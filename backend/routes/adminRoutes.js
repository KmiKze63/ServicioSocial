const express = require('express');
const router = express.Router();
const {
  listarUsuarios,
  crearUsuario,
  actualizarUsuario,
  listarSolicitudesPendientes,
  aprobarSolicitud,
  rechazarSolicitud,
  verAuditoria,
  reporteDiasUsados
} = require('../controllers/adminController');
const { authMiddleware, isAdmin } = require('../middleware/authMiddleware');

router.use(authMiddleware);
router.use(isAdmin);

router.get('/usuarios', listarUsuarios);
router.post('/usuarios', crearUsuario);
router.put('/usuarios/:id_usuario_editar', actualizarUsuario);

router.get('/solicitudes/pendientes', listarSolicitudesPendientes);
router.put('/solicitudes/:id_solicitud/aprobar', aprobarSolicitud);
router.put('/solicitudes/:id_solicitud/rechazar', rechazarSolicitud);

router.get('/auditoria', verAuditoria);
router.get('/reportes/dias-usados', reporteDiasUsados);

module.exports = router;
