const express = require('express');
const router = express.Router();
const {
  verPerfil,
  actualizarPerfil,
  cambiarPassword,
  verNotificaciones,
  marcarNotificacionLeida,
  verReglas
} = require('../controllers/usuarioController');
const { authMiddleware } = require('../middleware/authMiddleware');

router.use(authMiddleware);

router.get('/perfil', verPerfil);
router.put('/perfil', actualizarPerfil);
router.put('/cambiar-password', cambiarPassword);
router.get('/notificaciones', verNotificaciones);
router.put('/notificaciones/:id_notificacion/leer', marcarNotificacionLeida);
router.get('/reglas', verReglas);

module.exports = router;
