-- =========================================
-- SQL Sales Analysis Project
-- =========================================

-- 1. DATA CLEANING (View)
DROP VIEW IF EXISTS ventas_limpias;

CREATE VIEW ventas_limpias AS
SELECT 
    Fecha,
    "A?o" AS Anio,
    Mes,
    Producto,
    CASE 
        WHEN Categoria LIKE 'Tecnolog%' THEN 'Tecnologia'
        ELSE Categoria
    END AS Categoria,
    Cliente,
    Ciudad,
    Region,
    Vendedor,
    Canal,
    Cantidad,
    PrecioUnitario,
    CostoUnitario,
    Total,
    CostoTotal,
    Utilidad
FROM ventas;

-- =========================================
-- 2. KPI OVERVIEW
-- =========================================

SELECT 
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Cantidad) AS Cantidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias;

-- =========================================
-- 3. SALES BY CATEGORY
-- =========================================

SELECT 
    Categoria,
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Cantidad) AS Cantidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias
GROUP BY Categoria
ORDER BY Ingresos_Totales DESC;

-- =========================================
-- 4. SALES BY REGION
-- =========================================

SELECT 
    Region,
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias
GROUP BY Region
ORDER BY Ingresos_Totales DESC;
