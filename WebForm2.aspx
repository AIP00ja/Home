<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Project.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration</title>
    <link href="css/Home.css" rel="stylesheet" />
    <!-- fonts links -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- bootstrap links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
</head>
<body>
    <div class="top-navbar">
        <div class="icons">
            <a href="logo.html"><img src="../Images/logo.png" alt="" width="18"/><span>PoJo</span></a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg" id="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html" id="logo"><span id="span1">H</span>ome <span>Appliances</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Product</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Category</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Offers</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Service</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Experience PoJo</a></li>
                </ul>
                <form class="d-flex" id="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        <!-- Admin Key Modal -->
        <div class="modal" id="adminKeyModal" tabindex="-1" role="dialog" style="display: block;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Admin Key Verification</h5>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="txtAdminKey" runat="server" placeholder="Enter Admin Key" CssClass="form-control"></asp:TextBox>
                        <asp:Label ID="lblKeyError" runat="server" CssClass="text-danger d-block mt-2" Visible="false"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnVerifyKey" runat="server" Text="Verify" CssClass="btn btn-primary" OnClick="btnVerifyKey_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Registration Form -->
        <div class="container" id="login" style="display: none;">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center">Admin Registration</h3>
                </div>
                <div class="col-md-7 py-3 py-md-0" id="side2">
                    <h3 class="text-center">Create Account</h3>
                    <div class="input3 text-center">
                        <asp:TextBox ID="txtName" runat="server" placeholder="Name"></asp:TextBox>
                         
                        <asp:TextBox ID="txtAge" runat="server" placeholder="Age"></asp:TextBox>
                        
                        <div class="input3 text-center">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="style">
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                           
                            </div>
                        
                        <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone"></asp:TextBox>
                       
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                       
                        <asp:TextBox ID="txtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    
                    <p class="text-center" id="btnlogin">
                        <asp:Button ID="btnSubmit" runat="server" Text="Sign Up" class="btn btn-warning btn-block theme-button mt-3" Enabled="false" CssClass="disabled" OnClick="btnSubmit_Click"/>
                    </p>
                </div>
            </div>
        </div>   
    </form>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
