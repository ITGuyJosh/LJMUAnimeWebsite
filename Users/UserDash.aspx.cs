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


public partial class UserDash : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection(@"Data Source=SQL2014.studentwebserver.co.uk;Initial Catalog=db_1525770_LJMUDB;Persist Security Info=True;User ID=user_db_1525770_LJMUDB;Password=On33chan66");
    protected void Page_Load(object sender, EventArgs e)
    {
        //getting & setting user session ID
        MembershipUser userID = Membership.GetUser();
        string user = userID.UserName;

        con.Open();

        int uid;

        SqlCommand idcmd = con.CreateCommand();
        idcmd.CommandType = CommandType.Text;
        idcmd.CommandText = "SELECT id FROM aspnet_Users WHERE UserName = '" + user + "';";
        uid = (int)idcmd.ExecuteScalar();
        con.Close();

        //set user session
        Session["uid"] = uid;

    }  

    protected void UpdateFile(object sender, EventArgs e) {
        //get previous file
        Image currentImg = (Image)FilterUserReviews.FindControl("CurrentImg");       
        string path = (string)currentImg.ImageUrl.ToString();
        //path = "~\\" + path ;

        //get new img
        FileUpload newImg = (FileUpload)FilterUserReviews.FindControl("NewAniImg");
        string img = (string)newImg.FileName;

        //get filepath & get user session
        int sessionId = (int)System.Web.HttpContext.Current.Session["uid"];
        string filePath = sessionId + @"\Reviews\" + img;

        //file exists validation, else do nothing
        if (File.Exists(Server.MapPath(path))) {
            //delete if exists
            FileInfo file = new FileInfo(Server.MapPath(path));
            file.Delete();

            //save new file
            newImg.SaveAs(Server.MapPath(filePath));

            //update database        
            con.Open();
            SqlCommand updatePath = con.CreateCommand();
            updatePath.CommandType = CommandType.Text;
            updatePath.CommandText = "UPDATE anime_reviews SET img_link = '" + filePath + "' WHERE user_id = '" + sessionId + "';";
            updatePath.ExecuteNonQuery();
            con.Close();
        } 

    }

    protected void DeleteReview(object sender, EventArgs e) {

        //get and declare control id & image path
        TextBox AniControlID = (TextBox)FilterUserReviews.FindControl("AniID");
        string AniID = AniControlID.Text;
        
        Image currentImg = (Image)FilterUserReviews.FindControl("CurrentImg");
        string path = (string)currentImg.ImageUrl.ToString();

        //delete current image if exists
        if (File.Exists(Server.MapPath(path))) {
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

        //redirect back to user dash
        Response.Redirect("UserDash.aspx");
    }
}