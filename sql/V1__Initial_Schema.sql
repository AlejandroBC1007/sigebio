CREATE TABLE investigadores (
    id_investigador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    rango VARCHAR(20) NOT NULL
);

CREATE TABLE laboratorios (
    id_laboratorio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel_bioseguridad INT NOT NULL,
    capacidad INT
);

CREATE TABLE equipos (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    estado VARCHAR(20),
    id_laboratorio INT
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_investigador INT,
    id_laboratorio INT,
    id_equipo INT,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP
);

CREATE TABLE log_auditoria (
    id_log SERIAL PRIMARY KEY,
    tabla VARCHAR(50),
    operacion VARCHAR(20),
    usuario VARCHAR(50),
    fecha TIMESTAMP
);