<%@ Page Title="" Language="C#" MasterPageFile="~/BackMaster.master" AutoEventWireup="true" CodeFile="AddReview.aspx.cs" Inherits="AddReview" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Libs/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="BackMain">        

        <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="AddReview" ShowMessageBox="true" CssClass="ErrorMsg" />
        <div class="ValidationMsg"></div>

        <div class="LeftAddForm">
            <asp:TextBox ID="AniTitle" runat="server" placeholder="Title" CssClass="AniTitle" ValidationGroup="AddReview"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AniTitle" ErrorMessage="Error: Title required." ToolTip="Title is required." ValidationGroup="AddReview">*</asp:RequiredFieldValidator>           
            <asp:TextBox ID="AniDesc" TextMode="MultiLine" runat="server" placeholder="Description" CssClass="AniDesc" ValidationGroup="AddReview"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AniDesc" ErrorMessage="Error: Description required." ToolTip="Description is required." ValidationGroup="AddReview">*</asp:RequiredFieldValidator>           
        </div>
        <div class="RightAddForm">
            <asp:FileUpload id="AniImgs" runat="server" CssClass="AniImgs" ></asp:FileUpload>
            <asp:CustomValidator id="FileValidator" runat="server" Display="None" EnableClientScript="False" ValidationGroup="AddReview" ErrorMessage="Please fill in all fields."></asp:CustomValidator>        
            <h3>Anime Category</h3>
            <asp:DropDownList ID="AniCats" runat="server" DataSourceID="AniCatCon" DataTextField="category" DataValueField="id" CssClass="AniCats"></asp:DropDownList>
            <asp:SqlDataSource ID="AniCatCon" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="select * from categories"></asp:SqlDataSource>
        </div>
        <div class="BottomAddForm">
            <CKEditor:CKEditorControl ID="txtReview" BasePath="/Libs/ckeditor/" runat="server" ValidationGroup="AddReview"></CKEditor:CKEditorControl>
            <asp:RequiredFieldValidator ID="RevRequired" runat="server" ControlToValidate="txtReview" ErrorMessage="Error: Review required." ToolTip="Review is required." ValidationGroup="AddReview">*</asp:RequiredFieldValidator>           

            <asp:Button ID="AddSubmit" runat="server" Text="Submit" onClick="btnSubmit_Click" CssClass="AddSubmit"/>
        </div>
    </div>    

</asp:Content>

