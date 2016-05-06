using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

public partial class Admin_ARManager : System.Web.UI.Page
{

    //set db con
    SqlConnection con = new SqlConnection(@"Data Source=SQL2014.studentwebserver.co.uk;Initial Catalog=db_1525770_LJMUDB;Persist Security Info=True;User ID=user_db_1525770_LJMUDB;Password=On33chan66");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //custom delete function for review
    protected void DeleteReview(object sender, EventArgs e)
    {

        //get and declare control id & image path
        TextBox AniControlID = (TextBox)FilterUserReviews.FindControl("AniID");
        string AniID = AniControlID.Text;

        Image currentImg = (Image)FilterUserReviews.FindControl("CurrentImg");
        string path = "..\\users\\" + (string)currentImg.ImageUrl.ToString();

        //delete current image if exists
        if (File.Exists(Server.MapPath(path)))
        {
            //delete if exists
            FileInfo file = new FileInfo(Server.MapPath(path));
            file.Delete();
        }

        //setup & execute sql delete query
        con.Open();
        SqlCommand qryDelete = con.CreateCommand();
        qryDelete.CommandType = CommandType.Text;
        qryDelete.CommandText = "DELETE FROM anime_reviews WHERE id = '" + AniID + "';";
        qryDelete.ExecuteScalar();
        con.Close();

        //redirect back to manager dash
        Response.Redirect("ARManager.aspx");
    }


}