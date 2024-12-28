<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
<link href="css/StyleSheet2.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       
                    
                        <h5 class="modal-title" id="exampleModalLabel">Update Details</h5>
                        
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
                            <label>Profile Image:</label>
                            <asp:Image ID="Image2" runat="server" Height="70" Width="70" />
                            <asp:FileUpload ID="FileUpload3" runat="server" />
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>
                    </div>
         <asp:Button ID="UpdateDetails" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="UpdateDetails_Click" />
                  
    </form>
</body>
</html>