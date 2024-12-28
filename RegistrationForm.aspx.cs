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
using System.Security.Cryptography;

namespace Project
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void ButtonInsert_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Age", txtAge.Text);
            cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

            
            string encryptedPassword = EncryptPassword(txtPass.Text);
            cmd.Parameters.AddWithValue("@Password", encryptedPassword);

            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a < 0)
            {
                Response.Write("<script>alert('Inserted data successfully!');window.location='Login.aspx';</script>");
                ClearData();
            }
            else
            {
                Response.Write("Failed to insert data!");
            }
            con.Close();
        }
        void ClearData()
        {
           txtName.Text = txtAge.Text = txtPhone.Text = txtEmail.Text = txtPass.Text = "";
           DropDownList1.ClearSelection();
           //UserType.ClearSelection();
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

        //protected void ButtonUpdate_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    string query = "update HomeAppliances set Name=@Name, Age=@Age, Phone=@Phone, Email=@Email, Password=@Password, UserType=@UserType where Id=@Id";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@Id", txtId.Text);
        //    cmd.Parameters.AddWithValue("@Name", txtName.Text);
        //    cmd.Parameters.AddWithValue("@Age", txtAge.Text);
        //    cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
        //    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
        //    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        //    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
        //    cmd.Parameters.AddWithValue("@UserType", UserType.SelectedItem.Value);
        //    con.Open();
        //    int a = cmd.ExecuteNonQuery();
        //    if (a>0)
        //    {
        //        Response.Write("Update data successfully!!!");
        //        ClearData();
        //    }
        //    else
        //    {
        //        Response.Write("Failed to Update");
        //    }
        //    con.Close();
        //}

        //protected void ButtonRead_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    string query = "select * from HomeAppliances where Id=@Id";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@Id", txtId.Text);
        //    con.Open();
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    if (reader.Read())
        //    {
        //        txtName.Text = reader["Name"].ToString();
        //        txtAge.Text = reader["Age"].ToString();
        //        DropDownList1.SelectedValue= reader["Gender"].ToString();
        //        txtPhone.Text = reader["Phone"].ToString();
        //        txtEmail.Text = reader["Email"].ToString();
        //        txtPass.Text = reader["Password"].ToString();
        //        UserType.SelectedValue = reader["UserType"].ToString();
        //    }
        //    else
        //    {
        //        Response.Write("No data found ?");
        //    }

        //}
        //protected void ButtonDelete_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    string query = "delete from HomeAppliances where Id=@Id";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@Id", txtId.Text);
        //    con.Open();
        //    int a = cmd.ExecuteNonQuery();
        //    if (a>0)
        //    {
        //        Response.Write("Delete data successfully!!");
        //        ClearData();
        //    }
        //    else
        //    {
        //        Response.Write("Delete to failed");
        //    }
        //    con.Close();
        //}
    }
}