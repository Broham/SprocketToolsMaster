using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using CabLib;
using System.IO;
using System.Xml;
using Microsoft.Deployment.Compression.Cab;
using Microsoft.Deployment.Compression;

namespace SprocketToolsWebsite
{
    public class WSPMod
    {
        public static string GetKeyedWsp(string wspFile, string company, string servers)
        {
            return GetKeyedWsp(wspFile, company, servers, DateTime.Now.AddDays(14));
        }

        public static string GetKeyedWsp(string wspFile, string company, string servers, DateTime expiry)
        {
             Guid transGuid = new Guid();

            //hax: config me
            string baseDir = @"D:\Hosting\5709750\html\sprockettools\d\";

            string source = baseDir + @"original\" + transGuid.ToString() + @"\";
            string dest = baseDir + @"modified\";

            //load the cab and unpack it to the temporary directory used for this transaction
            CabInfo cab = new CabInfo(baseDir + wspFile);
            cab.Unpack(source);

            //get xml file
            string keyXmlFile = source + @"Layouts\SprocketValidator\key.xml";
            XmlDocument xd = new XmlDocument();
            xd.Load(keyXmlFile);

            //update XML file and write back to disk
            XmlNode n = xd.SelectSingleNode(@"/key");

            n.InnerText = Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes(company + "|" + servers + "|" + DateTime.Today.AddDays(14).ToShortDateString()));
            using (XmlWriter xw = XmlWriter.Create(keyXmlFile))
            {
                xd.WriteTo(xw);
                xw.Flush();
            }

            //create a list with files and add them to a cab file
            string newFile = (dest + DateTime.Now.ToString("yyyyMMdd") + "_" + company + "_" + wspFile).Replace(" ", "");
            CabInfo newCab = new CabInfo(newFile);

            List<string> paths = new List<string>();

            //put files into list to be packed
            foreach (string compFile in Directory.GetFiles(source, "*", SearchOption.AllDirectories))
            {
                paths.Add(compFile.Replace(source, ""));
            }

            newCab.PackFiles(source, paths, paths);

            //delete the transaction directory
            Directory.Delete(source,true);

            return newFile;
        }

    }
}