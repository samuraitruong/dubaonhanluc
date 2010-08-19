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
using System.Threading;
using System.IO;
using System.Diagnostics;

namespace DBNL.App.Models
{
    public delegate void AfterIndexingCoplete();

    public class LuceneHelper
    {
        private object locker = new object();
        private object indexing_locker = new object();
        public AfterIndexingCoplete IndexingAfterComplete;


        protected Lucene.Net.Analysis.Analyzer analyzer = new Lucene.Net.Analysis.Standard.StandardAnalyzer();

        public void BuildingIndex()
        {

            //System.Threading.Thread thread = new System.Threading.Thread(BuildingIndex_Thread);
            //thread.Priority = ThreadPriority.Highest;
            //thread.Start();
            BuildingIndex_Thread();
        }

        private Lucene.Net.Documents.Document create_doc(int id, string content)
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



        private Lucene.Net.Search.Searcher searcher = null;

        public  void threadproc_update(object obj)
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
                    var item = new ContentService().GetContentById(id);
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



        private bool DeleteDirectory(string target_dir)
        {
            bool result = false;

            string[] files = Directory.GetFiles(target_dir);
            string[] dirs = Directory.GetDirectories(target_dir);

            foreach (string file in files)
            {
                File.SetAttributes(file, FileAttributes.Normal);
                File.Delete(file);
            }

            foreach (string dir in dirs)
            {
                DeleteDirectory(dir);
            }

            Directory.Delete(target_dir, false);

            return result;
        }

        public void BuildingIndex_Thread()
        {
            lock (indexing_locker)
            {
                string tempdir = DBNLConfigurationManager.LuceneElement.IndexingFolder + ".tempx";
                if (Directory.Exists(tempdir)) Directory.Delete(tempdir, true);
                bool hasError = false;

                //try
                //{
                Lucene.Net.Index.IndexWriter writer = new Lucene.Net.Index.IndexWriter(tempdir, analyzer, true);

                //int totalRecords = new ContentService().All().Count();
                int offset = 0;
                ContentService service = new ContentService();

                var items = service.All().Skip(offset).Take(100).AsEnumerable();
                int itemcount = items.Count();
                Debug.WriteLine(itemcount.ToString());
                Debug.Flush();
                while (itemcount > 0)
                {


                    foreach (var item in items)
                    {
                        writer.AddDocument(create_doc(
                                item.ContentId, item.Content1));

                        Debug.WriteLine(item.ContentId.ToString());
                        Debug.Flush();
                    }
                    items = service.All().Skip(offset).Take(100).AsEnumerable();
                    itemcount = items.Count();
                    offset += 100;
                }
                writer.Optimize();
                writer.Close();
                //}
                //catch (Exception e)
                //{
                //      hasError = true;
                //      throw e;
                //}
                //finally
                //{

                if (!hasError)
                {
                    lock (locker)
                    {
                        string[] files = System.IO.Directory.GetFiles(tempdir);
                        foreach (string s in files)
                        {
                            string fileName = System.IO.Path.GetFileName(s);
                            string destFile = System.IO.Path.Combine(DBNLConfigurationManager.LuceneElement.IndexingFolder, fileName);
                            System.IO.File.Copy(s, destFile, true);
                        }
                    }
                }
                IndexingAfterComplete();
                //}
            }


        }

        public IEnumerable<Content>
            Search(string keyword, int page, int pageSize, out int totals)
        {
            lock (locker)
            {
                List<Content> result = new List<Content>();
                IndexReader reader = IndexReader.Open(DBNLConfigurationManager.LuceneElement.IndexingFolder);

                IndexSearcher searcher = new IndexSearcher(reader);


                TopDocCollector collector = new TopDocCollector((page + 1) * pageSize);

                PhraseQuery pquery = new PhraseQuery();
                BooleanQuery myquery = new BooleanQuery();
                PhraseQuery q2 = new PhraseQuery();
                //grab the search terms from the query string
                string[] str = keyword.Split(' ');
                //build the query
                foreach (string word in str)
                {
                    //brand is the field I'm searching in
                    q2.Add(new Term("content", word.ToLower()));
                }

                //finally, add it to the BooleanQuery object
                myquery.Add(q2, BooleanClause.Occur.MUST);


                //foreach (string srt in keyword.Split(new char[] {' '}))
                //{
                //    pquery.Add(new Term("content", srt.ToLower()));
                //}
                //pquery.Add(q2, BooleanClause.Occur.MUST);

                TermQuery query = new TermQuery(new Term("content", keyword));
                //            TopDocs topDocs = searcher.Search(query, collector);
                //searcher.Search(query, collector);

                QueryParser qp = new QueryParser("content", new StandardAnalyzer());

                //Contains a phrase such as "this is a phrase" 
                Query q = qp.Parse(keyword);
                //Hits hits = searcher.Search(q);
                //Hits hits = searcher.Search(query);
                Hits hits = searcher.Search(myquery);

                //ScoreDoc[] hits = collector.TopDocs().scoreDocs;
                totals = hits.Length();
                Lucene.Net.Highlight.Formatter formatter = new Lucene.Net.Highlight.SimpleHTMLFormatter(
        "<span class=\"Highlight\">",
        "</span>");

                Lucene.Net.Highlight.SimpleFragmenter fragmenter = new Lucene.Net.Highlight.SimpleFragmenter(400);
                Lucene.Net.Highlight.QueryScorer scorer = new Lucene.Net.Highlight.QueryScorer(myquery);
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

                    Content content = new ContentService().GetItem(int.Parse(doc.Get("id")));
                    content.HighlightText = highlighted_text;
                    result.Add(content);
                }
                reader.Close();

                searcher.Close();
                return result.AsEnumerable();
            }

        }
    
        public string Query(string keyword)
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
