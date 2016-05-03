<%@ Page Title="" Language="C#" MasterPageFile="~/BackMaster.master" AutoEventWireup="true" CodeFile="AccSettings.aspx.cs" Inherits="Users_AccSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="MainBody">
        <asp:ChangePassword ID="ChangePassword" runat="server" RenderOuterTable="false">
            <ChangePasswordTemplate>


                <div class="ChangePassBox">
                    <h2>Change Password</h2>

                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="ChangePassword" ShowMessageBox="true" CssClass="ErrorMsg" />

                    <div class="AccCurPass">
                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="AccTextBox" placeholder="CURRENT PASSWORD"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Error: Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                    </div>

                    <div class="AccNewPass">
                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="AccTextBox" placeholder="NEW PASSWORD"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="Error: New Password is required." ToolTip="New Password" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="AccConfPass">

                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="AccTextBox" placeholder="CONFIRM NEW PASSWORD"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Error: Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="none" ErrorMessage="Error: The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword"></asp:CompareValidator>

                    </div>

                    <div class="AccBtnsBox">
                        <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword" CssClass="AccBtns" />

                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="AccBtns" />
                    </div>
                </div>

            </ChangePasswordTemplate>

            <SuccessTemplate>
                <div class ="AccSuccess">
                    <h3>Your password has been changed!</h3>
                    <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" CssClass="AccBtns" PostBackUrl="~/Admin/ARManager.aspx" />
                    
                </div>
            </SuccessTemplate>

        </asp:ChangePassword>

    </div>

    <div class="MobSpace"></div>
</asp:Content>

