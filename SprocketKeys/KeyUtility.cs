using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Reflection;

namespace SprocketKeys
{
    class KeyUtility
    {
        public static string Encode(string value)
        {
            return Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes(value));
        }

        public static string Decode(string value)
        {
            return System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(value));
        }
    }
}
