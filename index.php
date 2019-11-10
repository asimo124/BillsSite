Page under construction...
<?php
/*/
//ini_set("display_errors", 1);
include "inc/includes.php";

?>
<!DOCTYPE html>
<html>
<head>
    <title>Site Links</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Site Sections</h2>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="/sol/glucose">Sol - Record Glucose Levels</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script></script>
//*/
?>