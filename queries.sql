-- =========================================
-- SQL SALES ANALYSIS PROJECT
-- =========================================

-- =========================================
-- 1. DATA CLEANING (VIEW)
-- =========================================

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

-- =========================================
-- 5. SALES TREND (BY MONTH)
-- =========================================

SELECT 
    Anio,
    Mes,
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias
GROUP BY Anio, Mes
ORDER BY Anio, 
    CASE 
        WHEN Mes = 'Ene' THEN 1
        WHEN Mes = 'Feb' THEN 2
        WHEN Mes = 'Mar' THEN 3
        WHEN Mes = 'Abr' THEN 4
        WHEN Mes = 'May' THEN 5
        WHEN Mes = 'Jun' THEN 6
        WHEN Mes = 'Jul' THEN 7
        WHEN Mes = 'Ago' THEN 8
        WHEN Mes = 'Sep' THEN 9
        WHEN Mes = 'Oct' THEN 10
        WHEN Mes = 'Nov' THEN 11
        WHEN Mes = 'Dic' THEN 12
    END;

-- =========================================
-- 6. TOP VENDEDORES
-- =========================================

SELECT 
    Vendedor,
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias
GROUP BY Vendedor
ORDER BY Ingresos_Totales DESC;

-- =========================================
-- 7. ADVANCED ANALYSIS (REGION + CATEGORY)
-- =========================================

SELECT 
    Region,
    Categoria,
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias
GROUP BY Region, Categoria
ORDER BY Region, Ingresos_Totales DESC;
