<%@ Page Title="" Language="C#" MasterPageFile="~/BackMaster.master" AutoEventWireup="true" CodeFile="AddReview.aspx.cs" Inherits="AddReview" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Libs/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="BackMain">        

        <div class="LeftAddForm">
            <asp:TextBox ID="AniTitle" runat="server" placeholder="Title" CssClass="AniTitle"></asp:TextBox>
            <asp:TextBox ID="AniDesc" TextMode="MultiLine" runat="server" placeholder="Description" CssClass="AniDesc"></asp:TextBox>
        </div>
        <div class="RightAddForm">
            <asp:FileUpload id="AniImgs" runat="server" CssClass="AniImgs" ></asp:FileUpload>
            <h3>Anime Category</h3>
            <asp:DropDownList ID="AniCats" runat="server" DataSourceID="AniCatCon" DataTextField="category" DataValueField="id" CssClass="AniCats"></asp:DropDownList>
            <asp:SqlDataSource ID="AniCatCon" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="select * from categories"></asp:SqlDataSource>
        </div>
        <div class="BottomAddForm">
            <CKEditor:CKEditorControl ID="txtReview" BasePath="/Libs/ckeditor/" runat="server"></CKEditor:CKEditorControl>           

            <asp:Button ID="AddSubmit" runat="server" Text="Submit" onClick="btnSubmit_Click" CssClass="AddSubmit"/>
        </div>
    </div>

    <script type="text/javascript">
    $(function () {
        $("#AddSubmit").dialog({
            modal: true,
            autoOpen: false,
            title: "Review Added!",
            width: 300,
            height: 150
        });
        $("#btnShow").click(function () {
            $('#dialog').dialog('open');
        });
    });
</script>

</asp:Content>

