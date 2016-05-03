<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="DisplayReview" runat="server" DataKeyNames="id" DataSourceID="ViewReview" RenderOuterTable="false">
      <ItemTemplate>
          <div id="DisplayReviewMain">
            <div id="DisplayReviewAside">
                <img alt="Anime Image" src='users\<%#  Eval("img_link")%>' class="DisplayImg"/>
                <div class="UserReviewInfo">
                    <ul>
                        <li>User: <asp:Label ID="user_idLabel" runat="server" Text='<%# Bind("UserName") %>' /></li>
                        <li>Category: <asp:Label ID="category_idLabel" runat="server" Text='<%# Bind("category") %>' /></li>
                        <li>Created:<asp:Label ID="createdLabel" runat="server" Text='<%# Bind("created") %>' /></li>
                    </ul>          
                </div>
            </div>

            
                <div class="UserReviewTop">
                <div class="UserReviewTitle">           
                    <h1><asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' /></h1>
                </div>
                <div class="UserReviewDesc">
                    <h2>Description</h2>
                    <p><asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' /></p>
                </div>
            </div>      
              <div id="DisplayReviewSection">          
                <div class="UserReviewRev">
                    <h2>Review</h2>
                    <p><asp:Label ID="reviewLabel" runat="server" Text='<%# Bind("review") %>' /></p>
                </div>           
            </div>
            </div>
      </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="ViewReview" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="SELECT [anime_reviews].[id], UserName, category, img_link, title, description, review, [anime_reviews].[created] AS created FROM [anime_reviews] LEFT JOIN [aspnet_Users] ON [anime_reviews].[user_id] = [aspnet_Users].[id] LEFT JOIN categories ON[anime_reviews].[category_id] = [categories].[id] WHERE ([anime_reviews].[id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        
    </asp:SqlDataSource>

</asp:Content>

