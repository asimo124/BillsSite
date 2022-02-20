
SELECT 
'id',
'title',
'is_deleted',
'rating',
'last_date_made',
'contains_salad',
'contains_gluten',
'image_path',
'protein_id',
'difficulty_level_id',
'is_homechef',
'is_easy',
'recipe_style_id',
'taste_level_id',
'recipe_link',
'meal_type_id',
'meal_sub_type_id',
'carb_sugar_rating',
'gluten_rating',
'health_rating',
'poop_rating',
'high_vegetable_rating',
'affects_ibs_rating',
'difficulty_rating',
'only_meal_app'
;

SELECT 
id,
title,
is_deleted,
rating,
last_date_made,
contains_salad,
contains_gluten,
image_path,
(
	SELECT GROUP_CONCAT(CONCAT(p.id, '-', p.title) SEPARATOR ' | ') FROM ri_protein p
) as protien_id,

difficulty_level_id,
is_homechef,
is_easy,
(
	SELECT GROUP_CONCAT(CONCAT(rs.id, '-', rs.title) SEPARATOR ' | ') FROM ri_recipe_style rs
) as recipe_style_id,
taste_level_id,
recipe_link,
meal_type_id,
meal_sub_type_id,
carb_sugar_rating,
gluten_rating,
health_rating,
poop_rating,
high_vegetable_rating,
affects_ibs_rating,
difficulty_rating,
only_meal_app
FROM ri_recipe 
LIMIT 30;

-- SHOW COLUMNS FROM ri_recipe;