using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.tool.xml;
using System.IO;
using System.Web.UI.WebControls;


namespace Project.User
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["UserType"]?.ToString() != "User")
            {
                Response.Redirect("~/Login.aspx");
            }
            if (Session["ProfileImage"] != null)
            {
                string profileImageUrl = Session["ProfileImage"].ToString();
                ProfileImage.ImageUrl = ResolveUrl(profileImageUrl);
            }
            else
            {
                ProfileImage.ImageUrl = "~/Images/profile-circle.png";
            }
            if (!IsPostBack)
            {
                BindGridView();
            }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

        }
        protected void LogOut_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "UserDetails");
            cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);

            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        protected void FillModalData_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_CheckDetails", con); 
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UserDetails");
                cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    HiddenFieldID.Value = reader["Id"].ToString();
                    Name.Text = reader["Name"].ToString();
                    Age.Text = reader["Age"].ToString();
                    DropDownList1.SelectedValue = reader["Gender"].ToString();
                    Phone.Text = reader["Phone"].ToString();
                    Email.Text = reader["Email"].ToString();
                    string profileImage = reader["ProfileImage"].ToString();
                    Image2.ImageUrl = profileImage;
                }
                con.Close();
            }

           
            ClientScript.RegisterStartupScript(this.GetType(), "OpenModal", "openModal();", true);

        }
        protected void UpdateDetails_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "UpdateDetails"); 
            cmd.Parameters.AddWithValue("@Id", HiddenFieldID.Value); 
            cmd.Parameters.AddWithValue("@Name", Name.Text);       
            cmd.Parameters.AddWithValue("@Age", Age.Text);         
            cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value); 
            cmd.Parameters.AddWithValue("@Phone", Phone.Text);     
            cmd.Parameters.AddWithValue("@Email", Email.Text);
            if (FileUpload3.HasFile)
            {
                
                string fileName = Path.GetFileName(FileUpload3.PostedFile.FileName);
                string filePath = "~/Image/" + fileName;


                Response.Write("<script>alert('File path: " + filePath + "');</script>");


                FileUpload3.SaveAs(Server.MapPath(filePath));


                cmd.Parameters.AddWithValue("@ProfileImage", filePath);


                Session["ProfileImage"] = filePath;
            }

            con.Open();

            int result = cmd.ExecuteNonQuery();

            con.Close();
            if (result < 0)
            {
                Response.Redirect(Request.RawUrl);

            }
            else
            {
                Response.Write("<script>alert('Failed to update. Please try again.');</script>");
            }

           
        }
        void ClearData()
        {
            CurrPass.Text = NewPass.Text = ConfiPass.Text = "";
        }

        protected void PasswordChange_Click(object sender, EventArgs e)
        {

            string currentPass = CurrPass.Text;
            string newPass = NewPass.Text;
            string confirmPass = ConfiPass.Text;
            string email = Session["Email"].ToString(); 

           
            if (newPass == confirmPass)
            {
                
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    
                    cmd.Parameters.AddWithValue("@Action", "ChangePass");
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@CurrentPass", currentPass);
                    cmd.Parameters.AddWithValue("@NewPassword", newPass);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery(); 

                    
                    if (rowsAffected>0)
                    {
                        Response.Write("<script>alert('Password updated successfully!');</script>");
                        BindGridView();
                        ClearData();
                    }
                    else
                    {
                        Response.Write("<script>alert('Current password is incorrect.');</script>");
                        
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('New password and confirmation do not match.');</script>");
               
            }
        }

        protected void ExportToPdf_Click(object sender, EventArgs e)
        {
           
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=YourFileName.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.RenderControl(hw);
           
            Document doc = new Document(iTextSharp.text.PageSize.A4, 50f, 50f, 100f, 30f);
            PdfWriter writer = PdfWriter.GetInstance(doc, Response.OutputStream);
            doc.Open();
            StringReader sr = new StringReader(sw.ToString());
            XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, sr);
            doc.Close();
            Response.End();
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            
        }

    }
}