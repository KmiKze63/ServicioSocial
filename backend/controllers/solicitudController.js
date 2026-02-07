const db = require('../config/database');

const crearSolicitud = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const {
      id_periodo_fk,
      tipo_permiso,
      fecha_inicio,
      fecha_fin,
      motivo
    } = req.body;

    const [result] = await db.query(
      'CALL procedure_usuario_crear_solicitud(?, ?, ?, ?, ?, ?)',
      [id_usuario, id_periodo_fk, tipo_permiso, fecha_inicio, fecha_fin, motivo]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Solicitud creada correctamente',
      solicitud: result[0] ? result[0][0] : null
    });
  } catch (error) {
    console.error('Error al crear solicitud:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al crear solicitud'
    });
  }
};

const verMisSolicitudes = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    const [result] = await db.query(
      'CALL procedure_usuario_ver_mis_solicitudes(?)',
      [id_usuario]
    );

    res.json({
      estado: 'EXITO',
      solicitudes: result[0] || []
    });
  } catch (error) {
    console.error('Error al ver solicitudes:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener solicitudes'
    });
  }
};

const cancelarSolicitud = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { id_solicitud } = req.params;
    const { motivo_cancelacion } = req.body;

    await db.query(
      'CALL procedure_usuario_cancelar_solicitud(?, ?, ?)',
      [id_usuario, id_solicitud, motivo_cancelacion]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Solicitud cancelada correctamente'
    });
  } catch (error) {
    console.error('Error al cancelar solicitud:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al cancelar solicitud'
    });
  }
};

module.exports = {
  crearSolicitud,
  verMisSolicitudes,
  cancelarSolicitud
};
