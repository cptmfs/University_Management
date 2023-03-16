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
            dataGridView1.DataSource = db.View_1.ToList();
            dataGridView1.Columns["Lesson"].Visible = false;


        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            datGrades g = new datGrades();
            g.Exam1 = byte.Parse(txtEx1.Text);
            g.Exam2 = byte.Parse(txtEx2.Text);
            g.Exam3 = byte.Parse(txtEx3.Text);
            g.Quiz1= byte.Parse(txtQuiz1.Text);
            g.Quiz2=byte.Parse(txtQuiz2.Text);
            g.Project = byte.Parse(txtProject.Text);
            g.Lesson = int.Parse(cbxLesson.SelectedValue.ToString());
            g.Student = int.Parse(txtStudent.Text);
            g.StudentAvg = int.Parse(txtAvg.Text);
            db.datGrades.Add(g);
            db.SaveChanges();
            MessageBox.Show("Student Grade information has been successfully saved in the system","Grade Add",MessageBoxButtons.OK,MessageBoxIcon.Information);
            GradeList();
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            datGrades g = new datGrades();
            int ex1, ex2, ex3, q1, q2, p;
            double avg;
            ex1=byte.Parse(txtEx1.Text);
            ex2 = byte.Parse(txtEx2.Text);
            ex3= byte.Parse(txtEx3.Text);
            q1= byte.Parse(txtQuiz1.Text);
            q2= byte.Parse(txtQuiz2.Text);
            p= byte.Parse(txtProject.Text);
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
            txtEx1.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtEx2.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            txtEx3.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            txtQuiz1.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
            txtQuiz2.Text = dataGridView1.Rows[e.RowIndex].Cells[8].Value.ToString();
            txtProject.Text = dataGridView1.Rows[e.RowIndex].Cells[9].Value.ToString();
            txtAvg.Text = dataGridView1.Rows[e.RowIndex].Cells[10].Value.ToString();
            cbxLesson.SelectedValue= int.Parse(dataGridView1.Rows[e.RowIndex].Cells[11].Value.ToString());
        }

        private void btnList_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = db.View_1.ToList();
        }
    }
}
