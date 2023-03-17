using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using University_Management.Entity;

namespace University_Management.Forms
{
    public partial class StudentPanelForm : Form
    {
        public StudentPanelForm()
        {
            InitializeComponent();
        }
        public string number;
        universityDbEntities2 db = new universityDbEntities2();
        int studentId;
        private void StudentPanelForm_Load(object sender, EventArgs e)
        {
            txtNo.Text = number;
            txtName.Text = db.datStudent.Where(x => x.StudentNo == number).Select(y => y.StudentFirstName).FirstOrDefault();
            txtSurname.Text = db.datStudent.Where(x => x.StudentNo == number).Select(y => y.StudentLastName).FirstOrDefault();
            txtPass.Text = db.datStudent.Where(x => x.StudentNo == number).Select(y => y.StudentPass).FirstOrDefault();
            txtMail.Text = db.datStudent.Where(x => x.StudentNo == number).Select(y => y.StudentMail).FirstOrDefault();
            txtDep.Text = db.datStudent.Where(x => x.StudentNo == number).Select(y => y.StudentDep).FirstOrDefault().ToString();
            studentId = db.datStudent.Where(i=>i.StudentNo== number).Select(j=> j.StudentID).FirstOrDefault(); 

            var examGrades = (from t in db.datGrades
                             select new
                             {
                                 t.datLessons.LessonName,
                                 t.Exam1,
                                 t.Exam2,
                                 t.Exam3,
                                 t.Quiz1,
                                 t.Quiz2,
                                 t.Project,
                                 t.StudentAvg,
                                 t.Student
                             }).Where(p=>p.Student==studentId).ToList();
            dataGridView1.DataSource = examGrades;

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text==txtNewPass2.Text && txtNewPass.Text!="" && txtNewPass2.Text != "")
            {
                var values = db.datStudent.Find(studentId);
                values.StudentPass= txtNewPass.Text;
                values.StudentMail = txtMail.Text;
                db.SaveChanges();
                MessageBox.Show("Student Informations Successfully Updated","Update",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
