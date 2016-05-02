<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="AnimeReviews.aspx.cs" Inherits="AnimeReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Resources/Scripts/jquery-2.2.0.min.js"></script>
    <script src="Resources/Scripts/dotdot.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="MainBody">
            <nav class="ReviewFilter">
                <ul>
                    <li><strong>Filter: </strong></li>
                    <li><asp:LinkButton ID="lnkBtnDSC" runat="server" OnClick="lnkBtnDSC_Click">Date DSC</asp:LinkButton></li>
                    <li><asp:LinkButton ID="lnkBtnUser" runat="server" OnClick="lnkBtnUser_Click">By User</asp:LinkButton></li>
                </ul>
                <asp:Label ID="lblCat" runat="server" Text="Category "></asp:Label>
                <asp:DropDownList ID="CatSelector" AutoPostBack="true" runat="server" DataSourceID="CatSelectorDS" DataTextField="category" DataValueField="id" OnSelectedIndexChanged="CatSelector_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="CatSelectorDS" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand="SELECT [id], [category] FROM [categories]"></asp:SqlDataSource>
            </nav>
        
        <asp:ListView ID="AnimeReviews" runat="server" DataSourceID="LJMUDB">
            <ItemTemplate>
                    <div class="Reviews">
                        <img alt="Anime Image" src='users\<%#  Eval("img_link")%>' class="ReviewImg"/>
                        <h3><%#  Eval("title")%></h3>
                        <p><%#  Eval("description")%></p>
                        <a href='Review.aspx?id=<%#  Eval("id")%>'>More</a>
                        <span class="DateCreated">#</span>
                        <span class="User"><%#  Eval("UserName")%></span>
                    </div>
                </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div class="PagerContainer">
                <div class="AnimePager">
                    
                    <asp:DataPager ID="AnimePager" runat="server" PagedControlID="AnimeReviews">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                        </div>
                </div>
            </LayoutTemplate>
            </asp:ListView>
                  
        </section>

<asp:SqlDataSource ID="LJMUDB" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand=" SELECT [anime_reviews].[id], UserName, category, [img_link], [title], [description], [review], [anime_reviews].[created] FROM [anime_reviews] 
  left join [aspnet_Users] on anime_reviews.user_id = aspnet_Users.id 
  left join categories on anime_reviews.category_id = categories.id 
  Order BY [anime_reviews].[created] DESC"></asp:SqlDataSource>


    <script>
        // limit amount of characters in description
        $(document).ready(function () {
            $(".Reviews p").dotdotdot({
                watch: "window"
            });
        });
    </script>

</asp:Content>

