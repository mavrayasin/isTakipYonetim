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
    
    public partial class projectTask
    {
        public int ID { get; set; }
        public string taskName { get; set; }
        public string taskDescription { get; set; }
        public int projectID { get; set; }
        public int userID { get; set; }
        public Nullable<System.DateTime> startDate { get; set; }
        public Nullable<System.DateTime> endDate { get; set; }
        public Nullable<System.DateTime> modifyDate { get; set; }
        public Nullable<System.DateTime> createdDate { get; set; }
    
        public virtual projects projects { get; set; }
        public virtual users users { get; set; }
    }
}
