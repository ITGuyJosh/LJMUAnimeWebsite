<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="MainBody">
        <div class="RegContainer">
        <h1>Register</h1>
        <asp:Literal runat="server" ID="StatusMessage" />


        <asp:CreateUserWizard ID="CreateUser" runat="server" OnCreatedUser="CreateUser_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserStep" runat="server">
                    <ContentTemplate>
                            <h3>Sign Up for Your New Account</h3>
                                <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="CreateUser" ShowMessageBox="true" CssClass="ErrorMsg" />
                                

                                <asp:TextBox ID="UserName" runat="server" placeholder="USERNAME" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Error: User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>

                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="PASSWORD"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Error: Password is required." ToolTip="Password is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
     
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" placeholder="CONFIRM PASSWORD"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Error: Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
  
                                <asp:TextBox ID="Email" runat="server" placeholder="EMAIL"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Error: E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                        
                                <asp:CustomValidator ID="LJMUValidator" OnServerValidate="LJMUValidator" runat="server" ControlToValidate="Email"  ErrorMessage="Error: You must have a valid LJMU email to register." ToolTip="You must have a valid LJMU email to register." ValidationGroup="CreateUser">*</asp:CustomValidator>

                                <asp:TextBox ID="Question" runat="server" placeholder="SECURITY QUESTION"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Error: Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                  
                                <asp:TextBox ID="Answer" runat="server" placeholder="SECURITY ANSWER"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Error: Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
     
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="None" ErrorMessage="Error: The Password and Confirmation Password must match." ValidationGroup="CreateUser" CssClass="ErrorMsg"></asp:CompareValidator>
        
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                      
        
                    </ContentTemplate>
                </asp:CreateUserWizardStep>

                <asp:CompleteWizardStep ID="CompleteUserStep" runat="server">
                    <ContentTemplate>     
                            <h3>Your account has been successfully created.</h3>
                            <span>
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Login Now" ValidationGroup="CreateUser" PostBackUrl="~/Users/UserDash.aspx" />
                            </span>
                    </ContentTemplate>
                </asp:CompleteWizardStep>

            </WizardSteps>
        </asp:CreateUserWizard>

        </div>


    </section>
</asp:Content>

