create or replace function public.handle_new_user()
returns trigger
security definer
set search_path = public
as $$
begin
  insert into public.profiles (user_id, name)
  values (new.id, new.raw_user_meta_data->>'name');
  return new;
end;
$$ language plpgsql;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

create policy "Users can read own profile"
on public.profiles for select
using (auth.uid() = user_id);

create policy "Users can CRUD own tasks"
on public.tasks for all
using (auth.uid() = user_id);

alter table public.profiles enable row level security;
alter table public.tasks enable row level security;

create index idx_tasks_user_created
on public.tasks(user_id, created_at desc);
