-- FUNCION VALIDACION
CREATE OR REPLACE FUNCTION validar_reserva()
RETURNS TRIGGER AS $$
DECLARE
    nivel INT;
    rango_inv VARCHAR;
    estado_equipo VARCHAR;
BEGIN
    -- Obtener nivel del laboratorio
    SELECT nivel_bioseguridad INTO nivel
    FROM laboratorios
    WHERE id_laboratorio = NEW.id_laboratorio;

    -- Obtener rango del investigador
    SELECT rango INTO rango_inv
    FROM investigadores
    WHERE id_investigador = NEW.id_investigador;

    -- Obtener estado del equipo
    SELECT estado INTO estado_equipo
    FROM equipos
    WHERE id_equipo = NEW.id_equipo;

    -- REGLA 1: Nivel 4 solo Director
    IF nivel = 4 AND rango_inv <> 'Director' THEN
        RAISE EXCEPTION 'Solo Director puede reservar laboratorio nivel 4';
    END IF;

    -- REGLA 2: Equipo debe estar activo
    IF estado_equipo <> 'activo' THEN
        RAISE EXCEPTION 'Equipo no disponible';
    END IF;

    -- REGLA 3: Evitar solapamiento de reservas
    IF EXISTS (
        SELECT 1
        FROM reservas
        WHERE id_investigador = NEW.id_investigador
        AND (NEW.fecha_inicio, NEW.fecha_fin)
        OVERLAPS (fecha_inicio, fecha_fin)
    ) THEN
        RAISE EXCEPTION 'Conflicto de horario para el investigador';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGER VALIDACION
CREATE TRIGGER trg_validar_reserva
BEFORE INSERT ON reservas
FOR EACH ROW
EXECUTE FUNCTION validar_reserva();


-- FUNCION AUDITORIA
CREATE OR REPLACE FUNCTION auditoria_reservas()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_auditoria(tabla, operacion, usuario, fecha)
    VALUES ('reservas', TG_OP, current_user, now());

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- TRIGGER AUDITORIA
CREATE TRIGGER trg_auditoria_reservas
AFTER INSERT ON reservas
FOR EACH ROW
EXECUTE FUNCTION auditoria_reservas();