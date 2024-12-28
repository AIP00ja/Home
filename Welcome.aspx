<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Project.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <h2>Enter Email to reset your password</h2>
                    <div>
                        <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Enter Your Email Id"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                    <div>
                        <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click"/>
                    </div>
        
    </form>
</body>
</html>
