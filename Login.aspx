<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <div class="MainBody">    
            <asp:Login ID="LoginSys" runat="server" RenderOuterTable="false" OnLoggedIn="onLoggedIn">
                <LayoutTemplate>
                     <div class="LoginBox">
                    
                    <h2>Login</h2>
                         <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="LoginSys" ShowMessageBox="true" CssClass="ErrorMsg" />

                         <div class="LogName">                             
                    <asp:TextBox ID="UserName" runat="server" CssClass="AccTextBox" placeholder="USERNAME"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Error: User Name is required." ToolTip="User Name is required." ValidationGroup="LoginSys">*</asp:RequiredFieldValidator>
                         </div>

                         <div class="LogPass">
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="AccTextBox" placeholder="PASSWORD"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Error: Password is required." ToolTip="Password is required." ValidationGroup="LoginSys">*</asp:RequiredFieldValidator>
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

