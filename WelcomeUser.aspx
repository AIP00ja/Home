<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeUser.aspx.cs" Inherits="Project.WelcomeUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Hello<br />
            <asp:Button ID="LogOut" runat="server" OnClick="LogOut_Click" Text="LogOut" />
        </div>
    </form>
</body>
</html>
