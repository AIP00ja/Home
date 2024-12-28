<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailSend.aspx.cs" Inherits="Project.EmailSend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/EmailSend.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
 <div class="form-container">
        <div class="row w-100" id="email">
           
            <div id="side1" class="side">
                <h3>Welcome Back!</h3>
                <p>Glad to have you back. Please enter your registar email</p>
            </div>
            
           
            <div id="side2" class="side">
                <h3>Forgot Password</h3>
               <%-- <p>Enter your email</p>--%>
                
                <div class="input-group">
                    <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Enter Your Email Id" CssClass="input-field"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="error-message"></asp:Label>
                </div>
                
                <div class="btn-container">
                    <asp:Button ID="SendButton" runat="server" Text="Send" CssClass="btn btn-warning" OnClick="SendButton_Click" Height="50" Width="150" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
