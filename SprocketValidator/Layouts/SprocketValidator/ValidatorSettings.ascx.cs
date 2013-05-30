using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace SprocketValidator.CONTROLTEMPLATES.SprocketValidator
{
    public partial class ValidatorSettings : UserControl, IFieldEditor
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //rbl_ValidationMethods.SelectedIndex = 0;
        }

        bool IFieldEditor.DisplayAsNewSection
        {
            //get { throw new NotImplementedException(); }
            get { return true; }
        }

        public void InitializeWithField(SPField field)
        {
            ValidatedInput vi = (ValidatedInput)field;
            if (!Page.IsPostBack)
            {
                if (vi != null)
                {
                    int validationSetting = -1;
                    int validationType = -1;
                    int newIndex = -1;
                    int.TryParse(vi.GetFieldAttribute("ValidationSetting"), out validationSetting);
                    int.TryParse(vi.GetFieldAttribute("ValidationType"), out validationType);
                    rbl_ValidationMethods.SelectedIndex = validationSetting;
                    HideShowPanels();
                    switch (validationSetting)
                    {
                        case 0: //common patterns
                            int.TryParse(vi.GetFieldAttribute("CommonPatternIndex"), out newIndex);
                            ddl_CommonPatterns.SelectedIndex = newIndex;
                            SetCommonPatternText();
                            break;
                        case 1: //masked input
                            tb_MaskedInputPattern.Text = vi.GetFieldAttribute("Mask");
                            break;
                        case 2: //Regular Expression
                            tb_RegularExpression.Text = vi.GetFieldAttribute("Regex");
                            break;
                        case 3: // Value comparison
                            //do stuff
                            tb_ComparisonValue.Text = vi.GetFieldAttribute("ComparisonValue");
                            ddl_ValueType.SelectedIndex = ddl_ValueType.Items.IndexOf(ddl_ValueType.Items.FindByText(vi.GetFieldAttribute("ComparisonDataType")));
                            ddl_ComparisonTypes.SelectedIndex = ddl_ComparisonTypes.Items.IndexOf(ddl_ComparisonTypes.Items.FindByText(vi.GetFieldAttribute("Comparison")));
                            break;
                    }
                    tb_Instructions.Text = vi.GetFieldAttribute("Instructions");
                }
            }
        }

        public void OnSaveChange(SPField field, bool isNewField)
        {
            ValidatedInput vi = (ValidatedInput)field;
            //vi.ValidationType = rbl_ValidationMethods.SelectedIndex;
            vi.SetFieldAttribute("ValidationSetting", rbl_ValidationMethods.SelectedIndex);
            switch (rbl_ValidationMethods.SelectedIndex)
            {
                case 0://Common patterns
                    vi.SetFieldAttribute("CommonPatternIndex", ddl_CommonPatterns.SelectedIndex);
                    switch (ddl_CommonPatterns.SelectedItem.Text)
                    {
                        case "US Phone Number":
                        case "Social Security Number":
                        case "Zip Code":
                            vi.SetFieldAttribute("ValidationType", (int)ValidatedInput.ValidationTypes.Masked);
                            vi.SetFieldAttribute("Mask", ddl_CommonPatterns.SelectedValue);
                            break;
                        case "Email Address":
                        case "Web Address":
                            vi.SetFieldAttribute("ValidationType", (int)ValidatedInput.ValidationTypes.Masked);
                            vi.SetFieldAttribute("Mask", ddl_CommonPatterns.SelectedValue);
                            break;
                    }

                    break;
                case 1://Masked input
                    vi.SetFieldAttribute("ValidationType", (int)ValidatedInput.ValidationTypes.Masked);
                    vi.SetFieldAttribute("Mask", tb_MaskedInputPattern.Text);
                    break;
                case 2://Regular expressions
                    vi.SetFieldAttribute("ValidationType", (int)ValidatedInput.ValidationTypes.Regex);
                    vi.SetFieldAttribute("Regex", tb_RegularExpression.Text);
                    break;
                case 3://Value comparison
                    vi.SetFieldAttribute("ValidationType", (int)ValidatedInput.ValidationTypes.Value);
                    vi.SetFieldAttribute("ComparisonValue", tb_ComparisonValue.Text);
                    vi.SetFieldAttribute("Comparison", ddl_ComparisonTypes.SelectedValue);
                    vi.SetFieldAttribute("ComparisonDataType", ddl_ValueType.SelectedValue);
                    break;
            }

            vi.SetFieldAttribute("Instructions", tb_Instructions.Text);
            //vi.Update();
        }

        protected void OnChange_ddl_CommonPatterns(object sender, EventArgs e)
        {
            SetCommonPatternText();
        }

        private void SetCommonPatternText()
        {
            switch (ddl_CommonPatterns.SelectedItem.Text)
            {
                case "US Phone Number":
                    lbl_CommonPatternDesc.Text = "<br/>Users will only be allowed to enter numbers.  The numbers they enter will be formatted as <i>(555) 555-5555</i> or <i>(555) 555-5555 x55555</i> depending on how many characters they enter. ";
                    break;
                case "Social Security Number":
                    lbl_CommonPatternDesc.Text = "<br/>Users will only be allowed to enter numbers.  The numbers they enter will be formatted as <i>111-11-1111</i>";
                    break;
                case "Email Address":
                    lbl_CommonPatternDesc.Text = "<br/>Users must enter a valid email address. For Example: <i>support@sprocket-tools.com</i>";
                    break;
                case "Web Address":
                    lbl_CommonPatternDesc.Text = "<br/>Users must enter a valid web address.  For example: <i>http://sprocket-tools.com</i>";
                    break;
                case "Zip Code":
                    lbl_CommonPatternDesc.Text = "<br/>Users will only be allowed to enter number.  The numbers they enter will be formatted as <i>11111</i> or <i>11111-1111</i> depending on how many numbers they enter.";
                    break;
            }
        }

        protected void rbl_ValidationMethods_SelectedIndexChanged(object sender, EventArgs e)
        {
            HideShowPanels();
        }

        private void HideShowPanels()
        {
            switch (rbl_ValidationMethods.SelectedIndex)
            {
                case 0:
                    pnl_CommonPatterns.Visible = true;
                    pnl_MaskedInput.Visible = false;
                    pnl_Regex.Visible = false;
                    pnl_ValueComparison.Visible = false;
                    break;
                case 1:
                    pnl_CommonPatterns.Visible = false;
                    pnl_MaskedInput.Visible = true;
                    pnl_Regex.Visible = false;
                    pnl_ValueComparison.Visible = false;
                    break;
                case 2:
                    pnl_CommonPatterns.Visible = false;
                    pnl_MaskedInput.Visible = false;
                    pnl_Regex.Visible = true;
                    pnl_ValueComparison.Visible = false;
                    break;
                case 3:
                    pnl_CommonPatterns.Visible = false;
                    pnl_MaskedInput.Visible = false;
                    pnl_Regex.Visible = false;
                    pnl_ValueComparison.Visible = true;
                    break;
            }
        }

    }
}
