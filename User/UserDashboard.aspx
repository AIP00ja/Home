 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Project.User.UserDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Home.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function openModal() {
            var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
            modal.show();
        }
        function openModall() {
            var modal = new bootstrap.Modal(document.getElementById('exampleModall'));
            modal.show();
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="top-navbar">
            <div class="icons">
                <a href="logo.html">
         <img src="../Images/logo.png" alt="" width="18" /><span>PoJo</span></a>           
            </div>
            <div class="icons">
          <asp:ImageButton ID="ProfileImage" runat="server" CssClass="profile-image rounded-circle" ImageUrl="~/Image/profile-circle.png" Height="60" Width="60" OnClick="FillModalData_Click" />      
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:HiddenField ID="HiddenFieldID" runat="server" />
                            <div>
                                <asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                            </div>
                            &nbsp;
                            <div>
                                <asp:TextBox ID="Age" runat="server" CssClass="form-control" placeholder="Enter your Age"></asp:TextBox>
                            </div>
                            &nbsp;
                            <div>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Gender</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            &nbsp;
                            <div>
                                <asp:TextBox ID="Phone" runat="server" CssClass="form-control" placeholder="Enter your Phone number" MaxLength="10"></asp:TextBox>
                            </div>
                            &nbsp;
                            <div>
                                <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Enter your Email"></asp:TextBox>
                            </div>
                            &nbsp;
                            <div class="mb-3">
                                <asp:Image ID="Image2" runat="server" Height="75" Width="75" CssClass="rounded-circle" />
                                <br />
                                <asp:FileUpload ID="FileUpload3" runat="server" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="UpdateDetails" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="UpdateDetails_Click" />
                        </div>
                    </div>
                </div>
            </div>
<br />
  <asp:LinkButton ID="LogOutButton" runat="server" Text="Log Out" OnClick="LogOut_Click" Height="5" />            
    </div>
        </div>
        <div class="container-fluid mt-1 pt-1">
            <div class="card p-4 mt-5 transparent-card">
                <h3 class="text-center mb-4 text-white">User Dashboard</h3>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" CellPadding="4">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="LabelName" runat="server" Text='<%# Eval("Name")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age">
                            <ItemTemplate>
                                <asp:Label ID="LabelAge" runat="server" Text='<%# Eval("Age")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="LabelGender" runat="server" Text='<%# Eval("Gender")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <ItemTemplate>
                                <asp:Label ID="LabelPhone" runat="server" Text='<%# Eval("Phone")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("Email")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="LabelPass" runat="server" Text='<%# Eval("Password")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Type">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserType" runat="server" Text='<%# Eval("UserType")%>' CssClass="text-black"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Profile Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="60" Width="60" CssClass="img-fluid rounded-circle" ImageUrl='<%# Eval("ProfileImage")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle CssClass="bg-info text-white" />
                    <HeaderStyle CssClass="bg-dark text-white" />
                    <RowStyle CssClass="bg-white" />
                    <AlternatingRowStyle CssClass="bg-light" />
                    <PagerStyle CssClass="bg-info text-white" HorizontalAlign="Left" />
                </asp:GridView>
            </div>
            <br />    
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModall">
                Update Password
            </button>
           
            <div class="modal fade" id="exampleModall" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="ModalLabel">Change Password</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <asp:TextBox ID="CurrPass" runat="server" CssClass="form-control" placeholder="Enter your Password"></asp:TextBox>
                            </div>
                            &nbsp;
                            <div>
                                <asp:TextBox ID="NewPass" runat="server" CssClass="form-control" placeholder="Enter your New Password"></asp:TextBox>
                            </div>
                            &nbsp;
                            
                            <div>
                                <asp:TextBox ID="ConfiPass" runat="server" CssClass="form-control" placeholder="Enter your Confirm Password"></asp:TextBox>
                            </div>
                            &nbsp; 
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="PasswordChange" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="PasswordChange_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <asp:LinkButton ID="ExportToPdf" runat="server" Text="Export to PDF" CssClass="btn btn-success" OnClick="ExportToPdf_Click" />
        </div>
    </form>

</body>
</html>
