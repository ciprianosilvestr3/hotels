CREATE TABLE `paises` (
`id` int(6) NOT NULL AUTO_INCREMENT,
`nombre` varchar(255) NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `estados` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(255) NULL DEFAULT NULL,
`pais_id` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `pais_id` (`pais_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `ciudades` (
`id` int(6) NOT NULL AUTO_INCREMENT,
`nombre` varchar(255) NULL DEFAULT NULL,
`estado_id` int(6) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `estado_id` (`estado_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `hoteles` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(45) NULL DEFAULT NULL,
`fecha_nacimiento` varchar(45) NULL DEFAULT NULL,
`email` varchar(45) NULL DEFAULT NULL,
`telefono` varchar(45) NULL DEFAULT NULL,
`fecha_registro` varchar(45) NULL DEFAULT NULL,
`logo` longblob NULL,
`estatus` tinyint(1) NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `usuarios` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NOT NULL,
`email` varchar(75) NOT NULL,
`password` varchar(45) NOT NULL,
`fecha_registro` datetime NOT NULL,
`estatus` tinyint(1) NOT NULL,
`foto` longblob NULL,
`sucursales_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `sitios_interes` (
`id` int(6) NOT NULL AUTO_INCREMENT,
`descripcion` varchar(300) NULL DEFAULT NULL,
`latitud` varchar(50) NULL DEFAULT NULL,
`longitud` varchar(50) NULL DEFAULT NULL,
`direccion` varchar(200) NULL DEFAULT NULL,
`ciudad_id` int(6) NULL DEFAULT NULL,
`foto` longblob NULL,
`estatus` tinyint(1) NULL,
PRIMARY KEY (`id`) ,
INDEX `ciudad_id` (`ciudad_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `usuarios_perfiles` (
`usuario_id` int(11) NOT NULL,
`perfil_id` int(11) NOT NULL,
INDEX `fk_usuarios_perfiles_usuarios_idx` (`usuario_id` ASC) USING BTREE,
INDEX `fk_usuarios_perfiles_perfiles1_idx` (`perfil_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `perfiles` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(45) NULL DEFAULT NULL,
`fecha_registro` datetime NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `perfiles_recursos` (
`consultar` tinyint(1) NULL DEFAULT 0,
`agregar` tinyint(1) NULL DEFAULT 0,
`editar` tinyint(1) NULL DEFAULT 0,
`eliminar` tinyint(1) NULL DEFAULT 0,
`recurso_id` int(11) NOT NULL,
`perfil_id` int(11) NOT NULL,
INDEX `fk_perfiles_recursos_recursos1_idx` (`recurso_id` ASC) USING BTREE,
INDEX `fk_perfiles_recursos_perfiles1_idx` (`perfil_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `recursos` (
`id` int(11) NOT NULL,
`nombre` varchar(100) NULL DEFAULT NULL,
`fecha_registro` datetime NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `sucursales` (
`id_sucursal` int(6) NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) NULL DEFAULT NULL,
`latitud` varchar(50) NULL DEFAULT NULL,
`longitud` varchar(50) NULL DEFAULT NULL,
`direccion` varchar(50) NULL DEFAULT NULL,
`telefono` varchar(15) NULL DEFAULT NULL,
`hoteles_id` int(11) NULL DEFAULT NULL,
`fecha_registro` datetime NULL,
`estatus` tinyint(1) NULL,
PRIMARY KEY (`id_sucursal`) ,
INDEX `cliente_id` (`hoteles_id` ASC) USING BTREE,
INDEX `cliente_id_2` (`hoteles_id` ASC) USING BTREE,
INDEX `cliente_id_3` (`hoteles_id` ASC) USING BTREE,
INDEX `cliente_id_4` (`hoteles_id` ASC) USING BTREE,
INDEX `cliente_id_5` (`hoteles_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `noticias` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`usuario_id` int(11) NOT NULL,
`titulo` varchar(75) NULL DEFAULT NULL,
`descripción` mediumtext NULL,
`fecha_registro` datetime NULL DEFAULT NULL,
`fecha_modificacion` datetime NULL DEFAULT NULL,
`estatus` tinyint(1) NULL DEFAULT NULL ,
`foto` longblob NULL,
PRIMARY KEY (`id`) ,
INDEX `fk_noticias_usuarios1_idx` (`usuario_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `productos` (
`id` int(6) NOT NULL AUTO_INCREMENT,
`nombre` varchar(50) NULL DEFAULT NULL,
`descripcion` mediumtext NULL,
`precio` double(8,0) NULL DEFAULT NULL,
`fecha_regitro` datetime NULL,
`estatus` tinyint(1) NULL,
`usuario_id` int(11) NULL,
`foto` longblob NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = dynamic;

CREATE TABLE `tipos_de_interes` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(255) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `tipo_interes` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(50) NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = compact;

CREATE TABLE `clientes_creando` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(255) NULL,
`hotel` varchar(255) NULL,
`base_datos` varchar(50) NULL,
`estatus` char(1) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `productos_sucursales` (
`productos_id` int(11) NOT NULL,
`sucursales_id` int(11) NOT NULL
)
ENGINE = InnoDB;

CREATE TABLE `noticias_sucursales` (
`noticias_id` int(11) NOT NULL,
`sucursales_id` int(11) NOT NULL
)
ENGINE = InnoDB;

CREATE TABLE `settings` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`sucursal_id` int(11) NULL,
`uuid` varchar(25) NULL,
`lenguaje_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB;

CREATE TABLE `sucursales_ciudades` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`sucursales_id` int(11) NULL,
`ciudades_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB;

CREATE TABLE `lenguajes` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(50) NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB;

CREATE TABLE `categorias` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`descripcion` varchar(50) NULL,
`tipo_interes` int(11) NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE `categorias_sitios_interes` (
`categorias_id` int(11) NOT NULL,
`sitios_interes_id` int(11) NOT NULL
)
ENGINE = InnoDB;


ALTER TABLE `estados` ADD CONSTRAINT `pais_id` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`);
ALTER TABLE `ciudades` ADD CONSTRAINT `estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`);
ALTER TABLE `sitios_interes` ADD CONSTRAINT `fk_sitios_interes_ciudades` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`);
ALTER TABLE `usuarios_perfiles` ADD CONSTRAINT `fk_usuarios_perfiles_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `perfiles_recursos` ADD CONSTRAINT `fk_perfiles_recursos_perfiles1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `usuarios_perfiles` ADD CONSTRAINT `fk_usuarios_perfiles` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`);
ALTER TABLE `perfiles_recursos` ADD CONSTRAINT `fk_perfiles_recursos` FOREIGN KEY (`recurso_id`) REFERENCES `recursos` (`id`);
ALTER TABLE `sucursales` ADD CONSTRAINT `fk_sucursales_hoteles` FOREIGN KEY (`hoteles_id`) REFERENCES `hoteles` (`id`);
ALTER TABLE `noticias` ADD CONSTRAINT `fk_noticias_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `productos` ADD CONSTRAINT `fk_productos_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
ALTER TABLE `productos_sucursales` ADD CONSTRAINT `fk_productos_sucursales` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`);
ALTER TABLE `productos_sucursales` ADD CONSTRAINT `fk_productos_sucursales_1` FOREIGN KEY (`sucursales_id`) REFERENCES `sucursales` (`id_sucursal`);
ALTER TABLE `noticias_sucursales` ADD CONSTRAINT `fk_noticias_sucursales` FOREIGN KEY (`noticias_id`) REFERENCES `noticias` (`id`);
ALTER TABLE `noticias_sucursales` ADD CONSTRAINT `fk_noticias_sucursales_1` FOREIGN KEY (`sucursales_id`) REFERENCES `sucursales` (`id_sucursal`);
ALTER TABLE `sucursales_ciudades` ADD CONSTRAINT `fk_sucursales_ciudades_sucursales` FOREIGN KEY (`sucursales_id`) REFERENCES `sucursales` (`id_sucursal`);
ALTER TABLE `sucursales_ciudades` ADD CONSTRAINT `fk_sucursales_ciudades_ciudades` FOREIGN KEY (`ciudades_id`) REFERENCES `ciudades` (`id`);
ALTER TABLE `settings` ADD CONSTRAINT `fk_settings_sucursales` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id_sucursal`);
ALTER TABLE `settings` ADD CONSTRAINT `fk_settings_lenguales` FOREIGN KEY (`lenguaje_id`) REFERENCES `lenguajes` (`id`);
ALTER TABLE `usuarios` ADD CONSTRAINT `fk_usuarios_sucursales` FOREIGN KEY (`sucursales_id`) REFERENCES `sucursales` (`id_sucursal`);
ALTER TABLE `categorias` ADD CONSTRAINT `fk_categorias_tipo_interes` FOREIGN KEY (`tipo_interes`) REFERENCES `tipo_interes` (`id`);
ALTER TABLE `categorias_sitios_interes` ADD CONSTRAINT `fk_categorias_sitios_interes_categorias` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`);
ALTER TABLE `categorias_sitios_interes` ADD CONSTRAINT `fk_categorias_sitios_interes_sitios` FOREIGN KEY (`sitios_interes_id`) REFERENCES `sitios_interes` (`id`);