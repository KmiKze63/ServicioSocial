const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');

  if (!token) {
    return res.status(401).json({
      estado: 'ERROR',
      mensaje: 'Acceso denegado. No se proporcionó token.'
    });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.usuario = decoded;
    next();
  } catch (error) {
    res.status(401).json({
      estado: 'ERROR',
      mensaje: 'Token inválido o expirado'
    });
  }
};

const isAdmin = (req, res, next) => {
  if (req.usuario.rol !== 'Admin') {
    return res.status(403).json({
      estado: 'ERROR',
      mensaje: 'Acceso denegado. Se requieren permisos de administrador.'
    });
  }
  next();
};

const isMaestro = (req, res, next) => {
  if (req.usuario.rol !== 'Maestro' && req.usuario.rol !== 'Admin') {
    return res.status(403).json({
      estado: 'ERROR',
      mensaje: 'Acceso denegado. Se requieren permisos de maestro.'
    });
  }
  next();
};

module.exports = { authMiddleware, isAdmin, isMaestro };
