using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Lucene.Net;
using DBNL.App.Models.Business;
using DBNL.App.Models.Extensions;
using System.Text;
using DBNL.App.Config;
using DBNL.App.Models;
using Lucene.Net.Search;
using Lucene.Net.Index;
using Lucene.Net.Documents;
using Lucene.Net.Analysis;
using Lucene.Net.Analysis.Standard;
using Lucene.Net.QueryParsers;

namespace DBNL.App.Models
{
    public class LuceneHelper
    {
        static object locker = new object();

        
        static Lucene.Net.Analysis.Analyzer analyzer = new Lucene.Net.Analysis.SimpleAnalyzer();

        public static void BuildingIndex(HttpApplicationState app)
        {

            System.Threading.Thread thread = new System.Threading.Thread(BuildingIndex_Thread);
            thread.Start(app);
        }

        static Lucene.Net.Documents.Document create_doc(int id, string content)
        {
            Lucene.Net.Documents.Document doc = new Lucene.Net.Documents.Document();

            string index_content = content.ReplaceHtmlEntities();
            index_content = index_content.StripHTML();
            doc.Add(new Lucene.Net.Documents.Field(
                "content",
                index_content,
                  Lucene.Net.Documents.Field.Store.YES,
                     Lucene.Net.Documents.Field.Index.TOKENIZED, 
                    Lucene.Net.Documents.Field.TermVector.WITH_POSITIONS_OFFSETS));

            doc.Add(new Lucene.Net.Documents.Field(
                "id",
                Convert.ToString(id),
                Lucene.Net.Documents.Field.Store.YES,
                Lucene.Net.Documents.Field.Index.UN_TOKENIZED));

            // For the highlighter, store the raw text
            //doc.Add(new Lucene.Net.Documents.Field(
            //    "raw_text",
            //    index_content,
            //    Lucene.Net.Documents.Field.Store.YES,
            //    Lucene.Net.Documents.Field.Index.UN_TOKENIZED));

            return doc;
        }



        static Lucene.Net.Search.Searcher searcher = null;

        public static void threadproc_update(object obj)
        {
            lock (locker) // If a thread is updating the index, no other thread should be doing anything with it.
            {

                try
                {
                    if (searcher != null)
                    {
                        try
                        {
                            searcher.Close();
                        }
                        catch (Exception e)
                        {
                        }
                        searcher = null;
                    }

                    Lucene.Net.Index.IndexModifier modifier = new Lucene.Net.Index.IndexModifier(DBNLConfigurationManager.LuceneElement.IndexingFolder, analyzer, false);

                    // same as build, but uses "modifier" instead of write.
                    // uses additional "where" clause for bugid

                    int id = (int)obj;

                    modifier.DeleteDocuments(new Lucene.Net.Index.Term("id", Convert.ToString(id)));
                    var item = ContentService.GetContentById(id);
                    modifier.AddDocument(create_doc(
                        item.ContentId, item.Content1));


                    modifier.Flush();
                    modifier.Close();

                }
                catch (Exception e)
                {
                }
            }
        }




        public static void BuildingIndex_Thread(object obj)
        {
            lock (locker)
            {
                try
                {
                    Lucene.Net.Index.IndexWriter writer = new Lucene.Net.Index.IndexWriter(DBNLConfigurationManager.LuceneElement.IndexingFolder, analyzer, true);

                    int totalRecords = ContentService.All().Count();
                    for (int i = 0; i < totalRecords; i = i + 100)
                    {
                        // DataSet ds = btnet.DbUtil.get_dataset("select bug_id, bug_text from bugs")
                        var items = ContentService.All().Skip(i).Take(100).AsEnumerable();
                        foreach (var item in items)
                        {
                            writer.AddDocument(create_doc(
                                    item.ContentId, item.Content1));
                        }
                    }
                    writer.Optimize();
                    writer.Close();
                }
                catch (Exception e)
                {
                    throw e;
                }
            }
        }

