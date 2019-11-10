<?php
include("inc/includes.php");

unset($_SESSION['user']);
header("Location: /login.php?Message=" . urlencode("You have logged out."));
exit;