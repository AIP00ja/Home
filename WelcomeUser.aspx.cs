using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WelcomeUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Email"] == null || Session["UserType"]?.ToString() != "User")
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetNoStore();
        }

        //protected void LogOut_Click(object sender, EventArgs e)
        //{

        //    Session.Abandon();
        //    Response.Redirect("Login.aspx");
        //}
    }
}