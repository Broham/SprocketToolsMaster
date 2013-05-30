using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace SprocketToolsWebsite
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_SendEmail_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(tb_Email.Text);
            message.To.Add(new MailAddress("Support@Sprocket-Tools.com"));
            message.Bcc.Add(new MailAddress("AbeMiessler@yahoo.com"));

            message.Subject = "Email from Sprocket-Tools.com vistor";
            //message.IsBodyHtml = true;
            message.Body =  "Name: " + tb_Name.Text + System.Environment.NewLine +
                            "Email: " + tb_Email.Text + System.Environment.NewLine +
                            "Phone: " + tb_Phone.Text + System.Environment.NewLine +
                            "Message: " + System.Environment.NewLine + tb_Message.Text;

            SmtpClient client = new SmtpClient();

            client.Send(message);
            lbl_Message.Text = "Your message has been sent.  We will get back to you as soon as possible!";
        }




    }
}