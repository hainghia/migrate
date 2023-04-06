create table distributor
(
    id               serial primary key,
    name_distributor varchar(50) not null unique,
    created_at       timestamptz not null default NOW(),
    updated_at       timestamptz not null default NOW(),
    deleted_at       timestamptz
);
