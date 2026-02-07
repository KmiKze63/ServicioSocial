import { Navigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

export const PrivateRoute = ({ children, requireAdmin = false }) => {
  const { usuario, loading } = useAuth();

  if (loading) {
    return <div>Cargando...</div>;
  }

  if (!usuario) {
    return <Navigate to="/login" />;
  }

  if (requireAdmin && usuario.rol !== 'Admin') {
    return <Navigate to="/dashboard" />;
  }

  return children;
};
