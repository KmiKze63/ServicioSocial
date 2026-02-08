import React, { useEffect, useState } from 'react';
import { User, ClipboardList, Settings, LogOut, Bell, LayoutDashboard } from 'lucide-react';
import axios from 'axios';

const Dashboard = () => {
    const [user, setUser] = useState(JSON.parse(localStorage.getItem('user') || '{}'));
    const [view, setView] = useState('overview');
    const [data, setData] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const token = localStorage.getItem('token');
                let endpoint = '';

                if (view === 'overview' || view === 'requests') {
                    endpoint = user.rol === 'Admin' ? '/api/admin/requests/pending' : '/api/user/profile';
                } else if (view === 'my_profile') {
                    endpoint = '/api/user/profile';
                } else if (view === 'my_requests') {
                    endpoint = '/api/user/requests';
                } else if (view === 'users' && user.rol === 'Admin') {
                    endpoint = '/api/admin/users';
                }

                if (endpoint) {
                    const res = await axios.get(`http://localhost:5000${endpoint}`, {
                        headers: { Authorization: `Bearer ${token}` }
                    });
                    setData(res.data);
                }
            } catch (err) {
                console.error('Fetch error:', err);
                setData(null);
            }
        };
        fetchData();
    }, [view, user.rol]);

    return (
        <div style={{ display: 'flex', minHeight: '100vh' }}>
            {/* Sidebar */}
            <aside className="glass-card" style={{ width: '280px', borderRadius: '0', borderLeft: 'none', borderTop: 'none', borderBottom: 'none' }}>
                <div style={{ paddingBottom: '2rem', borderBottom: '1px solid rgba(255,255,255,0.1)', marginBottom: '2rem' }}>
                    <h2 style={{ fontSize: '1.25rem' }}>Agremiados v1.0</h2>
                </div>

                <nav style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                    <MenuItem active={view === 'overview'} icon={<LayoutDashboard size={20} />} label="General" onClick={() => setView('overview')} />
                    {user.rol === 'Admin' ? (
                        <>
                            <MenuItem active={view === 'users'} icon={<User size={20} />} label="Maestros" onClick={() => setView('users')} />
                            <MenuItem active={view === 'requests'} icon={<ClipboardList size={20} />} label="Solicitudes" onClick={() => setView('requests')} />
                        </>
                    ) : (
                        <>
                            <MenuItem active={view === 'my_profile'} icon={<User size={20} />} label="Mi Perfil" onClick={() => setView('my_profile')} />
                            <MenuItem active={view === 'my_requests'} icon={<ClipboardList size={20} />} label="Mis Permisos" onClick={() => setView('my_requests')} />
                        </>
                    )}
                    <MenuItem active={view === 'settings'} icon={<Settings size={20} />} label="Configuración" onClick={() => setView('settings')} />

                    <div style={{ marginTop: 'auto', paddingTop: '2rem' }}>
                        <MenuItem label="Salir" icon={<LogOut size={20} />} onClick={() => { localStorage.clear(); window.location.href = '/login'; }} color="#ef4444" />
                    </div>
                </nav>
            </aside>

            {/* Main Content */}
            <main style={{ flex: 1, padding: '2.5rem', overflowY: 'auto' }}>
                <header style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '3rem' }}>
                    <div>
                        <h1>{view === 'overview' ? `Hola, ${user.nombre_completo}` : view.toUpperCase().replace('_', ' ')}</h1>
                        <p style={{ color: '#94a3b8' }}>{new Date().toLocaleDateString('es-MX', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}</p>
                    </div>
                    <div style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
                        <button className="glass-card" style={{ padding: '0.75rem', borderRadius: '50%', display: 'flex' }}>
                            <Bell size={20} />
                        </button>
                        <div className="glass-card" style={{ padding: '0.5rem 1rem', display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                            <div style={{ width: '32px', height: '32px', background: '#6366f1', borderRadius: '50%', display: 'flex', justifyContent: 'center', alignItems: 'center', fontWeight: 'bold' }}>
                                {user.nombre_completo?.[0]}
                            </div>
                            <span style={{ fontSize: '0.875rem' }}>{user.rol}</span>
                        </div>
                    </div>
                </header>

                <section>
                    {view === 'overview' && (
                        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '1.5rem' }}>
                            <StatCard title="Estado de Cuenta" value={user.estado} color="#10b981" />
                            <StatCard title="Es Agremiado" value={user.es_agremiado} color="#6366f1" />
                            {user.rol === 'Admin' && <StatCard title="Solicitudes Pendientes" value={Array.isArray(data) ? data.length : 0} color="#f59e0b" />}
                        </div>
                    )}

                    {(view === 'requests' || view === 'my_requests') && (
                        <div className="glass-card" style={{ padding: '1.5rem', overflowX: 'auto' }}>
                            <h3 style={{ marginBottom: '1.5rem' }}>{view === 'requests' ? 'Solicitudes Pendientes' : 'Mis Permisos'}</h3>
                            <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
                                <thead>
                                    <tr style={{ borderBottom: '1px solid rgba(255,255,255,0.1)', color: '#94a3b8' }}>
                                        <th style={{ padding: '1rem' }}>ID</th>
                                        <th style={{ padding: '1rem' }}>Tipo</th>
                                        <th style={{ padding: '1rem' }}>Inicio</th>
                                        <th style={{ padding: '1rem' }}>Fin</th>
                                        <th style={{ padding: '1rem' }}>Días</th>
                                        <th style={{ padding: '1rem' }}>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {Array.isArray(data) && data.length > 0 ? data.map(req => (
                                        <tr key={req.id_solicitud} style={{ borderBottom: '1px solid rgba(255,255,255,0.05)' }}>
                                            <td style={{ padding: '1rem' }}>#{req.id_solicitud}</td>
                                            <td style={{ padding: '1rem' }}>{req.tipo_permiso}</td>
                                            <td style={{ padding: '1rem' }}>{new Date(req.fecha_inicio).toLocaleDateString()}</td>
                                            <td style={{ padding: '1rem' }}>{new Date(req.fecha_fin).toLocaleDateString()}</td>
                                            <td style={{ padding: '1rem' }}>{req.dias_solicitados}</td>
                                            <td style={{ padding: '1rem' }}>
                                                <span style={{
                                                    padding: '0.25rem 0.75rem',
                                                    borderRadius: '1rem',
                                                    fontSize: '0.75rem',
                                                    background: req.estado === 'Pendiente' ? '#f59e0b20' : '#10b98120',
                                                    color: req.estado === 'Pendiente' ? '#f59e0b' : '#10b981'
                                                }}>
                                                    {req.estado}
                                                </span>
                                            </td>
                                        </tr>
                                    )) : (
                                        <tr><td colSpan="6" style={{ textAlign: 'center', padding: '2rem', color: '#94a3b8' }}>No hay datos disponibles.</td></tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    )}

                    {view === 'my_profile' && data && !Array.isArray(data) && (
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 2fr', gap: '2rem' }}>
                            <div className="glass-card" style={{ textAlign: 'center' }}>
                                <div style={{ width: '100px', height: '100px', background: '#6366f1', borderRadius: '50%', margin: '0 auto 1.5rem', display: 'flex', justifyContent: 'center', alignItems: 'center', fontSize: '2.5rem', fontWeight: 'bold' }}>
                                    {data.nombre?.[0]}
                                </div>
                                <h3>{data.nombre_completo}</h3>
                                <p style={{ color: '#94a3b8' }}>{data.rol}</p>
                                <div style={{ marginTop: '2rem', textAlign: 'left', fontSize: '0.875rem' }}>
                                    <p style={{ color: '#94a3b8', marginBottom: '0.25rem' }}>Estado de cuenta</p>
                                    <p style={{ marginBottom: '1rem' }}>{data.estado_usuario}</p>
                                    <p style={{ color: '#94a3b8', marginBottom: '0.25rem' }}>Último acceso</p>
                                    <p>{new Date(data.ultimo_acceso).toLocaleString()}</p>
                                </div>
                            </div>
                            <div className="glass-card">
                                <h3 style={{ marginBottom: '1.5rem' }}>Detalles Laborales</h3>
                                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }}>
                                    <InfoItem label="Matrícula" value={data.matricula || 'N/A'} />
                                    <InfoItem label="Facultad" value={data.facultad || 'N/A'} />
                                    <InfoItem label="Tipo de Contrato" value={data.tipo_contrato || 'N/A'} />
                                    <InfoItem label="Tipo de Jornada" value={data.tipo_jornada || 'N/A'} />
                                    <InfoItem label="Departamento" value={data.departamento || 'N/A'} />
                                    <InfoItem label="Puesto" value={data.puesto || 'N/A'} />
                                    <InfoItem label="Antigüedad" value={`${data.anios_antiguedad || 0} años`} />
                                    <InfoItem label="Ingreso" value={new Date(data.fecha_ingreso).toLocaleDateString()} />
                                </div>
                            </div>
                        </div>
                    )}

                    {['users', 'settings'].includes(view) && (
                        <div className="glass-card">
                            <p style={{ textAlign: 'center', padding: '4rem', color: '#94a3b8' }}>Módulo {view} en desarrollo para demostración.</p>
                        </div>
                    )}
                </section>
            </main>
        </div>
    );
};

