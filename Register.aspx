<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="MainBody">
        <h1>Register</h1>
        <asp:Literal runat="server" ID="StatusMessage" />


        <asp:CreateUserWizard ID="CreateUser" runat="server" OnCreatedUser="CreateUser_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserStep" runat="server">
                    <ContentTemplate>
                        <div class="CreateReg">
                            <h3>Sign Up for Your New Account</h3>

                            <div class="CreateRegUser">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="CreateRegPass">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="CreateRegPassCon">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="CreateRegEmail">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="CreateRegQuestion">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>

                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="CreateRegAnswer">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="CreateRegPassComp">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUser"></asp:CompareValidator>
                            </div>

                            <div class="CreateRegError">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>

                <asp:CompleteWizardStep ID="CompleteUserStep" runat="server">
                    <ContentTemplate>
                        <div class="CompleteReg">
                            <h3>Your account has been successfully created.</h3>
                            <span>
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Login Now" ValidationGroup="CreateUser" />
                            </span>
                        </div>
                    </ContentTemplate>
                </asp:CompleteWizardStep>

            </WizardSteps>
        </asp:CreateUserWizard>




    </section>
</asp:Content>

