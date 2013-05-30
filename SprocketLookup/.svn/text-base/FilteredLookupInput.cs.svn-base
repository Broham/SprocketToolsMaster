using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace SprocketLookup
{
    class FilteredLookupInput : SPFieldLookup
    {
        public FilteredLookupInput(SPFieldCollection fields, string fieldName) :
            base(fields, fieldName) { }

        public FilteredLookupInput(SPFieldCollection fields, string typeName, string displayName) :
            base(fields, typeName, displayName) { }

        public string TargetColumn
        {
            get;
            set;
        }
    }
}
