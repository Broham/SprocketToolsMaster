using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;

namespace SprocketMerge.Layouts.SprocketMerge
{
    public partial class UploadFile : LayoutsPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Upload_Click(object sender, EventArgs e)
        {
            try
            {
                SPList templateLib = SPContext.Current.Web.Lists["Merge Templates"];
                templateLib.RootFolder.Files.Add(templateLib.RootFolder.Url + "/" + fu_NewTemplate.FileName, fu_NewTemplate.FileBytes);
                templateLib.Update();
            }
            catch (Exception ex)
            {
                lbl_Status.Text = "There was a problem uploading your file:" + System.Environment.NewLine + ex.Message + System.Environment.NewLine + ex.StackTrace;
                return;
            }
            lbl_Status.Text = "File uploaded sucessfully, close this window when you are done uploading templates.";
            Context.Response.Write("<script type='text/javascript'>window.parent.location.reload(true);window.frameElement.commitPopup();</script>");
            Context.Response.Flush();
            Context.Response.End();

        }
    }
}
