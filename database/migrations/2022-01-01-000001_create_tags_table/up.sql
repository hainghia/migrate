create table tags
(
    id         serial primary key,
    name_tag   varchar(255),
    created_at timestamptz not null default NOW(),
    updated_at timestamptz not null default NOW(),
    deleted_at timestamptz
);
