using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;
using System.IO;

namespace DBNL.App.Models.ActionResults
{
    public class ActionResultHelper
    {
        public static string RenderActionResultToString(Controller controleler, ActionResult result)
        {
            // Create memory writer.
            var sb = new StringBuilder();
            var memWriter = new StringWriter(sb);

            // Create fake http context to render the view.
            var fakeResponse = new HttpResponse(memWriter);
            var fakeContext = new HttpContext(System.Web.HttpContext.Current.Request,
                fakeResponse);
            var fakeControllerContext = new ControllerContext(
                new HttpContextWrapper(fakeContext),
                controleler.ControllerContext.RouteData,
                controleler);
            var oldContext = System.Web.HttpContext.Current;
            System.Web.HttpContext.Current = fakeContext;

            // Render the view.
            result.ExecuteResult(fakeControllerContext);

            // Restore old context.
            System.Web.HttpContext.Current = oldContext;

            // Flush memory and return output.
            memWriter.Flush();
            return sb.ToString();
        }
    }
}