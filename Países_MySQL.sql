
-- 1. ¿Qué consulta ejecutarías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de habla del idioma.  Tu consulta debe ordenar el resultado por porcentaje de habla del idioma en orden descendente. (1)
SELECT name, Language, Percentage FROM country AS c
JOIN countrylanguage AS l ON c.Code = l.CountryCode
WHERE l.Language = 'Slovene'
ORDER BY l.Percentage DESC;


-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades de cada país?  Tu consulta debe devolver el nombre del país, el id--ioma y el número total de ciudades. Tu consulta debe ordenar el resultado por el número de ciudades en orden descendente. (3)
-- en esta sentencia no incluyo el idioma en la muestra del pdf solo se incluye las columnas de nombre pais, aparte que el total de ciudades de duplicaria por que en un pais pueden haber muchos idiomas y en una ciudad pueden presentarse muchos idiomas, 
SELECT c.Name,  COUNT(ID) AS Total_ciudades FROM city AS ci JOIN country AS c ON ci.CountryCode = c.Code
GROUP BY c.Name ORDER BY Total_ciudades DESC;

-- 3. ¿Qué consulta ejecutarías para obtener todos ciudades de México con una población mayor a 500,000? Tu consulta debe ordenar el resultado por población en orden descendente. (1)
SELECT ci.Name, ci.Population, c.Name FROM city AS ci
JOIN country AS C ON ci.CountryCode = c.Code 
WHERE c.Name = "Mexico" and ci.Population > 500000 ORDER BY ci.Population DESC;


-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje de habla mayor a 89%?
-- Tu consulta debe ordenar el resultado por porcentaje de habla en orden descendente. (1)
SELECT c.Name,  l.Language, l.Percentage FROM country AS c 
JOIN countrylanguage AS l ON l.CountryCode = c.Code 
WHERE  l.Percentage > 0.89 ORDER BY l.Percentage DESC;

-- 5. ¿Qué consulta ejecutarías para obtener todos los países con un área de superficie menor a 501 y población mayor a 100,000? (2)
SELECT Name, SurfaceArea, Population FROM country 
WHERE  SurfaceArea < 501 and Population > 100000;

-- 6. ¿Qué consulta ejecutarías para obtener países solo con monarquía constitucional, un capital superior a 200 y una esperanza de vida mayor a 75 años?  (1)
SELECT Name, GovernmentForm, Capital, LifeExpectancy FROM country 
WHERE  GovernmentForm = 'Constitutional Monarchy' and Capital > 200 and LifeExpectancy > 75;

-- 7. ¿Qué consulta ejecutarías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires con una población mayor a 500,000 habitantes? 
-- La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.  (2)
SELECT c.Name, ci.Name, ci.District, ci.Population FROM city AS ci 
JOIN country  AS c ON ci.CountryCode = c.Code
WHERE  c.Name = 'Argentina' and ci.District = 'Buenos Aires'and ci.Population > 500000 ;

-- 8. ¿Qué consulta ejecutarías para resumir el número de países en cada región? Tu consulta debe mostrar el nombre de la región y
-- el número de países. Además, debe ordenar el resultado por el número de países en orden descendente. (2)
SELECT Region, COUNT(Name) AS Num_Paises FROM country 
GROUP BY Region
ORDER BY Num_Paises DESC;
