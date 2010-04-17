using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.IO;
using System.Web;

namespace DBNL.App.Models.ViewResults
{
    public class ImageResult : ActionResult
    {
        public System.Drawing.Image Image { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }

        public ImageResult(string imageFile)
        {
            Image = System.Drawing.Image.FromFile(imageFile);
            MemoryStream ms = new MemoryStream();
            System.Drawing.Imaging.ImageFormat format = System.Drawing.Imaging.ImageFormat.Jpeg;
            switch(Path.GetExtension(imageFile).ToLower()){
                case ".jpg":
                    format = System.Drawing.Imaging.ImageFormat.Jpeg;
                    ContentType = "image/jpg";
                    break;
                case ".gif":
                    format = System.Drawing.Imaging.ImageFormat.Gif;
                    ContentType = "image/gif";
                    break;
                case ".png":
                    format = System.Drawing.Imaging.ImageFormat.Png;
                    ContentType = "image/png";
                    break;
                case ".bmp":
                    format = System.Drawing.Imaging.ImageFormat.Bmp;
                    ContentType = "image/bmp";
                    break;
            }
            Image.Save(ms, format);
            Image.Dispose();
            ms.Seek(0, SeekOrigin.Begin);
            this.ImageStream = ms;

        }

        public ImageResult(string imageFile, int width, int height)
        {
            Image = System.Drawing.Image.FromFile(imageFile);
            System.Drawing.Image croppedImage = Image.GetThumbnailImage(width, height, ThumbnailCallback, IntPtr.Zero);
            MemoryStream ms = new MemoryStream();
            croppedImage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            croppedImage.Dispose();
            ms.Seek(0, SeekOrigin.Begin);
            this.ImageStream = ms;
            Image.Dispose();
            this.ContentType = "image/jpg";
            
        }
        public bool ThumbnailCallback()
        {
            return false;
        }

        public ImageResult(Stream imageStream, string contentType)
        {

            if (imageStream == null)

                throw new ArgumentNullException("imageStream");

            if (contentType == null)

                throw new ArgumentNullException("contentType");
            this.ImageStream = imageStream;

            this.ContentType = contentType;

        }



        public Stream ImageStream { get; private set; }

        public string ContentType { get; private set; }



        public override void ExecuteResult(ControllerContext context)
        {

            if (context == null)

                throw new ArgumentNullException("context");



            HttpResponseBase response = context.HttpContext.Response;



            response.ContentType = this.ContentType;

            byte[] buffer = new byte[4096];

            while (true)
            {

                int read = this.ImageStream.Read(buffer, 0, buffer.Length);

                if (read == 0)

                    break;
                response.OutputStream.Write(buffer, 0, read);

            }
            ImageStream.Close();
            response.End();

        }
    }
}



