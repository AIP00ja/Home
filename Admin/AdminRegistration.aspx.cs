using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace Project.Admin
{
    public partial class AdminRegistration : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnVerifyKey_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM AdminKeys WHERE AdminKey = @AdminKey", con);
                cmd.Parameters.AddWithValue("@AdminKey", txtAdminKey.Text.Trim());

                con.Open();
                int keyCount = (int)cmd.ExecuteScalar();
                con.Close();

                if (keyCount > 0)
                {
                    lblKeyError.Visible = false;

                    // Hide the modal and show the registration form
                    ScriptManager.RegisterStartupScript(this, GetType(), "toggleModal",
                        @"document.getElementById('adminKeyModal').style.display = 'none';
                          document.getElementById('login').style.display = 'block';", true);

                    // Enable the Submit button
                    btnSubmit.Enabled = true;
                }
                else
                {
                    lblKeyError.Text = "Invalid Admin Key. Please try again.";
                    lblKeyError.Visible = true;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {

                SqlCommand cmd = new SqlCommand("sp_RegisterAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@AdminKey", txtAdminKey.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                string encryptedPassword = EncryptPassword(txtPass.Text);
                cmd.Parameters.AddWithValue("@Password", encryptedPassword);

                con.Open();
                string message = cmd.ExecuteScalar()?.ToString();

                if (message == "Admin registered successfully!")
                {

                    Response.Write("<script>alert('Admin registered successfully!');window.location='Login.aspx';</script>");
                    ClearData();

                }
                else
                {
                    lblKeyError.Text = message;
                    lblKeyError.Visible = true;
                }

                con.Close();
            }
        }
        void ClearData()
        {
            txtName.Text = txtAge.Text = txtPhone.Text = txtEmail.Text = txtPass.Text = txtAdminKey.Text = string.Empty;
            DropDownList1.ClearSelection();
            lblKeyError.Visible = false;

        }
        public string EncryptPassword(string plainPassword)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Encoding.UTF8.GetBytes("12345678901234567890123456789012");
                aesAlg.IV = Encoding.UTF8.GetBytes("1234567890123456");

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);
                byte[] plainBytes = Encoding.UTF8.GetBytes(plainPassword);
                byte[] encryptedBytes = encryptor.TransformFinalBlock(plainBytes, 0, plainBytes.Length);
                return Convert.ToBase64String(encryptedBytes);
            }
        }
    }
}