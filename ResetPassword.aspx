<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Project.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Reset Password</h2>
        <div>
         <asp:TextBox ID="NewTextBox" runat="server" Visible="true" placeholder="Enter Your New Password"></asp:TextBox>
        </div>
         <div>
         <asp:TextBox ID="ConfirmTextBox" runat="server" Visible="true" placeholder="Enter Your Confirm Password"></asp:TextBox>
        </div>
          <div>
            <asp:Button ID="ResetButton" runat="server" Visible="true" Text="Reset"/>
         </div>
    </form>
</body>
</html>
