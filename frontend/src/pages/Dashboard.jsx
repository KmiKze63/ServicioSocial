import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import '../styles/Dashboard.css';

const Dashboard = () => {
  const { usuario, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = async () => {
    await logout();
    navigate('/login');
  };

  return (
    <div className="dashboard-container">
      <nav className="navbar">
        <div className="navbar-brand">
          <h2>Sistema de Agremiados</h2>
        </div>
        <div className="navbar-user">
          <span>{usuario?.nombre}</span>
          <span className="badge">{usuario?.rol}</span>
          <button onClick={handleLogout} className="btn-logout">Cerrar Sesión</button>
        </div>
      </nav>

      <div className="dashboard-content">
        <aside className="sidebar">
          <ul>
            <li><Link to="/dashboard">Inicio</Link></li>
            <li><Link to="/perfil">Mi Perfil</Link></li>
            <li><Link to="/notificaciones">Notificaciones</Link></li>
            
            {(usuario?.rol === 'Maestro' || usuario?.rol === 'Admin') && (
              <>
                <li className="menu-section">Solicitudes</li>
                <li><Link to="/solicitudes/nueva">Nueva Solicitud</Link></li>
                <li><Link to="/solicitudes/mis-solicitudes">Mis Solicitudes</Link></li>
              </>
            )}

            {usuario?.rol === 'Admin' && (
              <>
                <li className="menu-section">Administración</li>
                <li><Link to="/admin/usuarios">Usuarios</Link></li>
                <li><Link to="/admin/solicitudes">Solicitudes Pendientes</Link></li>
                <li><Link to="/admin/reportes">Reportes</Link></li>
                <li><Link to="/admin/auditoria">Auditoría</Link></li>
              </>
            )}
          </ul>
        </aside>

        <main className="main-content">
          <div className="welcome-section">
            <h1>Bienvenido, {usuario?.nombre}</h1>
            <p>Rol: {usuario?.rol}</p>
            {usuario?.es_agremiado === 'Sí' && (
              <p className="badge-agremiado">Agremiado Activo</p>
            )}
          </div>

          <div className="dashboard-cards">
            <div className="card">
              <h3>Mi Perfil</h3>
              <p>Ver y actualizar información personal</p>
              <Link to="/perfil" className="btn-primary">Ver Perfil</Link>
            </div>

            {(usuario?.rol === 'Maestro' || usuario?.rol === 'Admin') && (
              <div className="card">
                <h3>Solicitudes</h3>
                <p>Gestionar solicitudes de permisos</p>
                <Link to="/solicitudes/mis-solicitudes" className="btn-primary">Ver Solicitudes</Link>
              </div>
            )}

            {usuario?.rol === 'Admin' && (
              <div className="card">
                <h3>Panel de Administración</h3>
                <p>Gestionar usuarios y solicitudes</p>
                <Link to="/admin/usuarios" className="btn-primary">Administrar</Link>
              </div>
            )}
          </div>
        </main>
      </div>
    </div>
  );
};

export default Dashboard;
