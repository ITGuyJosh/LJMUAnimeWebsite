<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="RolesManager.aspx.cs" Inherits="RolesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="MainBody">

        <div class="RolesContainer">
            <div class="UsersManager">
                <h3>User Manager</h3>

                <asp:Repeater ID="rptrUsers" runat="server" OnItemCommand="rptrUsers_ItemCommand">

                    <ItemTemplate>
                        <div class="UserManageUsers">

                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument="<%# Container.DataItem %>" />
                            <asp:Label runat="server" Text="<%# Container.DataItem %>"></asp:Label>
                            <a href="UserRoleManager.aspx?id=<%# Container.DataItem %>">Manage Roles</a>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>
            </div>
            <div class="RolesManager">
                <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="RolesManager" ShowMessageBox="true" CssClass="ErrorMsg" />
                <h3>Role Manager</h3>
                <div class="RolesAddRole">
                    <asp:Label ID="lblRole" runat="server" Text="Role Name" AssociatedControlID="txtRole"></asp:Label>
                    <asp:TextBox ID="txtRole" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddRole" runat="server" Text="Add Role" OnClick="btnAddRole_Click" />
                    <asp:RequiredFieldValidator ID="CatRequired" runat="server" ControlToValidate="txtRole" ErrorMessage="Error: Role required." ToolTip="Role is required." ValidationGroup="RolesManager">*</asp:RequiredFieldValidator>
                </div>
                <div class="RolesRepeater">
                    <asp:Repeater ID="rptrRoles" runat="server" OnItemCommand="rptrRoles_ItemCommand">
                        <ItemTemplate>
                            <div class="RolesManageRoles">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument="<%# Container.DataItem %>" /><asp:Label runat="server" Text="<%# Container.DataItem %>"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>            
        </div>

    </div>
</asp:Content>

