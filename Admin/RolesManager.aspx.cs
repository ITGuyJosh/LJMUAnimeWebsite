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

        if (!IsPostBack) {
            BindRoles();
            BindUsers();
        }

    }

    private void BindUsers() {
        MembershipUserCollection members = Membership.GetAllUsers();
        List<string> membersList = new List<string>();
        foreach (MembershipUser member in members) {
            membersList.Add(member.UserName);
        }
        rptrUsers.DataSource = Membership.GetAllUsers();
        rptrUsers.DataBind();
    }

    protected void BindRoles() {
        rptrRoles.DataSource = Roles.GetAllRoles();
        rptrRoles.DataBind();
    }


    protected void btnAddRole_Click(object sender, EventArgs e) {
        Roles.CreateRole(txtRole.Text);
        BindRoles();
    }

    protected void rptrRoles_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Roles.DeleteRole(e.CommandArgument.ToString());
        BindRoles();
    }

    protected void rptrUsers_ItemCommand(object source, RepeaterCommandEventArgs e) {
        Membership.DeleteUser(e.CommandArgument.ToString());
        BindRoles();
    }

}