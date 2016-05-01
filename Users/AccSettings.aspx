<%@ Page Title="" Language="C#" MasterPageFile="~/BackMaster.master" AutoEventWireup="true" CodeFile="AccSettings.aspx.cs" Inherits="Users_AccSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ChangePassword ID="ChangePassword" runat="server" RenderOuterTable="false">
        <ChangePasswordTemplate>

            <div class="MainBody">
                <div class="ChangePassBox">
                <h2>Change Password</h2>
                <div class="AccCurPass">
                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword" CssClass="AccLbl">Password</asp:Label>

                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="AccTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                </div>

                <div class="AccNewPass">
                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword" CssClass="AccLbl">New Password</asp:Label>

                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="AccTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ToolTip="New Password" />

                </div>
                <div class="AccConfPass">
                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword" CssClass="AccLbl">Confirm New Password</asp:Label>

                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="AccTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>

                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword"></asp:CompareValidator>

                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                </div>

                <div class="AccBtnsBox">
                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword" CssClass="AccBtns" />

                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="AccBtns" />
                </div>
                </div>
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
</asp:Content>

