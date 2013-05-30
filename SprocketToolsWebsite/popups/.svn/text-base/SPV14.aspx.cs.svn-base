using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Reflection;

namespace SprocketToolsWebsite.popups
{
    public partial class SPV14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            string name = ui_Input.tb_FName.Text + " " + ui_Input.tb_LName.Text;
            string company = ui_Input.tb_Company.Text;
            string servers = ui_Input.tb_Server.Text;
            string email = ui_Input.tb_Email.Text;
            string phone = ui_Input.tb_Phone.Text;
            string other = ui_Input.tb_Other.Text;
            MailMessage sprocketToolsMessage = new MailMessage();
            sprocketToolsMessage.From = new MailAddress("Support@Sprocket-Tools.com");
            sprocketToolsMessage.To.Add(new MailAddress("Support@Sprocket-Tools.com"));

            sprocketToolsMessage.Subject = "Email from Sprocket-Tools.com vistor";
            //message.IsBodyHtml = true;
            sprocketToolsMessage.Body = "An order was just placed with the following information:" +
                            "Name: " + name + System.Environment.NewLine +
                            "Company: " + company + System.Environment.NewLine +
                            "Email: " + email + System.Environment.NewLine +
                            "Phone: " + phone + System.Environment.NewLine +
                            "Servers: " + servers + System.Environment.NewLine +
                            "Message: " + System.Environment.NewLine + other;
            SmtpClient client = new SmtpClient();
            MailMessage customerMessage = new MailMessage();
            customerMessage.From = new MailAddress("Support@Sprocket-Tools.com");
            customerMessage.To.Add(new MailAddress(email));
            customerMessage.Bcc.Add("Support@Sprocket-Tools.com");
            
            //HERE Figure out how to make this work on GoDaddy.  If you can't, figure out how we will do attachments?  Database?
            FileStream fs = new FileStream(WSPMod.GetKeyedWsp(@"SprocketValidator.wsp", company, servers.Replace(",","|")), FileMode.Open);
            //Stream s = Assembly.GetExecutingAssembly().GetManifestResourceStream("SprocketToolsWebsite.d.SprocketValidator.wsp");
            Attachment a = new Attachment(fs,"SprocketValidator.wsp");
            customerMessage.Attachments.Add(a);
            customerMessage.Body = "Thank you for your purchase.  Please use the attachment to install your new product.";

            client.Send(customerMessage);
            client.Send(sprocketToolsMessage);



            Response.Write("<script>window.close();</script>");
        }
    }
}