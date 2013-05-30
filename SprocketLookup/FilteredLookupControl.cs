using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Web;

namespace SprocketLookup
{
    class FilteredLookupControl : BaseFieldControl
    {
        FilteredLookupInput field;

        public FilteredLookupControl(FilteredLookupInput fli)
        {
            field = fli;
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
        }

        //protected override valu
    }
}
