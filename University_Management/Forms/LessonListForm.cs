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
    public partial class LessonListForm : Form
    {
        public LessonListForm()
        {
            InitializeComponent();
        }
        universityDbEntities2 db = new universityDbEntities2();
        private void LessonListForm_Load(object sender, EventArgs e)
        {
            var LessonList = from x in db.datLessons
                             select new
                             {
                                 x.LessonID,
                                 x.LessonName
                             };
            dataGridView1.DataSource = LessonList.ToList();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
