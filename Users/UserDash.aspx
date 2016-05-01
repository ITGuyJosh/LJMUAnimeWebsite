<%@ Page Title="" Language="C#" MasterPageFile="~/BackMaster.master" AutoEventWireup="true" CodeFile="UserDash.aspx.cs" Inherits="UserDash" ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Libs/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="AniEditMsg">
        <h4>Select a Review to Edit</h4>
    </div>

    <div class="BackMain">

        <asp:FormView ID="FilterUserReviews" runat="server" DataKeyNames="id" DataSourceID="FilterReviewDS" DefaultMode="Edit" RenderOuterTable="false">
            <EditItemTemplate>


                <div class="LeftEditForm">
                    <div class="AniIDRow">
                        <div class="AniIDBox">
                            <h3>Ani ID</h3>
                            <asp:TextBox ID="AniID" runat="server" Text='<%# Bind("id") %>' ReadOnly="True" CssClass="AniEditID" />
                        </div>
                        <div class="AniTitleBox">
                            <h3>Title</h3>
                            <asp:TextBox ID="AniTitle" runat="server" Text='<%# Bind("title") %>' CssClass="AniEditTitle"></asp:TextBox>
                        </div>
                    </div>
                    <div class="DescEditRow">
                        <div class="DescEditBox">
                        <h3>Description</h3>
                        <asp:TextBox ID="AniDesc" TextMode="MultiLine" runat="server" Text='<%# Bind("description") %>' CssClass="AniDesc"></asp:TextBox>
                        </div>

                        <div class="AniCatEditBox">
                        <h3>Anime Category</h3>
                        <asp:DropDownList ID="AniCatDrop" runat="server" DataSourceID="AniCatCon" DataTextField="category" DataValueField="category_id" CssClass="AniCats" SelectedValue='<%# Bind("category_id") %>'></asp:DropDownList>
                        </div>
                        <asp:SqlDataSource ID="AniCatCon" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="select id as category_id, category from categories"></asp:SqlDataSource>
                        
                        <div class="AniImgEditBox">
                         <h3>Change Image</h3>
                    <asp:FileUpload ID="NewAniImg" runat="server" CssClass="AniEditImg"></asp:FileUpload>
                    <asp:Button ID="ChangeImg" runat="server" Text="Update Image" OnClick="UpdateFile"/>
                            </div>
                    </div>
                </div>
                <div class="RightEditForm">

                    <h3>Current Image</h3>
                    <asp:Image alt="Anime Image" ID="CurrentImg" ImageUrl='<%#  Eval("img_link")%>' class="AniCurrentImg" runat="server" />
                   

                </div>
                <div class="BottomEditForm">
                    <CKEditor:CKEditorControl ID="txtReview" BasePath="/Libs/ckeditor/" runat="server" Text='<%# Bind("review") %>'></CKEditor:CKEditorControl>

                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Update" Text="Update Text" UpdateMethod="UpdateFile" CssClass="linkBtns" />

                    <asp:Button ID="Delete" Text="Delete" runat="server" CssClass="linkBtns" OnClick="DeleteReview" />

                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="linkBtns" />
                    <asp:HyperLink ID="Refresh" runat="server" CausesValidation="False" Text="Refresh" NavigateUrl="~/Users/UserDash.aspx" CssClass="linkBtns" />
                </div>

            </EditItemTemplate>
        </asp:FormView>

        <asp:SqlDataSource ID="FilterReviewDS" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="SELECT [id], [category_id], [img_link], [title], [description], [review] FROM [anime_reviews] WHERE ([id] = @id)" UpdateCommand="UPDATE [anime_reviews] SET [category_id] = @category_id, [title] = @title, [description] = @description, [review] = @review WHERE [id] = @id;" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="UserReviews" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="category_id" Type="Int32" />
                <asp:Parameter Name="img_link" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="review" Type="String" />
                <asp:Parameter Name="id" Type="int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="BottomEditSelector">
            <asp:GridView ID="UserReviews" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="UserReviewDS" AllowSorting="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#181717" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#181717" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#e9e9e9" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="UserReviewDS" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="SELECT [anime_reviews].[id], [title], [category] FROM [anime_reviews] LEFT JOIN [categories] ON [anime_reviews].[category_id] = [categories].id WHERE ([user_id] = @user_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="user_id" SessionField="uid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

    </div>

    <script>
        //removing msg prompt upon selections
        $(document).ready(function () {
            if ($('.LeftEditForm').length) {
                $('.AniEditMsg').remove();
            }
        });
    </script>
</asp:Content>

