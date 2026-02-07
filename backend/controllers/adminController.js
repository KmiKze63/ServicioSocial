const db = require('../config/database');

const listarUsuarios = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    const [result] = await db.query(
      'CALL procedure_admin_listar_usuarios(?)',
      [id_usuario]
    );

    res.json({
      estado: 'EXITO',
      usuarios: result[0] || []
    });
  } catch (error) {
    console.error('Error al listar usuarios:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener usuarios'
    });
  }
};

const crearUsuario = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { email, password, nombre, apellido_paterno, apellido_materno, id_rol } = req.body;

    await db.query(
      'CALL procedure_admin_crear_usuario(?, ?, ?, ?, ?, ?, ?)',
      [id_usuario, email, password, nombre, apellido_paterno, apellido_materno, id_rol]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Usuario creado correctamente'
    });
  } catch (error) {
    console.error('Error al crear usuario:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al crear usuario'
    });
  }
};

const actualizarUsuario = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { id_usuario_editar } = req.params;
    const { email, nombre, apellido_paterno, apellido_materno, id_rol, estado } = req.body;

    await db.query(
      'CALL procedure_admin_actualizar_usuario(?, ?, ?, ?, ?, ?, ?, ?)',
      [id_usuario, id_usuario_editar, email, nombre, apellido_paterno, apellido_materno, id_rol, estado]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Usuario actualizado correctamente'
    });
  } catch (error) {
    console.error('Error al actualizar usuario:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al actualizar usuario'
    });
  }
};

const listarSolicitudesPendientes = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    const [result] = await db.query(
      'CALL procedure_admin_listar_solicitudes_pendientes(?)',
      [id_usuario]
    );

    res.json({
      estado: 'EXITO',
      solicitudes: result[0] || []
    });
  } catch (error) {
    console.error('Error al listar solicitudes:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener solicitudes'
    });
  }
};

const aprobarSolicitud = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { id_solicitud } = req.params;
    const { comentario_admin } = req.body;

    await db.query(
      'CALL procedure_admin_aprobar_solicitud(?, ?, ?)',
      [id_usuario, id_solicitud, comentario_admin]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Solicitud aprobada correctamente'
    });
  } catch (error) {
    console.error('Error al aprobar solicitud:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al aprobar solicitud'
    });
  }
};

const rechazarSolicitud = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { id_solicitud } = req.params;
    const { motivo_rechazo } = req.body;

    if (!motivo_rechazo) {
      return res.status(400).json({
        estado: 'ERROR',
        mensaje: 'Se requiere un motivo de rechazo'
      });
    }

    await db.query(
      'CALL procedure_admin_rechazar_solicitud(?, ?, ?)',
      [id_usuario, id_solicitud, motivo_rechazo]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Solicitud rechazada correctamente'
    });
  } catch (error) {
    console.error('Error al rechazar solicitud:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al rechazar solicitud'
    });
  }
};

const verAuditoria = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { fecha_inicio, fecha_fin } = req.query;

    const [result] = await db.query(
      'CALL procedure_admin_ver_auditoria(?, ?, ?)',
      [id_usuario, fecha_inicio || null, fecha_fin || null]
    );

    res.json({
      estado: 'EXITO',
      auditoria: result[0] || []
    });
  } catch (error) {
    console.error('Error al ver auditoría:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener auditoría'
    });
  }
};

const reporteDiasUsados = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { id_agremiado, anio } = req.query;

    const [result] = await db.query(
      'CALL procedure_admin_reporte_dias_usados_por_maestro(?, ?, ?)',
      [id_usuario, id_agremiado, anio]
    );

    res.json({
      estado: 'EXITO',
      reporte: result[0] || []
    });
  } catch (error) {
    console.error('Error en reporte:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al generar reporte'
    });
  }
};

module.exports = {
  listarUsuarios,
  crearUsuario,
  actualizarUsuario,
  listarSolicitudesPendientes,
  aprobarSolicitud,
  rechazarSolicitud,
  verAuditoria,
  reporteDiasUsados
};
