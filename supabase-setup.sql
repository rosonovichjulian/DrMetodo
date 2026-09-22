-- ============================================================
-- Ejecutar TODO este script en Supabase → SQL Editor → New query → Run
-- ============================================================

-- Tabla donde vive cada expediente (un trabajo = una fila)
create table if not exists trabajos (
  id text primary key,
  data jsonb not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Activamos seguridad por fila y dejamos una política simple y abierta
-- (cualquiera con el link de la app puede leer y escribir, igual que
-- funcionaba en la versión de prueba). Si más adelante querés algo más
-- estricto, esto es lo primero que hay que endurecer.
alter table trabajos enable row level security;

drop policy if exists "acceso abierto trabajos" on trabajos;
create policy "acceso abierto trabajos"
  on trabajos for all
  using (true)
  with check (true);

-- Bucket de almacenamiento para los documentos adjuntos (PDF, Word, imágenes)
insert into storage.buckets (id, name, public)
values ('adjuntos', 'adjuntos', true)
on conflict (id) do nothing;

drop policy if exists "lectura publica adjuntos" on storage.objects;
create policy "lectura publica adjuntos"
  on storage.objects for select
  using (bucket_id = 'adjuntos');

drop policy if exists "subida publica adjuntos" on storage.objects;
create policy "subida publica adjuntos"
  on storage.objects for insert
  with check (bucket_id = 'adjuntos');

drop policy if exists "borrado publico adjuntos" on storage.objects;
create policy "borrado publico adjuntos"
  on storage.objects for delete
  using (bucket_id = 'adjuntos');
