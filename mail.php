<?php

// if (isset($_POST['email']))  {
//  
//  //Email information
//  $name = $_POST['name'];
//  $email = $_POST['email'];
//  $comment = $_POST['comment'];
//  $subject = "Site email from " + $name + ", at " + $email + ".";
//
//    require 'Resources/PHPMailer/PHPMailerAutoload.php';
//
//    $mail = new PHPMailer;
//
//    $mail->SMTPDebug = 3;                               // Enable verbose debug output
//
//    $mail->isSMTP();                                      // Set mailer to use SMTP
//    $mail->Host = 'cloud104.planethippo.com';  // Specify main and backup SMTP servers
//    $mail->SMTPAuth = true;                               // Enable SMTP authentication
//    $mail->Username = 'mail@ljmuanime.co.uk';                 // SMTP username
//    $mail->Password = 'Hippoemail123!';                           // SMTP password
//    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
//    $mail->Port = 465;                                    // TCP port to connect to
////     
////     $mail->SMTPOptions = array(
////        'ssl' => array(
////            'verify_peer' => false,
////            'verify_peer_name' => false,
////            'allow_self_signed' => true
////        )
////    );
//
//    $mail->setFrom($email, $name);
//    $mail->addAddress('mail@ljmuanime.co.uk', 'LJMU Anime');     // Add a recipient
//
//    $mail->isHTML(true);                                  // Set email format to HTML
//
//    $mail->Subject = $subject;
//    $mail->Body    = $comment;
//    $mail->AltBody = $comment;
//
//    if(!$mail->send()) {
//        echo 'Message could not be sent.';
//        echo 'Mailer Error: ' . $mail->ErrorInfo;
//        //header("Location: mailerror.html"); 
//
//    } else {
//        echo 'Message has been sent';
//        //header("Location: mailthanks.html"); 
//}   
//     
//  }
//
////if "email" variable is not filled out, display the form
//  else  {
//    header("Location: mailerror.html"); 
//  }


if(isset($_POST['submit'])){
    $to = "mail@ljmuanime.co.uk"; // this is your Email address
    $from = $_POST['email']; // this is the sender's Email address
    $name = $_POST['name'];
    $subject = "Website Contact";
    $message = $name . " wrote the following:" . "\n\n" . $_POST['comment'];

    $headers = "From:" . $from;
    mail($to,$subject,$message,$headers);
    
    header("Location: mailthanks.html"); 

    } else {
    
    header("Location: mailerror.html"); 
    
}


?>