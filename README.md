# Repositorio Git del grupo PRI-M.COSMETIC (grupo C)
# Manual Técnico

## 1. Introducción

Este proyecto, parte del curso de Proyecto de Sistemas, presenta una aplicación móvil diseñada para satisfacer las necesidades operativas de un cliente real. Con un enfoque en la eficiente carga de productos, la aplicación permite aplicar descuentos, gestionar un carrito de compras y acceder a un servicio de soporte técnico. Incluye una sección de categorías para la organización de productos y establece un requisito de registro para acceder al HomePage, garantizando seguridad y personalización.

## 2. Descripción del Proyecto

La aplicación móvil se centra en la venta de cosméticos y ofrece un formulario para agregar nuevos productos. Además, cuenta con un carrito de venta que permite agregar productos de interés y enviar el precio y los productos a través de un chat de WhatsApp. También incluye un formulario de quejas para recibir comentarios y reportar errores.

## 3. Roles / Integrantes

- Team Leader: Sebastian Jacob Bueno Lara
- Architect DB: Jhon Erlan Marca Sanchez
- Dev: Ytzel Darlenne Blaz Gallardo

## 4. Arquitectura del Software

### Módulo de Administración de Productos

- **Componentes:** Formulario para agregar nuevos productos, base de datos para almacenar la información del producto, lógica de validación de datos.
- **Interacciones:** El formulario interactúa con la base de datos para almacenar la información del nuevo producto.

### Módulo de Carrito de Compras

- **Componentes:** Interfaz de usuario del carrito, lógica de gestión del carrito, base de datos para almacenar temporalmente los productos seleccionados.
- **Interacciones:** La interfaz de usuario interactúa con la lógica de gestión del carrito, que a su vez interactúa con la base de datos temporal.

### Módulo de Integración con WhatsApp

- **Componentes:** Módulo de envío de mensajes a WhatsApp, interfaz de usuario para activar la función, lógica para preparar la información del carrito y enviarla por WhatsApp.
- **Interacciones:** El carrito de compras interactúa con el módulo de integración para enviar la información del pedido al chat de WhatsApp.

### Módulo de Formulario de Quejas

- **Componentes:** Formulario de quejas, base de datos para almacenar las quejas, lógica de validación de datos.
- **Interacciones:** El formulario de quejas interactúa con la base de datos para almacenar la información de las quejas.

### Patrones de Diseño Utilizados

- **MVC (Modelo-Vista-Controlador):** Se utiliza para separar la lógica de negocio (Modelo), la interfaz de usuario (Vista) y la lógica de control (Controlador) para facilitar la modularidad y el mantenimiento.