        public static IEnumerable<Content>
            Search(string keyword, int page, int pageSize, out int totals)
        {
            List<Content> result = new List<Content>();


            IndexReader reader = IndexReader.Open(DBNLConfigurationManager.LuceneElement.IndexingFolder);

            IndexSearcher searcher = new IndexSearcher(reader);

 
            TopDocCollector collector = new TopDocCollector((page + 1) * pageSize);

            PhraseQuery pquery = new PhraseQuery();
            foreach (string srt in keyword.Split(new char[] {' '}))
            {
                pquery.Add(new Term("content", srt));
            }
            TermQuery query = new TermQuery(new Term("content", keyword));
//            TopDocs topDocs = searcher.Search(query, collector);
            //searcher.Search(query, collector);

            QueryParser qp = new QueryParser("content", new StandardAnalyzer());

            //Contains a phrase such as "this is a phrase" 
            Query q = qp.Parse(keyword);
            //Hits hits = searcher.Search(q);
            Hits hits = searcher.Search(query);

            //ScoreDoc[] hits = collector.TopDocs().scoreDocs;
            totals = hits.Length();
            Lucene.Net.Highlight.Formatter formatter = new Lucene.Net.Highlight.SimpleHTMLFormatter(
    "<span style=\"background:yellow;color:red;\">",
    "</span>");

            Lucene.Net.Highlight.SimpleFragmenter fragmenter = new Lucene.Net.Highlight.SimpleFragmenter(400);
            Lucene.Net.Highlight.QueryScorer scorer = new Lucene.Net.Highlight.QueryScorer(query);
            Lucene.Net.Highlight.Highlighter highlighter = new Lucene.Net.Highlight.Highlighter(formatter, scorer);
            highlighter.SetTextFragmenter(fragmenter);
            
            for (int i = (page - 1) * pageSize; i < Math.Min(page * pageSize, hits.Length()); i++)
            {

                Document doc = hits.Doc(i);
                string raw_text = doc.Get("content");


                Lucene.Net.Analysis.TokenStream stream = analyzer.TokenStream("", new System.IO.StringReader(raw_text));
                string highlighted_text = highlighter.GetBestFragments(stream, raw_text, 1, "...").Replace("'", "''");


                if (highlighted_text == "") // someties the highlighter fails to emit text...
                {
                    highlighted_text = raw_text.Replace("'", "''");
                }
                if (highlighted_text.Length > 500)
                {
                    highlighted_text = highlighted_text.Substring(0, 500);
                }

                Content content = ContentService.GetItem(int.Parse(doc.Get("id")));
                content.HighlightText = highlighted_text;
                result.Add(content);
            }

            searcher.Close();
            return result.AsEnumerable();


        }
    
        public static string Query(string keyword)
        {
            Lucene.Net.QueryParsers.QueryParser parser = new Lucene.Net.QueryParsers.QueryParser("text", analyzer);
            Lucene.Net.Search.Query query = null;

            try
            {
                if (string.IsNullOrEmpty(keyword))
                {
                    throw new Exception("keywork is empty");
                }

                query = parser.Parse(keyword);

            }
            catch (Exception e)
            {
            }


            lock (locker)
            {

                Lucene.Net.Search.Hits hits = null;
                try
                {
                    if (searcher == null)
                    {
                        searcher = new Lucene.Net.Search.IndexSearcher(DBNLConfigurationManager.LuceneElement.IndexingFolder);
                    }

                    hits = searcher.Search(query);


                }
                catch (Exception e)
                {
                }

                for (int i = 0; i < hits.Length(); i++)
                {
                    Lucene.Net.Documents.Document doc = hits.Doc(i);

                }

                Lucene.Net.Highlight.Formatter formatter = new Lucene.Net.Highlight.SimpleHTMLFormatter(
    "<span style=\"background:yellow;color:red;\">",
    "</span>");

                Lucene.Net.Highlight.SimpleFragmenter fragmenter = new Lucene.Net.Highlight.SimpleFragmenter(400);
                Lucene.Net.Highlight.QueryScorer scorer = new Lucene.Net.Highlight.QueryScorer(query);
                Lucene.Net.Highlight.Highlighter highlighter = new Lucene.Net.Highlight.Highlighter(formatter, scorer);
                highlighter.SetTextFragmenter(fragmenter);

                StringBuilder sb = new StringBuilder();
                string guid = Guid.NewGuid().ToString().Replace("-", "");
                Dictionary<string, int> dict_already_seen_ids = new Dictionary<string, int>();
                

                // insert the search results into a temp table which we will join with what's in the database
                for (int i = 0; i < hits.Length(); i++)
                {
                    if (dict_already_seen_ids.Count < 100)
                    {
                        Lucene.Net.Documents.Document doc = hits.Doc(i);
                        string id = doc.Get("id");
                        if (!dict_already_seen_ids.ContainsKey(id))
                        {
                            dict_already_seen_ids[id] = 1;
                            

                            string raw_text =doc.Get("raw_text");


                            Lucene.Net.Analysis.TokenStream stream = analyzer.TokenStream("", new System.IO.StringReader(raw_text));
                            string highlighted_text = highlighter.GetBestFragments(stream, raw_text, 1, "...").Replace("'", "''");


                            if (highlighted_text == "") // someties the highlighter fails to emit text...
                            {
                                highlighted_text = raw_text.Replace("'", "''");
                            }
                            if (highlighted_text.Length > 3000)
                            {
                                highlighted_text = highlighted_text.Substring(0, 3000);
                            }
                            sb.Append(highlighted_text);
                            sb.Append("'");
                            sb.Append(")\n");
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                return sb.ToString();

            }


        }
    }
    
}
