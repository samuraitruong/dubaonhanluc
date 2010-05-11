using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using DBNL.App.Models.ActionResults;
using System.Xml;
using iTextSharp.text.xml;
using System.Drawing;

namespace DBNL.App.Controllers
{
    public class WebContactController : FOController
    {
        //
        // GET: /WebContact/

        public ActionResult Index()
        {
            ViewData.Model = new ContactService().GetAllItems();
            return View();
        }

        //
        // GET: /WebContact/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /WebContact/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /WebContact/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /WebContact/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /WebContact/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public byte[] CreatePdf(IEnumerable<Models.Contact> data)
        {
            byte[] result;
            using (MemoryStream ms = new MemoryStream())
            {
                Document pDoc = new Document(PageSize.A4);
                PdfWriter writer = PdfWriter.GetInstance(pDoc, ms);
                pDoc.Open();
                
                iTextSharp.text.Font contentFont = iTextSharp.text.FontFactory.GetFont("Arial", 13, iTextSharp.text.Font.HELVETICA);

                string dir = Environment.GetEnvironmentVariable("windir");
                dir += @"\Fonts\times.ttf";

                BaseFont bf = BaseFont.CreateFont(dir, BaseFont.IDENTITY_H, true);
                iTextSharp.text.Font font = new iTextSharp.text.Font(bf,11);

                PdfPTable table = new PdfPTable(new float [] {50, 300, 300});

                PdfPCell cell = new PdfPCell(new Phrase("Danh sách nhân viên trung tâm dự báo nhân lực TPHCM", font));

                cell.Colspan = 3;

                cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                cell.BackgroundColor = BaseColor.LIGHT_GRAY;
                table.AddCell(cell);
                table.AddCell("STT");
                table.AddCell("Tên");
                table.AddCell("Email");
                int index = 1;
                foreach (var item in data)
                {
                    table.AddCell(index.ToString());

                    table.AddCell(new Phrase(item.Name, font));

                    Anchor anchor = new Anchor(item.Email);

                    anchor.Reference = "mailto://" + item.Email;

                    Phrase phase = new Phrase();
                    phase.Add(anchor);
                    table.AddCell(phase);
                    index++;
                }

                

                
                pDoc.Add(table);
                pDoc.Close();
                result = ms.GetBuffer();
            }

            return result;
        }


        public ActionResult Pdf()
        {
            var data = new ContactService().GetAllItems();

            return new BinaryContentResult(CreatePdf(data), "application/pdf");
        }
    }
}
