//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace University_Management.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class datGrades
    {
        public int GradeID { get; set; }
        public Nullable<int> Exam1 { get; set; }
        public Nullable<int> Exam2 { get; set; }
        public Nullable<int> Exam3 { get; set; }
        public Nullable<int> Quiz1 { get; set; }
        public Nullable<int> Quiz2 { get; set; }
        public Nullable<int> Project { get; set; }
        public Nullable<decimal> StudentAvg { get; set; }
        public Nullable<int> Lesson { get; set; }
        public Nullable<int> Student { get; set; }
    
        public virtual datLessons datLessons { get; set; }
        public virtual datStudent datStudent { get; set; }
    }
}
