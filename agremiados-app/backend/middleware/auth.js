const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
    const token = req.headers['authorization']?.split(' ')[1];

    if (!token) {
        return res.status(403).json({ message: 'No se proporcionó un token' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded;
        next();
    } catch (err) {
        return res.status(401).json({ message: 'Token inválido o expirado' });
    }
};

const isAdmin = (req, res, next) => {
    if (req.user && req.user.rol === 'Admin') {
        next();
    } else {
        return res.status(403).json({ message: 'Se requieren privilegios de administrador' });
    }
};

module.exports = { verifyToken, isAdmin };
