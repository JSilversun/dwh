--AlquilerGustos
SELECT t.anio::int AS anio, t.nombre_mes AS mes, t.nombre_dia AS dia, ct.pais AS pais, ct.ciudad AS ciudad, c.nombre AS categoria, SUM(ag.cantidad_alquiler) AS cant
FROM dwh.alquilergustos AS ag
JOIN dwh.tiempo AS t
ON t.idTiempo=ag.tiempo_id
JOIN dwh.categoria AS c
ON c.idCategoria=ag.categoria_id
JOIN dwh.ciudad AS ct
ON ct.idCiudad=ag.ciudad_id
JOIN dwh.cliente AS cl
ON cl.idCliente=ag.cliente_id
WHERE t.nombre_mes::text IN (${mes}) AND t.anio IN (${anio}) AND t.nombre_dia IN (${nombre_dia}) AND ct.pais IN (${pais})
AND ct.ciudad IN (${ciudad}) AND c.nombre IN (${categoria})
GROUP BY t.anio, t.nombre_mes, t.nombre_dia, ct.pais, ct.ciudad, c.nombre;

--ListaDias
SELECT DISTINCT nombre_dia 
FROM dwh.tiempo 
WHERE nombre_dia IS NOT NULL;

--ListaAnios
SELECT DISTINCT anio::int 
FROM dwh.tiempo 
WHERE anio IS NOT NULL
ORDER BY anio;

--ListaMeses
SELECT DISTINCT nombre_mes 
FROM dwh.tiempo 
WHERE nombre_mes IS NOT NULL;

--ListaCategoria
SELECT DISTINCT c.nombre AS categoria
FROM dwh.alquilergustos AS ag
JOIN dwh.categoria AS c
ON c.idCategoria=ag.categoria_id;

--ListaCiudades
SELECT DISTINCT c.ciudad AS ciudad
FROM dwh.alquilergustos AS ag
JOIN dwh.ciudad AS c
ON c.idCiudad=ag.ciudad_id
ORDER BY c.ciudad;

--ListaPaises
SELECT DISTINCT c.pais AS pais
FROM dwh.alquilergustos AS ag
JOIN dwh.ciudad AS c
ON c.idCiudad=ag.ciudad_id
ORDER BY c.pais;