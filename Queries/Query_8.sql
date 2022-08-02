SELECT cryptoName, code
FROM cryptocurrency
 JOIN cryptocurrency_has_category ON cryptocurrency.code = cryptocurrency_has_category.Cryptocurrency_code
 JOIN category ON category.idCategory = cryptocurrency_has_category.Category_idCategory
WHERE category.categoryName = 'Gaming';