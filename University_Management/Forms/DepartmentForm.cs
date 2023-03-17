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
    public partial class DepartmentForm : Form
    {
        public DepartmentForm()
        {
            InitializeComponent();
        }

        universityDbEntities2 db= new universityDbEntities2();
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtDepName.Text=="")
            {
                errorProvider1.SetError(txtDepName, "Department name cannot be empty!");
            }
            else
            {
                datDepartment dep = new datDepartment();
                dep.DepName = txtDepName.Text;
                db.datDepartment.Add(dep);
                db.SaveChanges();
                MessageBox.Show("Departmend Added","Add",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
