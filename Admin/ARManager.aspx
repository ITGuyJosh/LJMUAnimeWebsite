<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ARManager.aspx.cs" Inherits="Admin_ARManager" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Libs/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="AniEditMsg">
        <h4>Manage User Reviews & Anime Categories</h4>
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

                    </div>
                </div>
                <div class="RightEditForm">

                    <h3>Current Image</h3>
                    <asp:Image alt="Anime Image" ID="CurrentImg" ImageUrl='<%# "..\\Users\\" +  Eval("img_link")%>' class="AniCurrentImg" runat="server" />
                   

                </div>
                <div class="BottomEditForm">
                    <CKEditor:CKEditorControl ID="txtReview" BasePath="/Libs/ckeditor/" runat="server" Text='<%# Bind("review") %>'></CKEditor:CKEditorControl>

                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Update" Text="Update" UpdateMethod="UpdateFile" CssClass="linkBtns" />

                    <asp:Button ID="Delete" Text="Delete" runat="server" CssClass="linkBtns" OnClick="DeleteReview" />

                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="linkBtns" />
                    <asp:HyperLink ID="Refresh" runat="server" CausesValidation="False" Text="Refresh" NavigateUrl="~/Admin/ARManager.aspx" CssClass="linkBtns" />
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



        <div class="CatManager">
            <div class="CatManagerInsert">
                <asp:FormView ID="AddCat" runat="server" DataKeyNames="id" DataSourceID="CatManagerCon" DefaultMode="Insert" RenderOuterTable="false">
                    <InsertItemTemplate>
                        <h4>Create Anime Category</h4>
                        <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />                    
                        <div class="CatLinkBtns"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="BtnCatCreate" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btnCatCancel" />
                            </div>
                    </InsertItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="CatManagerCon" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" InsertCommand="INSERT INTO [categories] ([category]) VALUES (@category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [category] FROM [categories]" DeleteCommand="DELETE FROM [categories] WHERE [id] = @original_id AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL))" UpdateCommand="UPDATE [categories] SET [category] = @category WHERE [id] = @original_id AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL))">

                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_category" Type="String" />
                    </DeleteParameters>

                    <InsertParameters>
                        <asp:Parameter Name="category" Type="String" />
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_category" Type="String" />
                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
             <div class="CatManagerEdit">
                 <h4>Edit Anime Categories</h4>
                 <asp:GridView ID="ManageCat" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="CatManagerEditCon" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="6">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
                 <asp:SqlDataSource ID="CatManagerEditCon" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" DeleteCommand="DELETE FROM [categories] WHERE [id] = @original_id AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL))" InsertCommand="INSERT INTO [categories] ([category]) VALUES (@category)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [category], [id] FROM [categories]" UpdateCommand="UPDATE [categories] SET [category] = @category WHERE [id] = @original_id AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL))">
                     <DeleteParameters>
                         <asp:Parameter Name="original_id" Type="Int32" />
                         <asp:Parameter Name="original_category" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="category" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="category" Type="String" />
                         <asp:Parameter Name="original_id" Type="Int32" />
                         <asp:Parameter Name="original_category" Type="String" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
             </div>
         </div>

        <div class="AREditSelector">
            <asp:GridView ID="UserReviews" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="UserReviewDS" AllowSorting="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None"  PageSize="12">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="AnimeID" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" ItemStyle-HorizontalAlign="Left"/>
                    <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                    <asp:BoundField DataField="created" HeaderText="Created" SortExpression="created" />
                    <asp:BoundField DataField="user_id" HeaderText="UserID" SortExpression="user_id" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#181717" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#181717" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#e9e9e9" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="UserReviewDS" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="SELECT [anime_reviews].[id], [title], [category], anime_reviews.created, anime_reviews.user_id FROM [anime_reviews] LEFT JOIN [categories] ON [anime_reviews].[category_id] = [categories].id ORDER BY anime_reviews.created DESC">
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
