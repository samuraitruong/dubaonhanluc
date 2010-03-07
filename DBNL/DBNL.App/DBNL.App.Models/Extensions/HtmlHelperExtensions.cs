using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI;
using DBNL.App.Models.ViewData;
using DBNL.App.Config;

namespace DBNL.App.Models.Extensions
{
    public static class HtmlHelperExtensions
    {
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
            Chart1.Series["Default"].ChartArea = "ChartArea1";
            // Set labels style
            Chart1.Series["Default"]["PieLabelStyle"] = "outside";
            //Chart1.Series["Default"].Label = "#PERCENT{P1}";
            Chart1.Titles.Add(polltitle);
            // Enable 3D
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

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

        public static string BannerList(this HtmlHelper helper , IEnumerable<Banner>  banners){
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");
            
            foreach (var item in banners) {
                sb.AppendFormat("<li><a href='{0}' alt='{2}' target='_blank'><img src='{1}' alt='{2}' /></a></li>",

                    item.Url,
                    string.Format("{0}/{1}", DBNLConfigurationManager.FileResponsity.BannerRelativeUrl, item.BannerImage),
                    item.Name
                    );
            }
            sb.Append("</ul>");

            return sb.ToString();
        }

    }
}
 