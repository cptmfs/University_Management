﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace University_Management.Forms
{
    public partial class StudentPanelForm : Form
    {
        public StudentPanelForm()
        {
            InitializeComponent();
        }
        public string number;
        private void StudentPanelForm_Load(object sender, EventArgs e)
        {
            txtNo.Text= number;
        }
    }
}
