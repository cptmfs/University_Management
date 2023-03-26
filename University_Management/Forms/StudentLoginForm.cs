using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace University_Management.Forms
{
    public partial class StudentLoginForm : Form 
    {
        private DateTime loginTime, logoutTime, errorTime;
        private string error = "";
        
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
                loginTime = DateTime.Now;
            }
            else
            {
                error = "UserID or Password Wrong!";
                errorTime = DateTime.Now;
                LogErMsg();
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
            logoutTime = DateTime.Now;
            LogMsg();
            Application.Exit();
        }

        private void LogMsg()
        {
            string userName = txtID.Text;
            StreamWriter sw = new StreamWriter(@"C:\Users\Kaptan\Documents\GitHub\University_Management\University_Management\log.txt", true);
            sw.WriteLine($"User Message:(LoginTime:{loginTime.ToString()}\tNo:{userName}\tLogoutTime:{logoutTime.ToString()})");
            sw.Close();
        }
        private void LogErMsg()
        {
            StreamWriter sw = new StreamWriter(@"C:\Users\Kaptan\Documents\GitHub\University_Management\University_Management\log.txt", true);
            sw.WriteLine($"Error Message:({error}\tErrorTime:{errorTime})");
            sw.Close();
        }
    }
}
