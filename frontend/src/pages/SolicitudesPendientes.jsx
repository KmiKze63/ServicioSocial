import { useState, useEffect } from 'react';
import { adminService } from '../services';
import '../styles/Admin.css';

const SolicitudesPendientes = () => {
  const [solicitudes, setSolicitudes] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    cargarSolicitudes();
  }, []);

  const cargarSolicitudes = async () => {
    try {
      const response = await adminService.listarSolicitudesPendientes();
      setSolicitudes(response.data.solicitudes);
      setLoading(false);
    } catch (error) {
      console.error('Error al cargar solicitudes:', error);
      setLoading(false);
    }
  };

  const handleAprobar = async (id) => {
    const comentario = prompt('Comentario (opcional):');
    try {
      await adminService.aprobarSolicitud(id, comentario);
      alert('Solicitud aprobada correctamente');
      cargarSolicitudes();
    } catch (error) {
      alert('Error al aprobar solicitud');
    }
  };

  const handleRechazar = async (id) => {
    const motivo = prompt('Motivo de rechazo (requerido):');
    if (!motivo) return;

    try {
      await adminService.rechazarSolicitud(id, motivo);
      alert('Solicitud rechazada correctamente');
      cargarSolicitudes();
    } catch (error) {
      alert('Error al rechazar solicitud');
    }
  };

  if (loading) return <div>Cargando...</div>;

  return (
    <div className="admin-container">
      <h1>Solicitudes Pendientes</h1>
      
      {solicitudes.length === 0 ? (
        <p>No hay solicitudes pendientes</p>
      ) : (
        <table className="admin-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Usuario</th>
              <th>Tipo</th>
              <th>Fecha Inicio</th>
              <th>Fecha Fin</th>
              <th>Días</th>
              <th>Motivo</th>
              <th>Fecha Solicitud</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {solicitudes.map((solicitud) => (
              <tr key={solicitud.id_solicitud}>
                <td>{solicitud.id_solicitud}</td>
                <td>{solicitud.nombre_usuario}</td>
                <td>{solicitud.tipo_permiso}</td>
                <td>{new Date(solicitud.fecha_inicio).toLocaleDateString()}</td>
                <td>{new Date(solicitud.fecha_fin).toLocaleDateString()}</td>
                <td>{solicitud.dias_solicitados}</td>
                <td>{solicitud.motivo}</td>
                <td>{new Date(solicitud.fecha_solicitud).toLocaleDateString()}</td>
                <td>
                  <button 
                    onClick={() => handleAprobar(solicitud.id_solicitud)}
                    className="btn-success"
                  >
                    Aprobar
                  </button>
                  <button 
                    onClick={() => handleRechazar(solicitud.id_solicitud)}
                    className="btn-danger"
                  >
                    Rechazar
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default SolicitudesPendientes;
