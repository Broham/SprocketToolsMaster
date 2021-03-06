﻿using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint;

namespace SprocketMask.ControlTemplates.SprocketMask
{
    public partial class MaskedInputFieldEditor : UserControl, IFieldEditor
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public bool DisplayAsNewSection
        {
            get {return false;}
        }

        public void OnSaveChange(SPField field, bool bNewField)
        {
            MaskedInput customTypedField = (MaskedInput) field;
            if (cb_CustomMask.Checked)
            {
                customTypedField.Mask = tb_CustomMask.Text;
                customTypedField.UseCustomPattern = true;
            }
            else
            {
                customTypedField.Mask = ddl_CommonPatterns.SelectedValue;
                customTypedField.UseCustomPattern = false;
            }
        }

        public void InitializeWithField(SPField field)
        {
            if (!Page.IsPostBack)
            {
                MaskedInput customTypedField = (MaskedInput)field;
                if (customTypedField.UseCustomPattern)
                {
                    ddl_CommonPatterns.Enabled = false;
                    tb_CustomMask.Enabled = true;
                    tb_CustomMask.Text = customTypedField.Mask;
                }
                else
                {
                    ddl_CommonPatterns.Enabled = true;
                    tb_CustomMask.Enabled = false;
                    ddl_CommonPatterns.SelectedValue = customTypedField.Mask;
                }
            }
        }

        protected void cb_CustomMask_CheckedChanged(object sender, EventArgs e)
        {
            tb_CustomMask.Enabled = !tb_CustomMask.Enabled;
            ddl_CommonPatterns.SelectedIndex = 0;
            ddl_CommonPatterns.Enabled = !ddl_CommonPatterns.Enabled;
        }
    }
}
