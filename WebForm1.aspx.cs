using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using ClosedXML.Excel.Drawings;
using System.Linq;
using System.Reflection.Emit;
using System.Drawing;

namespace Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateDetails_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string filePath = Server.MapPath("Images/");
            string fileName = Path.GetFileName(FileUpload3.FileName);
            string extension = Path.GetExtension(fileName);
            HttpPostedFile postedFile = FileUpload3.PostedFile;
            int size = postedFile.ContentLength;
            string UpdatePath = "Images/";
            if (FileUpload3.HasFile == true)
            {
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    if (size <= 100000)
                    {
                        UpdatePath = UpdatePath + fileName;
                        FileUpload3.SaveAs(Server.MapPath(UpdatePath));

                       

                        SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "UpdateDetails");

                        cmd.Parameters.AddWithValue("@Id", HiddenFieldID.Value);
                        cmd.Parameters.AddWithValue("@Name", Name.Text);
                        cmd.Parameters.AddWithValue("@Age", Age.Text);
                        cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@Phone", Phone.Text);
                        cmd.Parameters.AddWithValue("@Email", Email.Text);
                        cmd.Parameters.AddWithValue("@ImageProfile", UpdatePath);

                        con.Open();

                        int result = cmd.ExecuteNonQuery();


                        if (result < 0)
                        {
                            Response.Write("<script>alert('Update successful!');</script>");
                           
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to update. Please try again.');</script>");

                        }
                        con.Close();
                    }
                    else
                    {
                        Label1.Text = "Length should be less than 1 MB";
                        Label1.Visible = true;
                        Label1.ForeColor = Color.Red;

                    }

                }
                else
                {
                    Label1.Text = "Format not supported!!";
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Red;
                }

            }
            //else
            //{

            //    SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);

            //    cmd.CommandType = CommandType.StoredProcedure;
            //    cmd.Parameters.AddWithValue("@Action", "UpdateDetails");

            //    cmd.Parameters.AddWithValue("@Id", HiddenFieldID.Value);
            //    cmd.Parameters.AddWithValue("@Name", Name.Text);
            //    cmd.Parameters.AddWithValue("@Age", Age.Text);
            //    cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
            //    cmd.Parameters.AddWithValue("@Phone", Phone.Text);
            //    cmd.Parameters.AddWithValue("@Email", Email.Text);
            //    cmd.Parameters.AddWithValue("@ImageProfile", UpdatePath);

            //    con.Open();

            //    int result = cmd.ExecuteNonQuery();


            //    if (result < 0)
            //    {
            //        Response.Write("<script>alert('Update successful!');</script>");

            //    }
            //    else
            //    {
            //        Response.Write("<script>alert('Failed to update. Please try again.');</script>");

            //    }
            //    con.Close();
            //}
        }
    }
}