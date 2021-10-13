DROP DATABASE IF EXISTS notas_db;
CREATE DATABASE notas_db;
USE notas_db;

-- Creacion tabla para usuarios
create table usuarios (
    id int PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
-- Creacion para tabla notas
CREATE TABLE notas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  fecha_creacion DATE NOT NULL,
  fecha_mod DATE NULL,
  eliminar_nota TINYINT,
  usuario_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
-- Creacion tabla categorias
CREATE Table categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion_categoria VARCHAR(100) NOT NULL
);
-- Creacion tabla de relacion notas_categorias
CREATE Table notas_categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nota_id INT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (nota_id) REFERENCES notas(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Carga de datos tabla usuarios
INSERT INTO usuarios (id, nombre, email)
VALUES (DEFAULT, "Sara Valdivieso", "svaldivieso@gmail.com"),
(DEFAULT, "Pablo Pacheco", "ppacheco@gmail.com"),
(DEFAULT, "Maximiliano Guerineau", "macziu@hotmail.com"),
(DEFAULT,"Fernando Albornoz","falbornoz@gmail.com"),
(DEFAULT,"Juan Gonzalez","jgonzalez@gmail.com"),
(DEFAULT,"Belen Timo","mbtimo@gmail.com"),
(DEFAULT,"Pia Torino","ptorino@gmail.com"),
(DEFAULT,"Sofia Garcia","sogama@gmail.com"),
(DEFAULT,"Pablo Sebastian Barrientos","psb@gmail.com"),
(DEFAULT,"Florencia Holgado","fhol@gmail.com");

-- Carga de datos tabla categorias
INSERT INTO categorias (id, descripcion_categoria)
VALUES (DEFAULT, "Rutina diaria"), (DEFAULT, "Deportes"), (DEFAULT, "Musica"), (DEFAULT, "Videos juegos"), (DEFAULT,"Cine"),
(DEFAULT, "Recreacion"), (DEFAULT, "Espectáculos"), (DEFAULT, "Tecnología"), (DEFAULT, "Viajes"), (DEFAULT, "Política");

-- Carga de datos tabla notas
INSERT INTO notas (id, titulo, descripcion, fecha_creacion, fecha_mod, eliminar_nota, usuario_id)
VALUES (DEFAULT, "Ir al supermercado", "comprar fideos y arroz solamente", "2021/10/13","2021/10/13", 1, 1),
(DEFAULT,"Volver al gimnasio","solo hacer piernas","2021/10/11","2021/10/11",1,2),
(DEFAULT,"Estreno Harry Potter","va estar muy la pelicula, tiene buenas criticas","2020/10/13","2020/10/13",1,5),
(DEFAULT, "Discos de estado solido", "es lo mejor que viene ahora para tu pc", "2021/7/11","2021/7/11", 1, 8),
(DEFAULT, "Lanzamiento Mortal Kombat", "dicen que va a estar muy bueno el video", "2021/3/11","2021/3/11", 1, 4),
(DEFAULT, "Viajar al caribe", "buscar el mejor precio para sacar pasaje", "2021/3/4","2021/3/4", 1, 9),
(DEFAULT, "Viaje del presidente", "busca tener mejor relaciones con EE.UU", "2021/8/11","2021/8/11", 1, 10),
(DEFAULT, "Concierto de abel pintos", "el cantante va a cantar su ultimo disco", "2021/4/6","2021/4/6", 1, 7),
(DEFAULT, "Venta de comics de superheroes", "los mejores comics para tu coleccion", "2021/2/11","2021/2/11", 1, 6),
(DEFAULT, "Mau y Ricky", "los cantantes no van a ser parte de la nueva edicion de la voz", "2021/7/11","2021/7/11", 1, 3);

-- Carga de datos tabla relacional notas_categorias
INSERT INTO notas_categorias (id, nota_id, categoria_id) VALUES (DEFAULT, 1, 8), (DEFAULT, 2, 3), (DEFAULT, 3, 5),
(DEFAULT, 4, 6), (DEFAULT, 5, 7), (DEFAULT, 6, 10), (DEFAULT, 7, 2), (DEFAULT, 8, 1), (DEFAULT, 9, 8), (DEFAULT, 10, 9);

-- Consultas a la base de datos
select * from usuarios;
select * from notas;
select * from categorias;