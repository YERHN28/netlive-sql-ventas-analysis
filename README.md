# SQL Sales Analysis Project

This project focuses on analyzing a real-world sales dataset using SQL to extract business insights and support decision-making.

## Objective

Analyze sales performance to identify trends, profitability, and opportunities by category, region, and other key business dimensions.

---

## Dataset

The dataset includes transactional sales data with the following key fields:

- Date (Fecha)
- Year (Año)
- Product & Category
- Customer & Location
- Sales Channel
- Quantity, Revenue, Cost, Profit

---

## Data Cleaning

A SQL view (`ventas_limpias`) was created to:

- Fix encoding issues in column names (e.g., Año → Anio)
- Standardize category values (e.g., Tecnologia)
- Prepare data for analysis without modifying the original dataset

---

## Key Metrics

The following KPIs were calculated:

- **Total Revenue** → SUM(Total)
- **Total Profit** → SUM(Utilidad)
- **Total Quantity Sold** → SUM(Cantidad)
- **Profit Margin** → Profit / Revenue

---

## Analysis

### 📊 Sales by Category

Tecnologia leads in revenue (~5.82M) with a total profit of ~1.87M and a margin of ~32%.

Muebles shows balanced performance with ~2.2M in revenue and ~35% margin.

Oficina, while generating lower revenue (~123K), has the highest margin (~58%), indicating strong profitability.

### 💡 Insight

Technology dominates in sales volume but has lower relative profitability. In contrast, Office products show high margins, suggesting an opportunity to increase revenue through growth strategies focused on high-profit items.

---

### 📅 Sales Trend Analysis

Se analizó el comportamiento de ventas a lo largo del tiempo para identificar patrones y estacionalidad.

#### 🔍 Results:

- Febrero presenta uno de los mayores niveles de ingresos (~833K).
- Meses como agosto muestran niveles más bajos de ventas.
- El margen se mantiene estable entre ~32% y ~34%.

#### 💡 Insight:

Las ventas presentan variaciones mensuales (estacionalidad). Sin embargo, la estabilidad del margen indica un buen control de costos y precios a lo largo del tiempo.

---

## Example SQL Query

```sql
SELECT 
    Categoria,
    SUM(Total) AS Ingresos_Totales,
    SUM(Utilidad) AS Utilidad_Total,
    SUM(Cantidad) AS Cantidad_Total,
    SUM(Utilidad) * 1.0 / SUM(Total) AS Margen
FROM ventas_limpias
GROUP BY Categoria
ORDER BY Ingresos_Totales DESC;
