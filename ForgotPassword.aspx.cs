using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using static System.Net.WebRequestMethods;
namespace Project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e) { }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Id, Email FROM HomeAppliances WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string myGUID = Guid.NewGuid().ToString();
                    int userId = Convert.ToInt32(dt.Rows[0]["Id"]);

                    string insertQuery = "INSERT INTO ResetPassword (Id, UserId, RequestDateTime, ExpiryDateTime) VALUES (@Id, @UserId, GETDATE(), DATEADD(HOUR, 1, GETDATE()))";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                    insertCmd.Parameters.AddWithValue("@Id", myGUID);
                    insertCmd.Parameters.AddWithValue("@UserId", userId);

                    con.Open();
                    insertCmd.ExecuteNonQuery();

                    SendResetEmail(dt.Rows[0]["Email"].ToString(), myGUID);
                    Response.Write("<script>alert('Check your email to reset your password.');</script>");
                    EmailTextBox.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('This email does not exist in our database!');</script>");
                }
            }
        }

        private void SendResetEmail(string toEmailAddress, string guid)
        {
            string emailBody = $"Hi {EmailTextBox},<br/><br/>Click the link below to reset your password:<br/><br/>" +
                               $"<a href='http://localhost:44386/ResetPassword.aspx?UserId={guid}'>Reset Password</a>";


            MailMessage mailMessage = new MailMessage("taskt4638@gmail.com", toEmailAddress)
            {
                Subject = "Reset Password",
                Body = emailBody,
                IsBodyHtml = true,
                Priority = MailPriority.High
            };

            using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
            {
                smtpClient.Credentials = new NetworkCredential("taskt4638@gmail.com", "pzau vtgf fchs zdat"); // Replace with app password or regular password if Less Secure App Access is enabled
                smtpClient.EnableSsl = true;

                try
                {
                    smtpClient.Send(mailMessage);
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Message not sent. Error: {ex.Message}');</script>");
                }
            }
        }

        protected void SendButton_Click1(object sender, EventArgs e)
        {

        }
    }
}
