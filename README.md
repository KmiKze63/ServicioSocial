# Sistema de Gestión de Agremiados

Aplicación web completa para la gestión de agremiados universitarios, permisos y vacaciones.

## 🚀 Tecnologías

### Backend
- Node.js + Express
- MySQL / MariaDB
- JWT para autenticación
- bcryptjs para encriptación

### Frontend
- React 18
- React Router para navegación
- Axios para peticiones HTTP
- CSS moderno con variables

## 📋 Requisitos Previos

- Node.js v18 o superior
- MySQL / MariaDB
- Base de datos "agremiados" configurada

## 🛠️ Instalación

### 1. Clonar el repositorio o descargar archivos

```bash
cd ServicioSocial
```

### 2. Configurar Backend

```bash
# Navegar a carpeta backend
cd backend

# Instalar dependencias
npm install

# Copiar archivo de configuración
copy .env.example .env

# Editar el archivo .env con tus credenciales de base de datos
notepad .env
```

**Configuración del archivo `.env`:**

```env
PORT=5000
NODE_ENV=development

DB_HOST=100.88.24.92
DB_PORT=3306
DB_USER=tu_usuario_mysql

DB_PASSWORD=tu_password_mysql
DB_DATABASE=agremiados

JWT_SECRET=tu_secreto_jwt_super_seguro_cambialo
JWT_EXPIRE=7d
```

### 3. Configurar Frontend

```bash
# Desde la raíz del proyecto
cd frontend

# Instalar dependencias
npm install
```

### 4. Importar Base de Datos

Asegúrate de que tu base de datos MySQL/MariaDB tenga los procedimientos almacenados importados:

```bash
mysql -u tu_usuario -p -h 100.88.24.92 agremiados < procedimientos_agremiados.sql
```

## 🚀 Ejecución

### Opción 1: Ejecutar Backend y Frontend por separado

**Terminal 1 - Backend:**
```bash
cd backend
npm run dev
```
El backend estará disponible en: `http://localhost:5000`

**Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
```
El frontend estará disponible en: `http://localhost:5173`

### Opción 2: Ejecutar todo desde la raíz

```bash
# Desde la raíz del proyecto
npm run dev
```

## 📱 Estructura del Proyecto

```
ServicioSocial/
├── backend/
│   ├── config/
│   │   └── database.js          # Configuración de MySQL
│   ├── controllers/
│   │   ├── authController.js    # Login/Logout
│   │   ├── usuarioController.js # Perfil y usuario
│   │   ├── solicitudController.js # Gestión de solicitudes
│   │   └── adminController.js   # Administración
│   ├── routes/
│   │   ├── authRoutes.js
│   │   ├── usuarioRoutes.js
│   │   ├── solicitudRoutes.js
│   │   └── adminRoutes.js
│   ├── middleware/
│   │   └── authMiddleware.js    # Autenticación JWT
│   ├── .env.example
│   ├── package.json
│   └── server.js
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   └── PrivateRoute.jsx
│   │   ├── context/
│   │   │   └── AuthContext.jsx
│   │   ├── pages/
│   │   │   ├── Login.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   ├── Perfil.jsx
│   │   │   ├── MisSolicitudes.jsx
│   │   │   ├── NuevaSolicitud.jsx
│   │   │   └── SolicitudesPendientes.jsx
│   │   ├── services/
│   │   │   ├── api.js
│   │   │   └── index.js
│   │   ├── styles/
│   │   │   ├── Login.css
│   │   │   ├── Dashboard.css
│   │   │   ├── Perfil.css
│   │   │   ├── Solicitudes.css
│   │   │   └── Admin.css
│   │   ├── App.jsx
│   │   ├── main.jsx
│   │   └── index.css
│   ├── package.json
│   └── vite.config.js
│
├── procedimientos_agremiados.sql
├── package.json
└── README.md
```

## 🔑 Funcionalidades

### Para Usuarios (Maestros)
- ✅ Login y autenticación
- ✅ Ver y editar perfil
- ✅ Crear solicitudes de permisos/vacaciones
- ✅ Ver historial de solicitudes
- ✅ Cancelar solicitudes pendientes
- ✅ Ver notificaciones
- ✅ Consultar reglas de permisos

