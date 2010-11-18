using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI;
using DBNL.App.Models.ViewData;
using DBNL.App.Config;
using DBNL.App.Models.Statics;
using System.Web.Mvc.Html;
using DBNL.App.Models.Business;

namespace DBNL.App.Models.Extensions
{
    public static class HtmlHelperExtensions
    {


        public static MvcHtmlString StaticLink(this HtmlHelper htmlHelper, string url, string text, object htmlAttributes)
        {
            TagBuilder imglink = new TagBuilder("a");
            imglink.MergeAttribute("href", url);
            imglink.InnerHtml = text;
            imglink.MergeAttributes((IDictionary<string, string>)htmlAttributes, true);
            return MvcHtmlString.Create(imglink.ToString());
             

        }


        public static string CategoryLink(this UrlHelper helper, ContentCategory category)
        {

            return helper.RouteUrl("Category-View-Route", new { category = category.Key});

        }
        public static MvcHtmlString CategoryLink(this HtmlHelper helper, ContentCategory category)
        {

            return helper.RouteLink(category.CategoryName, "Category-View-Route", new { category = category.Key});
        }

        public static MvcHtmlString CategoryLink(this HtmlHelper helper, string name, ContentCategory category)
        {

            return helper.RouteLink(name, "Category-View-Route", new { category = category.Key });
        }

