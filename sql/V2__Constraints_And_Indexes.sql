-- FOREIGN KEYS
ALTER TABLE equipos
ADD CONSTRAINT fk_equipo_lab
FOREIGN KEY (id_laboratorio)
REFERENCES laboratorios(id_laboratorio)
ON DELETE CASCADE;

ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_inv
FOREIGN KEY (id_investigador)
REFERENCES investigadores(id_investigador);

ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_lab
FOREIGN KEY (id_laboratorio)
REFERENCES laboratorios(id_laboratorio);

ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_equipo
FOREIGN KEY (id_equipo)
REFERENCES equipos(id_equipo);

-- CHECK bioseguridad
ALTER TABLE laboratorios
ADD CONSTRAINT chk_nivel CHECK (nivel_bioseguridad BETWEEN 1 AND 4);

-- CHECK estado equipo
ALTER TABLE equipos
ADD CONSTRAINT chk_estado CHECK (estado IN ('activo','mantenimiento','fuera_servicio'));

-- ÍNDICE
CREATE INDEX idx_reservas_fecha
ON reservas(fecha_inicio, fecha_fin);