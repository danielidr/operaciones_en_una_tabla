-- 1. Crear Base de datos posts
CREATE DATABASE posts;

-- 2. Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido, descripción

CREATE TABLE post(
id SERIAL,
nombre_de_usuario VARCHAR(30) NOT NULL,
fecha_de_creación DATE NOT NULL,
contenido VARCHAR(10000) NOT NULL,
descripcion VARCHAR(250));

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"

INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion) VALUES ('Pamela', '2020-03-01', 'Escribir es el arte de plasmar los pensamientos en un papel. Es un arte porque requiere tiempo de aprendizaje, esfuerzo y destreza: este proceso arduo busca llevar las ideas abstractas a un mundo tangible. Aunque las ideas que se encuentren detrás sean buenas, una redacción clara y concisa podría hacer toda la diferencia entre un escrito enriquecedor y uno tedioso y poco informativo.','mejorar tu redacción');

INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion) VALUES ('Pamela', '2020-07-08','Las redes sociales son estructuras formadas en Internet por personas u organizaciones que se conectan a partir de intereses o valores comunes. A través de ellas, se crean relaciones entre individuos o empresas de forma rápida, sin jerarquía o límites físicos.', 'redes sociales');

INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion) VALUES ('Carlos', '2021-03-01', 'La nueva generación de consolas trajo consigo un nuevo estándar en términos de gráficos, poder de procesamiento y juegos. La Xbox Series X y la PlayStation 5 seguramente serán las estrellas del mercado por varios años, ¿pero cuál es mejor? Nosotros nos hemos dado a la tarea de probarlas y compararlas; es un trabajo duro, pero alguien tiene que hacerlo. Sin más, esto es todo lo que tienes que saber acerca de las mejores consolas de videojuegos disponibles actualmente.', 'consolas de videojuegos');

-- 4. Modificar la tabla post, agregando la columna título
ALTER TABLE post ADD titulo VARCHAR(50);

-- 5. Agregar título a las publicaciones ya ingresadas
UPDATE post SET titulo='Redacción' WHERE id=1;
UPDATE post SET titulo='Redes Sociales' WHERE id=2;
UPDATE post SET titulo='Las mejores consolas de videojuegos' WHERE id=3;

-- 6. Insertar 2 post para el usuario "Pedro"

INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion, titulo) VALUES ('Pedro', '2021-02-27', 'WandaVision era una historia sobre Wanda Maximoff, sin embargo, su título y trama también contemplaban a Vision como una parte fundamental, por lo que el último capítulo de la serie también tuvo que entregar algunas respuestas y resolver otros puntos sobre el arco del sintezoide interpretado por Paul Bettany.', 'serie de Marvel  Wandavision', 'Wandavision');

INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion, titulo) VALUES ('Pedro', '2021-03-15', 'Después de los eventos de Avengers: Endgame, Samuel Wilson / Falcon y James Barnes / Soldado del Invierno se unen en una aventura global que pone a prueba sus habilidades, y su paciencia, en Marvel Studios The Falcon and the Winter Soldier.', 'serie de Marvel Falcon y el soldado del invierno', 'Falcon y el soldado del invierno');

-- 7. Eliminar el post de Carlos
DELETE FROM post WHERE nombre_de_usuario='Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion, titulo) VALUES ('Carlos', '2020-10-01', 'Para quienes son fanáticos de las películas de misterio tipo “El impostor” y los videojuegos de estrategia les va a encantar. Este es un juego que asigna a un jugador del grupo matar a los demás, sin que el resto sepa de quién se trata. Por lo tanto, unos tienen que intentar no ser descubiertos y los demás tienen que intentar descubrirlo.', 'El videojuego del momento', 'Among Us');

-- 9. Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts.

ALTER TABLE post ADD PRIMARY KEY(id);
CREATE TABLE comentarios(
id SERIAL,
fecha_y_hora TIMESTAMP NOT NULL,
contenido VARCHAR(300) NOT NULL,
id_post INT,
FOREIGN KEY (id_post) REFERENCES
post(id)
);

-- 10. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"

INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-01-04 20:34:03', 'Estoy de acuerdo contigo Pamela, la redacción es super importante',1);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-01-15 12:01:20', 'Necesito ayuda con eso',1);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2020-12-06 16:08:45', 'Super entretenido',6);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2020-12-08 19:08:45', 'No me gusta el juego, encuentro que es solo para matar tiempo',6);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-01-05 16:08:45', 'Es bueno',6);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-02-18 11:48:05', 'Paso de moda',6);

-- 11. Crear un nuevo post para "Margarita"
INSERT INTO post (nombre_de_usuario, fecha_de_creación, contenido, descripcion, titulo) VALUES ('Margarita', '2021-03-29', 'Tras la incorporación de la mujer como fuerza laboral y la inserción de tecnología especializada, la República de Corea liberalizó la venta de sus productos, que desde ese entonces no han hecho nada más que ganar adeptos alrededor del mundo, más aún durante los últimos años en que el K-Pop domina los rankings musicales', 'cosmetica coreana', 'La popular cosmetica coreana');

-- 12. Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-03-29 23:00:34', 'Amo el K-Beauty',7);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-03-30 00:34:04', 'Excelentes ingredientes a buenos precios',7);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-03-30 00:34:04', 'En algunos productos es mejor la cosmetica occidental',7);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-03-30 00:34:04', 'Me ha ayudado mucho',7);
INSERT INTO comentarios (fecha_y_hora, contenido, id_post) VALUES ('2021-03-30 12:00:23', 'Prefiero la cosmetica local',7);
