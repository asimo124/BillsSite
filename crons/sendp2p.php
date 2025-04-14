<?php
    ini_set("display_errors", "1");
    require_once("../vendor/autoload.php");
    require_once("../inc/includes.php");

// Use the REST API Client to make requests to the Twilio REST API
use Twilio\Rest\Client;

$sendDate = "";
$sql = "SELECT attribute_value 
        FROM p2p_settings 
        WHERE attribute_key = 'sendDate' ";
$resultset = getQuery($sql);
if (count($resultset) > 0) {
    $sendDate = $resultset[0]['attribute_value'];
}

$today = date("Y-m-d");

//if ($sendDate == md5($today)) {

    // Your Account SID and Auth Token from twilio.com/console
    $sid = 'ACb5e8ebd1c2bcd4416943d67520d7a60a';
    $token = 'f4fc1616fdb81c2a48fdead2b70f3d9f';
    $client = new Client($sid, $token);


    //die("don't run");

    // Use the client to do fun stuff like send text messages!
    $client->messages->create(
    // the number you'd like to send the message to
        '+12102142245',
        array(
            // A Twilio phone number you purchased at twilio.com/console
            'from' => '+14253812651',
            // the body of the text message you'd like to send
            'body' => 'p2p time - go for it'
        )
    );
//}

echo "<pre>Done \n";
?>
