using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {

        try
        {

            //ensure that clientside JS validation was successful for all fields
            if (Page.IsValid)
            {

                //setup and send stmp object with gmail smtp server
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                //enable ssl for google https
                smtpClient.EnableSsl = true;
                //specify account credentials
                smtpClient.UseDefaultCredentials = false;
                System.Net.NetworkCredential access = new System.Net.NetworkCredential();
                access.UserName = "ljmuanimesociety@gmail.com";
                access.Password = "On33chan66";
                smtpClient.Credentials = access;

                //compose message information
                MailAddress from = new MailAddress("ljmuanimesociety@gmail.com");
                MailAddress to = new MailAddress("ljmuanimesociety@gmail.com");

                //initialising a new mail message
                MailMessage mailMessage = new MailMessage(from, to);

                mailMessage.Subject = txtSubject.Text;
                mailMessage.Body = "<b>Name: </b>" + txtName.Text + "<br>"
                    + "<b>Email: </b>" + txtEmail.Text + "<br>"
                    + "<b>Subject: </b>" + txtSubject.Text + "<br>"
                    + "<b>Comment: </b>" + txtComments.Text;

                //tell mailMessage object it contains html
                mailMessage.IsBodyHtml = true;

                //send message                
                smtpClient.Send(mailMessage);
                smtpClient.Dispose();

                //set UI thank you message
                lblText.ForeColor = System.Drawing.Color.Blue;
                lblText.Text = "Thank you for contacting us!";
                lblText.CssClass = "lblCorrect";

                //reseting fields and buttons
                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtSubject.Enabled = false;
                txtComments.Enabled = false;
                btnSubmit.Enabled = false;
            }

        }
        catch (Exception ex)
        {
            //set UI error message
            lblText.ForeColor = System.Drawing.Color.Red;
            lblText.Text = "There is an unknown problem. Please try again later. </br>" + ex.Message;
        }

    }
}