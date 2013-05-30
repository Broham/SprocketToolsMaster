using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;


namespace SprocketImport
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btn_Preview_Click(object sender, EventArgs e)
        {
            string line;
            string[] delims = new string[1] { tb_Delim.Text  };
            // Read the file and display it line by line.
            StreamReader file = new StreamReader(tb_File.Text);
            bool createColumns = true;
            while ((line = file.ReadLine()) != null)
            {
                if (createColumns)
                {
                    AddColumnsToDGV(line.Split(delims, StringSplitOptions.None).Length);
                    createColumns = false;
                }
                dgv_Preview.Rows.Add(line.Split(delims,StringSplitOptions.None));
            }
        }

        private void AddColumnsToDGV(int num)
        {
            for (int i = 0; i < num; i++)
            {
                dgv_Preview.Columns.Add(new DataGridViewColumn(new DataGridViewTextBoxCell()));
            }

        }

        private void btn_NavigateToDir_Click(object sender, EventArgs e)
        {
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == System.Windows.Forms.DialogResult.OK)
            {
                tb_Directory.Text = folderBrowserDialog1.SelectedPath;
            }
        }

        private void btn_NavigateToFile_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();

        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            tb_File.Text = openFileDialog1.FileName;
        }
    }
}
