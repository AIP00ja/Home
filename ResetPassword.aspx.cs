using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        string guidValue;
        int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            guidValue = Request.QueryString["UserId"];

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(guidValue))
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        string query = "SELECT UserId, ExpiryDateTime FROM ResetPassword WHERE Id = @Guid AND ExpiryDateTime > GETDATE()";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Guid", guidValue);

                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            userId = Convert.ToInt32(dt.Rows[0]["UserId"]);
                            NewTextBox.Visible = true;
                            ConfirmTextBox.Visible = true;
                            ResetButton.Visible = true;
                        }
                        else
                        {
                            Response.Write("<script>alert('Your password reset link is expired or invalid!');</script>");
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/ForgotPassword.aspx");
                }
            }
        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            if (NewTextBox.Text == ConfirmTextBox.Text && !string.IsNullOrEmpty(NewTextBox.Text))
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string updateQuery = "UPDATE HomeAppliances SET Password = @Password WHERE Id = @UserId";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                    updateCmd.Parameters.AddWithValue("@Password", NewTextBox.Text); 
                    updateCmd.Parameters.AddWithValue("@UserId", userId);

                    string deleteQuery = "DELETE FROM ResetPassword WHERE UserId = @UserId";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, con);
                    deleteCmd.Parameters.AddWithValue("@UserId", userId);

                    con.Open();
                    updateCmd.ExecuteNonQuery();
                    deleteCmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Your password has been changed successfully!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Both password fields must match and be non-empty!');</script>");
            }
        }
    }
}
