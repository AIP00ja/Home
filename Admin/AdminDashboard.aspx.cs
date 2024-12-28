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
using System.Security.Cryptography;
using System.Text;

namespace Project.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["xyz"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["UserType"]?.ToString() != "Admin")
            {

                Response.Redirect("~/Login.aspx");
            }
            if (Session["ProfileImage"] != null)
            {
                string profileImageUrl = Session["ProfileImage"].ToString();
                CheckDetailsButton.ImageUrl = ResolveUrl(profileImageUrl); 
            }
            else
            {
                CheckDetailsButton.ImageUrl = "~/Images/profile-circle.png";
            }
            if (!IsPostBack)
            {
               
                BindGridView();
            }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

        }
        //void BindGridView()
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@Action", "Select");
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataTable data = new DataTable();
        //    sda.Fill(data);
        //    foreach (DataRow row in data.Rows)
        //    {
        //        string encryptedPassword = row["Password"].ToString();
        //        string decryptedPassword = DecryptPassword(encryptedPassword);  // Decrypt password
        //        row["Password"] = decryptedPassword;  // Update the DataRow with decrypted password
        //    }

        //    DataView dv = data.DefaultView;
        //    dv.RowFilter = "UserType = 'User'";
        //    GridView1.DataSource = dv;
        //    GridView1.DataBind();

        //}
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Select");

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);

            // Decrypt each password and update the column
            foreach (DataRow row in data.Rows)
            {
                string encryptedPassword = row["Password"]?.ToString();
                if (!string.IsNullOrEmpty(encryptedPassword))
                {
                    try
                    {
                        string decryptedPassword = DecryptPassword(encryptedPassword);
                        row["Password"] = decryptedPassword;
                    }
                    catch (Exception ex)
                    {
                        row["Password"] = "Decryption Error";  // Optional: log or flag the error
                    }
                }
                else
                {
                    row["Password"] = "Invalid or Empty Password";
                }
            }


            // Filter rows for UserType = 'User'
            DataView dv = data.DefaultView;
            dv.RowFilter = "UserType = 'User'";

            // Bind the modified DataView to the GridView
            GridView1.DataSource = dv;
            GridView1.DataBind();
        }


        //public string DecryptPassword(string encryptedPassword)
        //{
        //    // Decrypt the password using AES decryption
        //    using (Aes aesAlg = Aes.Create())
        //    {
        //        aesAlg.Key = Encoding.UTF8.GetBytes("12345678901234567890123456789012");  // 32-byte key
        //        aesAlg.IV = Encoding.UTF8.GetBytes("1234567890123456");  // 16-byte IV (ensure correct size)

        //        ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);
        //        byte[] encryptedBytes = Convert.FromBase64String(encryptedPassword);  // Convert the password from Base64 to byte array
        //        byte[] decryptedBytes = decryptor.TransformFinalBlock(encryptedBytes, 0, encryptedBytes.Length);  // Decrypt the password
        //        return Encoding.UTF8.GetString(decryptedBytes);  // Return the decrypted password as string
        //    }
        //}
        public string DecryptPassword(string encryptedText)
        {
            if (string.IsNullOrWhiteSpace(encryptedText))
                throw new ArgumentException("The input text is null or empty.");

            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Encoding.UTF8.GetBytes("12345678901234567890123456789012");  // Key must match encryption
                aesAlg.IV = Encoding.UTF8.GetBytes("1234567890123456");  // IV must match encryption

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                byte[] cipherBytes = Convert.FromBase64String(encryptedText);
                byte[] plainBytes = decryptor.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
                return Encoding.UTF8.GetString(plainBytes);
            }
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Insert");
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", EncryptPassword(txtPassword.Text.Trim()));
                cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
                if (fuProfileImage.HasFile)
                {
                    string imgPath = "~/Image/" + fuProfileImage.FileName;
                    fuProfileImage.SaveAs(Server.MapPath(imgPath));
                    cmd.Parameters.AddWithValue("@ProfileImage", imgPath);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ProfileImage", DBNull.Value);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindGridView();

                
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Record Inserted Successfully');", true);
            }
        }
        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName.Equals("Insert"))
        //    {
        //        SqlConnection con = new SqlConnection(cs);
        //        {
        //            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Action", "Insert");
        //            cmd.Parameters.AddWithValue("@Name", (GridView1.FooterRow.FindControl("NameTextBox") as TextBox).Text.Trim());
        //            cmd.Parameters.AddWithValue("@Age", (GridView1.FooterRow.FindControl("AgeTextBox") as TextBox).Text.Trim());
        //            cmd.Parameters.AddWithValue("@Gender", (GridView1.FooterRow.FindControl("GenderFooter") as DropDownList).SelectedItem.Text);
        //            cmd.Parameters.AddWithValue("@Phone", (GridView1.FooterRow.FindControl("PhoneTextBox") as TextBox).Text.Trim());
        //            cmd.Parameters.AddWithValue("@Email", (GridView1.FooterRow.FindControl("EmailTextBox") as TextBox).Text.Trim());
        //            cmd.Parameters.AddWithValue("@Password", (GridView1.FooterRow.FindControl("PasswordTextBox") as TextBox).Text.Trim());
        //            cmd.Parameters.AddWithValue("@UserType", (GridView1.FooterRow.FindControl("FooterRadioButtonList") as RadioButtonList).Text);
        //            FileUpload fl1 = (FileUpload)GridView1.FooterRow.FindControl("FileUpload2");
        //            if (fl1.HasFile)
        //            {

        //                string imgPath = "~/Image/" + fl1.FileName;
        //                fl1.SaveAs(Server.MapPath(imgPath));
        //                cmd.Parameters.AddWithValue("@ProfileImage", imgPath);
        //            }
        //            else
        //            {
        //                cmd.Parameters.AddWithValue("@ProfileImage", DBNull.Value);
        //            }
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            BindGridView();

        //            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('New Record Added');", true);
        //            //lblSuccessMessage.Text = "";
        //        }
        //    }
        //}

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Update");
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value));
            TextBox nameTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("NameTextBox");
            TextBox ageTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("AgeTextBox");
            DropDownList genderDropDownList = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("GenderDropDownList1");
            TextBox phoneTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("PhoneTextBox");
            TextBox emailTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("EmailTextBox");
            TextBox passwordTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("PasswordTextBox");
            RadioButtonList userTypeRadioButtonList = (RadioButtonList)GridView1.Rows[e.RowIndex].FindControl("UserTypeRadioButtonList");

            cmd.Parameters.AddWithValue("@Name", nameTextBox.Text);
            cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(ageTextBox.Text));
            cmd.Parameters.AddWithValue("@Gender", genderDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@Phone", phoneTextBox.Text);
            cmd.Parameters.AddWithValue("@Email", emailTextBox.Text);
            cmd.Parameters.AddWithValue("@Password", EncryptPassword(passwordTextBox.Text));
            cmd.Parameters.AddWithValue("@UserType", userTypeRadioButtonList.SelectedValue);


            FileUpload fl1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            HiddenField hiddenImagePath = (HiddenField)GridView1.Rows[e.RowIndex].FindControl("HiddenImagePath");

            if (fl1.HasFile)
            {
                string imgPath = "~/Image/" + fl1.FileName;
                fl1.SaveAs(Server.MapPath(imgPath));
                cmd.Parameters.AddWithValue("@ProfileImage", imgPath);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ProfileImage", hiddenImagePath.Value);

            }

            FileUpload FileImport = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileImport");
            HiddenField hiddenImportPath = (HiddenField)GridView1.Rows[e.RowIndex].FindControl("HiddenImportPath");

            if (FileImport.HasFile)
            {
                string ImportFile = "~/Import/" + FileImport.FileName;
                FileImport.SaveAs(Server.MapPath(ImportFile));
                cmd.Parameters.AddWithValue("@ImportPath", ImportFile);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ImportPath", hiddenImportPath.Value);
            }
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            BindGridView();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Selected Record Updated');", true);
            //lblSuccessMessage.Text = "";
            con.Close();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Delete");
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value));
            con.Open();
            cmd.ExecuteNonQuery();
            BindGridView();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Selected Record Deleted');", true);
            //lblSuccessMessage.Text = "";

        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileAdmin.aspx");

        }

        protected void ExportToExcel(object sender, EventArgs e)
        {
            bool isSelected = GridView1.Rows.Cast<GridViewRow>()
                       .Any(row => ((CheckBox)row.FindControl("ChkEmpty"))?.Checked == true);

            if (!isSelected)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select at least one checkbox to export.');", true);
                return;
            }
            using (XLWorkbook workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Selected Data");
                worksheet.Cell(1, 1).Value = "Name";
                worksheet.Cell(1, 2).Value = "Age";
                worksheet.Cell(1, 3).Value = "Gender";
                worksheet.Cell(1, 4).Value = "Phone";
                worksheet.Cell(1, 5).Value = "Email";
                worksheet.Cell(1, 6).Value = "UserType";
                worksheet.Cell(1, 7).Value = "Profile Image";

                int rowIndex = 2;

                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                    if (chkRow != null && chkRow.Checked)
                    {
                        
                        worksheet.Cell(rowIndex, 1).Value = ((Label)row.FindControl("NameLabel")).Text;
                        worksheet.Cell(rowIndex, 2).Value = ((Label)row.FindControl("AgeLabel")).Text;
                        worksheet.Cell(rowIndex, 3).Value = ((Label)row.FindControl("GenderLabel")).Text;
                        worksheet.Cell(rowIndex, 4).Value = ((Label)row.FindControl("PhoneLabel")).Text;
                        worksheet.Cell(rowIndex, 5).Value = ((Label)row.FindControl("EmailLabel")).Text;
                        worksheet.Cell(rowIndex, 6).Value = ((Label)row.FindControl("UserTypeLabel")).Text;
                        string imgUrl = ((System.Web.UI.WebControls.Image)row.FindControl("Image1")).ImageUrl;
                        string imgPath = Server.MapPath(imgUrl);

                        if (File.Exists(imgPath))
                        {
                            
                            double customWidth = 50;  
                            double customHeight = 50; 

                            
                            worksheet.Column(7).Width = customWidth / 1.5; 
                            worksheet.Row(rowIndex).Height = customHeight * 3; 

                           
                            var image = worksheet.AddPicture(imgPath)
                                                 .MoveTo(worksheet.Cell(rowIndex, 7))
                                                 .WithPlacement(XLPicturePlacement.Move)
                                                 .ScaleWidth(customWidth / 100)  
                                                 .ScaleHeight(customHeight / 100);
                        }

                        rowIndex++;
                    }
                }
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=SelectedData.xlsx");

                using (MemoryStream memoryStream = new MemoryStream())
                {
                    workbook.SaveAs(memoryStream);
                    memoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void ChkHeader_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkHeader = (CheckBox)GridView1.HeaderRow.FindControl("ChkHeader");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                if (chkRow != null)
                {
                    chkRow.Checked = chkHeader.Checked;
                }
            }
        }

        protected void ExportToPdf_Click(object sender, EventArgs e)
        {
            DataTable selectedData = new DataTable();
            selectedData.Columns.Add("Name");
            selectedData.Columns.Add("Age");
            selectedData.Columns.Add("Gender");
            selectedData.Columns.Add("Phone");
            selectedData.Columns.Add("Email");
            selectedData.Columns.Add("UserType");
            selectedData.Columns.Add("ProfileImage");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                if (chkRow != null && chkRow.Checked)
                {
                    DataRow newRow = selectedData.NewRow();
                    newRow["Name"] = ((Label)row.FindControl("NameLabel")).Text;
                    newRow["Age"] = ((Label)row.FindControl("AgeLabel")).Text;
                    newRow["Gender"] = ((Label)row.FindControl("GenderLabel")).Text;
                    newRow["Phone"] = ((Label)row.FindControl("PhoneLabel")).Text;
                    newRow["Email"] = ((Label)row.FindControl("EmailLabel")).Text;
                    newRow["UserType"] = ((Label)row.FindControl("UserTypeLabel")).Text;
                    newRow["ProfileImage"] = ((System.Web.UI.WebControls.Image)row.FindControl("Image1")).ImageUrl;

                    selectedData.Rows.Add(newRow);
                }
            }

            if (selectedData.Rows.Count > 0)
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    Document pdfDoc = new Document(PageSize.A4);
                    PdfWriter.GetInstance(pdfDoc, ms);
                    pdfDoc.Open();

                    PdfPTable pdfTable = new PdfPTable(selectedData.Columns.Count);
                    pdfTable.WidthPercentage = 100;

                    
                    foreach (DataColumn column in selectedData.Columns)
                    {
                        PdfPCell cell = new PdfPCell(new Phrase(column.ColumnName));
                        pdfTable.AddCell(cell);
                    }

                   
                    foreach (DataRow row in selectedData.Rows)
                    {
                        foreach (DataColumn column in selectedData.Columns)
                        {
                            if (column.ColumnName == "ProfileImage" && !string.IsNullOrEmpty(row[column].ToString()))
                            {
                                
                                iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(Server.MapPath(row[column].ToString()));
                                img.ScaleToFit(50f, 50f);  
                                pdfTable.AddCell(new PdfPCell(img));
                            }
                            else
                            {
                                pdfTable.AddCell(row[column].ToString());
                            }
                        }
                    }

                    pdfDoc.Add(pdfTable);
                    pdfDoc.Close();

                    
                    byte[] fileBytes = ms.ToArray();
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=SelectedRowsExport.pdf");
                    Response.BinaryWrite(fileBytes);
                    Response.End();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select at least one row to export.');", true);
                return;
            }
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

                
                FileUpload3.SaveAs(Server.MapPath(filePath));

               
                cmd.Parameters.AddWithValue("@ProfileImage", filePath);

                
                Session["ProfileImage"] = filePath;
            }

            con.Open();

            int result = cmd.ExecuteNonQuery();

            if (result < 0)
            {
                Response.Redirect(Request.RawUrl);
                
            }
            else
            {
                Response.Write("<script>alert('Failed to update. Please try again.');</script>");
            }

            con.Close();

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
                    Response.Clear();
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();


                    if (rowsAffected > 0)
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

        protected void CheckDetailsButton_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "showModal", "$('#myModal').modal('show');", true);

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
                    string profileImage = reader["ProfileImage"].ToString();
                    Image3.ImageUrl = profileImage;
                    Label2.Text = reader["Name"].ToString();
                    Label3.Text = reader["Age"].ToString();
                    Label4.Text = reader["Gender"].ToString();
                    Label5.Text = reader["Phone"].ToString();
                    Label6.Text = reader["Email"].ToString();
                    Label7.Text = reader["UserType"].ToString();
                }
                con.Close();
            }

        }
        protected void DownloadProfile_Click(object sender, EventArgs e)
        {
            string profileImageUrl = Image3.ImageUrl;
            string name = Label2.Text;
            string age = Label3.Text;
            string gender = Label4.Text;
            string phone = Label5.Text;
            string email = Label6.Text;
            string userType = Label7.Text;
            string profileImagePath = !string.IsNullOrEmpty(profileImageUrl) ? Server.MapPath(profileImageUrl) : null;
            using (MemoryStream ms = new MemoryStream())
            {
                
                Document pdfDoc = new Document(PageSize.A4);
                PdfWriter.GetInstance(pdfDoc, ms);
                pdfDoc.Open();
                pdfDoc.Add(new Paragraph("Profile Details:"));
                if (profileImagePath != null && File.Exists(profileImagePath))
                {
                    iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(profileImagePath);
                    img.ScaleToFit(100f, 100f);  
                    pdfDoc.Add(img);
                }
                pdfDoc.Add(new Paragraph("Name: " + name));
                pdfDoc.Add(new Paragraph("Age: " + age));
                pdfDoc.Add(new Paragraph("Gender: " + gender));
                pdfDoc.Add(new Paragraph("Phone: " + phone));
                pdfDoc.Add(new Paragraph("Email: " + email));
                pdfDoc.Add(new Paragraph("UserType: " + userType));
                pdfDoc.Close();
                byte[] fileBytes = ms.ToArray();
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=ProfileDetails.pdf");
                Response.BinaryWrite(fileBytes);
                Response.End();
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = SearchInput.Value;  
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_CheckDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "Search");
                cmd.Parameters.AddWithValue("@Search", searchQuery);    
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataView dv = dt.DefaultView;
                dv.RowFilter = "UserType = 'User'";  
                GridView1.DataSource = dv;
                GridView1.DataBind();
            }
        }
    }
    }
