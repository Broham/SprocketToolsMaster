using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Reflection;


namespace SprocketValidator
{
    public class ValidatedInput : SPFieldText
    {

        public ValidatedInput(SPFieldCollection fields, string fieldName) :
                                                                        base(fields, fieldName) { }

        public ValidatedInput(SPFieldCollection fields, string typeName, string displayName) :

                                                                        base(fields, typeName, displayName) { }

        private int _ValidationSettings;
        public int ValidationSettings
        {
            get { return _ValidationSettings; }
            set { _ValidationSettings = value; }
        }

        private int _CommonPatternIndex;
        public int CommonPatternIndex
        {
            get { return _CommonPatternIndex; }
            set { _CommonPatternIndex = value; }
        }

        public enum ValidationTypes { Masked = 1, Regex, Value };
        
        private int _ValidationType;
        public int ValidationType
        {
            get { return this._ValidationType; }
            set { this._ValidationType = value; }
        }



        private string _Regex;
        public string Regex
        {
            get
            {
                return _Regex;
            }
            set
            {
                _Regex = value;
            }
        }

        public string ComparisonValue;
        public string ComparisonDataType;
        public string Comparison;

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

        private string _Instructions;
        public string Instructions
        {
            get
            {
                return _Instructions;
            }
            set
            {
                _Instructions = value;
            }
        }

        public override BaseFieldControl FieldRenderingControl
        {
            get
            {
                BaseFieldControl fieldControl = new ValidatedInputControl(this);
                fieldControl.FieldName = InternalName; 
                return fieldControl;
            }
        }

        public void SetFieldAttribute(string propertyName, object propertyValue)
        {
            Type type = typeof(SPField);
            MethodInfo set = type.GetMethod("SetFieldAttributeValue", BindingFlags.NonPublic | BindingFlags.Instance);
            set.Invoke(this, new object[] { propertyName, propertyValue.ToString() });
        }

        public string GetFieldAttribute(string propertyName)
        {
            Type type = typeof(SPField);
            MethodInfo getField = type.GetMethod("GetFieldAttributeValue", BindingFlags.NonPublic | BindingFlags.Instance, null, new Type[] { typeof(String) }, null);
            return (string)getField.Invoke(this, new object[] { propertyName });
        }
    }
}
