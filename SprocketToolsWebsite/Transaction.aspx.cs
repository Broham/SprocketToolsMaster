using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;

namespace SprocketToolsWebsite
{
    public partial class Transaction : System.Web.UI.Page
    {

        private void Page_Load(object sender, System.EventArgs e)
        {
            MailMessage sprocketToolsMessage = new MailMessage();
            sprocketToolsMessage.Subject = "Transaction email";
            sprocketToolsMessage.Body = "Test Transaction Email!";

            // Step 1a: Modify the POST string.
            string formPostData = "cmd = _notify-validate";
            foreach (String postKey in Request.Form)
            {
                string postValue = Encode(Request.Form[postKey]);
                formPostData += string.Format("&{0}={1}", postKey, postValue);
                sprocketToolsMessage.Body += (postKey + " : " + Request.Form[postKey] + System.Environment.NewLine);

            }

            // Step 1b: POST the data back to PayPal.
            WebClient client = new WebClient();
            client.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
            byte[] postByteArray = Encoding.ASCII.GetBytes(formPostData);
            byte[] responseArray = client.UploadData("https://www.paypal.com/cgi-bin/webscr", "POST", postByteArray);
            string response = Encoding.ASCII.GetString(responseArray);

            //message.IsBodyHtml = true;
            SmtpClient smtpClient = new SmtpClient();
            sprocketToolsMessage.From = new MailAddress("Support@Sprocket-Tools.com");
            sprocketToolsMessage.To.Add("Support@Sprocket-Tools.com");



            // Step 1c: Process the response from PayPal.
            switch (response)
            {
                case "VERIFIED":
                    {
                        // Perform steps 2-5 above. 
                        // Continue with automation processing if all steps succeeded.
                        sprocketToolsMessage.Subject += " VERIFIED";

                        MailMessage customerEmail = new MailMessage();
                        customerEmail.IsBodyHtml = true;
                        customerEmail.Subject = "Sprocket Tools Order - " + Request.Form["txn_id"];
                        customerEmail.Body = "Thank you for your order!<br/><br/>  Please use the attachment to install your copy of " + Request.Form["item_name"];
                        FileStream fs = new FileStream(WSPMod.GetKeyedWsp(@"SprocketValidator.wsp", Request.Form["address_name"], "*", DateTime.Now.AddYears(100)), FileMode.Open);
                        Attachment a = new Attachment(fs,"SprocketValidator.wsp");
                        customerEmail.Attachments.Add(a);
                        smtpClient.Send(customerEmail);
                        break
                        ;
                    }
                default:
                    {
                        // Possible fraud. Log for investigation.
                        sprocketToolsMessage.Subject += " FRAUD";
                        break;
                    }
            }

            smtpClient.Send(sprocketToolsMessage);
        }

        private string Encode(string oldValue)
        {
            string newValue = oldValue.Replace("\"", "'");
            newValue = System.Web.HttpUtility.UrlEncode(newValue);
            newValue = newValue.Replace("%2f", "/");
            return newValue;
        }

        //    sprocketToolsMessage.Subject = "Email from Sprocket-Tools.com vistor";
        //    //message.IsBodyHtml = true;
        //    sprocketToolsMessage.Body = "An order was just placed with the following information:" +
        //                    "Name: " + name + System.Environment.NewLine +
        //                    "Company: " + company + System.Environment.NewLine +
        //                    "Email: " + email + System.Environment.NewLine +
        //                    "Phone: " + phone + System.Environment.NewLine +
        //                    "Servers: " + servers + System.Environment.NewLine +
        //                    "Message: " + System.Environment.NewLine + other;
        //    SmtpClient client = new SmtpClient();
        //    MailMessage customerMessage = new MailMessage();
        //    customerMessage.From = new MailAddress("Support@Sprocket-Tools.com");
        //    customerMessage.To.Add(new MailAddress(email));
        //    customerMessage.Bcc.Add("Support@Sprocket-Tools.com");
            
        //    //HERE Figure out how to make this work on GoDaddy.  If you can't, figure out how we will do attachments?  Database?
        //    FileStream fs = new FileStream(WSPMod.GetKeyedWsp(@"SprocketValidator.wsp", company, servers.Replace(",","|")), FileMode.Open);
        //    //Stream s = Assembly.GetExecutingAssembly().GetManifestResourceStream("SprocketToolsWebsite.d.SprocketValidator.wsp");
        //    Attachment a = new Attachment(fs,"SprocketValidator.wsp");
        //    customerMessage.Attachments.Add(a);
        //    customerMessage.Body = "Thank you for your purchase.  Please use the attachment to install your new product.";

        //    client.Send(customerMessage);
        //    client.Send(sprocketToolsMessage);

        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}
    }
}