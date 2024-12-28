using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Security.Cryptography;

namespace Project
{
    public partial class EmailSend : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from HomeAppliances where Email='" + EmailTextBox.Text + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                dr.Read();
                string pw = dr["Password"].ToString();
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("Password" + DecryptPassword(pw));
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("taskt4638@gmail.com", "kzex tzoj hnsm acuk");
                MailMessage msg = new MailMessage();
                msg.To.Add(EmailTextBox.Text);
                msg.From = new MailAddress("Home Appliances..<taskt4638@gmail.com>");
                msg.Subject = "Your Password";
                msg.Body = sb.ToString();
                client.Send(msg);
                Label1.Text = "Your password has been send to resgistered email id";
            }
            else
            {
                Label1.Text = "Invalid Email id";
            }
        }
        public string DecryptPassword(string encryptedPassword)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Encoding.UTF8.GetBytes("12345678901234567890123456789012");  // 32-byte key
                aesAlg.IV = Encoding.UTF8.GetBytes("1234567890123456");  // 16-byte IV

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);
                byte[] encryptedBytes = Convert.FromBase64String(encryptedPassword);
                byte[] decryptedBytes = decryptor.TransformFinalBlock(encryptedBytes, 0, encryptedBytes.Length);
                return Encoding.UTF8.GetString(decryptedBytes);
            }
        }
    }
}