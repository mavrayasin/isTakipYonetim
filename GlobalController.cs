using isTakipYonetim.Models;
using isTakipYonetim.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace isTakipYonetim.Controllers
{
    public class GlobalController : Controller
    {
        Entities ent = new Entities();
        // GET: Global
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string usernm, string passwd)
        {

            if (usernm != null && passwd != null) //Kullanıcı adı ve parola kontrolü
            {
                users u = ent.users.Where(i => i.username == usernm && i.password == passwd).FirstOrDefault();
                sessions s = new sessions();
                if (u != null)
                {
                    s.firstname = u.firstName;
                    s.lastname = u.lastName;
                    s.username = u.username;
                    s.systemUserID = u.ID;

                    userLog ul = new userLog();
                    clientInfo ci = new clientInfo();

                    var userIDs = ent.userLog.Select(i => i.userID).ToList();

                    if (userIDs.Contains(s.systemUserID) == true) //giriş yapan kullanıcı daha önce giriş yaptı ise userLog tablosunda güncelleme işlemi
                    {
                        ul = ent.userLog.Where(i => i.userID == s.systemUserID).FirstOrDefault();
                        ul.userID = s.systemUserID;
                        ul.ipAdress = ci.ipAdressClient;
                        ul.systemRecordTime = DateTime.Now;
                        ent.SaveChanges();
                    }
                    else //Kullanıcı ilk kez giriş yapıyor ise userLog tablosuna ekleme işlemi
                    {
                        ul.userID = s.systemUserID;
                        ul.ipAdress = ci.ipAdressClient;
                        ul.systemRecordTime = DateTime.Now;
                        ent.userLog.Add(ul);
                        ent.SaveChanges();
                    }

                    return RedirectToAction("TeamMembers", "Global");
                }
                else
                {
                    ViewBag.LoginErrorResult = 0; // hata mesajı
                    return View();
                }

            }
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {

            return View();
        }
        public ActionResult Register(string email, string username, string pass, string confirmPass, string firstName, string lastName)
        {

            users u = new users();
            if (pass == confirmPass) // girilen parolalar eşleşti ise
            {
                u.email = email;
                u.username = username;
                u.password = pass;
                u.confirmPass = confirmPass;
                u.firstName = firstName;
                u.lastName = lastName;
                u.createDate = DateTime.Now;
                u.roleID = 2;
                ent.users.Add(u);
                ent.SaveChanges();
                return RedirectToAction("Login", "Global");
            }
            else
            {
                ViewBag.LoginErrorResult = 0; //"girilen parolalar eşleşmedi" hata mesajı
            }
            return View();
        }
        public ActionResult TeamMembers()
        {
            userProjectDetail up = new userProjectDetail();
            up.projectUsersList = ent.projectUsers.ToList();
            up.usersList = ent.users.ToList();
            up.userLogList = ent.userLog.ToList();
            return View(up);
        }
        public ActionResult Projects()
        {
            projectsDetail pd = new projectsDetail();
            pd.projectUsersList = ent.projectUsers.ToList();
            pd.projectsList = ent.projects.ToList();

            return View(pd);
        }
        [HttpGet]
        public ActionResult AddNewProject()
        {
            List<categories> ct = ent.categories.ToList();

            return View(ct);
        }
        [HttpPost]
        public ActionResult AddNewProject(string name, HttpPostedFileBase iconFile, string description, int progress, int categoryID)
        {
            var uzanti = Path.GetExtension(iconFile.FileName);
            var url = Path.Combine(Server.MapPath("~/FileUpload/" + name + uzanti));
            var dosyaAciklama = Path.GetFileName(iconFile.FileName);

            sessions s = new sessions();
            try
            {
                projects p = new projects();
                p.name = name;
                iconFile.SaveAs(Server.MapPath("~/FileUpload/" + name));
                //p.iconHref = url;
                p.description = description;
                p.progress = progress;
                p.categoryID = categoryID;
                p.lastChangeDate = DateTime.Now;
                p.systemUserID = s.systemUserID;
                ent.projects.Add(p);
                ent.SaveChanges();
                return RedirectToAction("Projects", "Global");

            }
            catch (Exception e)
            {

            }

            return View();
        }
        public ActionResult Logout()
        {
            sessions s = new sessions();
            s.firstname = null;
            s.lastname = null;
            s.systemUserID = null;
            s.username = null;

            Session.Abandon();
            return View("Login");
        }
    }
}