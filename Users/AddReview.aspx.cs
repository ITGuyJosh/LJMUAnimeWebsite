using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class AddReview : System.Web.UI.Page {

    //define db con
    SqlConnection con = new SqlConnection(@"Data Source=SQL2014.studentwebserver.co.uk;Initial Catalog=db_1525770_LJMUDB;Persist Security Info=True;User ID=user_db_1525770_LJMUDB;Password=On33chan66");

    public void Page_Load(object sender, EventArgs e) {
    
    }

    //custom add function
    protected void btnSubmit_Click(object sender, EventArgs e) {

        //declare variables
        string title;
        string desc;
        string review;

        //get user name for IDing folder
        MembershipUser userID = Membership.GetUser();
        string user = userID.UserName;

        //open sql connection
        con.Open();

        //declare user id
        int uid;

        //select user id based on username
        SqlCommand idcmd = con.CreateCommand();
        idcmd.CommandType = CommandType.Text;
        idcmd.CommandText = "SELECT id FROM aspnet_Users WHERE UserName = '" + user + "';";
        uid = (int)idcmd.ExecuteScalar();

        //decode CKeditor html for database entry
        string decode = txtReview.Text;
        string AniReview = Server.HtmlDecode(decode);

        //removing quotes
        title = AniTitle.Text.Replace("\"", "");
        title = AniTitle.Text.Replace("\'", "");
        desc = AniDesc.Text.Replace("\"", "");
        desc = AniDesc.Text.Replace("\'", "");
        review = AniReview.Replace("\"", "");
        review = AniReview.Replace("\'", "");        

        //set link destination
        string folderPath = uid + @"\Reviews\";
        string linkDest = folderPath + AniImgs.FileName;

        //checkif file has been uploaded
        if (!AniImgs.HasFile)
        {
            FileValidator.IsValid = false;
            return;
        }
        else {
            //save file to directory
            AniImgs.SaveAs(Server.MapPath(linkDest));

            //prepare & execute command for inserting all review information into database
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO anime_reviews (user_id, category_id, img_link, title, description, review) VALUES('" + uid + "','" + AniCats.Text + "', '" + linkDest + "','" + title + "','" + desc + "','" + review + "')";
            cmd.ExecuteNonQuery();

            //close sql connections
            con.Close();

            //Redirect
            Response.Redirect("UserDash.aspx");
        }

        
    }
}