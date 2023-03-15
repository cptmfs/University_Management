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
    public partial class StudentForm : Form
    {
        public StudentForm()
        {
            InitializeComponent();
        }
        universityDbEntities2 db = new universityDbEntities2();
        private void StudentForm_Load(object sender, EventArgs e)
        {
            var values = from x in db.datStudent
                         select new
                         {
                             x.StudentID,
                             x.StudentFirstName,
                             x.StudentLastName,
                             x.StudentNo,
                             x.StudentPass,
                             x.StudentMail,
                             x.StudentImg,
                             x.datDepartment.DepName

                         };
            dataGridView1.DataSource = values.ToList();
        }
    }
}
