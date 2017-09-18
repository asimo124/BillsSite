<?php

$new_modeldata = json_decode(file_get_contents("http://alexhaw1.wwwss22.a2hosted.com/swift/swift_data_files/new_modeldata_fields.json"));
$new_models = json_decode(file_get_contents("http://alexhaw1.wwwss22.a2hosted.com/swift/swift_data_files/new_model_fields.json"));
$new_tables = json_decode(file_get_contents("http://alexhaw1.wwwss22.a2hosted.com/swift/swift_data_files/new_table_fields.json"));

$models = array();
$model_data = array();
foreach ($new_modeldata as $get_model_data => $getItem) {
	$model_data[] = $get_model_data;
}
foreach ($new_models as $get_model => $getItem) {
	$models[] = $get_model;
}

$old_modeldata = json_decode(file_get_contents("http://alexhaw1.wwwss22.a2hosted.com/swift/swift_data_files/old_modeldata_fields.json"));
$old_models = json_decode(file_get_contents("http://alexhaw1.wwwss22.a2hosted.com/swift/swift_data_files/old_model_fields.json"));
$old_tables = json_decode(file_get_contents("http://alexhaw1.wwwss22.a2hosted.com/swift/swift_data_files/old_table_fields.json"));

$use_old_models = array();
$old_model_data = array();
foreach ($old_modeldata as $get_model_data => $getItem) {
	$old_model_data[] = $get_model_data;
}
foreach ($old_models as $get_model => $getItem) {
	$use_old_models[] = $get_model;
}

function toAscii($str, $delimiter='-', $bumpyCase=false) {
	$clean = iconv('UTF-8', 'ASCII//TRANSLIT', $str);
	$clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
	$clean = strtolower(trim($clean, '-'));
	$clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);
	if ($bumpyCase == true) {
		$word_str = "";
		$wordsArr = explode($delimiter, $clean);
		foreach ($wordsArr as $get_word) {
			$word_str .= ucfirst($get_word);
		}	
		$clean = $word_str;
	}	
	return $clean;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>IOS DB CheatSheet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
body {
	font-size: 13px;
	font-family: Arial;
	color: #333;
}
.wrapper {
	width: 100%;
	min-height: 200px;
	margin-left: 20px;
}
.button {
	width: 175px;
	min-height: 16px;
	border: 1px solid #666666;
	border-radius: 7px;
	color: #000;
	padding: 7px;
	margin-right: 12px;
	float: left;
	background-color: #E6E6E6;
}
.clear {
	clear: both;
}
div.table_title {

	margin-top: 12px;
	font-size: 15px;
	width: 575px;
}
div.fields_text {
	
	margin-top: 4px;
	margin-left: 30px;
	width: 545px;
	font-size: 14px;
	display:;
}
span.show_title {

	font-size: 18px;
	font-weight: bold;
}
a.plus_btn {

	padding: 1px 4px;
	border: 1px #333 solid;
	border-radius: 4px;
	color: #333;
	font-size: 18px;
}
a.click_section {

	color: #000;
	font-weight: bold;
}
#show_new, #show_old {
	width: 50%;
	float: left;
	min-height: 16px;
}

input.search_text {

	color: #333;
	border-radius: 6px;
	border: 1px #ccc solid;
	padding: 4px;
	width: 350px;
	font-size: 14px;
}
</style>
<script>

