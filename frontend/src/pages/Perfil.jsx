import { useState, useEffect } from 'react';
import { useAuth } from '../context/AuthContext';
import { usuarioService } from '../services';
import '../styles/Perfil.css';

const Perfil = () => {
  const { usuario } = useAuth();
  const [perfil, setPerfil] = useState(null);
  const [loading, setLoading] = useState(true);
  const [editMode, setEditMode] = useState(false);
  const [formData, setFormData] = useState({});
  const [mensaje, setMensaje] = useState('');

  useEffect(() => {
    cargarPerfil();
  }, []);

  const cargarPerfil = async () => {
    try {
      const response = await usuarioService.verPerfil();
      setPerfil(response.data.perfil);
      setFormData(response.data.perfil);
      setLoading(false);
    } catch (error) {
      console.error('Error al cargar perfil:', error);
      setLoading(false);
    }
  };

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await usuarioService.actualizarPerfil({
        nombre: formData.nombre,
        apellido_paterno: formData.apellido_paterno,
        apellido_materno: formData.apellido_materno,
        email: formData.email
      });
      setMensaje('Perfil actualizado correctamente');
      setEditMode(false);
      cargarPerfil();
    } catch (error) {
      setMensaje('Error al actualizar perfil');
    }
  };

  if (loading) return <div>Cargando...</div>;

  return (
    <div className="perfil-container">
      <h1>Mi Perfil</h1>
      
      {mensaje && <div className="mensaje">{mensaje}</div>}

      {!editMode ? (
        <div className="perfil-info">
          <div className="info-group">
            <label>Nombre Completo:</label>
            <p>{perfil?.nombre_completo}</p>
          </div>
          <div className="info-group">
            <label>Email:</label>
            <p>{perfil?.email}</p>
          </div>
          <div className="info-group">
            <label>Rol:</label>
            <p>{perfil?.rol}</p>
          </div>
          <div className="info-group">
            <label>Estado:</label>
            <p>{perfil?.estado_usuario}</p>
          </div>
          
          {perfil?.es_agremiado === 'Sí' && (
            <>
              <h2>Información de Agremiado</h2>
              <div className="info-group">
                <label>Matrícula:</label>
                <p>{perfil?.matricula}</p>
              </div>
              <div className="info-group">
                <label>Facultad:</label>
                <p>{perfil?.facultad}</p>
              </div>
              <div className="info-group">
                <label>Tipo de Contrato:</label>
                <p>{perfil?.tipo_contrato}</p>
              </div>
              <div className="info-group">
                <label>Tipo de Jornada:</label>
                <p>{perfil?.tipo_jornada}</p>
              </div>
              <div className="info-group">
                <label>Años de Antigüedad:</label>
                <p>{perfil?.anios_antiguedad}</p>
              </div>
              <div className="info-group">
                <label>Departamento:</label>
                <p>{perfil?.departamento}</p>
              </div>
              <div className="info-group">
                <label>Puesto:</label>
                <p>{perfil?.puesto}</p>
              </div>
            </>
          )}
          
          <button onClick={() => setEditMode(true)} className="btn-primary">
            Editar Perfil
          </button>
        </div>
      ) : (
        <form onSubmit={handleSubmit} className="perfil-form">
          <div className="form-group">
            <label>Nombre:</label>
            <input
              type="text"
              name="nombre"
              value={formData.nombre || ''}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-group">
            <label>Apellido Paterno:</label>
            <input
              type="text"
              name="apellido_paterno"
              value={formData.apellido_paterno || ''}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-group">
            <label>Apellido Materno:</label>
            <input
              type="text"
              name="apellido_materno"
              value={formData.apellido_materno || ''}
              onChange={handleChange}
            />
          </div>
          <div className="form-group">
            <label>Email:</label>
            <input
              type="email"
              name="email"
              value={formData.email || ''}
              onChange={handleChange}
              required
            />
          </div>
          <div className="form-actions">
            <button type="submit" className="btn-primary">Guardar</button>
            <button type="button" onClick={() => setEditMode(false)} className="btn-secondary">
              Cancelar
            </button>
          </div>
        </form>
      )}
    </div>
  );
};

export default Perfil;
