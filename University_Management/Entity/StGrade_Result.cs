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
    
    public partial class StGrade_Result
    {
        public int GradeID { get; set; }
        public string LessonName { get; set; }
        public string Student { get; set; }
        public Nullable<byte> Exam1 { get; set; }
        public Nullable<byte> Exam2 { get; set; }
        public Nullable<byte> Exam3 { get; set; }
        public Nullable<byte> Quiz1 { get; set; }
        public Nullable<byte> Quiz2 { get; set; }
        public Nullable<decimal> Student_Average { get; set; }
        public int LessonID { get; set; }
    }
}
