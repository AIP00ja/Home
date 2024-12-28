<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AdminDashboard.aspx.cs" Inherits="Project.Admin.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Admin Dashboard</title>
<link href="../css/Home.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIq0gQhhZmTk5S5h8pA9lq8hJ7xA4FfBfoM8vT3R1l9u1lgzDVm" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
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
        function checkModal() {
            document.getElementById("myModal").style.display = "block";

        }  
        function openInsertModal() {
            var modal = new bootstrap.Modal(document.getElementById('insertModal'));
            modal.show();
    }
</script>
     <style>
       .navbar {
    background-color: rgb(67, 0, 86);  
}

.navbar .nav-link {
    color: white;
    margin-right: 20px;
}

.navbar .nav-link:hover {
    color: #ffc800;  
}

.navbar-nav {
    display: flex;
    justify-content: center;  
    align-items: center;      
}

.container {
    margin-top: 50px;
}

.btn-group .dropdown-menu {
    min-width: 200px;
    
   
}

.btn-custom {
    margin-top: 10px;
}

.modal-content {
    padding: 20px;
}
.d-flex {
    display: flex;
    align-items: center;
}

#SearchInput {
    width: 250px;  
    border-radius: 20px;  
    padding: 10px; 
}

#SearchButton {
    background-color: #ffc800;  
    border: none;
    border-radius: 20px;  
    color: white;
    padding: 10px 20px;
    margin-left: 10px; 
}
#SearchButton:hover {
    background-color: #ffcc00; 
}

#SearchInput:focus {
    box-shadow: 0 0 5px rgba(255, 204, 0, 0.7);  
}
.gridview-container {
 max-width: 100%;
 overflow: hidden;
 }
 .table {
 table-layout: fixed;
 }
 .table th, .table td {
  word-wrap: break-word;
  text-align: center;
 }
 .gridview-container table {
  height: 50px; 
  overflow-y: auto;
  }
    </style>
</head>
<body>
     <form id="form1" runat="server">
     <div class="top-navbar">
        <div class="icons">
            <a href="logo.html"><img src="../Images/logo.png" alt="" width="18"/><span>PoJo</span></a> 
            </div>
        <div class="icons">
            <asp:ImageButton ID="CheckDetailsButton" runat="server" CssClass="profile-image rounded-circle" ImageUrl="~/Image/profile-circle.png" OnClick="CheckDetailsButton_Click" Height="40" Width="40" />
        </div>
    </div>
        <!-- Button for Export Options -->
   <nav class="navbar navbar-expand-lg navbar-dark">
   <%-- <a class="navbar-brand" href="logo.html"><img src="../Images/logo.png" alt="" width="30" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>--%>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDownload" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Download File
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDownload">
                    <li><asp:LinkButton ID="btnExportExcel" runat="server" CssClass="dropdown-item" ForeColor="Black" Text="Export to Excel" OnClick="ExportToExcel" /></li>
                    <li><asp:LinkButton ID="btnExportPdf" runat="server" CssClass="dropdown-item" ForeColor="Black" Text="Export to PDF" OnClick="ExportToPdf_Click" /></li>
                </ul>
            </li>
            <li class="nav-item">
                <button type="button" class="btn btn-warning nav-link" data-bs-toggle="modal" data-bs-target="#exampleModall">Update Password</button>
            </li>
            <li class="nav-item">
            <asp:Button ID="btnInsertTop" runat="server" CssClass="nav-link btn btn-success" Text="Insert New Record" OnClientClick="openInsertModal(); return false;" />
            </li>
           <li class="nav-item">
             <div class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="SearchInput" runat="server" />
            <asp:Button ID="SearchButton" runat="server" CssClass="btn btn-outline-success" Text="Search" OnClick="SearchButton_Click"/>
                </div>
                </li>
        </ul>
    </div>
</nav>
          <!-- Update Details Button -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="HiddenFieldID" runat="server" />
                        <div class="mb-3">
                            <asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Enter your name" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="Age" runat="server" CssClass="form-control" placeholder="Enter your Age" />
                        </div>
                        <div class="mb-3">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="Phone" runat="server" CssClass="form-control" placeholder="Enter your Phone number" MaxLength="10" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Enter your Email" />
                        </div>
                        <div class="mb-3">                            
                            <asp:Image ID="Image2" runat="server" Height="75" Width="75" CssClass="rounded-circle"/>
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

        <!-- Password Button -->
        
        <div class="modal fade" id="exampleModall" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="ModalLabel">Change Password</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <asp:TextBox ID="CurrPass" runat="server" CssClass="form-control" placeholder="Enter your Password" TextMode="Password" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="NewPass" runat="server" CssClass="form-control" placeholder="Enter your New Password" TextMode="Password" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="ConfiPass" runat="server" CssClass="form-control" placeholder="Confirm your New Password" TextMode="Password" />
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="PasswordChange" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="PasswordChange_Click" />
                    </div>
                </div>
            </div>
        </div>
          
