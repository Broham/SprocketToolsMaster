using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Novacode;
using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using Microsoft.SharePoint;
using System.Linq;

namespace SprocketMerge.SprocketMerge
{
    public partial class SprocketMergeUserControl : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SPFolderCollection sfc = SPContext.Current.Web.Folders;
                ddl_Destination.Items.Add("---Make a selection---");
                foreach (SPFolder f in sfc.Cast<SPFolder>().OrderBy(t=>t.Name))
                {
                    if (f.DocumentLibrary != null)
                    {
                        ddl_Destination.Items.Add(new ListItem(f.Name, f.Url));
                    }
                }

                SPListCollection lic = SPContext.Current.Web.Lists;
                ddl_Lists.Items.Add("---Make a selection---");
                foreach (SPList l in lic.Cast<SPList>().OrderBy(t=>t.Title))
                {
                    //if(l.BaseType == SPBaseType.f
                    ddl_Lists.Items.Add(new ListItem(l.Title, l.ID.ToString()));
                }

                SPDocumentLibrary tempDocs = (SPDocumentLibrary)SPContext.Current.Web.Lists["Merge Templates"];
                //lb_Templates.Items.Add(new ListItem("---Make a selection---","-1",true);
                foreach (SPListItem i in tempDocs.Items.Cast<SPListItem>().OrderBy(t=>t.Name))
                {
                    lb_Templates.Items.Add(new ListItem(i.Name, i.UniqueId.ToString()));
                }
                lb_Templates.DataBind();
            }
        }

        protected void btn_Merge_Click(object sender, EventArgs e)
        {
            try
            {
                SPList l = SPContext.Current.Web.Lists[new Guid(ddl_Lists.SelectedValue)];

                SPFolder f = SPContext.Current.Web.Folders[ddl_Destination.SelectedValue];

                List<string> visFields = new List<string>();
                visFields = GetVisibleColumns(l.DefaultView.ViewFields);
                using (DocX doc = DocX.Load(SPContext.Current.Web.GetFile(new Guid(lb_Templates.SelectedValue)).OpenBinaryStream()))
                {
                    foreach (SPListItem li in l.Items)
                    {
                        foreach (string field in visFields)
                        {
                            if (li[field] != null)
                            {
                                doc.ReplaceText(GetRepaceableText(field), li[field].ToString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                            }
                            else if(field == "Today's Date") //special functionality for today's date
                            {
                                doc.ReplaceText(GetRepaceableText(field), DateTime.Now.ToShortDateString(), false, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                            }
                        }

                        MemoryStream ms = new MemoryStream();
                        doc.SaveAs(ms);
                        //HERE  let users choose field that 
                        f.Files.Add(li["Name"].ToString() + ".docx", ms, true);
                    }
                }
                lbl_Result.Text = "Merge complete! " + l.Items.Count + " documents created.";
            }
            catch(Exception ex)
            {
                lbl_Result.Text = "ERROR: " + ex.Message + System.Environment.NewLine + ex.StackTrace;
            }
        }

        private List<string> GetVisibleColumns(SPViewFieldCollection sfc)
        {
            List<string> visFields = new List<string>();
            foreach (string field in sfc)
            {
                visFields.Add(field);
            }
            visFields.Add("Today's Date");
            return visFields;
        }

        private List<string> GetTemplateFields(string text)
        {
            List<string> returnVals = new List<string>();
            MatchCollection mc = Regex.Matches(text, "<<_(.+?)_>>");
            foreach (Match m in mc)
            {
                returnVals.Add(m.Value.Replace("<<_", "").Replace("_>>", ""));
            }
            return returnVals;
        }

        private string GetRepaceableText(string text)
        {
            return "<<_" + text + "_>>";
        }

        protected string ClosestMatch(string target, List<string> options)
        {
            int lowest = LevDistance.Compute(target, options[0]);
            string selectedVal = string.Empty;
            foreach (string option in options)
            {
                int currentDist = LevDistance.Compute(target, option);
                if (currentDist < lowest)
                {
                    lowest = currentDist;
                    selectedVal = option;
                }
            }
            return selectedVal;

        }

        protected void ddl_Lists_SelectedIndexChanged(object sender, EventArgs e)
        {
            SPList l = SPContext.Current.Web.Lists[new Guid(ddl_Lists.SelectedValue)];

            List<String> names = GetVisibleColumns(l.DefaultView.ViewFields);
            DocX doc = DocX.Load(SPContext.Current.Web.GetFile(new Guid(lb_Templates.SelectedValue)).OpenBinaryStream());

            List<string> templateFields = GetTemplateFields(doc.Text);
            List<RowData> myData = new List<RowData>();

            foreach (String template in templateFields)
            {
                RowData rd = new RowData();
                rd.TemplateField = template;
                rd.SelectedValue = ClosestMatch(template, names);
                rd.ColumnNames = names;
                myData.Add(rd);
            }
            ObjectDataSource ods = new ObjectDataSource();
            ///ods.select
            gv_Mappings.DataSource = myData;
            gv_Mappings.DataBind();
            ddl_Destination.Enabled = true;
        }

        protected void gv_Mappings_rowdatabound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SPList l = SPContext.Current.Web.Lists[new Guid(ddl_Lists.SelectedValue)];
                List<String> names = GetVisibleColumns(l.DefaultView.ViewFields);
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddl_Columns");
                ddl.SelectedValue = ClosestMatch(e.Row.Cells[0].Text, names);
                ddl.DataSource = names;
                ddl.DataBind();
            }
        }

        protected void lb_Templates_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Lists.Enabled = true;
        }
    }
}
