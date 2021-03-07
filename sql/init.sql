GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;

\c postgres;

create table Users (
    id serial NOT NULL,
    created_at timestamp NOT NULL,
    name varchar(20),
    PRIMARY KEY (id)
);

GRANT ALL PRIVILEGES ON TABLE Users to postgres;

insert into Users (created_at, name) values (NOW(), '홍길동');

commit;