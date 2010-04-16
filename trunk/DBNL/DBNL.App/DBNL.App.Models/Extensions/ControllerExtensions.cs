using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.ViewResults;
using System.Web.Mvc;
using System.IO;

namespace DBNL.App.Models.Extensions
{
    public static class ControllerExtensions
    {
        public static ImageResult Image(this Controller controller, Stream imageStream, string contentType)
        {
  

     return new ImageResult(imageStream, contentType);

        }

        public static ImageResult Image(this Controller controller, string fileName, int w, int h)
        {
            return new ImageResult(fileName, w, h);
        }
        public static ImageResult Image(this Controller controller, byte[] imageBytes, string contentType)
        {
            return new ImageResult(new MemoryStream(imageBytes), contentType);
        }
      }
}
