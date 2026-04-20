-- INVESTIGADORES
CREATE TABLE investigadores (
    id_investigador SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    rango VARCHAR(50)
);

-- LABORATORIOS
CREATE TABLE laboratorios (
    id_laboratorio SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    nivel_bioseguridad INT,
    capacidad INT
);

-- EQUIPOS
CREATE TABLE equipos (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    estado VARCHAR(50),
    id_laboratorio INT
);

-- RESERVAS
CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_investigador INT,
    id_laboratorio INT,
    id_equipo INT,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP
);

-- AUDITORÍA
CREATE TABLE log_auditoria (
    id_log SERIAL PRIMARY KEY,
    tabla VARCHAR(50),
    operacion VARCHAR(50),
    usuario VARCHAR(50),
    fecha TIMESTAMP
);