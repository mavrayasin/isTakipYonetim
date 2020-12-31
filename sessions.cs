using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace isTakipYonetim.ViewModel
{
    public class sessions
    {
        public string firstname
        {
            get { return HttpContext.Current.Session["firstname"] == null ? "" : HttpContext.Current.Session["firstname"].ToString(); }
            set { HttpContext.Current.Session["firstname"] = value; }
        }
        public string lastname
        {
            get { return HttpContext.Current.Session["lastname"] == null ? "" : HttpContext.Current.Session["lastname"].ToString(); }
            set { HttpContext.Current.Session["lastname"] = value; }
        }
        public string username
        {
            get { return HttpContext.Current.Session["username"] == null ? "" : HttpContext.Current.Session["username"].ToString(); }
            set { HttpContext.Current.Session["username"] = value; }
        }
        public int? systemUserID
        {
            get { return Convert.ToInt32(HttpContext.Current.Session["systemUserID"]); }
            set { HttpContext.Current.Session["systemUserID"] = value; }
        }
    }
}