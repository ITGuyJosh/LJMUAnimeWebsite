<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="AnimeReviews.aspx.cs" Inherits="AnimeReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Resources/Scripts/jquery-2.2.0.min.js"></script>
    <script src="Resources/Scripts/dotdot.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="MainBody">
            <nav class="ReviewFilter">
                <ul>
                    <li><a href="#">Date ASC</a></li>
                    <li><a href="#">Date DSC</a></li>
                </ul>
                <select class="AnimeSelector" >
                    <option value="0">Select an Anime...</option>
                    <option value="0">One Punch Man</option>
                    <option value="1">Full-Metal Alchemist</option>
                    <option value="2">Death Note</option>
                    <option value="3">One Piece</option>
                </select>
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
                    
                    <asp:DataPager ID="AnimePager" runat="server">
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

<asp:SqlDataSource ID="LJMUDB" runat="server" ConnectionString="<%$ ConnectionStrings:LJMUDBCON %>" SelectCommand=" SELECT [anime_reviews].[id], UserName, category, [img_link], [title], [description], [review] FROM [anime_reviews] 
  left join [aspnet_Users] on anime_reviews.user_id = aspnet_Users.id 
  left join categories on anime_reviews.category_id = categories.id 
  Order BY [user_id]"></asp:SqlDataSource>


    <script>
        // limit amount of characters in description
        $(document).ready(function () {
            $(".Reviews p").dotdotdot({
                watch: "window"
            });
        });
    </script>

</asp:Content>

