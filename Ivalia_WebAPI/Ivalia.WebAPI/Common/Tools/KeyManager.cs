using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.WebAPI.Common.Tools
{
    public class KeyManager
    {
        public static string RandomPassword(int length = 6)
        {
            var Rnd = new Random();
            const string Chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789";

            return new string(Enumerable.Repeat(Chars, length).Select(s => s[Rnd.Next(s.Length)]).ToArray());
        }

        public static string Hash(string input)
        { 
            using (SHA256 Sha256Hash = SHA256.Create())
            {
                byte[] Bytes = Sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                StringBuilder builder = new StringBuilder();

                for (int i = 0; i < Bytes.Length; i++)
                {
                    builder.Append(Bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }

    }
}
