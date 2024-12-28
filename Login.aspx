<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Home.css" rel="stylesheet" />
    <!-- fonts links -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <!-- bootstrap links -->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
<style>
    .imghw{
    height: 70px;   
    width: 70px;    
    object-fit: cover;  
    }
    .profile-img-card {
    display: block;
    margin: 0 auto;
    }
    .label-text {
    display: block;
    margin: 1px auto; 
    text-align: center; 
    font-size: 13px; 
    color: #000;
}

}
</style>
</head>
    <script type="text/javascript">
    window.onload = function() {
        if (performance.navigation.type === performance.navigation.TYPE_BACK_FORWARD) {
            window.history.go(1);
        }
    };
</script>
<body>
    <div class="top-navbar">
        <div class="icons">
            <a href="logo.html"><img src="Images/logo.png" alt="" width="18"/><span>PoJo</span></a> 
        </div>
        <div class="icons">
            <a href="Login.aspx"><img src="Images/register.png" alt="" width="18"/><span>Login</span></a>
            <a href="RegistrationForm.aspx"><img src="Images/register.png" alt="" width="18"/><span>Register</span></a>
            <a href="Admin/AdminRegistration.aspx"><img src="Images/register.png" alt="" width="18"/><span>Admin</span></a>
        
        </div>
    </div>
    <nav class="navbar navbar-expand-lg" id="navbar">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.html" id="logo"><span id="span1">H</span>ome <span>Appliances</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span><img src="Images/menu.png" alt="" width="30"/></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">Home</a>
              </li>
                <li class="nav-item">
                <a class="nav-link" href="#">Product</a>
              </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color:rgb(67 0 86);">
                    <li class="dropdown-item">
                <a class="nav-link" href="#">Washers & Dryers</a>
              </li>
                    <li class="dropdown-item">
                <a class="nav-link" href="#">Cooking & Baking</a>
              </li>
                    <li class="dropdown-item">
                <a class="nav-link" href="#">Kitchen appliances</a>
              </li>
                    <li class="dropdown-item">
                <a class="nav-link" href="#">Refrigerators</a>
              </li>
                    <li class="dropdown-item">
                <a class="nav-link" href="#">Mixer Grinders</a>
              </li>
                </ul>
                </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Offers</a>
              </li>
                <li class="nav-item">
                <a class="nav-link" href="#">Service</a>
              </li>
                 <li class="nav-item">
                <a class="nav-link" href="#">Experience PoJo</a>
              </li>
            </ul>
            <form class="d-flex" id="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>
    <!--Login-->
    <form id="form1" runat="server">
        <div class="container" id="login">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center">Welcome Back!</h3>
                </div>
                <div class="col-md-7 py-3 py-md-0" id="side2">
                    <h3 class="text-center">Account login</h3>
                    <p class="text-center">In this HTML tutorial, you will find more than 200 examples.</p>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/profile-circle.png" CssClass="profile-img-card rounded-circle imghw"/>
                    <br />
                    <asp:Label ID="Label1" runat="server" CssClass="label-text"></asp:Label>
                    <div class="input2 text-center">
                     <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" OnTextChanged="txtEmail_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <asp:TextBox ID="txtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>         
                    </div>
                    <input type="checkbox" id="showPassword" onchange="this.form.txtPass.type = this.checked ? 'text' : 'password';" style="text-align: left; width: 10%; margin-left: 100px;" />Show Password            
                     <p class="text-center" id="btnlogin"><asp:Button ID="ButtonLogin" runat="server" Text="LogIn" OnClick="ButtonLogin_Click" class="btn btn-warning btn-block theme-button mt-3"/></p>

                    <div class="new-signup text-center mt-3">
                        <a href="EmailSend.aspx" class="signuplink text-black">Forgot username or password?</a>
                    </div>
                    </div>  
            </div>
        </div>   
    </form>
    <!--Newslate-->
   <%-- <div class="container" id="newslate" style="margin-top:100px">
        <h3 class="text-center">Subscribe to The Home Application for latest upload.</h3>
        <div class="input text-center">
            <input type="text" placeholder="Enter your Email.."/>
            <button id="subscribe">SUBSCRIBE</button>
        </div>
    </div>--%>
    <!--footer-->
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Service</h4>
                        <ul>
                            <li><a href="#">Get Support</a></li>
                            <li><a href="#">Repair service</a></li>
                            <li><a href="#">Care & Protection</a></li>
                            <li><a href="#">Contact & Info</a></li>
                        </ul>                       
                        <h4></h4>
                        <div class="socail-links mt-3">
                            <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            <a href="#"><i class="fa-brands fa-facebook"></i></a>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            <a href="#"><i class="fa-brands fa-skype"></i></a>
                            <a href="#"><i class="fa-brands fa-linkedin"></i></a>
                        </div>                   
                    </div>
                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Experience PoJo</h4>
                        <ul>
                            <li><a href="#">History</a></li>
                            <li><a href="#">Awards</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Terms and Conditions</h4>
                        <ul>
                            <li><a href="#">Terms and Conditions of Sale</a></li>
                            <li><a href="#">General Promotion Terms and<br /> Condition</a></li>
                            <li><a href="#">Warranty on products</a></li>
                            <li><a href="#">Festive 2024 Terms and Conditions</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Secure Payment Methods</h4>
                        <div>
                            <a href="#"><img src="Images/Visapayment_logo.jpg" alt="" width="60" /></a>
                            <a href="#"><img src="Images/MastercardPaymen.jpg" alt="" width="60" /></a>
                            <a href="#"><img src="Images/RuPayPayment.jpg" alt="" width="60" /></a>
                            <a href="#"><img src="Images/UPI.png" alt="" width="60" /></a>
                        </div>                       
                    </div>
                </div>
                <hr />
                <div class="container py-4">
                    <div class="copyright">
                        &copy; 2024 PoJo <strong><span> Home Application</span></strong> Group&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;<span>Responsible Body</span>
                        &nbsp;&nbsp;&nbsp;<span>Terms and Conditions of use</span>
                        &nbsp;&nbsp;&nbsp;<span>Privacy policy</span>
                        &nbsp;&nbsp;&nbsp;<span>E-waste management</span>
                    </div>
                </div>
                <div class="container py-4">
                    <div class="credits">
                        Designed by<a href="#">&nbsp;PoJo</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <a href="#" class="arrow"><i><img src="Images/arrow.png" alt="" /></i></a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
