# postgres_docker

> Template repository for deploying PostgreSQL and pgAdmin using Docker-compose.

&nbsp;

## Prerequisites

|      Name      | Version  |                    Link                    |
| :------------: | :------: | :----------------------------------------: |
|     Docker     | ^20.10.5 | <https://docs.docker.com/engine/install/>  |
| Docker-compose | ^1.28.5  | <https://docs.docker.com/compose/install/> |

&nbsp;

## How to Use

```bash
$ git clone https://github.com/cheesecat47/postgres_docker.git
$ cd postgres_docker
```

### on Docker-compose

```bash
$ sudo docker-compose up -d && sudo docker-compose logs -f
```

### or Docker

```bash
$ sudo docker network create pg_network # name whatever you want

$ sudo docker volume create postgres
$ sudo docker run -d --name postgres_container \
    -p 54320:5432 \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=1234 \
    -e POSTGRES_DB=postgres \
    -v `pwd`/sql/:/docker-entrypoint-initdb.d/ \
    -v postgres:/var/lib/postgresql/data \
    --network pg_network \
    postgres

$ sudo docker volume create pgadmin
$ sudo docker run -d --name pgadmin_container \
    -p 54330:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=your-email@domain.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=qwer' \
    -v pgadmin:/var/lib/pgadmin \
    --network pg_network \
    dpage/pgadmin4
```

Go to <http://localhost:54330> to manage the DB.

For more information, visit [Here](https://cheesecat47.github.io/devblog/docker/2021/03/07/PostgreSQL-Docker.html).

&nbsp;

## Services

|    Name    |                    Link                    |
| :--------: | :----------------------------------------: |
| PostgreSQL |    <https://hub.docker.com/_/postgres>     |
|  pgAdmin4  | <https://hub.docker.com/r/dpage/pgadmin4/> |

&nbsp;

## Environment Variables

|  Service   |      Variable Name       |                                           Description                                           |
| :--------: | :----------------------: | :---------------------------------------------------------------------------------------------: |
| PostgreSQL |    POSTGRES_PASSWORD     | Required. This is set as superuser pw. The default superuser is defined by the `POSTGRES_USER`. |
| PostgreSQL |      POSTGRES_USER       |       Optional. If it is not specified, then the default user of `postgres` will be used.       |
| PostgreSQL |       POSTGRES_DB        |        Optional. If it is not specified, then the value of `POSTGRES_USER` will be used.        |
|  pgAdmin4  |  PGADMIN_DEFAULT_EMAIL   |            Required. It is used when setting up the initial admin account to login.             |
|  pgAdmin4  | PGADMIN_DEFAULT_PASSWORD |            Required. It is used when setting up the initial admin account to login.             |

&nbsp;

## Deploy Ports

|   Name   | Port # |
| :------: | :----: |
| postgres | 54320  |
| pgadmin  | 54330  |

&nbsp;

## About `sql` directory

Docker runs the `*.sql`, `*.sql.gz` and `*.sh` files in the `/docker-entrypoint-initdb.d/` folder **once** when the container is launched for the first time. Therefore, you can create initialization code, put that file or folder in the `/docker-entrypoint-initdb.d/` folder inside the container to initialize it as you wish.