<!-- Check Details Button -->
<div class="modal fade" id="myModal" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header d-flex justify-content-between w-100">
             <h1 class="modal-title fs-5" id="CheckDetails">Check Profile</h1>
             <asp:LinkButton ID="DownloadProfile" runat="server" Text="Download" OnClick="DownloadProfile_Click" />            
            </div>
            <div class="modal-body">
                <asp:HiddenField ID="HiddenField1" runat="server"/>
                 <div class="mb-3">
                 <asp:Image ID="Image3" runat="server" Height="100" Width="100" CssClass="rounded-circle" />
                </div>
                <div class="mb-3">
                   <label>Name :</label> <asp:Label ID="Label2" runat="server" />
                </div>
                <div class="mb-3">
                   <label>Age :</label> <asp:Label ID="Label3" runat="server" />
                </div>
                <div class="mb-3">
                    <label>Gender :</label><asp:Label ID="Label4" runat="server" />
                </div>
                <div class="mb-3">
                    <label>Phone :</label><asp:Label ID="Label5" runat="server" />
                </div>
                <div class="mb-3">
                    <label>Email :</label><asp:Label ID="Label6" runat="server" />
                </div>
                <div class="mb-3">
                    <label>UserType :</label><asp:Label ID="Label7" runat="server" />
                </div>
                <asp:Button ID="UpdateButton" runat="server" Text="Update Details" CssClass="btn btn-primary" Height="40" Width="150" OnClick="FillModalData_Click" /> 
                <asp:Button ID="LogOutButton" runat="server" Text="Log Out" OnClick="LogOut_Click" CssClass="btn btn-primary" Height="40" Width="150" />      
            </div>          
        </div>
    </div>
</div>  
<br /> 
           <!-- Insert New Record -->
         <div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="insertModalLabel">Insert New Record</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control mb-2" Placeholder="Name"></asp:TextBox>
                            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control mb-2" Placeholder="Age"></asp:TextBox>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control mb-2">
                                <asp:ListItem Text="Select" Value="" />
                                <asp:ListItem Text="Male" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                            </asp:DropDownList>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-2" Placeholder="Phone"></asp:TextBox>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-2" Placeholder="Email"></asp:TextBox>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-2" Placeholder="Password"></asp:TextBox>
                            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control mb-2">
                                <asp:ListItem Text="Select User Type" Value="" />
                                <asp:ListItem Text="Admin" Value="Admin" />
                                <asp:ListItem Text="User" Value="User" />
                            </asp:DropDownList>
                            <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="form-control mb-2" />
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

          <%--<asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" ShowFooter="True" 
                OnRowCommand="GridView1_RowCommand" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting" 
                AllowPaging="True" PageSize="5" CssClass="table table-striped table-bordered table-sm" 
                Width="100%">--%>

   <div class="gridview-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting" 
                CssClass="table table-striped table-bordered table-sm" 
                Width="100%">
                <Columns>                
                    <asp:TemplateField>
                        <HeaderTemplate>                   
                       <label for="ChkHeader">Select All</label>
                            <br />
                            <asp:CheckBox ID="ChkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="ChkHeader_CheckedChanged" />                      
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="ChkEmpty" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Eval("Name") %>' class="form-control" />
                        </EditItemTemplate>
                        <%--<FooterTemplate>
                            <asp:TextBox ID="NameTextBox" runat="server" class="form-control" />
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Eval("Age") %>' class="form-control" />
                        </EditItemTemplate>
                       <%-- <FooterTemplate>
                            <asp:TextBox ID="AgeTextBox" runat="server" class="form-control" />
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="GenderDropDownList1" runat="server" class="form-control" Text='<%# Eval("Gender") %>'>
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                       <%-- <FooterTemplate>
                            <asp:DropDownList ID="GenderFooter" runat="server" class="form-control">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>--%>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Eval("Phone") %>' class="form-control" />
                        </EditItemTemplate>
                       <%-- <FooterTemplate>
                            <asp:TextBox ID="PhoneTextBox" runat="server" class="form-control" />
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Eval("Email") %>' class="form-control" />
                        </EditItemTemplate>
                       <%-- <FooterTemplate>
                            <asp:TextBox ID="EmailTextBox" runat="server" class="form-control" />
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Eval("Password") %>'  class="form-control" />
                        </EditItemTemplate>
                        <%--<FooterTemplate>
                            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" class="form-control" />
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="UserType">
                            <ItemTemplate>
                                <asp:Label ID="UserTypeLabel" runat="server" Text='<%# Eval("UserType") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="UserTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" Text='<%# Eval("UserType") %>'>
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <%--<FooterTemplate>
                                <asp:RadioButtonList ID="FooterRadioButtonList" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                                </asp:RadioButtonList>
                            </FooterTemplate>--%>
                        </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="ProfileImage">
                            <ItemTemplate>
                                <asp:Image ID="Image1" Height="50" Width="100" ImageUrl='<%# Eval("ProfileImage")%>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:HiddenField ID="HiddenImagePath" Value='<%# Eval("ProfileImage") %>' runat="server" />
                            </EditItemTemplate>
                           <%-- <FooterTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </FooterTemplate>--%>
                        </asp:TemplateField>

                   <asp:TemplateField HeaderText="View Import File">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkImport" runat="server" NavigateUrl='<%# Eval("ImportPath") %>' Text="View File" Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileImport" runat="server" />
                                <asp:HiddenField ID="HiddenImportPath" Value='<%# Eval("ImportPath") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                    <asp:TemplateField HeaderText="Operation">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CssClass="btn btn-info btn-sm" Width="100">Edit</asp:LinkButton> 
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" Width="100">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm" Width="100">Update</asp:LinkButton> 
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" Width="100">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <%--<FooterTemplate>
                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Insert" CssClass="btn btn-primary btn-sm" Width="100">Insert</asp:LinkButton>
                        </FooterTemplate>--%>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script>
        function openInsertModal() {
            var modal = new bootstrap.Modal(document.getElementById('insertModal'));
            modal.show();
        }
    </script>
</body>
</html>