### Para Administradores
- ✅ Todas las funcionalidades de usuario
- ✅ Gestionar usuarios
- ✅ Aprobar/Rechazar solicitudes
- ✅ Ver solicitudes pendientes
- ✅ Generar reportes
- ✅ Ver auditoría del sistema

## 📡 API Endpoints

### Autenticación
- `POST /api/auth/login` - Iniciar sesión
- `POST /api/auth/logout` - Cerrar sesión

### Usuario
- `GET /api/usuario/perfil` - Ver perfil
- `PUT /api/usuario/perfil` - Actualizar perfil
- `PUT /api/usuario/cambiar-password` - Cambiar contraseña
- `GET /api/usuario/notificaciones` - Ver notificaciones
- `PUT /api/usuario/notificaciones/:id/leer` - Marcar notificación leída
- `GET /api/usuario/reglas` - Ver reglas de permisos

### Solicitudes
- `POST /api/solicitudes` - Crear solicitud
- `GET /api/solicitudes/mis-solicitudes` - Ver mis solicitudes
- `PUT /api/solicitudes/:id/cancelar` - Cancelar solicitud

### Administración (requiere rol Admin)
- `GET /api/admin/usuarios` - Listar usuarios
- `POST /api/admin/usuarios` - Crear usuario
- `PUT /api/admin/usuarios/:id` - Actualizar usuario
- `GET /api/admin/solicitudes/pendientes` - Solicitudes pendientes
- `PUT /api/admin/solicitudes/:id/aprobar` - Aprobar solicitud
- `PUT /api/admin/solicitudes/:id/rechazar` - Rechazar solicitud
- `GET /api/admin/auditoria` - Ver auditoría
- `GET /api/admin/reportes/dias-usados` - Reporte de días usados

## 🎨 Capturas de Pantalla

### Login
Pantalla de inicio de sesión con validación de credenciales.

### Dashboard
Panel principal con navegación según el rol del usuario.

### Gestión de Solicitudes
- Crear nuevas solicitudes de permisos
- Ver historial completo
- Cancelar solicitudes pendientes

### Panel de Administración
- Gestión de usuarios
- Aprobación de solicitudes
- Reportes y auditoría

## 🔒 Seguridad

- Autenticación basada en JWT
- Contraseñas encriptadas con bcrypt
- Validación de permisos por rol
- Protección contra SQL injection (procedimientos almacenados)
- CORS configurado
- Manejo de errores centralizado

## 🐛 Solución de Problemas

### Error de conexión a la base de datos
```
Error: connect ECONNREFUSED
```
**Solución:** Verifica que MySQL esté corriendo y las credenciales en `.env` sean correctas.

### Error al iniciar el frontend
```
EADDRINUSE: address already in use
```
**Solución:** El puerto 5173 está ocupado. Mata el proceso o usa otro puerto.

### Token inválido o expirado
**Solución:** Cierra sesión y vuelve a iniciar sesión.

## 📝 Notas Importantes

1. **Primera ejecución:** Asegúrate de que la base de datos tenga al menos un usuario administrador creado.

2. **Procedimientos almacenados:** Todos los procedimientos del archivo `procedimientos_agremiados.sql` deben estar importados.

3. **CORS:** Si el frontend y backend están en diferentes dominios, ajusta la configuración de CORS en `backend/server.js`.

4. **Producción:** 
   - Cambia `NODE_ENV=production`
   - Usa variables de entorno seguras
   - Configura HTTPS
   - Usa un secreto JWT robusto

## 👨‍💻 Desarrollo

### Agregar nuevos endpoints
1. Crear controlador en `backend/controllers/`
2. Crear ruta en `backend/routes/`
3. Agregar ruta en `backend/server.js`

### Agregar nuevas páginas
1. Crear componente en `frontend/src/pages/`
2. Agregar ruta en `frontend/src/App.jsx`
3. Agregar servicio en `frontend/src/services/index.js`

## 📄 Licencia

Este proyecto es para uso educativo/interno.

## 🤝 Soporte

Para reportar problemas o sugerencias, contacta al equipo de desarrollo.