$(document).ready(function() {

	$('.collapse_new').click(function() {
		var data_table = $(this).attr("data-table");
		if ($(this).html() == "-") {
			$(this).html('+');
		} else {
			$(this).html('-');
		}
		$('div[data-fields-table="' + data_table + '"]').each(function() {
			$(this).toggle();
		})
	});

	$('.collapse_all').click(function() {
		if ($(this).html() == "-") {
			$(this).html('+');
			$('.fields_text').each(function() {
				$(this).hide();
			});
		} else {
			$(this).html('-');
			$('.fields_text').each(function() {
				$(this).show();
			});
		}
	});

	$('#click_old').click(function() {
		$('#show_new').hide();
		$('#show_old').show();
	});

	$('#click_new').click(function() {
		$('#show_new').show();
		$('#show_old').hide();
	});

	$('#click_both').click(function() {
		$('#show_new').show();
		$('#show_old').show();
	});

	$('#search_keywords').keyup(function() {
		if ($(this).val() != "") {
			$('.table_title').each(function() {
				$(this).hide();
			})
			$('.fields_text').each(function() {
				$(this).hide();
			})
			//$('.clear').css("height", "0px");
		} else {
			$('.table_title').each(function() {
				$(this).show();
			})
			$('.fields_text').each(function() {
				$(this).show();
			})
			//$('.clear').css("height", "3px");
		}
		var foundKeywords = false
		$('[data-use-fields*="' + $(this).val() + '"]').each(function() {
			foundKeywords = true
			$(this).show();
			var data_fields_table = $(this).attr("data-fields-table");
			$('[data-my-table="' + data_fields_table + '"]').show();
		})
		$('[data-use-table*="' + $(this).val() + '"]').each(function() {
			foundKeywords = true
			$(this).show();
			var data_my_table = $(this).attr("data-my-table");
			$('[data-fields-table="' + data_my_table + '"]').show();
		})
	});
});
</script>
</head>
<body>
<div class="wrapper"> 
	<div class="button" id="click_both">
		<a href="javascript: void;" class="click_section" >Both</a>
	</div>
	<div class="button" id="click_new">
		<a href="javascript: void;" class="click_section" >New</a>
	</div>
	<div class="button" id="click_old">
		<a href="javascript: void;" class="click_section" >Old</a>
	</div>
	

	<div class="clear" style="height: 12px;"></div>
	<input type="text" id="search_keywords" class="search_text" placeholder="Search" />
	<div class="clear" style="height: 4px;"></div>

	<div id="show_new" >

		<div class="clear" style="height: 15px;" ></div>
		<span class="show_title" >New Database</span>
		<div class="clear" style="height: 4xspx;"></div>
		<a href="javascript:void(0);" class="plus_btn collapse_all" style="text-decoration: none;">-</a>

		<?php $i = 0; ?>
		<?php foreach ($new_tables as $get_table => $newItem) : ?>
			<div class="table_title" data-my-table="<?php echo $get_table; ?>" data-use-table="<?php echo toAscii($get_table . " " . $models[$i] . " " . $model_data[$i]); ?>">
				
				<a href="javascript:void(0);" class="plus_btn collapse_new" data-table="<?php echo $get_table; ?>"  style="text-decoration: none;">+</a>

				&nbsp; <span style="color: #FF0000; font-weight: bold;" ><?php echo $get_table; ?>:</span> <span style="color: #000000; font-weight: bold;" ><?php echo $models[$i]; ?></span>, <?php echo $model_data[$i]; ?>
			</div>
			<div class="clear" style="height: 3px;"></div>

			<?php foreach ($newItem as $field => $fieldItem) : ?>
				<div class="fields_text" data-fields-table="<?php echo $get_table; ?>" data-use-fields="<?php echo toAscii($field . " " . $fieldItem->method . " " . $fieldItem->type); ?>">
					<span style="color: #0066AA; font-weight: bold;" ><?php echo $field; ?></span> - <span style="color: #000000; font-weight: bold;" ><?php echo $fieldItem->method; ?></span> - <span style="color: #008800;" ><?php echo $fieldItem->type; ?></span>

				</div>
				<div class="clear"></div>
			<?php endforeach; ?>
			<?php $i++; ?>
		<?php endforeach; ?>
	</div>

	<div id="show_old" >

		<div class="clear" style="height: 15px;" ></div>
		<span class="show_title" >Old Database</span>
		<div class="clear"></div>
		<a href="javascript:void(0);" class="plus_btn collapse_all" style="text-decoration: none;">-</a>

		<?php $i = 0; ?>
		<?php foreach ($old_tables as $get_table => $newItem) : ?>
			<div class="table_title" data-my-table="<?php echo $get_table; ?>" data-use-table="<?php echo toAscii($get_table . " " . $use_old_models[$i] . " " . $old_model_data[$i]); ?>">
				<a href="javascript:void(0);" class="plus_btn collapse_new" data-table="<?php echo $get_table; ?>"  >+</a>

				&nbsp; <span style="color: #FF0000; font-weight: bold;" ><?php echo $get_table; ?>:</span> <span style="color: #000000; font-weight: bold;" ><?php echo $use_old_models[$i]; ?></span>, <?php echo $old_model_data[$i]; ?>
			</div>
			<div class="clear" style="height: 3px;"></div>

			<?php foreach ($newItem as $field => $fieldItem) : ?>
				<div class="fields_text" data-fields-table="<?php echo $get_table; ?>" data-use-fields="<?php echo toAscii($field . " " . $fieldItem->method . " " . $fieldItem->type); ?>" style="text-decoration: none;">
					<span style="color: #0066AA; font-weight: bold;" ><?php echo $field; ?></span> - <span style="color: #000000; font-weight: bold;" ><?php echo $fieldItem->method; ?></span> - <span style="color: #008800;" ><?php echo $fieldItem->type; ?></span>

				</div>
				<div class="clear"></div>
			<?php endforeach; ?>
			<?php $i++; ?>
		<?php endforeach; ?>
	</div>

</div>	
</body>
</html>
