DROP DATABASE IF EXISTS mariapan;
CREATE DATABASE mariapan;

use mariapan;


CREATE TABLE proveedor(
    id int not null AUTO_INCREMENT,
    nombre char(255) not null,
    pais char(255) not null,
    PRIMARY KEY(id)
);

CREATE TABLE productos(
    id int not null AUTO_INCREMENT,
    nombre char(255) not null,
    precio float not null,
    cantidad int not null,
    id_proveedor int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id)
);

CREATE TABLE facturas(
    id int not null AUTO_INCREMENT,
    fecha_hora TIMESTAMP not null DEFAULT (NOW()),
    sucursal char(255) not null,
    total float not null,
    PRIMARY KEY (id)
);

CREATE TABLE producto_factura(
    id_factura int,
    id_producto int,
    cantidad int not null,
    PRIMARY KEY(id_factura, id_producto),
    FOREIGN KEY (id_factura) REFERENCES facturas(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

insert into proveedor (nombre, pais)
values('Hamelin', 'Inglaterra'),('Humpty Dumpty', 'Bolivia'),('Pita Perfection','Grecia');

insert into productos(nombre, precio, cantidad, id_proveedor)
values('Pan Flauta Hamelin',4.60,25,1), ('Pan de Huevo',3.50,30,2),('Pan Pita',2.85,28,3);

select * from productos;

/*
QUERYS PARA MI AMIGO RAUL 

**PARA OBTENER TODOS LOS PRODUCTOS DE UNA DETERMINADA FACTURA
SELECT * FROM producto_factura WHERE id_factura = {el id en cuestion que quieras encontrar};


**PARA SELECCIONAR TODO LOS PRODUCTOS
SELECT * FROM productos;
~tienes que guardar tanto cantidad como los nombres en arreglos paralelos, para que entonces puedas verificar
que no exceda la cantidad que hay, tambien tienes que guardar id, nombre, precio, cantidad


~POSTERIORMENTE, cada item que se vaya añadiendo a la factura lo guardas en un arreglo 
paralelo tipo, id, nombre, cantidad y ya

~tienes que calcular el total desde Netbeans


**PARA ACTUALIZAR LA TABLA

INSERT INTO facturas (sucursal, total) VALUES ({aqui el nombre de la sucursal}, {el total calculado})

TAREA:(Como rayos sabemos el numero de factura recien creado la instancia hmmmmmmm...)

~El siguiente insert into tiene que estar dentro de una estructura repepetiva
INSERT INTO factura(id_factura, id_producto, cantidad) VALUES ({el id de la factura recien creada}, {iteras sobre el arreglo y entonces pones aqui el id},{mismo proceso pero con el arreglo de cantidad})

**PARA VER LAS FACTURAS DE NUEVO


SELECT * from facturas;
~guardar en un arreglo
~Raul tiene que tener una variable auxiliar para guardar el id en el que estas actualmente

~Cuando Raul tenga el id en que esta actualmente 
SELECT id_producto from producto_factura where id_factura={A la variable auxiliar de la factura}
~TODOOOOO ESTO LO GUARDAS EN UN ARREGLO

~ahora vas a recorrer con una estructura repetiti el arreglo porque haras el siguiente query
SELECT nombre from productos where id = {el item del arreglo que se supone guardaste }
~Esto lo guardas en un arreglo para imprimir los nombres de los productos

**Esto es para el tab inventario
~Esta tacito que lo guardaras en arreglos paralelos
Select nombre, cantidad from productos;

**para el tab proveedores



SELECT * from provedor;
~guardar en un arreglo
~Raul tiene que tener una variable auxiliar para guardar el id en el que estas actualmente

~Cuando Raul tenga el id en que esta actualmente 
SELECT nombre from productos where id_proveedor={A la variable auxiliar del proveedor}
~TODOOOOO ESTO LO GUARDAS EN UN ARREGLO

NO TE RINDAS RAUL, TU PUEDES, DATE PRISA GOKU!


*/