//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace isTakipYonetim.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class categories
    {
        public categories()
        {
            this.projects = new HashSet<projects>();
        }
    
        public int ID { get; set; }
        public string categoryName { get; set; }
    
        public virtual ICollection<projects> projects { get; set; }
    }
}
