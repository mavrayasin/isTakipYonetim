using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace isTakipYonetim.ViewModel
{
    public class clientInfo
    {
        public string ipAdressClient
        {
            get { return System.Web.HttpContext.Current.Request.UserHostAddress; }
        }
    }
}