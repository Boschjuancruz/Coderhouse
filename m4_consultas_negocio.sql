
-- Módulo 4 - Pre-entrega: Consultas SQL de negocio
-- Proyecto: RetailPro
-- Base de Datos: Ventas_Tech_DB

USE Ventas_Tech_DB;
GO

-- Consulta 1 — Resumen ejecutivo mensual
-- Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes.
SELECT 
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS Total_Facturado,
    COUNT(*) AS Cantidad_Pedidos,
    SUM(cantidad * precio_unitario) / COUNT(*) AS Ticket_Promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes;
GO

-- Consulta 2 — Ranking de productos
-- Top 5 de id_producto por total facturado, mostrando las unidades vendidas y el total generado.
SELECT TOP 5 
    id_producto,
    SUM(cantidad) AS Unidades_Vendidas,
    SUM(cantidad * precio_unitario) AS Total_Generado
FROM ventas
GROUP BY id_producto
ORDER BY Total_Generado DESC;
GO

-- Consulta 3 — Clientes recurrentes
-- Clientes que hayan realizado más de un pedido, mostrando la cantidad de pedidos y el total gastado.
SELECT 
    id_cliente,
    COUNT(*) AS Cantidad_Pedidos,
    SUM(cantidad * precio_unitario) AS Total_Gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY Total_Gastado DESC;
GO

-- Consulta 4 — Meses por encima/por debajo del promedio
-- Total facturado por mes, con una etiqueta que indica si quedó por encima o por debajo del promedio.
WITH VentasMensuales AS (
    SELECT 
        MONTH(fecha_venta) AS Mes,
        SUM(cantidad * precio_unitario) AS Total_Facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
),
PromedioGeneral AS (
    SELECT AVG(Total_Facturado) AS Promedio_Mensual_General
    FROM VentasMensuales
)
SELECT 
    vm.Mes,
    vm.Total_Facturado,
    CASE 
        WHEN vm.Total_Facturado > pg.Promedio_Mensual_General THEN 'Por encima'
        WHEN vm.Total_Facturado < pg.Promedio_Mensual_General THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS Rendimiento_Mensual
FROM VentasMensuales vm
CROSS JOIN PromedioGeneral pg
ORDER BY vm.Mes;
GO


-- BLOQUE DE CIERRE: Hallazgos concretos

/*
 1. Un grupo reducido de clientes (identificados en la Consulta 3) agrupa gran parte del volumen de pedidos recurrentes, lo que resalta la oportunidad de armarles campañas de fidelización.
 2. El análisis del top 5 de productos (Consulta 2) expone que los ítems con mayor recaudación no siempre son los que tienen más unidades vendidas, demostrando la influencia del precio unitario de los productos premium en la rentabilidad general.
 3. La comparativa mensual (Consulta 4) permite detectar rápidamente meses valle con rendimiento 'Por debajo' del promedio, alertando sobre la necesidad de planificar promociones preventivas para sostener la facturación en periodos de baja estacionalidad.
*/
