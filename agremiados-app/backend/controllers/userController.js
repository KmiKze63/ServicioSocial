const db = require('../db');

const getProfile = async (req, res) => {
    try {
        const [results] = await db.query('CALL procedure_usuario_ver_perfil(?)', [req.user.id]);
        res.json(results[0][0]);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener el perfil' });
    }
};

const getMyRequests = async (req, res) => {
    try {
        const [results] = await db.query('CALL procedure_usuario_ver_mis_solicitudes(?)', [req.user.id]);
        res.json(results[0]);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener las solicitudes' });
    }
};

module.exports = { getProfile, getMyRequests };
