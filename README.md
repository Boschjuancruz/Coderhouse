# Práctica: Consultas Básicas SELECT y Alias

Este repositorio contiene las consultas fundamentales de SQL requeridas por el equipo de finanzas de TechStore, diseñadas para extraer, filtrar y traducir la información de la base de datos a un formato amigable para el negocio.

## Preguntas Técnicas

### ¿Por qué es mala práctica usar `SELECT *` en producción?
Usar `SELECT *` en entornos productivos se considera una mala práctica por varias razones concretas:
1. **Rendimiento y consumo de red:** Al solicitar todas las columnas, la base de datos procesa y transfiere un volumen de datos mucho mayor al necesario. Si una tabla tiene 50 columnas y la aplicación solo necesita 3, se está desperdiciando ancho de banda y memoria RAM.
2. **Mantenibilidad y estabilidad (Seguridad):** Si el esquema de la tabla cambia en el futuro (por ejemplo, se agrega una columna con datos sensibles o se elimina una columna existente), el `SELECT *` devolverá resultados inesperados que pueden romper el código de la aplicación o del reporte que consume esos datos, provocando fallas en el sistema.

### ¿Por qué son importantes los alias para un stakeholder no técnico?
Los stakeholders (como el equipo de finanzas, marketing o gerencia) necesitan tomar decisiones rápidas basadas en los datos, y no suelen estar familiarizados con la nomenclatura técnica de las bases de datos. 

Un alias actúa como un traductor entre el mundo técnico y el negocio. Por ejemplo, una columna llamada `total_amount` puede ser ambigua: ¿es una cantidad de ítems o es dinero? Al usar un alias y transformarla a `total_amount AS monto_total_facturado`, cualquier persona del área de finanzas entiende inmediatamente qué representa ese valor sin necesidad de consultar el diccionario de datos ni preguntarle al equipo de ingeniería.
