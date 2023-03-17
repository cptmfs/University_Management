using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;

namespace University_Management.Forms
{
    public partial class PictureForm : Form
    {
        public PictureForm()
        {
            InitializeComponent();
        }
        public string imgLocation;
        public int id;
        private void PictureForm_Load(object sender, EventArgs e)
        {
            pictureBox1.ImageLocation = $@"{imgLocation}";

        }

        private void button1_Click(object sender, EventArgs e)
        { 
            this.Close();
        }
    }
}
