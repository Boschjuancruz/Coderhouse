-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Juan Cruz Bosch
-- Fecha: 2026-09-21
-- ══════════════════════════════════════════

-- ── SECCIÓN DDL ──────────────────────────

-- Paso 1: Eliminar la tabla si ya existe para permitir re-ejecuciones sin errores
DROP TABLE IF EXISTS inventario;

-- Paso 2: Crear la estructura de la tabla de inventario
CREATE TABLE inventario (
    -- id_producto: Entero que identifica de forma única a cada producto. Se define como Clave Primaria (PK).
    id_producto INT PRIMARY KEY,
    
    -- nombre_producto: VARCHAR(100) permite almacenar el nombre del producto de forma eficiente hasta 100 caracteres.
    nombre_producto VARCHAR(100),
    
    -- categoria: VARCHAR(50) almacena la clasificación del producto (computación, accesorios, etc.).
    categoria VARCHAR(50),
    
    -- precio_unitario: DECIMAL(10,2) es obligatorio para valores monetarios. Garantiza precisión exacta evitando errores de redondeo de FLOAT.
    precio_unitario DECIMAL(10,2),
    
    -- stock_actual: INT almacena el número entero de unidades disponibles actualmente en el depósito.
    stock_actual INT,
    
    -- stock_minimo: INT define el umbral entero de reposición antes de quedarse sin stock.
    stock_minimo INT,
    
    -- fecha_ingreso: DATE almacena únicamente la fecha en que ingresó el producto al inventario.
    fecha_ingreso DATE,
    
    -- activo: SMALLINT (o TINYINT/INT equivalente) actúa como indicador binario (1 = disponible, 0 = descontinuado).
    activo INT
);


-- ── SECCIÓN DML ──────────────────────────

-- Paso 3: INSERT INTO (Carga de los 10 productos iniciales)
INSERT INTO inventario (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo) VALUES
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- Paso 4: UPDATE con WHERE (Registro de ventas del día actualizando stock_actual)
-- Venta de Laptop Pro 15 (Se venden 3 unidades: 15 - 3 = 12)
UPDATE inventario 
SET stock_actual = stock_actual - 3 
WHERE id_producto = 1;

-- Venta de Mouse Inalámbrico (Se venden 12 unidades: 80 - 12 = 68)
UPDATE inventario 
SET stock_actual = stock_actual - 12 
WHERE id_producto = 2;

-- Venta de Auriculares BT Pro (Se venden 5 unidades: 35 - 5 = 30)
UPDATE inventario 
SET stock_actual = stock_actual - 5 
WHERE id_producto = 6;

-- Paso 5: UPDATE adicional (Marcar la Webcam HD 1080p como descontinuada: activo = 0)
UPDATE inventario 
SET activo = 0 
WHERE id_producto = 8;

-- Paso 6: SELECT de validación (Ver la tabla completa para confirmar que la carga y los cambios son correctos)
SELECT * FROM inventario;
