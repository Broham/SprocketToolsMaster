using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

using System.Web.UI.WebControls;

namespace SprocketRegexValidator
{
    class RegexValidatedInputControl : BaseFieldControl
    {
        RegexValidatedInput field;
        TextBox tb_Input;
        RegularExpressionValidator regexVal;

        public RegexValidatedInputControl(RegexValidatedInput rvi)
        {
            field = rvi;
            this.tb_Input = new TextBox();
            this.regexVal = new RegularExpressionValidator();
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            tb_Input = new TextBox();
            tb_Input.ID = "tb_Input";

            regexVal = new RegularExpressionValidator();
            regexVal.ValidationExpression = field.Regex;
            regexVal.ControlToValidate = "tb_Input";
            regexVal.Text = "Input invalid!";

            this.Controls.Add(tb_Input);
            this.Controls.Add(regexVal);
        }
    }
}
