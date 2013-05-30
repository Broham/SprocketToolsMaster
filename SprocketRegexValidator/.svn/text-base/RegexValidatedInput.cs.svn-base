using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace SprocketRegexValidator
{
    class RegexValidatedInput : SPFieldText
    {
        public RegexValidatedInput(SPFieldCollection fields, string fieldName) :

                                                                        base(fields, fieldName) { }

        public RegexValidatedInput(SPFieldCollection fields, string typeName, string displayName) :

                                                                        base(fields, typeName, displayName) { }

        public string Regex
        {
            get
            {
                return GetCustomProperty("Regex").ToString();
            }
            set
            {
                Regex = value;
            }
        }

        public override BaseFieldControl FieldRenderingControl
        {
            get
            {
                BaseFieldControl fieldControl = new RegexValidatedInputControl(this);
                fieldControl.FieldName = InternalName; 
                return fieldControl;
            }
        }
    }
}
