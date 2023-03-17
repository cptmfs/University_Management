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

namespace University_Management.Forms
{
    public partial class StudentLoginForm : Form 
    {
        public StudentLoginForm()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=universityDb;Integrated Security=True");
        private void btnSave_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select * From datStudent where StudentNo=@p1 and StudentPass=@p2",connection);
            cmd.Parameters.AddWithValue("@p1",txtID.Text);
            cmd.Parameters.AddWithValue("@p2", txtPass.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()) 
            {
                StudentPanelForm form = new StudentPanelForm();
                form.number = txtID.Text;
                form.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("UserID or Password Wrong! Please  Re-Enter","Login Error",MessageBoxButtons.OK,MessageBoxIcon.Warning);  
            }
            connection.Close();
        }

        private void txtID_TextChanged(object sender, EventArgs e)
        {
            if (txtID.Text=="00000" && txtPass.Text=="000")
            {
                ChartForm form = new ChartForm();
                form.Show();
                this.Hide();
            }
        }

        private void txtPass_TextChanged(object sender, EventArgs e)
        {
            if (txtID.Text == "00000" && txtPass.Text == "000")
            {
                ChartForm form = new ChartForm();
                form.Show();
                this.Hide();
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
