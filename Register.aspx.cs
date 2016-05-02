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

        SqlConnection con = new SqlConnection(@"Data Source=SQL2014.studentwebserver.co.uk;Initial Catalog=db_1525770_LJMUDB;Persist Security Info=True;User ID=user_db_1525770_LJMUDB;Password=On33chan66");
        
        protected void CreateUser_CreatedUser(object sender, EventArgs e) {

            CreateUserWizard cuw = (CreateUserWizard)sender;

            string RoleToJoin = "User";

            if (!Roles.IsUserInRole(cuw.UserName, RoleToJoin)) {
                Roles.AddUserToRole(cuw.UserName, RoleToJoin);
            }

            int uid;

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT TOP 1 id FROM aspnet_Users ORDER BY id DESC";
            uid = (int)cmd.ExecuteScalar();            

            string pathToCreate = "~/Users/" + uid + "/Reviews";

            if(!Directory.Exists(Server.MapPath(pathToCreate))){
                Directory.CreateDirectory(Server.MapPath(pathToCreate));                
            }

            con.Close();
            
        }
        protected void LJMUValidator(object source, ServerValidateEventArgs args)
        {
            string rawemail = args.Value;
            string ljmu = "ljmu.ac.uk";
            string trimemail = rawemail.Substring(Math.Max(0, rawemail.Length - 10));

            if (trimemail == ljmu)
            {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }

        }
}


