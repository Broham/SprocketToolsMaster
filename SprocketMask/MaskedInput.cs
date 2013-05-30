using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace SprocketMask
{
    public class MaskedInput : SPFieldText
    {
        public MaskedInput(SPFieldCollection fields, string fieldName) :

                                                                        base(fields, fieldName) { }

        public MaskedInput(SPFieldCollection fields, string typeName, string displayName) :

                                                                        base(fields, typeName, displayName) { }
        private string _Mask;
        public string Mask
        {
            get
            {
                return _Mask;
            }
            set
            {
                _Mask = value;   
            }
        }


        public string Instructions
        {
            get;
            set;
        }

        public bool UseCustomPattern
        {
            get;
            set;
        }


        public override BaseFieldControl FieldRenderingControl
        {
            get
            {
                BaseFieldControl fieldControl = new MaskedInputControl(this);
                fieldControl.FieldName = InternalName; return fieldControl;
            }
        }
    }
}
