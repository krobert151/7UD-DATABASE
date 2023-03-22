DROP TABLE IF EXISTS propietario CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS visita CASCADE;
DROP TABLE IF EXISTS inmueble CASCADE;
DROP TABLE IF EXISTS vivienda CASCADE;
DROP TABLE IF EXISTS local CASCADE;
DROP TABLE IF EXISTS habitaciones CASCADE;
DROP TABLE IF EXISTS piso CASCADE;
DROP TABLE IF EXISTS casa CASCADE;
DROP TABLE IF EXISTS chalet CASCADE;

CREATE TABLE propietario(
	dni 			varchar,
	nombre 			varchar,
	telefono		int,
	CONSTRAINT  pk_propietario PRIMARY KEY (dni)
);	
	
CREATE TABLE cliente(
	dni 			varchar,
	nombre 			varchar,
	CONSTRAINT  pk_cliente PRIMARY KEY (dni)
);	
	
CREATE TABLE inmueble(
	cod_ref 		varchar,
	m2				NUMERIC,
	direccion 		varchar,
	tipoOperacion	SMALLINT,
	propietario 	varchar,
	CONSTRAINT pk_inmueble PRIMARY KEY (cod_ref)
);	
	
CREATE TABLE visita(
	dni	 			varchar,
	cod_ref			varchar,
	fecha			date,
	comentario		TEXT,
	CONSTRAINT pk_visita PRIMARY KEY (dni,cod_ref,fecha)
);

CREATE TABLE habitaciones(
	tipo 			int,
	m2				NUMERIC,
	descripcion 	TEXT,
	vivienda		varchar ,
	foto			int,
	CONSTRAINT pk_habitaciones PRIMARY KEY (tipo,m2,descripcion,vivienda)
);

CREATE TABLE vivienda (
	descripcion 	TEXT,
	numBaños		SMALLINT
)INHERITS (inmueble) ;

CREATE TABLE local(
	zona 			SMALLINT,
	caracteristicas text
)INHERITS (inmueble);

CREATE TABLE piso(
	zona 			SMALLINT,
	tipo			varchar
)INHERITS (vivienda);

CREATE TABLE casa(
	zona 			SMALLINT
)INHERITS (vivienda);

CREATE TABLE chalet(
	urbanizacion 	varchar,
	parcelas 		smallint
)INHERITS (vivienda);

ALTER TABLE inmueble
ADD CONSTRAINT fk_propietario
FOREIGN KEY (propietario)
REFERENCES propietario (dni)
ON DELETE CASCADE CASCADE;

ADD CONSTRAINT fk_vivienda
FOREIGN KEY (vivienda)
REFERENCES vivienda (cod_ref)
ON DELETE CASCADE CASCADE;
