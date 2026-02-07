const db = require('../config/database');

const verPerfil = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    const [result] = await db.query(
      'CALL procedure_usuario_ver_perfil(?)',
      [id_usuario]
    );

    if (result[0] && result[0][0]) {
      res.json({
        estado: 'EXITO',
        perfil: result[0][0]
      });
    } else {
      res.status(404).json({
        estado: 'ERROR',
        mensaje: 'Perfil no encontrado'
      });
    }
  } catch (error) {
    console.error('Error al ver perfil:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener perfil'
    });
  }
};

const actualizarPerfil = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { nombre, apellido_paterno, apellido_materno, email } = req.body;

    await db.query(
      'CALL procedure_usuario_actualizar_perfil(?, ?, ?, ?, ?)',
      [id_usuario, nombre, apellido_paterno, apellido_materno, email]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Perfil actualizado correctamente'
    });
  } catch (error) {
    console.error('Error al actualizar perfil:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al actualizar perfil'
    });
  }
};

const cambiarPassword = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { password_actual, password_nueva } = req.body;

    if (!password_actual || !password_nueva) {
      return res.status(400).json({
        estado: 'ERROR',
        mensaje: 'Se requiere contraseña actual y nueva'
      });
    }

    await db.query(
      'CALL procedure_usuario_cambiar_password(?, ?, ?)',
      [id_usuario, password_actual, password_nueva]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Contraseña cambiada correctamente'
    });
  } catch (error) {
    console.error('Error al cambiar password:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al cambiar contraseña'
    });
  }
};

const verNotificaciones = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    const [result] = await db.query(
      'CALL procedure_usuario_ver_notificaciones(?)',
      [id_usuario]
    );

    res.json({
      estado: 'EXITO',
      notificaciones: result[0] || []
    });
  } catch (error) {
    console.error('Error al ver notificaciones:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener notificaciones'
    });
  }
};

const marcarNotificacionLeida = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;
    const { id_notificacion } = req.params;

    await db.query(
      'CALL procedure_usuario_marcar_notificacion_leida(?, ?)',
      [id_usuario, id_notificacion]
    );

    res.json({
      estado: 'EXITO',
      mensaje: 'Notificación marcada como leída'
    });
  } catch (error) {
    console.error('Error al marcar notificación:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al marcar notificación'
    });
  }
};

const verReglas = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    const [result] = await db.query(
      'CALL procedure_usuario_ver_reglas(?)',
      [id_usuario]
    );

    res.json({
      estado: 'EXITO',
      reglas: result[0] || []
    });
  } catch (error) {
    console.error('Error al ver reglas:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al obtener reglas'
    });
  }
};

module.exports = {
  verPerfil,
  actualizarPerfil,
  cambiarPassword,
  verNotificaciones,
  marcarNotificacionLeida,
  verReglas
};
