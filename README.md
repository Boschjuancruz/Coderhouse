
##  Descripción del Proyecto (RetailPro)
El objetivo de este proyecto es modelar los datos de una empresa de retail, construir la base de datos desde cero, poblarla con datos y realizar consultas analíticas avanzadas que sirvan como materia prima para un futuro dashboard en Power BI



##  Progreso y Entregables por Módulo

### Módulo 1 y 2: Definición y Modelado del Negocio
* **Objetivo:** Definir el caso de negocio y estructurar los datos.
* **Hitos:** 
  * Planteamiento del modelo de negocio de RetailPro.
  * Diseño del Diagrama Entidad-Relación (DER) y normalización de la base de datos hasta la 3ra Forma Normal (3NF).
  * Definición de las entidades principales: `Clientes`, `Productos`, `Ventas` y `Sucursales`/`Canales`.

### Módulo 3: Checkpoint - Creación del Esquema (DDL y DML)
* **Objetivo:** Materializar el modelo relacional en un motor de base de datos (SQL Server).
* **Hitos:**
  * Creación de la base de datos mediante sentencias `CREATE DATABASE`.
  * Generación de tablas con sus respectivos tipos de datos, Primary Keys (PK) y Foreign Keys (FK) usando lenguaje DDL.
  * Inserción de datos de prueba y dimensiones (clientes, categorías, regiones) mediante lenguaje DML (`INSERT INTO`).

### Módulo 4: Consultas Básicas
* **Objetivo:** Extraer información inicial trabajando con tablas individuales.
* **Hitos:**
  * Uso de comandos fundamentales (`SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`).
  * Análisis descriptivo básico y filtrado de registros sobre las tablas de ventas, productos y clientes de forma aislada.

### Módulo 5: Consultas Enriquecidas y JOINs (Actual)
* **Objetivo:** Cruzar tablas para obtener vistas desnormalizadas y enriquecidas, preparando la información para Power BI.
* **Entregable:** Script `m5_consultas_joins.sql` con:
  * **Vista Base (INNER JOIN):** Cruce de ventas históricas con descripciones de clientes y productos.
  * **Análisis de CRM (LEFT JOIN):** Identificación de clientes registrados que nunca realizaron compras (`WHERE ... IS NULL`).
  * **Análisis de Catálogo (LEFT JOIN):** Detección de productos sin movimiento o ventas.
  * **Consolidado por Canal (UNION ALL):** Unificación de consultas creando columnas estáticas para diferenciar el origen de las ventas (Online vs. Presencial).



## Herramientas y Tecnologías Utilizadas
* **Lenguaje:** SQL (T-SQL)
* **Gestor de Base de Datos:** SQL Server Management Studio (SSMS)
* **Control de Versiones:** Git / GitHub
* **Visualización (Próximamente):** Power BI

