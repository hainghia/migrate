## Git Repositories

- [GitHub](https://github.com/rust-pro/web-server)
- [GitLab](https://gitlab.com/rust-inc/web-server)
- [Bitbucket](https://bitbucket.org/hainghia/web-server)

### Remote repository

```shell
git remote -v
git add .; git commit -asm "Initial commit";git push origin main;
```


### [Diesel CLI](https://diesel.rs/guides/getting-started.html)

```shell
#Install the CLI tool
cargo install diesel_cli
```

If you run into an error like:

> *note: ld: library not found for -lmysqlclient* <br>
> clang: error: linker command failed with exit code 1 (use -v to see invocation)

By default diesel depends on the following client libraries:

- [libpq](https://www.postgresql.org/docs/current/libpq.html) for the PostgreSQL backend
- [libmysqlclient](https://dev.mysql.com/doc/c-api/8.0/en/c-api-implementations.html) for the Mysql backend
- [libsqlite3](https://www.sqlite.org/index.html) for the SQlite backend

```shell
cargo install diesel_cli --no-default-features --features postgres
```

- setting the `DATABASE_URL` environment variable

```shell
# DATABASE_URL: postgres://{user}:{password}@{hostname}:{port}/{database-name}
echo DATABASE_URL=postgres://postgres:password@localhost:5432/documents > .env
```

- Setup Diesel for your project

```shell 
diesel setup
```

- Generate a new migration with the given name, and the current timestamp as the version.

```shell
diesel migration generate create_posts
```

- Next, we’ll write the SQL for migrations:

```postgresql
CREATE TABLE posts
(
    id        SERIAL PRIMARY KEY,
    title     VARCHAR NOT NULL,
    body      TEXT    NOT NULL,
    published BOOLEAN NOT NULL DEFAULT FALSE
)
```

And

```postgresql
DROP TABLE posts
```

- Runs all pending migrations.

```shell
diesel migration run
```

- Reverts and re-runs the latest migration. Useful for testing that a migration can in fact be reverted.

```shell
diesel migration redo --all
```

- Reverts the specified migrations.

```shell
diesel migration revert --all
```

- Returns true if there are any pending migrations.

```shell
diesel migration pending
```

- Lists all available migrations, marking those that have been applied.

```shell
diesel migration list
```
