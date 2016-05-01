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
        if (!IsPostBack) {
            BindRoles();
        }

    }

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
        rptrAvailableRoles.DataSource = availableRoles;
        rptrAvailableRoles.DataBind();

        rptrCurrentRoles.DataSource = userRoles;
        rptrCurrentRoles.DataBind();
    }

    protected void rptrCurrentRoles_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Roles.RemoveUserFromRole(Request.QueryString["id"], e.CommandArgument.ToString());
        BindRoles();
    }

    protected void rptrAvailableRoles_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Roles.AddUserToRole(Request.QueryString["id"], e.CommandArgument.ToString());
        BindRoles();
    }
}