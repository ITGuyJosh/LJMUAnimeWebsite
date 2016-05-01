using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void onLoggedIn(object sender, EventArgs e) {

        //Redirect upon login to role specific page
        if (Roles.IsUserInRole(LoginSys.UserName,"Admin")) {
            Response.Redirect("~/Admin/ARManager.aspx");
        } 
            Response.Redirect("~/Users/UserDash.aspx");
              
    }
  
}