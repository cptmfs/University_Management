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
    public partial class StudentRegisterForm : Form
    {
        public StudentRegisterForm()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-D3HGLAO\\SQLEXPRESS;Initial Catalog=universityDb;Integrated Security=True");

        private void StudentRegisterForm_Load(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select * From datDepartment",connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            comboBox1.ValueMember = "DepID";
            comboBox1.DisplayMember = "DepName";
            comboBox1.DataSource = dt;

            txtPass.PasswordChar = '*';
            txtPass2.PasswordChar = '*';
        }
        universityDbEntities2 db = new universityDbEntities2();
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtPass.Text==txtPass2.Text)
            {
                datStudent student = new datStudent();
                student.StudentFirstName = txtName.Text;
                student.StudentLastName = txtSurname.Text;
                student.StudentNo = txtNo.Text;
                student.StudentPass = txtPass.Text;
                student.StudentPass = txtPass2.Text;
                student.StudentMail = txtMail.Text;
                student.StudentImg = txtImg.Text;
                student.StudentDep = int.Parse(comboBox1.SelectedValue.ToString());
                db.datStudent.Add(student);
                db.SaveChanges();
                MessageBox.Show("Student information has been successfully saved in the system", "Register", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("The passwords you entered did not match.","Password",MessageBoxButtons.OK,MessageBoxIcon.Stop);
            }
            
        }

        private void btnFile_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            txtImg.Text = openFileDialog1.FileName;
        }
    }
}
