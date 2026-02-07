const express = require('express');
const router = express.Router();
const {
  crearSolicitud,
  verMisSolicitudes,
  cancelarSolicitud
} = require('../controllers/solicitudController');
const { authMiddleware, isMaestro } = require('../middleware/authMiddleware');

router.use(authMiddleware);
router.use(isMaestro);

router.post('/', crearSolicitud);
router.get('/mis-solicitudes', verMisSolicitudes);
router.put('/:id_solicitud/cancelar', cancelarSolicitud);

module.exports = router;
