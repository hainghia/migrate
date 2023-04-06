create table customer_tag
(
    id             serial primary key,
    distributor_id integer references customer not null,
    tag_id         integer references tags        not null,
    created_at     timestamptz                    not null default NOW(),
    updated_at     timestamptz                    not null default NOW(),
    deleted_at     timestamptz
);
