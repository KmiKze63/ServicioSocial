import { createContext, useState, useContext, useEffect } from 'react';
import { authService } from '../services';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [usuario, setUsuario] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const user = authService.getCurrentUser();
    setUsuario(user);
    setLoading(false);
  }, []);

  const login = async (email, password) => {
    const response = await authService.login(email, password);
    setUsuario(response.usuario);
    return response;
  };

  const logout = async () => {
    await authService.logout();
    setUsuario(null);
  };

  const isAdmin = () => usuario?.rol === 'Admin';
  const isMaestro = () => usuario?.rol === 'Maestro';

  return (
    <AuthContext.Provider value={{ usuario, login, logout, loading, isAdmin, isMaestro }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth debe usarse dentro de AuthProvider');
  }
  return context;
};
