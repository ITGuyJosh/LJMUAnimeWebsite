<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="UserRoleManager.aspx.cs" Inherits="UserRoleManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="MainBody">
        <div class="RolesContainer">            
            <div class="UsersManager">
                <h3>Current Roles</h3>

                <asp:Repeater ID="rptrCurrentRoles" runat="server" OnItemCommand="rptrCurrentRoles_ItemCommand">

                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:Button ID="btnDelete" runat="server" Text="Remove" CommandArgument="<%# Container.DataItem %>" /><asp:Label runat="server" Text="<%# Container.DataItem %>"></asp:Label></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>

            </div>

            <div class="RolesManager">

                <h3>Available Roles</h3>
                <asp:Repeater ID="rptrAvailableRoles" runat="server" OnItemCommand="rptrAvailableRoles_ItemCommand">

                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CommandArgument="<%# Container.DataItem %>" /><asp:Label runat="server" Text="<%# Container.DataItem %>"></asp:Label></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
            <div class="RolesBackLink">
            <a href="RolesManager.aspx">Back to Manage Roles</a>
                </div>
        </div>
    </div>
</asp:Content>

