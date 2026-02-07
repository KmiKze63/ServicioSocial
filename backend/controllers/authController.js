const db = require('../config/database');
const jwt = require('jsonwebtoken');

const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({
        estado: 'ERROR',
        mensaje: 'Email y contraseña son requeridos'
      });
    }

    const [result] = await db.query(
      'CALL procedure_login_usuario(?, ?)',
      [email, password]
    );

    if (result[0] && result[0][0]) {
      const usuario = result[0][0];

      const token = jwt.sign(
        {
          id_usuario: usuario.id_usuario,
          email: usuario.email,
          rol: usuario.rol,
          nombre: usuario.nombre_completo
        },
        process.env.JWT_SECRET,
        { expiresIn: process.env.JWT_EXPIRE }
      );

      res.json({
        estado: 'EXITO',
        mensaje: 'Login exitoso',
        token,
        usuario: {
          id_usuario: usuario.id_usuario,
          email: usuario.email,
          nombre: usuario.nombre_completo,
          rol: usuario.rol,
          es_agremiado: usuario.es_agremiado
        }
      });
    } else {
      res.status(401).json({
        estado: 'ERROR',
        mensaje: 'Credenciales inválidas'
      });
    }
  } catch (error) {
    console.error('Error en login:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: error.sqlMessage || 'Error al iniciar sesión'
    });
  }
};

const logout = async (req, res) => {
  try {
    const { id_usuario } = req.usuario;

    await db.query('CALL procedure_usuario_cerrar_sesion(?)', [id_usuario]);

    res.json({
      estado: 'EXITO',
      mensaje: 'Sesión cerrada correctamente'
    });
  } catch (error) {
    console.error('Error en logout:', error);
    res.status(500).json({
      estado: 'ERROR',
      mensaje: 'Error al cerrar sesión'
    });
  }
};

module.exports = { login, logout };
