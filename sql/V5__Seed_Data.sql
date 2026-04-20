-- INVESTIGADORES
INSERT INTO investigadores (nombre, email, rango) VALUES
('Ana', 'ana@mail.com', 'Junior'),
('Luis', 'luis@mail.com', 'Senior'),
('Carlos', 'carlos@mail.com', 'Director'),
('Maria', 'maria@mail.com', 'Junior'),
('Jose', 'jose@mail.com', 'Senior')
ON CONFLICT (email) DO NOTHING;

-- LABORATORIOS
INSERT INTO laboratorios (nombre, nivel_bioseguridad, capacidad) VALUES
('Lab A', 1, 10),
('Lab B', 2, 15),
('Lab C', 3, 20),
('Lab D', 4, 5),
('Lab E', 2, 12);

-- EQUIPOS
INSERT INTO equipos (nombre, estado, id_laboratorio, ultima_revision) VALUES
('Microscopio', 'activo', 1, CURRENT_DATE),
('Centrifuga', 'activo', 2, CURRENT_DATE),
('PCR', 'mantenimiento', 3, CURRENT_DATE),
('Freezer', 'activo', 4, CURRENT_DATE),
('Incubadora', 'activo', 5, CURRENT_DATE);