using isTakipYonetim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace isTakipYonetim.ViewModel
{
    public class userProjectDetail
    {
      public List<users> usersList { get; set; }

      public List<projectUsers> projectUsersList { get; set; }
      
      public List<userLog> userLogList { get; set; }
    }
}