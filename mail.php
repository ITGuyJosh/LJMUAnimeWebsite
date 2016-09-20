<?php

 if (isset($_REQUEST['email']))  {
  
  //Email information
  $name = $_REQUEST['name'];
  $email = $_REQUEST['email'];
  $comment = $_REQUEST['comment'];
    
  $admin_email = "ljmuanimesoc@gmail.com";
  $subject = "Site email from " + $name + ".";
  
  //send email
  mail($admin_email, "$subject", $comment, "From:" . $email);
  
  //Email response
  header("Location: mailthanks.html");    
     
  }
    
  
  //if "email" variable is not filled out, display the form
  else  {
    header("Location: mailerror.html"); 
  }

?>