using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Login");
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
               
                string encryptedPassword = reader["Password"].ToString();

               
                string decryptedPassword = DecryptPassword(encryptedPassword);

                
                if (decryptedPassword == txtPass.Text)
                {
                    
                    Session["Email"] = reader["Email"];
                    Session["UserType"] = reader["UserType"].ToString();
                    Session["ProfileImage"] = reader["ProfileImage"].ToString();

                    
                    if (Session["UserType"].ToString() == "Admin")
                    {
                        Response.Redirect("Admin/AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("User/UserDashboard.aspx");
                    }
                }
                else
                {
                    Label1.Text = "Invalid email or password!";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                
                Label1.Text = "Invalid email or password!";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

            con.Close();

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

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "CheckEmail");
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()) 
            {
                
                string profileImage = reader["ProfileImage"].ToString();
                if (!string.IsNullOrEmpty(profileImage))
                {
                    Image1.ImageUrl = ResolveUrl(profileImage);  
                }
                else
                {
                    Image1.ImageUrl = "~/Image/profile-circle.png";  
                }

               
            }
            else
            {
                Image1.ImageUrl = "~/Image/profile-circle.png";
                Label1.Text = "Email id is not registered";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

            con.Close();
        }
    }
}