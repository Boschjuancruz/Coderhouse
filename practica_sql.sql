-- ========================================================
-- Módulo 2 - Unidad 1: Diseño de Bases de Datos
-- Archivo: modulo2_unidad1_diseno.sql
-- Descripción: Creación de tablas para el sistema de ventas
-- ========================================================

-- 1. Definición de la Tabla de Clientes
CREATE TABLE clientes (
    -- id_cliente: Entero utilizado como identificador único para cada cliente.
    id_cliente INT,
    
    -- nombre: VARCHAR(100) permite almacenar nombres completos de hasta 100 caracteres.
    nombre VARCHAR(100),
    
    -- perfil_bio: TEXT se elige para textos largos o notas extensas (biografías).
    perfil_bio TEXT,
    
    -- fecha_registro: DATE almacena exclusivamente la fecha (año-mes-día) del registro.
    fecha_registro DATE
);

-- 2. Definición de la Tabla de Productos
CREATE TABLE productos (
    -- id_producto: Entero para identificar unívocamente cada producto.
    id_producto INT,
    
    -- descripcion: VARCHAR(255) soporta textos descriptivos detallados del producto.
    descripcion VARCHAR(255),
    
    -- precio: DECIMAL(10,2) es el estándar exacto para valores monetarios.
    precio DECIMAL(10,2),
    
    -- esta_activo: INT (o número pequeño) utilizado como indicador binario (por ejemplo, 1 para activo, 0 para inactivo).
    esta_activo INT
);