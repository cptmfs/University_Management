using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
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
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-D3HGLAO\\SQLEXPRESS;Initial Catalog=universityDb;Integrated Security=True");
        private void StudentForm_Load(object sender, EventArgs e)
        {
            ListStudent();
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select * From datDepartment", connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            comboBox1.ValueMember = "DepID";
            comboBox1.DisplayMember = "DepName";
            comboBox1.DataSource = dt;

        }
        void ListStudent()
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
                             x.datDepartment.DepName,
                             x.StudentDep,
                             x.StudentStatus

                         };
            dataGridView1.DataSource = values.Where(x=>x.StudentStatus==true).ToList();
            dataGridView1.Columns["StudentDep"].Visible = false;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtID.Text= dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtName.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtSurname.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtNo.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtPass.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtMail.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            txtPicture.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            comboBox1.SelectedValue = dataGridView1.Rows[e.RowIndex].Cells[8].Value.ToString();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            var x = db.datStudent.Find(id);
            x.StudentStatus = false;
            db.SaveChanges();
            MessageBox.Show("Student has been successfully deleted in the system","Student Delete",MessageBoxButtons.OK,MessageBoxIcon.Stop);
            ListStudent();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtID.Text);
            var x = db.datStudent.Find(id);
            x.StudentFirstName = txtName.Text;
            x.StudentLastName = txtSurname.Text;
            x.StudentNo=txtNo.Text;
            x.StudentPass = txtPass.Text;
            x.StudentMail = txtMail.Text;
            x.StudentImg = txtPicture.Text;
            x.StudentDep = int.Parse(comboBox1.SelectedValue.ToString());
            db.SaveChanges();
            MessageBox.Show("Student Information has been successfully updated in the system", "Student Delete", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ListStudent();

        }
    }
}
