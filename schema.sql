-- ==========================================================
-- ESTRUCTURA BASE: LABORATORIO HASHY EL GOLOSO
-- ==========================================================

-- 1. BITÁCORA DE OPERACIONES (Para el Trigger/Logs)
CREATE TABLE logs_hashy (
    id SERIAL PRIMARY KEY,
    nombre_funcion TEXT,
    fecha_ejecucion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensaje_accion TEXT,
    usuario_db TEXT DEFAULT current_user
);

-- 2. MERCADO NEGRO DE TORTUGA (Para Subconsultas de la Fase 2)
CREATE TABLE mercado_negro (
    id SERIAL PRIMARY KEY,
    categoria TEXT,
    precio_referencia NUMERIC(10,2),
    ultima_actualizacion DATE
);

-- 3. INVENTARIO DE GOLOSINAS (La tabla principal)
CREATE TABLE inventario_pirata (
    id INT PRIMARY KEY,
    nombre_sucio TEXT,
    categoria TEXT,
    precio_finca NUMERIC(10,2),
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
(2, 'CHoco-late...Amargo', 'Chocolates', 55.00, 3, '2025-10-01', 3), -- VENCIDO
(3, ' gomita-O_O-fresa ', 'Gomitas', 18.00, 4, '2026-03-01', 12),
(4, '---TRUFA_Oscura---', 'Chocolates', 40.00, 5, '2026-01-10', 5),
(5, 'Caramelo_Salado!!', 'Caramelos', 18.00, 7, '2025-12-01', 2), -- VENCIDO
(6, 'Gomita_Osa', 'Gomitas', 25.00, 11, '2026-04-10', 8);