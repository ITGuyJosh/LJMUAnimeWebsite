<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <div class="MainBody">    
            <asp:Login ID="LoginSys" runat="server" RenderOuterTable="false" OnLoggedIn="onLoggedIn">
                <LayoutTemplate>
                     <div class="LoginBox">
                    
                    <h2>Log In</h2>

                         <div class="LogName">
                             <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="AccLbl">User Name</asp:Label>

                    <asp:TextBox ID="UserName" runat="server" CssClass="AccTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginSys">*</asp:RequiredFieldValidator>
                         </div>

                         <div class="LogPass">
                             <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="AccLbl">Password</asp:Label>

                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="AccTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginSys">*</asp:RequiredFieldValidator>
                         </div>
                         <div class="LogRemember">
                             <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />

                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                         </div>

                         <div class="LogBtns">
                             <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginSys" CssClass="AccBtns" />
                             <asp:HyperLink ID="Register" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>                             
                         </div>                  
                     </div>

                </LayoutTemplate>
            </asp:Login>

        </div>    
</asp:Content>

