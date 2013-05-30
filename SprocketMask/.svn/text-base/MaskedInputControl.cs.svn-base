using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Web.UI.WebControls;

namespace SprocketMask
{
    class MaskedInputControl : BaseFieldControl
    {
        MaskedInput field;
        TextBox tb_MaskPattern;
        Label lbl_Instructions;

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            tb_MaskPattern = new TextBox();
            tb_MaskPattern.ID = "tb_MaskPattern";
            tb_MaskPattern.Attributes.Add("onfocus", "$(this).mask('" + field.Mask + "')");

            lbl_Instructions = new Label();
            lbl_Instructions.Text = "<br/>" + field.Instructions;
            lbl_Instructions.ID = "lbl_Instructions";

            this.Controls.Add(tb_MaskPattern);
            this.Controls.Add(lbl_Instructions);
        }

        public MaskedInputControl(MaskedInput mi)
        {
            this.field = mi;
            this.tb_MaskPattern = new TextBox();
            this.lbl_Instructions = new Label();
        }

        protected override void OnPreRender(EventArgs e)
        {
            this.Page.ClientScript.RegisterClientScriptInclude( "jquery", "/_layouts/SprocketMask/jQuery.js");
            this.Page.ClientScript.RegisterClientScriptInclude("jQueryPlugin", "/_layouts/SprocketMask/jquery.maskedinput-1.3.min.js");
            this.Page.ClientScript.RegisterClientScriptInclude("mask", "/_layouts/SprocketMask/mask.js");
        }

        public virtual string Text
        {
            get
            {
                this.EnsureChildControls();
                if (this.tb_MaskPattern == null)
                {
                    return null;
                }
                return this.tb_MaskPattern.Text;
            }
            set
            {
                if (this.tb_MaskPattern != null)
                {
                    this.tb_MaskPattern.Text = value;
                }
            }
        }

        public override object Value
        {
            get
            {
                return this.Text;
            }
            set
            {
                if (base.Field != null)
                {
                    this.Text = base.Field.GetFieldValueForEdit(value);
                }
            }
        }

        
    }
}
