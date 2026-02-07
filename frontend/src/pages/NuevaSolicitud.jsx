import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { solicitudService } from '../services';
import '../styles/Solicitudes.css';

const NuevaSolicitud = () => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    tipo_permiso: 'Vacaciones',
    fecha_inicio: '',
    fecha_fin: '',
    motivo: ''
  });
  const [mensaje, setMensaje] = useState('');
  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMensaje('');

    try {
      await solicitudService.crearSolicitud({
        ...formData,
        id_periodo_fk: null
      });
      setMensaje('Solicitud creada correctamente');
      setTimeout(() => {
        navigate('/solicitudes/mis-solicitudes');
      }, 2000);
    } catch (error) {
      setMensaje(error.response?.data?.mensaje || 'Error al crear solicitud');
      setLoading(false);
    }
  };

  return (
    <div className="solicitud-form-container">
      <h1>Nueva Solicitud de Permiso</h1>
      
      {mensaje && (
        <div className={mensaje.includes('Error') ? 'error-message' : 'success-message'}>
          {mensaje}
        </div>
      )}

      <form onSubmit={handleSubmit} className="solicitud-form">
        <div className="form-group">
          <label>Tipo de Permiso:</label>
          <select
            name="tipo_permiso"
            value={formData.tipo_permiso}
            onChange={handleChange}
            required
          >
            <option value="Vacaciones">Vacaciones</option>
            <option value="Permiso Económico">Permiso Económico</option>
            <option value="Licencia Médica">Licencia Médica</option>
            <option value="Comisión">Comisión</option>
          </select>
        </div>

        <div className="form-group">
          <label>Fecha de Inicio:</label>
          <input
            type="date"
            name="fecha_inicio"
            value={formData.fecha_inicio}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label>Fecha de Fin:</label>
          <input
            type="date"
            name="fecha_fin"
            value={formData.fecha_fin}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label>Motivo:</label>
          <textarea
            name="motivo"
            value={formData.motivo}
            onChange={handleChange}
            rows="4"
            placeholder="Describe el motivo de tu solicitud..."
            required
          />
        </div>

        <div className="form-actions">
          <button type="submit" disabled={loading} className="btn-primary">
            {loading ? 'Enviando...' : 'Enviar Solicitud'}
          </button>
          <button 
            type="button" 
            onClick={() => navigate('/solicitudes/mis-solicitudes')}
            className="btn-secondary"
          >
            Cancelar
          </button>
        </div>
      </form>
    </div>
  );
};

export default NuevaSolicitud;
