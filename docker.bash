## Create container with database mariadb + volumes +

docker run --name world-db -e MYSQL_USER=example-user -e MYSQL_PASSWORD=user-password -e MYSQL_ROOT_PASSWORD=root_secret_password -e MYSQL_DATABASE=world-db -p
3307:3306 -v world-db:/var/lib/mysql --network=world-app -d mariadb:10.9-jammy


## PHPMyAdmin and lightweight apache image
docker run --name phpmyadmin -d -e PMA_ARBITRARY=1 -p 8080:80 --network=world-app phpmyadmin:5.2.0-apache


############# Another way ###################

docker container run \
-dp 3307:3306 \
--name world-db \
--env MARIADB_USER_EXAMPLE=example_user \
--env MARIADB_PASSWORD=user-password \
--env MARIADB_ROOT_PASSWORD=root-secret-password \
--env MARIADB_DATABASE=world-db \
--volume world-db:/var/lib/mysql \
--network world-app \
mariadb:jammy

docker container run \
--name phpmyadmin \
-d \
-e PMA_ARBITARY=1 \
-p 8080:80 \
--network world-app \
phpmyadmin:5.2.0-apache



################ NODE VERSION ####################

docker container run \
--name nest-app \
-w /app \
-p 80:3000 \
-v "$(pwd)":/app \
node:16-alpine3.16 \
sh -c "yarn install && yarn start:dev"


############# POSTGRESS ###################

### CREAR BASE DE DATOS ##########
docker volume create postgres-db

####### LUEGO CREAMOS CONTENEDOR #######
docker container run \
-d \
--name postgres-db \
-e POSTGRES_PASSWORD=123456 \
-v postgres-db:/var/lib/postgresql/data \
postgres:15.1


############# PGADMIN #############

docker container run \
--name pgAdmin \
-e PGADMIN_DEFAULT_PASSWORD=123456 \
-e PGADMIN_DEFAULT_EMAIL=superman@google.com \
-dp 8080:80 \
dpage/pgadmin4:7.3