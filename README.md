# SISVENTAS - Sistema de Control de Ventas


## Descripción

SISVENTAS es un sistema web desarrollado en PHP orientado a la gestión de ventas para pequeñas y medianas empresas. Permite administrar productos, usuarios, clientes, proveedores y realizar el registro y consulta de ventas.

Este sistema facilita el control de inventario y operaciones comerciales mediante una interfaz sencilla y funcional.

---

## Tecnologías utilizadas

- PHP (Programación Backend)
- MySQL (Base de datos relacional)
- HTML5 / CSS3
- JavaScript (Validaciones básicas y dinámicas)
- Bootstrap (Diseño responsivo)
- PDO (PHP Data Objects para conexión segura a la base de datos)

---

## Estructura del proyecto

sisventas/
│
├── controlador/ # Controladores que manejan la lógica de negocio
│ ├── UsuarioControlador.php
│ ├── ProductoControlador.php
│ └── VentaControlador.php
│
├── modelo/ # Modelos que interactúan con la base de datos
│ ├── Usuario.php
│ ├── Producto.php
│ └── Venta.php
│
├── vista/ # Vistas divididas por entidad
│ ├── usuario/
│ ├── venta/
│ └── layout/
│
├── includes/ # Archivos comunes como conexión a la base de datos
│ └── db.php
│
├── login/ # Módulo de autenticación
│ ├── login.php
│ └── logout.php
│
├── sql/ # Base de datos
│ └── sisventas.sql
│
└── README.md 


---

##  Funcionalidades principales

-  Autenticación de usuarios: login y logout con sesión segura.
-  Gestión de usuarios: registrar, editar, eliminar y listar usuarios.
- Gestión de productos: CRUD completo de productos.
-  Gestión de ventas: registrar nuevas ventas, consultar historial.
- Reportes básicos (por implementar): resumen de ventas por fecha.
- Control de stock: actualizado automáticamente según las ventas.
- Panel administrativo: navegación centralizada a todos los módulos
