import { useState, useEffect } from 'react';
import { solicitudService } from '../services';
import '../styles/Solicitudes.css';

const MisSolicitudes = () => {
  const [solicitudes, setSolicitudes] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    cargarSolicitudes();
  }, []);

  const cargarSolicitudes = async () => {
    try {
      const response = await solicitudService.verMisSolicitudes();
      setSolicitudes(response.data.solicitudes);
      setLoading(false);
    } catch (error) {
      console.error('Error al cargar solicitudes:', error);
      setLoading(false);
    }
  };

  const handleCancelar = async (id) => {
    if (!window.confirm('¿Estás seguro de cancelar esta solicitud?')) return;
    
    const motivo = prompt('Ingresa el motivo de cancelación:');
    if (!motivo) return;

    try {
      await solicitudService.cancelarSolicitud(id, motivo);
      alert('Solicitud cancelada correctamente');
      cargarSolicitudes();
    } catch (error) {
      alert('Error al cancelar solicitud');
    }
  };

  if (loading) return <div>Cargando...</div>;

  return (
    <div className="solicitudes-container">
      <h1>Mis Solicitudes</h1>
      
      {solicitudes.length === 0 ? (
        <p>No tienes solicitudes registradas</p>
      ) : (
        <table className="solicitudes-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Tipo</th>
              <th>Fecha Inicio</th>
              <th>Fecha Fin</th>
              <th>Días</th>
              <th>Estado</th>
              <th>Fecha Solicitud</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {solicitudes.map((solicitud) => (
              <tr key={solicitud.id_solicitud}>
                <td>{solicitud.id_solicitud}</td>
                <td>{solicitud.tipo_permiso}</td>
                <td>{new Date(solicitud.fecha_inicio).toLocaleDateString()}</td>
                <td>{new Date(solicitud.fecha_fin).toLocaleDateString()}</td>
                <td>{solicitud.dias_solicitados}</td>
                <td>
                  <span className={`badge badge-${solicitud.estado_solicitud.toLowerCase()}`}>
                    {solicitud.estado_solicitud}
                  </span>
                </td>
                <td>{new Date(solicitud.fecha_solicitud).toLocaleDateString()}</td>
                <td>
                  {solicitud.estado_solicitud === 'Pendiente' && (
                    <button 
                      onClick={() => handleCancelar(solicitud.id_solicitud)}
                      className="btn-danger"
                    >
                      Cancelar
                    </button>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default MisSolicitudes;
