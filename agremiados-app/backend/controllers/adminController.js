const db = require('../db');

const listUsers = async (req, res) => {
    const { estado, rol } = req.query;
    try {
        const [results] = await db.query('CALL procedure_admin_listar_usuarios(?, ?, ?)', [estado || null, req.user.id, rol || null]);
        res.json(results[0]);
    } catch (error) {
        res.status(500).json({ message: 'Error al listar usuarios' });
    }
};

const listPendingRequests = async (req, res) => {
    try {
        const [results] = await db.query('CALL procedure_admin_listar_solicitudes_pendientes(?)', [req.user.id]);
        res.json(results[0]);
    } catch (error) {
        res.status(500).json({ message: 'Error al listar solicitudes pendientes' });
    }
};

module.exports = { listUsers, listPendingRequests };
