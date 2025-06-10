create database	sistemas;
use sistemas;

-- Tabla de Sistemas Operativos
CREATE TABLE SistemaOperativo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    version VARCHAR(50) NOT NULL,
    arquitectura VARCHAR(20) NOT NULL,
    fabricante VARCHAR(100),
    manual VARCHAR(100)
);

-- Tabla de Equipos
CREATE TABLE Equipo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    foto VARCHAR(100),
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    sistema_operativo_id INT NOT NULL,
    FOREIGN KEY (sistema_operativo_id) REFERENCES SistemaOperativo(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
