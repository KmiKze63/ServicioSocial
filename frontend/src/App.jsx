import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider } from './context/AuthContext';
import { PrivateRoute } from './components/PrivateRoute';
import Login from './pages/Login';
import Dashboard from './pages/Dashboard';
import Perfil from './pages/Perfil';
import MisSolicitudes from './pages/MisSolicitudes';
import NuevaSolicitud from './pages/NuevaSolicitud';
import SolicitudesPendientes from './pages/SolicitudesPendientes';
import './App.css';

function App() {
  return (
    <AuthProvider>
      <Router>
        <Routes>
          <Route path="/login" element={<Login />} />
          
          <Route
            path="/dashboard"
            element={
              <PrivateRoute>
                <Dashboard />
              </PrivateRoute>
            }
          />
          
          <Route
            path="/perfil"
            element={
              <PrivateRoute>
                <Perfil />
              </PrivateRoute>
            }
          />
          
          <Route
            path="/solicitudes/mis-solicitudes"
            element={
              <PrivateRoute>
                <MisSolicitudes />
              </PrivateRoute>
            }
          />
          
          <Route
            path="/solicitudes/nueva"
            element={
              <PrivateRoute>
                <NuevaSolicitud />
              </PrivateRoute>
            }
          />
          
          <Route
            path="/admin/solicitudes"
            element={
              <PrivateRoute requireAdmin={true}>
                <SolicitudesPendientes />
              </PrivateRoute>
            }
          />
          
          <Route path="/" element={<Navigate to="/dashboard" />} />
        </Routes>
      </Router>
    </AuthProvider>
  );
}

export default App;
