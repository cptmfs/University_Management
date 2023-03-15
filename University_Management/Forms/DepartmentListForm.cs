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
    public partial class DepartmentListForm : Form
    {
        public DepartmentListForm()
        {
            InitializeComponent();
        }
        universityDbEntities2 db= new universityDbEntities2();
        private void DepartmentListForm_Load(object sender, EventArgs e)
        {
            var values=from x in db.datDepartment select new 
            { 
                x.DepID,
                x.DepName,
                
            };
            dataGridView1.DataSource = values.ToList();
            
        }
    }
}