const MenuItem = ({ icon, label, onClick, active, color }) => (
    <div
        onClick={onClick}
        style={{
            display: 'flex',
            alignItems: 'center',
            gap: '1rem',
            padding: '0.875rem 1.25rem',
            cursor: 'pointer',
            borderRadius: '0.75rem',
            background: active ? 'rgba(99, 102, 241, 0.15)' : 'transparent',
            color: active ? '#818cf8' : (color || 'inherit'),
            transition: 'all 0.2s',
            border: active ? '1px solid rgba(99, 102, 241, 0.3)' : '1px solid transparent'
        }}
    >
        {icon}
        <span style={{ fontWeight: active ? '600' : '400' }}>{label}</span>
    </div>
);

const InfoItem = ({ label, value }) => (
    <div>
        <p style={{ color: '#94a3b8', fontSize: '0.75rem', textTransform: 'uppercase', letterSpacing: '0.05em', marginBottom: '0.25rem' }}>{label}</p>
        <p style={{ fontWeight: '500' }}>{value}</p>
    </div>
);

const StatCard = ({ title, value, color }) => (
    <div className="glass-card" style={{ borderLeft: `4px solid ${color}` }}>
        <h4 style={{ color: '#94a3b8', fontSize: '0.875rem', marginBottom: '0.5rem' }}>{title}</h4>
        <p style={{ fontSize: '1.75rem', fontWeight: 'bold' }}>{value}</p>
    </div>
);

export default Dashboard;
