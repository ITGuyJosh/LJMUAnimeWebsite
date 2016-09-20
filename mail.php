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
  echo "Thank you for contacting us!";
     
  }
    
  
  //if "email" variable is not filled out, display the form
  else  {
    echo "<h3>Sorry, there has been an error with your email. Please try again later.</h3>"
  }

?>