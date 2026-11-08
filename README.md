
##  Descripción del Proyecto (RetailPro)
El objetivo de este proyecto es modelar los datos de una empresa de retail, construir la base de datos desde cero, poblarla con datos y realizar consultas analíticas avanzadas que sirvan como materia prima para un futuro dashboard en Power BI



##  Progreso y Entregables por Módulo

El proyecto ha sido desarrollado de forma incremental a lo largo de los siguientes módulos:

1. Módulo 1 y 2: Definición y Modelado del Negocio
   - Planteamiento del caso de negocio de RetailPro.
   - Diseño del Diagrama Entidad-Relación (DER) y normalización de la base de datos hasta la 3ra Forma Normal (3NF).
   - Definición de entidades principales: Clientes, Productos, Ventas y Sucursales/Canales.

2. Módulo 3: Checkpoint - Creación del Esquema (DDL y DML)
   - Creación de la base de datos relacional mediante sentencias CREATE DATABASE en SQL Server (SSMS).
   - Generación de tablas con sus respectivos tipos de datos, Primary Keys (PK) y Foreign Keys (FK) usando lenguaje DDL.
   - Inserción de datos de prueba y dimensiones (clientes, categorías, regiones) mediante lenguaje DML (INSERT INTO).

3. Módulo 4: Consultas Básicas
   - Extraer información inicial trabajando con tablas individuales usando SELECT, WHERE, ORDER BY y GROUP BY.
   - Análisis descriptivo básico y filtrado de registros sobre las tablas de ventas, productos y clientes de forma aislada.

4. Módulo 5: Consultas Enriquecidas y JOINs
   - Cruzar tablas para obtener vistas desnormalizadas y enriquecidas, preparando la información para Power BI.
   - Entregable: Script m5_consultas_joins.sql con:
     - Vista Base (INNER JOIN): Cruce de ventas históricas con descripciones de clientes y productos.
     - Análisis de CRM (LEFT JOIN): Identificación de clientes registrados que nunca realizaron compras (WHERE ... IS NULL).
     - Análisis de Catálogo (LEFT JOIN): Detección de productos sin movimiento o ventas.
     - Consolidado por Canal (UNION ALL): Unificación de consultas creando columnas estáticas para diferenciar el origen de las ventas (Online vs. Presencial).

5. Módulo 6: Modelado Dimensional (Star Schema)
   - Transformación del modelo relacional 3NF hacia un esquema dimensional orientado al análisis BI.
   - Creación de la tabla de hechos FactVentas y las tablas de dimensión DimCliente, DimProducto, DimSucursal y DimTiempo.

6. Módulo 7: Conexión y Modelado en Power BI
   - Importación de datos y vistas desnormalizadas desde SQL Server hacia Power BI Desktop.
   - Configuración del modelo de datos, relaciones 1:N con dirección de filtro cruzado único y creación de la tabla de fechas nativa.

7. Módulo 8: Cálculo de Métricas y KPIs en DAX
   - Creación de medidas analíticas en DAX para el análisis comercial: Ventas Totales, Ticket Promedio, Margen de Ganancia %, y variaciones temporales (YTD, MoM, YoY).
   - Definición de KPIs para el seguimiento del rendimiento por categoría y canal de venta.

8. Módulo 9: Diseños de Dashboards, Gobernanza y Entrega Final
   - Construcción de tableros ejecutivos e interactivos con segmentadores de datos, marcadores (bookmarks) y navegadores de página.
   - Documentación técnica final, validación de performance y entrega de la solución de Business Intelligence para RetailPro.

---


## Herramientas y Tecnologías Utilizadas
* **Lenguaje:** SQL (T-SQL)
* **Gestor de Base de Datos:** SQL Server Management Studio (SSMS)
* **Control de Versiones:** Git / GitHub
* **Visualización (Próximamente):** Power BI

