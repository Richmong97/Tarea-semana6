-- Active: 1700429346696@@dpg-cld7n9ngsrdc73fj7mu0-a.oregon-postgres.render.com@5432@richmongdb
CREATE TABLE tbl_role (
    id SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(255),
    is_active BOOLEAN DEFAULT true,
    create_date TIMESTAMP DEFAULT current_timestamp,
    delete_date TIMESTAMP,
    update_date TIMESTAMP
);

INSERT INTO tbl_role
(nombre_rol)
values
('Admin'),
('client');

SELECT * FROM tbl_role;

CREATE TABLE tbl_users (
    user_name VARCHAR(50) PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    contrasenia VARCHAR(50),
    perfil_picture bytea,
    id_role int REFERENCES tbl_role(id),
    is_active BOOLEAN DEFAULT true,
    create_date TIMESTAMP DEFAULT current_timestamp,
    delete_date TIMESTAMP,
    update_date TIMESTAMP
);

INSERT INTO tbl_users
(
    user_name,email, contrasenia, id_role
)
VALUES
('richmong97','richmong@ejemplo.com', 'Dovahkiin', 1),
('alumno1','alunmo@ejemplo.com', '123456789', 2);