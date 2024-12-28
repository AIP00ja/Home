<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Project.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server" id="form1">
         <%--<div class="form-container">
        <div class="row w-100" id="email">
           
            <div id="side1" class="side">
                <h3>Welcome Back!</h3>
                <p>Glad to have you back. Please enter your registar email</p>
            </div>
            <div id="side2" class="side">
                <h3>Enter Email to reset your password</h3>--%>
               <%-- <p>Enter your email</p>--%>
                
                <%--<div class="input-group">
                    <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Enter Your Email Id" CssClass="input-field"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="error-message"></asp:Label>
                </div>
                
                <div class="btn-container">
                    <asp:Button ID="SendButton" runat="server" Text="Send" CssClass="btn btn-warning" OnClick="SendButton_Click1" Height="50" Width="150" />
                </div>
            </div>
        </div>
    </div>--%>

        <h2>Enter Email to reset your password</h2>
                    <div>
                        <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Enter Your Email Id"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click"/>
                    </div>
                </form>
    </body>
</html>
