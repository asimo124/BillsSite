<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$sql = "SELECT r.id as recipe_id, r.title as recipe_name 
        , p.title as protein_type
        , GROUP_CONCAT(i.title SEPARATOR '~') as ingredient
        , rs.title as recipe_style
        FROM ri_recipe r 
        INNER JOIN ri_protein p 
            ON r.protein_id = p.id 
        INNER JOIN ri_recipe_ingredient ri 
            oN r.id = ri.recipe_id 
        INNER JOIN ri_ingredient i 
            ON ri.ingredient_id = i.id 
        INNER JOIN ri_recipe_style rs 
            ON r.recipe_style_id = rs.id
        GROUP BY r.id 
        ORDER BY CONCAT(r.title, '-', r.id) ASC 
        , i.id ";

$results = getQuery4($sql);

foreach ($results as $index => $getResult) {
    $results[$index]['ingredient'] = explode('~', $getResult['ingredient']);
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Found Recipes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <style>
        
    </style>
</head>
<body>
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Found Recipes</h2>

    <div class="row">
        <div class="col-xs-12">
        <table class="table table-bordered summary-table">
            <tr>
                <th>Recipe Name</th>
                <th>Protein Type</th>
                <th>Ingredients</th>
                <th>Recipe Style</th>
            </tr>
            <?php foreach ($results as $result): ?>
                <tr>
                    <td><?php echo $result['recipe_name']; ?></td>
                    <td><?php echo $result['protein_type']; ?></td>
                    <td>
                        <ul>
                        <?php foreach ($result['ingredient'] as $ingredient): ?>
                            <li><?php echo $ingredient; ?></li>
                        <?php endforeach; ?>
                        </ul>
                    </td>
                    <td><?php echo $result['recipe_style']; ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>
</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/js/nav.js"></script>
<script>
const { createApp } = Vue;

createApp({
    data() {
        return {
        }
    },
    computed: {
        
    },
    mounted() {

    },
    methods: {
    }
}).mount('#app');
</script>
</body>
</html>
