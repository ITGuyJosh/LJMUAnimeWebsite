using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RolesManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) {

        //running role & user bind if page not post back
        if (!IsPostBack) {
            BindRoles();
            BindUsers();
        }

    }

    //binding user
    private void BindUsers() {
        //get all users
        MembershipUserCollection members = Membership.GetAllUsers();

        //adding user to list
        List<string> membersList = new List<string>();
        //looping through users to add them to list
        foreach (MembershipUser member in members) {
            membersList.Add(member.UserName);
        }

        //binding users to page
        rptrUsers.DataSource = Membership.GetAllUsers();
        rptrUsers.DataBind();
    }

    //binding all roles
    protected void BindRoles() {
        rptrRoles.DataSource = Roles.GetAllRoles();
        rptrRoles.DataBind();
    }

    //creating role 
    protected void btnAddRole_Click(object sender, EventArgs e) {
        Roles.CreateRole(txtRole.Text);
        BindRoles();
    }

    //deleting role
    protected void rptrRoles_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Roles.DeleteRole(e.CommandArgument.ToString());
        BindRoles();
    }

    //deleting user
    protected void rptrUsers_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Membership.DeleteUser(e.CommandArgument.ToString());
        BindRoles();
    }

}