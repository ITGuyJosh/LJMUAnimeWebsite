using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class AnimeReview : System.Web.UI.Page
{

   
    protected void Page_Load(object sender, EventArgs e)
    {       
           
    }

    // filter function that binds the repeater to display reviews in desc order
    protected void lnkBtnDSC_Click(object sender, EventArgs e)
    {
        LJMUDB.SelectCommand = "SELECT [anime_reviews].[id], UserName, category, [img_link], [title], [description], [review], [anime_reviews].[created] FROM [anime_reviews] left join [aspnet_Users] on anime_reviews.user_id = aspnet_Users.id   left join categories on anime_reviews.category_id = categories.id   Order BY [anime_reviews].[created] DESC";
        LJMUDB.DataBind();
        AnimeReviews.DataBind();
    }

    // filter function that binds the repeater to display reviews in user order
    protected void lnkBtnUser_Click(object sender, EventArgs e)
    {
        LJMUDB.SelectCommand = "SELECT [anime_reviews].[id], UserName, category, [img_link], [title], [description], [review], [anime_reviews].[created] FROM [anime_reviews] left join [aspnet_Users] on anime_reviews.user_id = aspnet_Users.id   left join categories on anime_reviews.category_id = categories.id   Order BY [user_id]";
        LJMUDB.DataBind();
        AnimeReviews.DataBind();
        
    }

    // filter function that binds the repeater to display only reviews selected by dropdown
    protected void CatSelector_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cat = CatSelector.SelectedValue;
        
        LJMUDB.SelectCommand = "SELECT [anime_reviews].[id], UserName, category, [img_link], [title], [description], [review], [anime_reviews].[created] FROM [anime_reviews] left join [aspnet_Users] on anime_reviews.user_id = aspnet_Users.id   left join categories on anime_reviews.category_id = categories.id  WHERE categories.id = '" + cat + "'";
        LJMUDB.DataBind();
        AnimeReviews.DataBind();
        
        
    }
}