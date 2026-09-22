# Seguimiento CETI — versión web propia

Esta es la versión del sistema que vive en su propia página web, con base de
datos y almacenamiento de archivos reales — no depende de Claude para nada
una vez que quede publicada.

No hace falta saber programar para instalarla, pero sí seguir estos pasos
en orden. Se hace todo con el mouse, sin usar la terminal.

Tiempo estimado: 20-30 minutos la primera vez.

---

## Paso 1 — Crear la base de datos (Supabase)

1. Entrá a **[supabase.com](https://supabase.com)** y creá una cuenta gratis
   (podés usar tu cuenta de Google/GitHub o un mail).
2. Creá un proyecto nuevo ("New project"). Ponele un nombre, por ejemplo
   `ceti-san-roque`, y una contraseña (guardala, es la de la base de datos,
   no la vas a necesitar en el día a día).
3. Esperá 1-2 minutos a que el proyecto termine de crearse.
4. Andá a **SQL Editor** (ícono en el menú de la izquierda) → **New query**.
5. Abrí el archivo `supabase-setup.sql` que te dejé en esta carpeta, copiá
   todo su contenido, pegalo ahí, y tocá **Run**. Esto crea la tabla de
   expedientes y el espacio para los documentos.
6. Andá a **Project Settings** (el ícono de engranaje) → **API**. Ahí vas a
   ver dos datos que necesitás para el paso 3:
   - **Project URL**
   - **anon public** (una clave larga)

## Paso 2 — Subir el código a GitHub

1. Entrá a **[github.com](https://github.com)** y creá una cuenta gratis.
2. Tocá el botón **+** arriba a la derecha → **New repository**.
3. Ponele un nombre, por ejemplo `ceti-san-roque`. Dejalo en **Public**
   (no importa, el link final va a ser el de Vercel, no el de GitHub).
   Tocá **Create repository**.
4. En la página del repositorio recién creado, buscá el link
   **"uploading an existing file"** (o el botón **Add file → Upload files**).
5. Arrastrá ahí los archivos de esta carpeta: `index.html`, `config.js`,
   `supabase-setup.sql` y este mismo `README.md`.
6. Antes de subir, editá `config.js` primero (ver Paso 3) — o subilo así y
   lo editás después directamente en GitHub, tocando el lápiz ✏️ sobre el
   archivo.

## Paso 3 — Completar config.js con tus datos

Abrí `config.js` (en tu compu, o con el lápiz ✏️ en GitHub) y reemplazá:

```js
window.CETI_CONFIG = {
  url: "PONÉ_ACÁ_TU_SUPABASE_PROJECT_URL",
  anonKey: "PONÉ_ACÁ_TU_SUPABASE_ANON_KEY",
  cetiPassword: "ceti2026"
};
```

con los datos que copiaste en el Paso 1.6. Guardá los cambios (si lo editaste
en GitHub, el botón dice "Commit changes").

## Paso 4 — Publicar el sitio (Vercel)

1. Entrá a **[vercel.com](https://vercel.com)** y creá una cuenta gratis
   — elegí la opción de registrarte **con GitHub**, así quedan conectados.
2. Tocá **Add New... → Project**.
3. Buscá el repositorio `ceti-san-roque` que creaste antes y tocá **Import**.
4. No hace falta tocar ninguna configuración — es un sitio simple. Tocá
   **Deploy**.
5. En un minuto te va a dar un link como `ceti-san-roque.vercel.app`.
   **Ese es el link definitivo** para compartir con alumnos y con CETI.

## Después de publicado

- **Cualquier cambio a `config.js` o `index.html`**: lo editás en GitHub
  (lápiz ✏️ sobre el archivo → editar → Commit changes) y Vercel actualiza
  el sitio solo, en menos de un minuto. No hay que "resubir" nada a Vercel.
- **Vista CETI**: se entra con la clave configurada en `cetiPassword`
  (por defecto `ceti2026` — cambiala en `config.js` si querés).
- **Límite de archivos**: quedó en 20 MB por documento, mucho más que la
  versión anterior. Se puede subir más en `index.html` (buscar
  `TAMANO_MAX_MB`) si Supabase lo permite en tu plan.

## Aviso importante de seguridad

Para que cualquiera pueda entrar sin necesidad de cuenta (como pediste),
la base de datos quedó configurada con acceso abierto: cualquiera que
tenga el link de la app puede leer y escribir datos. La única barrera
para las acciones de la Comisión es la clave de la Vista CETI dentro de
la aplicación — no es una autenticación real a nivel de base de datos.

Para un uso institucional más serio (por ejemplo, si más adelante se
maneja información sensible de pacientes), lo que corresponde es agregar
un sistema de usuarios real con Supabase Auth. Es un paso más, y te lo
puedo armar cuando llegue el momento — no hacía falta para esta primera
versión funcionando.
