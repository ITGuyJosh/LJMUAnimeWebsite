using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRoleManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) {

        //check if page is not postback to run bindroles function
        if (!IsPostBack) {
            BindRoles();
        }

    }

    //custom function to bind user to roles
    private void BindRoles() {

        //get all roles
        var allRoles = Roles.GetAllRoles();

        var userRoles = Roles.GetRolesForUser(Request.QueryString["id"]);

        //find available roles for the user
        var availableRoles = new List<string>();
        foreach (string role in allRoles) {
            if (!userRoles.Contains(role)) {
                availableRoles.Add(role);
            }
        }

        //binding avaialble roles
        rptrAvailableRoles.DataSource = availableRoles;
        rptrAvailableRoles.DataBind();

        //binding current roles
        rptrCurrentRoles.DataSource = userRoles;
        rptrCurrentRoles.DataBind();
    }

    //getting a list of current roles
    protected void rptrCurrentRoles_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Roles.RemoveUserFromRole(Request.QueryString["id"], e.CommandArgument.ToString());
        BindRoles();
    }

    //getting a list of available roles
    protected void rptrAvailableRoles_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Roles.AddUserToRole(Request.QueryString["id"], e.CommandArgument.ToString());
        BindRoles();
    }
}