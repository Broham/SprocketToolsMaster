using System;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Collections;
using System.Linq;

namespace SprocketComplete.SprocketComplete
{
    [ToolboxItemAttribute(false)]
    public class SprocketComplete : WebPart
    {
        //[WebBrowsable(true),
        //Category("Miscellaneous"),
        //Personalizable(PersonalizationScope.Shared),
        //WebDisplayName("Enter some text")]
        //public string CustomTextProp { get; set; } 

        // Visual Studio might automatically update this path when you change the Visual Web Part project item.
        private const string _ascxPath = @"~/_CONTROLTEMPLATES/SprocketComplete/SprocketComplete/SprocketCompleteUserControl.ascx";
        public string _SourceList { get; set; }
        public string _SourceColumn { get; set; } 

        protected override void CreateChildControls()
        {
           // MyEditorPart mep = new MyEditorPart();
            SprocketCompleteUserControl control = Page.LoadControl(_ascxPath) as SprocketCompleteUserControl;
            if (control != null)
                control.WebPart = this;
            //Controls.Add(mep);
            Controls.Add(control);
        }

        public override EditorPartCollection CreateEditorParts()
        {
            ArrayList editorArray = new ArrayList();
            MyEditorPart edPart = new MyEditorPart();
            edPart.ID = this.ID + "_editorPart1";
            editorArray.Add(edPart);
            EditorPartCollection editorParts = new EditorPartCollection(editorArray);
            return editorParts;
        }

    }

    public class MyEditorPart : EditorPart
    {
        private bool OnlyUserColumns;

        private Label lbl_Options;
        private DropDownList ddl_Lists;

        private Label lbl_Columns;
        private DropDownList ddl_ListColumns;

        private Label lbl_UserColumns;
        private CheckBox cb_UserColumns;

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            ddl_Lists = new DropDownList();
            ddl_Lists.AutoPostBack = true;
            ddl_Lists.SelectedIndexChanged += new EventHandler(ddl_Lists_SelectedIndexChanged);

            lbl_Options = new Label();
            lbl_Options.Text = "<strong>Select source List:</strong>";

            lbl_Columns = new Label();
            lbl_Columns.Text = "<br/><br/><strong>Select source column:</strong>";

            ddl_ListColumns = new DropDownList();
            ddl_ListColumns.AutoPostBack = true;
            ddl_ListColumns.SelectedIndexChanged += new EventHandler(ddl_ListColumns_SelectedIndexChanged);
            ddl_ListColumns.Enabled = false;

            //lbl_UserColumns = new Label();
            //lbl_UserColumns.Text = "<br/><br/><strong>Only display user defined columns:</strong>";

            cb_UserColumns = new CheckBox();
            cb_UserColumns.Text = "<br/><br/><strong>Only display user defined columns:</strong>";
            cb_UserColumns.Checked = true;
            cb_UserColumns.TextAlign = TextAlign.Left;
            cb_UserColumns.AutoPostBack = true;
            cb_UserColumns.CheckedChanged += new EventHandler(cb_UserColumns_CheckedChanged);

            
            //using (SPSite site = new SPSite("http://" + Page.Request.Url.Host.ToString()))
            ddl_Lists.Items.Add("--Make a Selection-");
            using (SPWeb web = SPContext.Current.Web.Site.OpenWeb())
            {
                foreach (SPList l in web.Lists)
                {
                    ddl_Lists.Items.Add(new ListItem(l.Title, l.ID.ToString()));
                }
            }
            
            Controls.Add(lbl_Options);
            Controls.Add(ddl_Lists);

            Controls.Add(lbl_Columns);
            Controls.Add(ddl_ListColumns);

            Controls.Add(cb_UserColumns);
        }

        protected void cb_UserColumns_CheckedChanged(Object sender, EventArgs e)
        {
            ddl_Lists_SelectedIndexChanged(new object(), new EventArgs());
        }

        protected void ddl_ListColumns_SelectedIndexChanged(Object sender, EventArgs e)
        {
            //SprocketComplete webPart = WebPartToEdit as SprocketComplete;
            //webPart._SourceColumn = ddl_ListColumns.SelectedValue;
        }

        protected void ddl_Lists_SelectedIndexChanged(Object sender, EventArgs e)
        {
            ddl_ListColumns.Enabled = true;
            ddl_ListColumns.Items.Clear();
            using (SPWeb web = SPContext.Current.Web.Site.OpenWeb())
            {
                
                SPList l = SPContext.Current.Web.Lists[new Guid(ddl_Lists.SelectedValue)];
                foreach (SPField f in l.Fields)
                {
                    if (!SPBuiltInFieldId.Contains(f.Id))
                    {
                        ddl_ListColumns.Items.Add(new ListItem(f.Title, f.InternalName));
                    }
                    else if (!cb_UserColumns.Checked)
                    {
                        ddl_ListColumns.Items.Add(new ListItem(f.Title + " - " + f.InternalName, f.InternalName));
                    }

                }
            }
        }

        public override bool ApplyChanges()
        {
            EnsureChildControls();
            SprocketComplete webPart = WebPartToEdit as SprocketComplete;

            if (webPart != null)
            {
                webPart._SourceList = ddl_Lists.SelectedValue.ToString();
                webPart._SourceColumn = ddl_ListColumns.SelectedValue.ToString();
            }
            return true;
        }

        public override void SyncChanges()
        {
            EnsureChildControls();
            SprocketComplete webPart = WebPartToEdit as SprocketComplete;

            if (webPart != null && webPart._SourceList != null)
            {
                ddl_Lists.SelectedValue = webPart._SourceList.ToString();
                ddl_Lists_SelectedIndexChanged(new object(), new EventArgs());
                ddl_ListColumns.SelectedValue = webPart._SourceColumn.ToString();
            }
        }
    }


}
