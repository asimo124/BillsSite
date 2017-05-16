<?php

$game_num = 1;
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet">
</head>
<body>
<div class="container-fluid" >

	<div style="clear: both; height: 150px;" ></div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="position: relative;" >
			
			<div style="position: absolute; top: 36%; left: 31%; width: 37%; text-align: center; font-size: 64px; color: #00aeef;" >
				Game <?php echo $game_num; ?>
			</div>
		
			<img src="/images/apa/apa_game.png" style="width: 100%;" />
		</div>
	</div>
	

</div>
</body>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src = "/js/bootstrap.min.js"></script>
</html>