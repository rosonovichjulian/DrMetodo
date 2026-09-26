// ============================================================
// CONFIGURACIÓN — url y anonKey de tu proyecto de Supabase
// ============================================================
//
// Panel de Supabase → Project Settings → API
//   - "Project URL"       → pegar en "url"
//   - "Publishable key"   → pegar en "anonKey"
//
// El acceso de CETI ya NO se maneja con una clave acá: ahora cada persona
// entra con su propia cuenta (email + contraseña), y quién tiene permisos
// de CETI se controla en la tabla "admins" dentro de Supabase (ver README.md).

window.CETI_CONFIG = {
  url: "https://sgvuzflggqzanltmwabp.supabase.co",
  anonKey: "sb_publishable_dEwazSM6AOBMA1QcEdTnHA_jRso0PPo"
};
