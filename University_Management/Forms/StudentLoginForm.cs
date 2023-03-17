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
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-D3HGLAO\\SQLEXPRESS;Initial Catalog=universityDb;Integrated Security=True");
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
    }
}
