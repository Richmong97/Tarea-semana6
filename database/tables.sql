-- Active: 1700429346696@@dp-a.oregon-postgres.render.com@5432@richmongdb@public

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

select * from tbl_users
where user_name = 'richmong97' and contrasenia = 'Dovahkiin' and is_active = true;


create table tbl_example 
(
    id serial primary key, 
    data_example varchar(200),
    user_name varchar(500)
);


select * from tbl_users;

delete from tbl_users where user_name is not null ;


create table tbl_post 
(   
    id SERIAL PRIMARY key,
    description varchar(200),
    img bytea,
    create_date TIMESTAMP default current_timestamp,
    user_name varchar(30) REFERENCES tbl_users (user_name) 
);


select id, description , user_name ,  encode(img, 'base64') img_base64 from tbl_post
order by create_date desc;

delete from tbl_post where id is not null;

SELECT * FROM tbl_role