using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using System.Data.SqlClient;
using System.Data;

    public partial class Register : System.Web.UI.Page {

        //define sql connection
        SqlConnection con = new SqlConnection(@"Data Source=SQL2014.studentwebserver.co.uk;Initial Catalog=db_1525770_LJMUDB;Persist Security Info=True;User ID=user_db_1525770_LJMUDB;Password=On33chan66");
        
        //Aadding user to role and generating custom user folder in directory
        protected void CreateUser_CreatedUser(object sender, EventArgs e) {

            CreateUserWizard cuw = (CreateUserWizard)sender;

            string RoleToJoin = "User";

            //adding user to role
            if (!Roles.IsUserInRole(cuw.UserName, RoleToJoin)) {
                Roles.AddUserToRole(cuw.UserName, RoleToJoin);
            }

            int uid;

            //selecting user id from db
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT TOP 1 id FROM aspnet_Users ORDER BY id DESC";
            uid = (int)cmd.ExecuteScalar();            

            //set path
            string pathToCreate = "~/Users/" + uid + "/Reviews";

            //create directory if doesn't exist
            if(!Directory.Exists(Server.MapPath(pathToCreate))){
                Directory.CreateDirectory(Server.MapPath(pathToCreate));                
            }

            con.Close();
            
        }

        // validation function to check if the users email is an ljmu one
        protected void LJMUValidator(object source, ServerValidateEventArgs args)
        {
            string rawemail = args.Value;
            string ljmu = "ljmu.ac.uk";
            string trimemail = rawemail.Substring(Math.Max(0, rawemail.Length - 10));

            //checking & setting if true or false
            if (trimemail == ljmu)
            {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }

        }
}


