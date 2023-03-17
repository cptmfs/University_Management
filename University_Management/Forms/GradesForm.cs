using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using University_Management.Entity;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace University_Management.Forms
{
    public partial class GradesForm : Form
    {
        public GradesForm()
        {
            InitializeComponent();
        }
        universityDbEntities2 db = new universityDbEntities2();

        private void GradesForm_Load(object sender, EventArgs e)
        {
            GradeList();
            cbxLesson.ValueMember = "LessonID";
            cbxLesson.DisplayMember = "LessonName";
            cbxLesson.DataSource = db.datLessons.ToList();
            cbxLesson2.ValueMember = "LessonID";
            cbxLesson2.DisplayMember = "LessonName";
            cbxLesson2.DataSource = db.datLessons.ToList();
        }
        void GradeList()
        {
            //var values = from x in db.datGrades
            //             select new
            //             {
            //                 x.GradeID,
            //                 x.Exam1,
            //                 x.Exam2,
            //                 x.Exam3,
            //                 x.Quiz1,
            //                 x.Quiz2,
            //                 x.Project,
            //                 x.StudentAvg,
            //                 x.datLessons.LessonName,
            //                 x.Lesson,
            //                 x.Student
            //             };
            //dataGridView1.DataSource = values.ToList(); 
            //dataGridView1.DataSource = db.View_1.ToList();
            dataGridView1.DataSource = db.StGrades2();
            dataGridView1.Columns["LessonID"].Visible = false;


        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            datGrades g = new datGrades();
            g.Exam1 = byte.Parse(txtEx1.Text);
            g.Exam2 = byte.Parse(txtEx2.Text);
            g.Exam3 = byte.Parse(txtEx3.Text);
            g.Quiz1 = byte.Parse(txtQuiz1.Text);
            g.Quiz2 = byte.Parse(txtQuiz2.Text);
            g.Project = byte.Parse(txtProject.Text);
            g.Lesson = int.Parse(cbxLesson.SelectedValue.ToString());
            g.Student = int.Parse(txtStudent.Text);
            g.StudentAvg = int.Parse(txtAvg.Text);
            db.datGrades.Add(g);
            db.SaveChanges();
            MessageBox.Show("Student Grade information has been successfully saved in the system", "Grade Add", MessageBoxButtons.OK, MessageBoxIcon.Information);
            GradeList();
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            datGrades g = new datGrades();
            int ex1, ex2, ex3, q1, q2, p;
            double avg;
            ex1 = byte.Parse(txtEx1.Text);
            ex2 = byte.Parse(txtEx2.Text);
            ex3 = byte.Parse(txtEx3.Text);
            q1 = byte.Parse(txtQuiz1.Text);
            q2 = byte.Parse(txtQuiz2.Text);
            p = byte.Parse(txtProject.Text);
            avg = (ex1 + ex2 + ex3 + q1 + q2 + p) / 6;
            txtAvg.Text = avg.ToString();

            //g.StudentAvg = avg;
            //db.datGrades.Add(g);
            //db.SaveChanges();
            //MessageBox.Show($"Student grade Avg : {g.StudentAvg}","Avg Calculate",MessageBoxButtons.OK,MessageBoxIcon.Exclamation);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
                txtID.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                txtEx1.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                txtEx2.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                txtEx3.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                txtQuiz1.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
                txtQuiz2.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
                txtProject.Text = dataGridView1.Rows[e.RowIndex].Cells[8].Value.ToString();
                txtAvg.Text = dataGridView1.Rows[e.RowIndex].Cells[9].Value.ToString();
                cbxLesson.SelectedValue = int.Parse(dataGridView1.Rows[e.RowIndex].Cells[10].Value.ToString());
        }

        private void btnList_Click(object sender, EventArgs e)
        {
            //dataGridView1.DataSource = db.View_1.ToList();
            //dataGridView1.DataSource = db.StGrades2();
            //dataGridView1.Columns["LessonID"].Visible = false;

            GradeList();

        }

        private void cbxLesson2_SelectedIndexChanged(object sender, EventArgs e)
        {
            var values = from x in db.datGrades
                         select new
                         {
                             x.GradeID,
                             x.datLessons.LessonName,
                             Student = x.datStudent.StudentFirstName + " " + x.datStudent.StudentLastName,
                             x.Exam1,
                             x.Exam2,
                             x.Exam3,
                             x.Quiz1,
                             x.Quiz2,
                             x.Project,
                             x.StudentAvg,
                             x.Lesson
                         };
            int v = int.Parse(cbxLesson2.SelectedValue.ToString()); //cbxLesson2 nin secilen degeri valuemember olarak int geldiği için int dönüşümü yapıldı
            dataGridView1.DataSource = values.Where(x => x.Lesson == v).ToList();
            dataGridView1.Columns["Lesson"].Visible = false;


        }

        private void btnSearchID_Click(object sender, EventArgs e)
        {
            var values = from x in db.datGrades
                         select new
                         {
                             x.GradeID,
                             x.datLessons.LessonName,
                             Student_Name = x.datStudent.StudentFirstName + " " + x.datStudent.StudentLastName,
                             x.Exam1,
                             x.Exam2,
                             x.Exam3,
                             x.Quiz1,
                             x.Quiz2,
                             x.Project,
                             x.StudentAvg,
                             x.Lesson,
                             x.Student
                         };
            int id = int.Parse(mskNo.Text);
            dataGridView1.DataSource = values.Where(x => x.Student == id).ToList();
            dataGridView1.Columns["Lesson"].Visible = false;
            dataGridView1.Columns["Student"].Visible = false;
        }
        private void btnSearchNo_Click(object sender, EventArgs e)
        {
            if (mskNo.Text.Length==5)
            {
                var values = db.datStudent.Where(x => x.StudentNo == "13341").Select(y => y.StudentID).FirstOrDefault();
                var grades = from g in db.datGrades
                             select new
                             {
                                 g.GradeID,
                                 g.datLessons.LessonName,
                                 Student_Name = g.datStudent.StudentFirstName + " " + g.datStudent.StudentLastName,
                                 g.Exam1,
                                 g.Exam2,
                                 g.Exam3,
                                 g.Quiz1,
                                 g.Quiz2,
                                 g.Project,
                                 g.StudentAvg,
                                 g.Lesson,
                                 g.Student
                             };
                dataGridView1.DataSource = grades.Where(a => a.Student == values).ToList();
                dataGridView1.Columns["Lesson"].Visible = false;
                dataGridView1.Columns["Student"].Visible = false;
            }
            else
            {
                MessageBox.Show("Please enter valid StundentNo","Validation",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
            
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            
                int id = int.Parse(txtID.Text);
                var x = db.datGrades.Find(id);
                x.Exam1 = int.Parse(txtEx1.Text);
                x.Exam2 = int.Parse(txtEx2.Text);
                x.Exam3 = int.Parse(txtEx3.Text);
                x.Quiz1 = int.Parse(txtQuiz1.Text);
                x.Quiz2 = int.Parse(txtQuiz2.Text);
                x.Project = int.Parse(txtProject.Text);
                x.StudentAvg = int.Parse(txtAvg.Text);
                db.SaveChanges();
                MessageBox.Show("Student Grades has been successfully updated in the system", "Grade Update", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
