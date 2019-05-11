<?php
include "../../inc/includes.php";

$sql = "SELECT ri.id, ri.recipe_id, ri.ingredient_id, ri.quantity, ri.unit_of_measure, i.ingredient
        FROM rec_recipe_ingredient ri
        INNER JOIN rec_ingredient i 
          ON ri.ingredient_id = i.id  
        WHERE ri.recipe_id = :recipe_id ";
$stmt_sel_ingredients = $db_conn->prepare($sql);

$sql = "SELECT * 
        FROM rec_recipe_steps rs 
        WHERE rs.recipe_id = :recipe_id 
        ORDER BY rs.display_order ";
$stmt_sel_steps = $db_conn->prepare($sql);

$sql = "SELECT ai.id, ri.recipe_id, ri.ingredient_id, i.ingredient
        FROM rec_recipe_ingredient ri 
        INNER JOIN rec_available_ingredient ai 
          ON ri.ingredient_id = ai.ingredient_id 
        INNER JOIN rec_ingredient i 
          ON ai.ingredient_id = i.id  
        WHERE ri.recipe_id = :recipe_id ";
$stmt_sel_available_ingredients = $db_conn->prepare($sql);

$sql = "SELECT * FROM rec_recipe r ORDER BY r.recipe_name ";
$resultset2 = getQuery($sql);

$resultset = array();
foreach ($resultset2 as $getRecipe2) {

    $getRecipe = $getRecipe2;
    $sql = "SELECT * 
        FROM rec_recipe_ingredient ri 
        WHERE ri.recipe_id = :recipe_id ";
    $stmt_sel_ingredients->execute([
        "recipe_id" => $getRecipe2['id']
    ]);
    $Ingredients = $stmt_sel_ingredients->fetchAll(\PDO::FETCH_ASSOC);
    $getRecipe['ingredients'] = $Ingredients;

    $sql = "SELECT * 
        FROM rec_recipe_steps rs 
        WHERE rs.recipe_id = :recipe_id ";
    $stmt_sel_steps->execute([
        "recipe_id" => $getRecipe2['id']
    ]);
    $RecipeSteps = $stmt_sel_steps->fetchAll(\PDO::FETCH_ASSOC);
    $getRecipe['steps'] = $RecipeSteps;

    $sql = "SELECT ri.recipe_id, ri.ingredient_id, i.ingredient
        FROM rec_recipe_ingredient ri 
        INNER JOIN rec_available_ingredient ai 
          ON ri.ingredient_id = ai.ingredient_id 
        INNER JOIN rec_ingredient i 
          ON ai.ingredient_id = i.id  
        WHERE ri.recipe_id = :recipe_id ";
    $stmt_sel_available_ingredients->execute([
        "recipe_id" => $getRecipe2['id']
    ]);
    $AvailIngredients = $stmt_sel_available_ingredients->fetchAll(\PDO::FETCH_ASSOC);
    $getRecipe['available_ingredients'] = $AvailIngredients;

    $resultset[] = $getRecipe;
}

header("Access-Control-Allow-Origin: *");
header("Content-type: text/json");
$retVal = [
    "data" => $resultset
];

echo json_encode($retVal);
?>