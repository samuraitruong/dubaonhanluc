using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models;

namespace DBNL.App.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Admin/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Admin/Create

        [HttpPost]
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
        // GET: /Admin/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/Edit/5

        [HttpPost]
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

        #region Link
        public ActionResult AddLink()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddLink(Link link)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Links.InsertOnSubmit(link);
            db.SubmitChanges();
            return RedirectToAction("ListLinks");
        }

        public ActionResult ListLinks()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Links;
            return View();
        }

        public ActionResult EditLink(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Links.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditLink(int id, Link link)
        {
            DBNLDataContext db = new DBNLDataContext();
            Link updLink = db.Links.Where(p => p.Id == id).SingleOrDefault();
            updLink.CreatedDate = link.CreatedDate;
            updLink.Title = link.Title;
            updLink.UpdatedDate = link.UpdatedDate;
            updLink.Url = link.Url;
            db.SubmitChanges();
            return RedirectToAction("ListLinks");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteLink(Link link)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Links.DeleteOnSubmit(link);
            db.SubmitChanges();
            return RedirectToAction("ListLinks");
        }
        #endregion

        #region Contact
        public ActionResult AddContact()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddContact(Contact contact)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Contacts.InsertOnSubmit(contact);
            db.SubmitChanges();
            return RedirectToAction("ListContacts");
        }

        public ActionResult ListContacts()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Contacts;
            return View();
        }

        public ActionResult EditContact(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Contacts.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditContact(int id, Contact contact)
        {
            DBNLDataContext db = new DBNLDataContext();
            Contact updContact = db.Contacts.Where(p => p.Id == id).SingleOrDefault();
            updContact.Name = contact.Name;
            updContact.Email = contact.Email;
            updContact.Status = contact.Status;
            db.SubmitChanges();
            return RedirectToAction("ListContacts");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteContact(Contact contact)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Contacts.DeleteOnSubmit(contact);
            db.SubmitChanges();
            return RedirectToAction("ListContacts");
        }
        #endregion

        #region Supporter
        public ActionResult AddSupporter()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddSupporter(Supporter supporter)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Supporters.InsertOnSubmit(supporter);
            db.SubmitChanges();
            return RedirectToAction("ListSupporters");
        }

        public ActionResult ListSupporters()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Supporters;
            return View();
        }

        public ActionResult EditSupporter(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Supporters.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditSupporter(int id, Supporter supporter)
        {
            DBNLDataContext db = new DBNLDataContext();
            Supporter sp = db.Supporters.Where(p => p.Id == id).SingleOrDefault();
            sp.Name = supporter.Name;
            sp.NickName = supporter.NickName;
            sp.Status = supporter.Status;
            sp.Type = supporter.Type;
            db.SubmitChanges();
            return RedirectToAction("ListSupporter");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteSupporter(Supporter supporter)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Supporters.DeleteOnSubmit(supporter);
            db.SubmitChanges();
            return RedirectToAction("ListSupporters");
        }
        #endregion

        #region Banner
        public ActionResult AddBanner()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddBanner(Banner banner)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Banners.InsertOnSubmit(banner);
            db.SubmitChanges();
            return RedirectToAction("ListBanners");
        }

        public ActionResult ListBanners()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Banners;
            return View();
        }

        public ActionResult EditBanner(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Banners.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditBanner(int id, Banner banner)
        {
            DBNLDataContext db = new DBNLDataContext();
            Banner updBanner = db.Banners.Where(p => p.Id == id).SingleOrDefault();
            updBanner.BannerImage = banner.BannerImage;
            updBanner.BannerPosition = banner.BannerPosition;
            updBanner.CreatedDate = banner.CreatedDate;
            updBanner.Name = banner.Name;
            updBanner.Status = banner.Status;
            updBanner.UpdatedDate = banner.UpdatedDate;
            updBanner.Url = banner.Url;
            db.SubmitChanges();
            return RedirectToAction("ListBanners");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteBanner(Banner banner)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Banners.DeleteOnSubmit(banner);
            db.SubmitChanges();
            return RedirectToAction("ListBanners");
        }

        public ActionResult ViewBannerDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Banners.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region Navigation
        public ActionResult AddNavigation()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddNavigation(Navigation nav)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Navigations.InsertOnSubmit(nav);
            db.SubmitChanges();
            return RedirectToAction("ListNavigations");
        }

        public ActionResult ListNavigations()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Navigations;
            return View();
        }

        public ActionResult EditNavigation(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Navigations.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditNavigation(int id, Navigation nav)
        {
            DBNLDataContext db = new DBNLDataContext();
            Navigation updNavigation = db.Navigations.Where(p => p.Id == id).SingleOrDefault();
            updNavigation.Component = nav.Component;
            updNavigation.ContentCategory = nav.ContentCategory;
            updNavigation.ContentId = nav.ContentId;
            updNavigation.DisplayOrder = nav.DisplayOrder;
            updNavigation.ExternalUrl = nav.ExternalUrl;
            updNavigation.Image = nav.Image;
            updNavigation.Name = nav.Name;
            updNavigation.ParentId = nav.ParentId;
            updNavigation.Position = nav.Position;
            updNavigation.RelativeUrl = nav.RelativeUrl;
            updNavigation.Status = nav.Status;
            updNavigation.Navigations = nav.Navigations;
            db.SubmitChanges();
            return RedirectToAction("ListNavigations");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteNavigation(Navigation nav)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Navigations.DeleteOnSubmit(nav);
            db.SubmitChanges();
            return RedirectToAction("ListNavigations");
        }

        public ActionResult ViewNavigationDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Navigations.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region ContentCategory
        public ActionResult AddContentCategory()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddContentCategory(ContentCategory contentCate)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.ContentCategories.InsertOnSubmit(contentCate);
            db.SubmitChanges();
            return RedirectToAction("ListContentCategories");
        }

        public ActionResult ListContentCategories()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.ContentCategories;
            return View();
        }

        public ActionResult EditContentCategory(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.ContentCategories.Where(p => p.ID == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditContentCategory(int id, ContentCategory contentCate)
        {
            DBNLDataContext db = new DBNLDataContext();
            ContentCategory updContentCate = db.ContentCategories.Where(p => p.ID == id).SingleOrDefault();
            updContentCate.CategoryName = contentCate.CategoryName;
            updContentCate.Key = contentCate.Key;
            updContentCate.ParentCategoryId = contentCate.ParentCategoryId;
            db.SubmitChanges();
            return RedirectToAction("ListContentCategories");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteContentCategory(ContentCategory contentCate)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.ContentCategories.DeleteOnSubmit(contentCate);
            db.SubmitChanges();
            return RedirectToAction("ListContentCategories");
        }

        public ActionResult ViewContentCategoryDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.ContentCategories.Where(p => p.ID == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region Content
        public ActionResult AddContent()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddContent(Content content)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Contents.InsertOnSubmit(content);
            db.SubmitChanges();
            return RedirectToAction("ListContents");
        }

        public ActionResult ListContents()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Contents;
            return View();
        }

        public ActionResult EditContent(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Contents.Where(p => p.ContentId == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditContent(int id, Content content)
        {
            DBNLDataContext db = new DBNLDataContext();
            Content updContent = db.Contents.Where(p => p.ContentId == id).SingleOrDefault();
            updContent.ContentCategory = content.ContentCategory;
            updContent.Count = content.Count;
            updContent.CreatedDate = content.CreatedDate;
            updContent.Status = content.Status;
            updContent.Title = content.Title;
            updContent.UpdatedDate = content.UpdatedDate;
            updContent.IsFeatured = content.IsFeatured;
            db.SubmitChanges();
            return RedirectToAction("ListContents");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteContent(Content content)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Contents.DeleteOnSubmit(content);
            db.SubmitChanges();
            return RedirectToAction("ListContents");
        }

        public ActionResult ViewContentDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Contents.Where(p => p.ContentId == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region ContentRelation
        public ActionResult AddContentRelation()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddContentRelation(ContentRelation contentRelation)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.ContentRelations.InsertOnSubmit(contentRelation);
            db.SubmitChanges();
            return RedirectToAction("ListContentRelations");
        }

        public ActionResult ListContentRelations()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.ContentRelations;
            return View();
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteContentRelation(ContentRelation contentRelation)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.ContentRelations.DeleteOnSubmit(contentRelation);
            db.SubmitChanges();
            return RedirectToAction("ListContentRelations");
        }
        #endregion

        #region Role
        public ActionResult AddRole()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRole(Role role)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Roles.InsertOnSubmit(role);
            db.SubmitChanges();
            return RedirectToAction("ListRoles");
        }

        public ActionResult ListRoles()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Roles;
            return View();
        }

        public ActionResult EditRole(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Roles.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditRole(int id, Role role)
        {
            DBNLDataContext db = new DBNLDataContext();
            Role updRole = db.Roles.Where(p => p.Id == id).SingleOrDefault();
            updRole.ComponentPermission = role.ComponentPermission;
            updRole.ContentPermission = role.ContentPermission;
            updRole.RoleName = role.RoleName;
            db.SubmitChanges();
            return RedirectToAction("ListRoles");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteRole(Role role)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Roles.DeleteOnSubmit(role);
            db.SubmitChanges();
            return RedirectToAction("ListRoles");
        }

        public ActionResult ViewRoleDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Roles.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region Poll
        public ActionResult AddPoll()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddPoll(Poll poll)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Polls.InsertOnSubmit(poll);
            db.SubmitChanges();
            return RedirectToAction("ListPolls");
        }

        public ActionResult ListPolls()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Polls;
            return View();
        }

        public ActionResult EditPoll(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Polls.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditPoll(int id, Poll poll)
        {
            DBNLDataContext db = new DBNLDataContext();
            Poll updPoll = db.Polls.Where(p => p.Id == id).SingleOrDefault();
            updPoll.PollName = poll.PollName;
            updPoll.Status = poll.Status;
            db.SubmitChanges();
            return RedirectToAction("ListPolls");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeletePoll(Poll poll)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Polls.DeleteOnSubmit(poll);
            db.SubmitChanges();
            return RedirectToAction("ListPolls");
        }

        public ActionResult ViewPollDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Polls.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region PollQuestion
        public ActionResult AddPollQuestion()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddPollQuestion(PollQuestion question)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.PollQuestions.InsertOnSubmit(question);
            db.SubmitChanges();
            return RedirectToAction("ListPollQuestions");
        }

        public ActionResult ListPollQuestions()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.PollQuestions;
            return View();
        }

        public ActionResult EditPollQuestion(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.PollQuestions.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditPollQuestion(int id, PollQuestion question)
        {
            DBNLDataContext db = new DBNLDataContext();
            PollQuestion updPollQuestion = db.PollQuestions.Where(p => p.Id == id).SingleOrDefault();
            updPollQuestion.CreatedDate = question.CreatedDate;
            updPollQuestion.PollId = question.PollId;
            updPollQuestion.Status = question.Status;
            updPollQuestion.UpdatedDate = updPollQuestion.UpdatedDate;
            updPollQuestion.Question = question.Question;
            updPollQuestion.Responses = question.Responses;
            db.SubmitChanges();
            return RedirectToAction("ListPollQuestions");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeletePollQuestion(PollQuestion question)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.PollQuestions.DeleteOnSubmit(question);
            db.SubmitChanges();
            return RedirectToAction("ListPollQuestions");
        }

        public ActionResult ViewPollQuestionDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.PollQuestions.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region User
        public ActionResult AddUser()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddUser(User user)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Users.InsertOnSubmit(user);
            db.SubmitChanges();
            return RedirectToAction("ListUsers");
        }

        public ActionResult ListUsers()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Users;
            return View();
        }

        public ActionResult EditUser(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Users.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditUser(int id, User user)
        {
            DBNLDataContext db = new DBNLDataContext();
            User updUser = db.Users.Where(p => p.Id == id).SingleOrDefault();
            updUser.CreatedDate = user.CreatedDate;
            updUser.Name = user.Name;
            updUser.Password = user.Password;
            updUser.Status = user.Status;
            updUser.UpdatedDate = user.UpdatedDate;
            updUser.Username = user.Username;
            db.SubmitChanges();
            return RedirectToAction("ListUsers");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteUser(User user)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.Users.DeleteOnSubmit(user);
            db.SubmitChanges();
            return RedirectToAction("ListUsers");
        }

        public ActionResult ViewUserDetails(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.Users.Where(p => p.Id == id).SingleOrDefault();
            return View();
        }
        #endregion

        #region UserInRole
        public ActionResult AddUserInRole()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddUserInRole(UserInRole userInRole)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.UserInRoles.InsertOnSubmit(userInRole);
            db.SubmitChanges();
            return RedirectToAction("ListUserInRoles");
        }

        public ActionResult ListUserInRoles()
        {
            DBNLDataContext db = new DBNLDataContext();
            ViewData.Model = db.UserInRoles;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DeleteUserInRole(UserInRole userInRole)
        {
            DBNLDataContext db = new DBNLDataContext();
            db.UserInRoles.DeleteOnSubmit(userInRole);
            db.SubmitChanges();
            return RedirectToAction("ListUserInRoles");
        }
        #endregion
    }
}
