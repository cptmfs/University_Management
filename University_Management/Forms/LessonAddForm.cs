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
    public partial class LessonAddForm : Form
    {
        public LessonAddForm()
        {
            InitializeComponent();
        }
        universityDbEntities2 db =new universityDbEntities2();
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtLessonName.Text == "")
            {
                errorProvider1.SetError(txtLessonName, "Lesson name cannot be empty!");
            }
            else
            {
                datLessons lessons = new datLessons();
                lessons.LessonName = txtLessonName.Text;
                db.datLessons.Add(lessons);
                db.SaveChanges();
                MessageBox.Show("Lesson Added", "Add", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
