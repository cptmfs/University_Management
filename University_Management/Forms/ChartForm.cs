using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace University_Management.Forms
{
    public partial class ChartForm : Form
    {
        public ChartForm()
        {
            InitializeComponent();
        }

        private void pnlLessonList_Click(object sender, EventArgs e)
        {
            LessonListForm form = new LessonListForm();
            form.Show();
        }

        private void pnlDepList_Click(object sender, EventArgs e)
        {
            DepartmentListForm form1 = new DepartmentListForm();
            form1.Show();
        }

        private void pnlNewDep_Click(object sender, EventArgs e)
        {
            DepartmentForm form2 = new DepartmentForm();
            form2.Show();
        }

        private void pnlGrades_Click(object sender, EventArgs e)
        {
            GradesForm form3 = new GradesForm();
            form3.Show();
        }

        private void pnlStudent_Click(object sender, EventArgs e)
        {
            StudentForm form4 = new StudentForm();
            form4.Show();
        }

        private void pnlStudentReg_Click(object sender, EventArgs e)
        {
            StudentRegisterForm form5 = new StudentRegisterForm();
            form5.Show();
        }

        private void pnlNewLesson_Click(object sender, EventArgs e)
        {
           LessonAddForm form6 = new LessonAddForm();
            form6.Show();
        }


        private void pnlSupport_Click(object sender, EventArgs e)
        {
            MessageBox.Show("This Project was created by cptmfs.\r\nA University Student Course and Personnel Operations management project was developed in C# Windows Form application.\r\nFor Academician Entry of the Project It is set to :\r\nId=00000 \r\nPass=000\r\nFor those who access the database of the project via Github, a script file named 'database' has been added to the script file.\r\nDo not forget to choose the file path as the path on your own computer before running the script file.\r\nFor more you can contact me at cpt.mfs@gmail.com", "Support",MessageBoxButtons.OK,MessageBoxIcon.Information);
        }

        private void panel7_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
