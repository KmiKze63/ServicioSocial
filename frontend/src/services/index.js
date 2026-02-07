import api from './api';

export const authService = {
  login: async (email, password) => {
    const response = await api.post('/auth/login', { email, password });
    if (response.data.token) {
      localStorage.setItem('token', response.data.token);
      localStorage.setItem('usuario', JSON.stringify(response.data.usuario));
    }
    return response.data;
  },

  logout: async () => {
    await api.post('/auth/logout');
    localStorage.removeItem('token');
    localStorage.removeItem('usuario');
  },

  getCurrentUser: () => {
    const usuario = localStorage.getItem('usuario');
    return usuario ? JSON.parse(usuario) : null;
  },

  isAuthenticated: () => {
    return !!localStorage.getItem('token');
  }
};

export const usuarioService = {
  verPerfil: () => api.get('/usuario/perfil'),
  actualizarPerfil: (datos) => api.put('/usuario/perfil', datos),
  cambiarPassword: (datos) => api.put('/usuario/cambiar-password', datos),
  verNotificaciones: () => api.get('/usuario/notificaciones'),
  marcarNotificacionLeida: (id) => api.put(`/usuario/notificaciones/${id}/leer`),
  verReglas: () => api.get('/usuario/reglas')
};

export const solicitudService = {
  crearSolicitud: (datos) => api.post('/solicitudes', datos),
  verMisSolicitudes: () => api.get('/solicitudes/mis-solicitudes'),
  cancelarSolicitud: (id, motivo) => api.put(`/solicitudes/${id}/cancelar`, { motivo_cancelacion: motivo })
};

export const adminService = {
  listarUsuarios: () => api.get('/admin/usuarios'),
  crearUsuario: (datos) => api.post('/admin/usuarios', datos),
  actualizarUsuario: (id, datos) => api.put(`/admin/usuarios/${id}`, datos),
  listarSolicitudesPendientes: () => api.get('/admin/solicitudes/pendientes'),
  aprobarSolicitud: (id, comentario) => api.put(`/admin/solicitudes/${id}/aprobar`, { comentario_admin: comentario }),
  rechazarSolicitud: (id, motivo) => api.put(`/admin/solicitudes/${id}/rechazar`, { motivo_rechazo: motivo }),
  verAuditoria: (fechaInicio, fechaFin) => api.get('/admin/auditoria', { params: { fecha_inicio: fechaInicio, fecha_fin: fechaFin } }),
  reporteDiasUsados: (idAgremiado, anio) => api.get('/admin/reportes/dias-usados', { params: { id_agremiado: idAgremiado, anio } })
};
