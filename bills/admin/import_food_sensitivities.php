<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

$sql = "SELECT id FROM fs_food_category WHERE title = ?";
$stmt_sel_food_sens_cat = $db_conn->prepare($sql);

$sql = "INSERT INTO fs_food_category (title) VALUES (?)";
$stmt_ins_food_sens_cat = $db_conn->prepare($sql);

$sql = "INSERT INTO fs_food
(title, category_id, is_inflammation, percentage_towards_inflammation, test_value, test_inflammation_index) VALUES 
(?,?,?,?,?,?)";

$stmt_ins_food_sens = $db_conn->prepare($sql);

$i = 0;
$fh = fopen("data/food_sensitivites_list.csv", "r");
while (($data = fgetcsv($fh)) !== FALSE) {
    
    if ($i == 0) {
        // Skip header row
        $i++;
        continue;
    }

    $category_name = $data[0];
    $title = $data[1];
    $is_inflammation = intval($data[2]);
    $value = floatval($data[3]);
    $percentage_towards_inflammation = floatval($data[4]);
    $index = floatval($data[5]);

    $sql = "SELECT id FROM fs_food_category WHERE name = ?";
    $stmt_sel_food_sens_cat->execute([$category_name]);

    $cat_row = $stmt_sel_food_sens_cat->fetch(PDO::FETCH_ASSOC);

    if ($cat_row) {
        $category_id = $cat_row['id'];
    } else {
        // Insert new category
        $stmt_ins_food_sens_cat->execute([$category_name]);
        $category_id = $db_conn->lastInsertId();
    }

    $sql = "INSERT INTO fs_food 
    (title, category_id, is_inflammation, percentage_towards_inflammation, test_value, test_inflammation_index) VALUES 
    (?,?,?,?,?,?)";

    $stmt_ins_food_sens->execute([
        $title,
        $category_id,
        $is_inflammation,
        $percentage_towards_inflammation,
        $value,
        $index
    ]);

    $i++;

}

echo "Script completed. \n";

