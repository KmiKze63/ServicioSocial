const db = require('../db');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const login = async (req, res) => {
    const { email, password } = req.body;

    try {
        // 1. Primero obtener el hash almacenado
        const [userRows] = await db.query(
            'SELECT password_hash FROM tb_usuario WHERE email = ? LIMIT 1',
            [email]
        );

        if (userRows.length === 0) {
            return res.status(401).json({
                success: false,
                message: 'Credenciales incorrectas'
            });
        }

        const storedHash = userRows[0].password_hash;

        // 2. Verificar contraseña con bcrypt
        const passwordMatch = await bcrypt.compare(password, storedHash);
        if (!passwordMatch) {
            return res.status(401).json({
                success: false,
                message: 'Credenciales incorrectas'
            });
        }

        // 3. Llamar al stored procedure con el hash correcto
        const [results] = await db.query('CALL procedure_login_usuario(?, ?)', [email, storedHash]);

        const loginData = results[0][0];

        if (loginData.tipo_respuesta === 'SUCCESS') {
            const token = jwt.sign(
                { id: loginData.id_usuario, rol: loginData.rol },
                process.env.JWT_SECRET,
                { expiresIn: '8h' }
            );

            res.json({
                success: true,
                token,
                user: {
                    id_usuario: loginData.id_usuario,
                    nombre_completo: loginData.nombre_completo,
                    rol: loginData.rol,
                    estado: loginData.estado,
                    es_agremiado: loginData.es_agremiado
                }
            });
        } else {
            res.status(401).json({
                success: false,
                message: loginData.mensaje || 'Credenciales incorrectas'
            });
        }
    } catch (error) {
        console.error('Error in login:', error);
        res.status(500).json({ success: false, message: 'Error interno del servidor' });
    }
};

module.exports = { login };
