<?php
//ini_set("display_errors", 1);
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /bills/admin/login.php");
    exit;
}
//*/

## Prepared Statements ##
$sql = "SELECT i.*
        FROM ri_recipe_ingredient ri 
        INNER JOIN ri_ingredient i 
            ON ri.ingredient_id = i.id 
        WHERE ri.recipe_id = :recipe_id ";
$stmt_sel_ingreds = $db_conn2->prepare($sql);
## ##

$sql = "SELECT r.id
, r.title as recipe
, p.title as protein
, rs.title as style
, dl.title as difficulty_level
, tl.title as taste_level
, r.last_date_made
, r.image_path
FROM ri_recipe r 
INNER JOIN ri_protein p 
		ON r.protein_id = p.id 
INNER JOIN ri_recipe_style rs 
		oN r.recipe_style_id = rs.id 
INNER JOIN ri_difficulty_level dl 
		oN r.difficulty_level_id = dl.id 
INNER JOIN ri_taste_level tl 
		ON r.taste_level_id = tl.id 
INNER JOIN ri_recipe_ingredient ri 
		ON r.id = ri.recipe_id 
INNER JOIN ri_ingredient i 
		oN ri.ingredient_id = i.id 
LEFT JOIN ri_home_inventory hi 
		oN i.id = hi.ingredient_id
WHERE 1 
AND r.is_deleted = 0
GROUP BY r.id ";

$results = getQuery2($sql, []);

foreach ($results as $index => $getItem) {

    $sql = "SELECT i.*
        FROM ri_recipe_ingredient ri 
        INNER JOIN ri_ingredient i 
            ON ri.ingredient_id = i.id 
        WHERE ri.recipe_id = :recipe_id ";
    $stmt_sel_ingreds->execute([
        "recipe_id" => $getItem['id']
    ]);
    $Ingreds = $stmt_sel_ingreds->fetchAll(2);
    $results[$index]['ingredients'] = $Ingreds;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Meals</title>
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

    <h2>Meals</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav2.php"; ?>
    <div style="clear: both; height: 7px"></div>

<!--    <div class="row">-->
<!--        <div class="col-md-12">-->
<!--            <a href="add.php" class="btn btn-primary">Create</a>-->
<!--        </div>-->
<!--    </div>-->
<!--    <div style="clear: both; height: 12px"></div>-->


    <?php foreach ($results as $index => $getRecipe) : ?>
        <?php if ($index % 4 == 0) : ?>
            <div class="row">
        <?php endif; ?>
            <div class="col-md-3 col-xs-4">
                <img src="https://api.hawleywebdesign.com/image.php?f=<?= $getRecipe['image_path']; ?>&w=150&h=220&effect=crop"; />
                <h3><?= $getRecipe['recipe']; ?></h3>
                <h4>Protein: <?= $getRecipe['protein']; ?></h4>
                <h4>Style: <?= $getRecipe['style']; ?></h4>
                <h4>Ingredients</h4>
                <ul>
                <?php foreach ($getRecipe['ingredients'] as $getIngred) : ?>
                    <li><?= $getIngred['title']; ?></li>
                <?php endforeach; ?>
                </ul>
            </div>
        <?php if ($index % 4 == 3) : ?>
            </div>
        <?php endif; ?>
    <?php endforeach; ?>


</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })
    })
</script>