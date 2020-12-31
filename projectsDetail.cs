using isTakipYonetim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace isTakipYonetim.ViewModel
{
    public class projectsDetail
    {
      public List<projects> projectsList { get; set; }

      public List<projectUsers> projectUsersList { get; set; }
      public List<categories> categoriesList { get; set; }
    }
}