
-- UPDATE ri_recipe SET affects_ibs_rating = 5;

SELECT
'id'
, 'title'
, 'only_meal_app'
, 'protein_select'
, 'protein_id'
, 'meal_type_select'
, 'carb_sugar_rating'
, 'gluten_rating'
, 'health_rating'
, 'poop_rating'
, 'high_vegetable_rating'
, 'affects_ibs_rating'
, 'difficulty_rating'
;


SELECT 
ri.id
, ri.title
, ri.only_meal_app
,
(
		SELECT 
		GROUP_CONCAT(CONCAT(p.id, '~', p.title) SEPARATOR ' | ')
		FROM ri_protein p 
) as protein_select
, ri.protein_id 
,
(
		SELECT 
		GROUP_CONCAT(CONCAT(mt.id, '~', smt.id, '~', mt.title, '~', smt.title) SEPARATOR ' | ')
		FROM ri_meal_type mt 
		INNER JOIN ri_sub_meal_type smt 
			ON mt.id = smt.meal_type_id 
		ORDER BY mt.id, smt.id 
) as meal_type_select 
, ri.carb_sugar_rating
, ri.gluten_rating
, ri.health_rating
, ri.poop_rating
, ri.high_vegetable_rating
, ri.affects_ibs_rating
, ri.difficulty_rating
FROM ri_recipe ri 
ORDER BY ri.title