<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Project.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Home.css" rel="stylesheet" />
    <!-- fonts links -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <!-- bootstrap links -->
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
   </head>
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
    <!--Home-->
    <section class="home">
    <div class="content">
        <h1><span>Home Products</span>
            <br />
           Up To<span id="span2">50%</span>Off
        </h1>
        <p>In this HTML tutorial, you will find more than 200 examples. With our online "Try it Yourself" editor,
            <br />you can edit and test each example yourself! </p>
        <div class="btn"><button>Shop Now</button></div>
    </div>
    <div class="img">
        <img src="Images/background.png" alt="" />
    </div>
        </section>
    <!--Product Cards-->
    <div class="container" id="product-cards">
        <h1 class="text-center">Products</h1>
        <div class="row" style="margin-top:30px;">
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Mixer Grinders.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Mixer Grinders</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Cooking & Baking.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Cooking & Baking</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$150<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Washers & Dryers.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Washers & Dryers</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$200<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Dishwashers.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Dishwashers</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$100<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top:30px;">
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Refrigerators.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Refrigerators</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$300<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Food Processors.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Food Processors</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$500<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Kitchen appliances.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Kitchen appliances</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>200<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Coffee Machines.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Coffee Machines</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        <div class="star">
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                            <i class="fa-solid fa-star checked"></i>
                        </div>
                        <h2>$400<span><li class="fa-solid fa-cart-shopping"></li></span></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="other-cards">
        <div class="row">
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Share your experience.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Share your experience</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Looking.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Looking for help? You'll find it here.</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <div class="card">
                    <img src="Images/Helping Friend.jpg" alt="" />
                    <div class="card-body">
                        <h3 class="text-center">Your Helping Friend</h3>
                        <p class="text-center">Lorem test each example yourself!</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Services-->
    <div class="container" id="Services">
        <h1 class="text-center">Services & support.</h1>
        <div class="row">
            <div class="col-md-4 py-3 py-md-0">
                <div class="card-1">
                    <h3>Register for MyBosch.</h3>
                 <p>Register for product warranty and enable us to reach out 
                     to you with tips & tricks for the usage of your appliance. 
                     Your registration with MyBosch comes with a whole range of 
                     benefits to make your experience even better.</p>   
                    
                </div>
            </div>
            <div class="col-md-4 py-3 py-md-0">
                <div class="card-1">
                    <h3>Our service</h3>
                    <p>Outstanding service – before and after the purchase.
                        Toll-Free No: 1800-266-1880
                        Working hours: Monday - Saturday: 8 am to 8 pm.
                        Chat with us (WhatsApp): +91-8451000555
                        1800 266 1880</p>
                    
                </div>
            </div>
            <div class="col-md-4 py-3 py-md-0">
                <div class="card-1">
                    <h3>Find a dealer</h3>
                    <p>Reach out to our authorized dealers and
                        brand stores across India.</p>
                    
                </div>
            </div>
        </div>
    </div>
    <!--banner-->
    <section class="banner">
    <div class="content">
<h1><span>Home Products</span></h1>
    </div>
    </section>
    <!--Offers-->
    <div class="container" id="offer">
        <div class="row">
            <div class="col-md-3 py-3 py-md-0">
                <i class="fa-solid fa-cart-shopping"></i>
                <h3>Free shopping</h3>
                <p>On order over $1000</p>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <i class="fa-solid fa-rotate-left"></i>
                <h3>Free Returns</h3>
                <p>within 30 days</p>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <i class="fa-solid fa-truck"></i>
                <h3>Fast Delivery</h3>
                <p>World wide</p>
            </div>
            <div class="col-md-3 py-3 py-md-0">
                <i class="fa-solid fa-thumbs-up"></i>
                <h3>Big choice</h3>
                <p>Of Products</p>
            </div>
        </div>
    </div>
    <!--Newslate-->
    <div class="container" id="newslate">
        <h3 class="text-center">Subscribe to The Home Application for latest upload.</h3>
        <div class="input text-center">
            <input type="text" placeholder="Enter your Email.."/>
            <button id="subscribe">SUBSCRIBE</button>
        </div>
    </div>
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
