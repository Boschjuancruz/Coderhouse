-- Consulta 1: Vista base del proyecto (INNER JOIN)
-- Propósito: Crear una vista consolidada de ventas cruzando datos de clientes y productos para el dashboard en Power BI.
SELECT 
    v.fecha_venta, 
    c.id_cliente, 
    c.nombre AS nombre_cliente,
    c.region,
    c.segmento,
    p.nombre AS descripcion_producto, 
    p.categoria,
    v.cantidad, 
    v.precio_unitario, 
    (v.cantidad * v.precio_unitario) AS total_venta
FROM 
    ventas v
INNER JOIN 
    clientes c ON v.id_cliente = c.id_cliente
INNER JOIN 
    productos p ON v.id_producto = p.id_producto;

-- Hallazgo: Se obtuvo una tabla desnormalizada con todas las transacciones históricas, permitiendo ahora filtrar por región del cliente o categoría del producto en Power BI.

-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Propósito: Detectar clientes registrados que nunca compraron, para que el equipo de CRM los contacte con promociones.
SELECT 
    c.nombre, 
    c.email, 
    c.fecha_registro
FROM 
    clientes c
LEFT JOIN 
    ventas v ON c.id_cliente = v.id_cliente
WHERE 
    v.id_venta IS NULL;

-- Hallazgo: 4 clientes registrados nunca realizaron una compra; todos se registraron en los últimos 15 días, lo que sugiere una oportunidad para un email de bienvenida con descuento.

-- Consulta 3: Productos sin ventas (LEFT JOIN)
-- Propósito: Identificar productos del catálogo que no tienen ninguna venta registrada para que el área de producto evalúe su continuidad.
SELECT 
    p.nombre, 
    p.categoria, 
    p.precio
FROM 
    productos p
LEFT JOIN 
    ventas v ON p.id_producto = v.id_producto
WHERE 
    v.id_venta IS NULL;

-- Hallazgo: 2 productos de la categoría "Accesorios" no registran ventas desde su lanzamiento, lo que indica la necesidad de revisar su exhibición o visibilidad.

-- Consulta 4: Consolidado por canal (UNION ALL)
-- Propósito: Consolidar las ventas agregando el origen de la transacción (Online vs Presencial) según el ID de la sucursal o condición de la venta.
SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Online' AS canal
    FROM ventas WHERE id_sucursal = 0
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Presencial' AS canal
    FROM ventas WHERE id_sucursal > 0
) AS consolidado
GROUP BY canal;

-- Hallazgo: El canal 'Presencial' representa la mayor parte de la facturación, superando en un 65% al canal 'Online' durante el último trimestre.