        public static string ContentLink(this UrlHelper helper, Content content)
        {

            return helper.RouteUrl("Content-View-Route", new {category=content.ContentCategory.Key, contentkey = content.UniqueKey});
            
        }
        public static MvcHtmlString ContentLink(this HtmlHelper helper, Content content)
        {

            return helper.RouteLink(content.Title, "Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });
        }
        public static string ContentLink(this UrlHelper helper, string category, Content content)
        {

            return helper.RouteUrl("Content-View-Route", new { category = category, contentkey = content.UniqueKey });

        }
        public static MvcHtmlString ContentLink(this HtmlHelper helper, string category, Content content)
        {
            return helper.RouteLink(content.Title, "Content-View-Route", new { category = category, contentkey = content.UniqueKey });
        }
        public static MvcHtmlString ContentLink(this HtmlHelper helper,Content content, int Word)
        {
            return helper.RouteLink(content.Title.Capatilized(Word), "Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });
        }
        public static MvcHtmlString ContentLink(this HtmlHelper helper, Content content, int Word, bool isCapatilized)
        {
            if(isCapatilized)
            return helper.RouteLink(content.Title.Capatilized(Word), "Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });

            return helper.RouteLink(content.Title.TrimmedWord(Word), "Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });
        }

        public static string NavigationLink(this UrlHelper helper, Navigation navigation)
        {
            if (navigation.Component == SiteModules.Url.ToString())
            {
                return helper.Content(navigation.ExternalUrl);

            }

            if (navigation.Component == SiteModules.WebContact.ToString())
            {
                return helper.Action(navigation.Action, navigation.Controller, new { id= navigation.CustomData});

            }
            if (navigation.Component == SiteModules.Article.ToString())
            {
                return helper.RouteUrl("Category-View-Route", new { category = navigation.ContentCategory.Key });

            }
            if (navigation.Component == SiteModules.Post.ToString())
            {
                var content = navigation.Content;
                return helper.RouteUrl("Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });
            }
            return helper.Action(navigation.Action, navigation.Controller, new { id = navigation.CategoryId });
        }
        public static MvcHtmlString NavigationLink(this HtmlHelper helper, Navigation navigation)
        {
            if (navigation.Component == SiteModules.Url.ToString())
            {
                return helper.StaticLink(navigation.ExternalUrl,navigation.Name, null);

            }
            if (navigation.Component == SiteModules.Article.ToString())
            {
                return helper.RouteLink(navigation.Name, "Category-View-Route", new { category = navigation.ContentCategory.Key });

            }
             if (navigation.Component == SiteModules.Post.ToString())
            {
                var content = navigation.Content;


                return helper.RouteLink(content.Title,"Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });
            }
            return helper.ActionLink(navigation.Name, navigation.Action, navigation.Controller, new { id = navigation.CategoryId }, null);
        }

        public static MvcHtmlString NavigationLink(this HtmlHelper helper,string name, Navigation navigation)
        {
            if (navigation.Component == SiteModules.Url.ToString())
            {
                return helper.StaticLink(navigation.ExternalUrl, name, null);

            }

            if (navigation.Component == SiteModules.Article.ToString())
            {
                return helper.RouteLink(name, "Category-View-Route", new { category = navigation.ContentCategory.Key });

            }
            if (navigation.Component == SiteModules.Post.ToString())
            {
                var content = navigation.Content;


                return helper.RouteLink(name, "Content-View-Route", new { category = content.ContentCategory.Key, contentkey = content.UniqueKey });
            }
            return helper.ActionLink(name, navigation.Action, navigation.Controller, new { id = navigation.CategoryId }, null);
        }

        public static void Chart(this HtmlHelper helper, string polltitle, List<int> values, List<string> labels, int width, int height, SeriesChartType ChartType, System.Web.UI.Page page)
        {
            System.Web.UI.DataVisualization.Charting.Chart Chart1 = new System.Web.UI.DataVisualization.Charting.Chart();
            Chart1 = new System.Web.UI.DataVisualization.Charting.Chart();
            Chart1.Width = width;
            Chart1.Height = height;
            Chart1.RenderType = RenderType.ImageTag;
            // Populate series data
            Chart1.Series.Add("Default");
            Chart1.ChartAreas.Add("ChartArea1");
            Chart1.Series["Default"].Points.DataBindXY(labels, values);
            
            // Set Doughnut chart type
            Chart1.Series["Default"].ChartType = ChartType;
            Chart1.Series["Default"].Label = "#VALX (#VAL/#PERCENT)";
            Chart1.Series["Default"].ChartArea = "ChartArea1";
            // Set labels style
            Chart1.Series["Default"]["PieLabelStyle"] = "Disabled";
            Chart1.Series["Default"]["PieLabelFormat"] ="#PERCENT";
            //Chart1.Series["Default"].Label = "#PERCENT{P1}";
            Chart1.Titles.Add(polltitle);
            // Enable 3D
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

            Legend l = new Legend("xxx");
            l.Title = "Hướng dẫn";
            l.LegendStyle = LegendStyle.Table;
            
            Chart1.Legends.Add(l);

            Chart1.BorderSkin.SkinStyle = BorderSkinStyle.Emboss;

            // Disable the Legend
            //Chart1.Legends[0].Enabled = true;

            // Render chart control
            Chart1.Page = page;
            HtmlTextWriter writer = new HtmlTextWriter(page.Response.Output);
            Chart1.RenderControl(writer);
        }
        public static void PollChart(this HtmlHelper<DBNL.App.Models.ViewData.PublicPollViewData> helper, PublicPollViewData data, int width, int height, Page page)
        {
            List<int> values = new List<int>();
            List<string> labels = new List<string>();
            foreach (var item in data.Questions)
            {
                values.Add(item.Responses);
                labels.Add(item.Question);
            }
            Chart(helper, data.ActivePoll.PollName, values, labels, width, height, SeriesChartType.Pie, page);
        }
        public static void PollChart(this HtmlHelper<DBNL.App.Models.ViewData.PublicPollViewData> helper, PublicPollViewData data, int width, int height, SeriesChartType type, Page page)
        {
            List<int> values = new List<int>();
            List<string> labels = new List<string>();
            foreach (var item in data.Questions)
            {
                values.Add(item.Responses);
                labels.Add(item.Question);
            }
            Chart(helper, data.ActivePoll.PollName, values, labels, width, height,type, page);
        }



        public static string BannerList(this HtmlHelper helper , IEnumerable<Banner>  banners){
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");
            
            foreach (var item in banners) {
                if (item.BannerImage.ToLower().EndsWith(".swf"))
                {
                    sb.AppendFormat("<li><a href='{0}' alt='{2}' target='_blank'><span class='flash_banner' rel='{1}' width='{3}' height='{4}' /></a></li>",
                        item.Url,
                        string.Format("{0}/{1}", DBNLConfigurationManager.FileResponsity.BannerRelativeUrl, item.BannerImage),
                        item.Name,
                        string.IsNullOrEmpty(item.Width)?"204": item.Width,
                        string.IsNullOrEmpty(item.Height)?"120": item.Height
                        );
                }
                else
                {
                    sb.AppendFormat("<li><a href='{0}' alt='{2}' target='_blank'><img src='{1}' alt='{2}' /></a></li>",

                        item.Url,
                        string.Format("{0}/{1}", DBNLConfigurationManager.FileResponsity.BannerRelativeUrl, item.BannerImage),
                        item.Name
                        );
                }
            }
            sb.Append("</ul>");

            return sb.ToString();
        }

        public static string BannerList(this HtmlHelper helper, IEnumerable<Banner> banners, int witdh)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");

            foreach (var item in banners)
            {
                if (item.BannerImage.ToLower().EndsWith(".swf"))
                {
                    sb.AppendFormat("<li><a href='{0}' alt='{2}' target='_blank'><span class='flash_banner' rel='{1}' width='{3}' height='{4}' /></a></li>",
                         item.Url,
                         string.Format("{0}/{1}", DBNLConfigurationManager.FileResponsity.BannerRelativeUrl, item.BannerImage),
                         item.Name,
                         string.IsNullOrEmpty(item.Width) ? "204" : item.Width,
                         string.IsNullOrEmpty(item.Height) ? "120" : item.Height
                         );
                }
                else
                {
                    sb.AppendFormat("<li><a href='{0}' alt='{2}' target='_blank'><img src='{1}' alt='{2}' width='{3}' /></a></li>",

                     item.Url,
                     string.Format("{0}/{1}", DBNLConfigurationManager.FileResponsity.BannerRelativeUrl, item.BannerImage),
                     item.Name,
                     witdh
                     );
                }

                
            }
            sb.Append("</ul>");
            return sb.ToString();
        }
      /// <summary>
	    /// Create a TreeView of nodes starting from a root element
	    /// </summary>
	    /// <param name="treeId">The ID that will be used when the ul is created</param>
	    /// <param name="rootItems">The root nodes to create</param>
	    /// <param name="childrenProperty">A lambda expression that returns the children nodes</param>
	    /// <param name="itemContent">A lambda expression defining the content in each tree node</param>
	    public static string TreeView<T>(this HtmlHelper html, string treeId, IEnumerable<T> rootItems, Func<T, IEnumerable<T>> childrenProperty, Func<T, string> itemContent)
	    {
	        return html.TreeView(treeId, rootItems, childrenProperty, itemContent, true, null);
	    }
	 
	    /// <summary>
	    /// Create a TreeView of nodes starting from a root element
	    /// </summary>
	    /// <param name="treeId">The ID that will be used when the ul is created</param>
	    /// <param name="rootItems">The root nodes to create</param>
	    /// <param name="childrenProperty">A lambda expression that returns the children nodes</param>
	    /// <param name="itemContent">A lambda expression defining the content in each tree node</param>
	    /// <param name="includeJavaScript">If true, output will automatically render the JavaScript to turn the ul into the treeview</param>   
	    public static string TreeView<T>(this HtmlHelper html, string treeId, IEnumerable<T> rootItems, Func<T, IEnumerable<T>> childrenProperty, Func<T, string> itemContent, bool includeJavaScript)
	    {
	        return html.TreeView(treeId, rootItems, childrenProperty, itemContent, includeJavaScript, null);
	    }
	 
	    /// <summary>
	    /// Create a TreeView of nodes starting from a root element
	    /// </summary>
	    /// <param name="treeId">The ID that will be used when the ul is created</param>
	    /// <param name="rootItems">The root nodes to create</param>
	    /// <param name="childrenProperty">A lambda expression that returns the children nodes</param>
	    /// <param name="itemContent">A lambda expression defining the content in each tree node</param>
	    /// <param name="includeJavaScript">If true, output will automatically render the JavaScript to turn the ul into the treeview</param>
	    /// <param name="emptyContent">Content to be rendered when the tree is empty</param>
	    /// <param name="includeJavaScript">If true, output will automatically into the JavaScript to turn the ul into the treeview</param>   
	    public static string TreeView<T>(this HtmlHelper html, string treeId, IEnumerable<T> rootItems, Func<T, IEnumerable<T>> childrenProperty, Func<T, string> itemContent, bool includeJavaScript, string emptyContent)
	    {
	        StringBuilder sb = new StringBuilder();
	 
	        sb.AppendFormat("<ul id='{0}'>\r\n", treeId);
	 
	        if(rootItems.Count() == 0)
	        {
	            sb.AppendFormat("<li>{0}</li>", emptyContent);
	        }
	 
	        foreach (T item in rootItems)
	        {
	            RenderLi(sb, item, itemContent);
	            AppendChildren(sb, item, childrenProperty, itemContent);
	        }
	 
	        sb.AppendLine("</ul>");
	 
	        if (includeJavaScript)
	        {
	            sb.AppendFormat(
	                @"<script type='text/javascript'>
	                    $(document).ready(function() {{
	                        $('#{0}').treeview({{ animated: 'fast' }});
	                    }});
	                </script>", treeId);
	        }
	 
	        return sb.ToString();
	    }
	 
	    private static void AppendChildren<T>(StringBuilder sb, T root, Func<T, IEnumerable<T>> childrenProperty, Func<T, string> itemContent)
	    {
	        var children = childrenProperty(root);
	        if(children.Count() == 0)
	        {
	            sb.AppendLine("</li>");
	            return;
	        }
	 
	        sb.AppendLine("\r\n<ul>");
	        foreach (T item in children)
	        {
	            RenderLi(sb, item, itemContent);
	            AppendChildren(sb, item, childrenProperty, itemContent);
	        }
	 
	        sb.AppendLine("</ul></li>");
	    }
	 
	    private static void RenderLi<T>(StringBuilder sb, T item, Func<T, string> itemContent)
	    {
	        sb.AppendFormat("<li>{0}", itemContent(item));           
	    }
        /// <summary>
        /// Renders JavaScript to turn the specified file input control into an 
        /// Uploadify upload control.
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="name"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        //public static string Uploadify(this HtmlHelper helper, string name, UploadifyOptions options)
        //{
        //    string scriptPath = helper.ResolveUrl("~/Content/jqueryPlugins/uploadify/");

        //    StringBuilder sb = new StringBuilder();
        //    //Include the JS file.
        //    sb.Append(helper.ScriptInclude("~/Content/jqueryPlugins/uploadify/jquery.uploadify.js"));
        //    sb.Append(helper.ScriptInclude("~/Content/jqueryPlugins/uploadify/jquery.uploadify.init.js"));

        //    //Dump the script to initialze Uploadify
        //    sb.AppendLine("<script type=\"text/javascript\">");
        //    sb.AppendLine("$(document).ready(function() {");
        //    sb.AppendFormat("initUploadify($('#{0}'),'{1}','{2}','{3}','{4}','{5}',{6},{7});", name, options.UploadUrl,
        //                    scriptPath, options.FileExtensions, options.FileDescription, options.AuthenticationToken,
        //                    options.ErrorFunction ?? "null", options.CompleteFunction ?? "null");
        //    sb.AppendLine();
        //    sb.AppendLine("});");
        //    sb.AppendLine("</script");

        //    return sb.ToString();
        //}
    }
}
 