-- ==========================================================
-- ESTRUCTURA BASE: LABORATORIO HASHY EL GOLOSO (Versión MySQL)
-- ==========================================================

-- 1. BITÁCORA DE OPERACIONES (Para el Trigger/Logs)
-- En MySQL, SERIAL es un alias de BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.
CREATE TABLE logs_hashy (
    id SERIAL PRIMARY KEY,
    nombre_funcion VARCHAR(255),
    fecha_ejecucion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensaje_accion TEXT,
    usuario_db VARCHAR(100) DEFAULT (CURRENT_USER())
);

-- 2. MERCADO NEGRO DE TORTUGA (Para Subconsultas de la Fase 2)
CREATE TABLE mercado_negro (
    id SERIAL PRIMARY KEY,
    categoria VARCHAR(100), -- MySQL requiere definir longitud en VARCHAR para índices
    precio_referencia DECIMAL(10,2),
    ultima_actualizacion DATE
);

-- 3. INVENTARIO DE GOLOSINAS (La tabla principal)
CREATE TABLE inventario_pirata (
    id INT PRIMARY KEY,
    nombre_sucio VARCHAR(255),
    categoria VARCHAR(100),
    precio_finca DECIMAL(10,2),
    prioridad_logica INT,
    fecha_ingreso DATE,
    meses_validez INT -- Cuántos meses dura antes de vencer
);

-- 4. DATOS SEMILLA
INSERT INTO mercado_negro (categoria, precio_referencia, ultima_actualizacion) VALUES 
('Caramelos', 15.00, '2026-01-01'),
('Chocolates', 45.00, '2026-01-01'),
('Gomitas', 20.00, '2026-01-01');

INSERT INTO inventario_pirata (id, nombre_sucio, categoria, precio_finca, prioridad_logica, fecha_ingreso, meses_validez) VALUES 
(1, '  cArr-Amelo_Menta  ', 'Caramelos', 12.00, 2, '2026-02-15', 6),
(2, 'CHoco-late...Amargo', 'Chocolates', 55.00, '2025-10-01', 3), -- VENCIDO
(3, ' gomita-O_O-fresa ', 'Gomitas', 18.00, 4, '2026-03-01', 12),
(4, '---TRUFA_Oscura---', 'Chocolates', 40.00, 5, '2026-01-10', 5),
(5, 'Caramelo_Salado!!', 'Caramelos', 18.00, 7, '2025-12-01', 2), -- VENCIDO
(6, 'Gomita_Osa', 'Gomitas', 25.00, 11, '2026-04-10', 8);


SELECT precio_referencia 
     FROM mercado_negro m