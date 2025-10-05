sudo apt install postgresql-client-common postgresql-client
psql --version

psql -h localhost -p 6432 -U postgres -d appdb

CREATE TABLE teste (id serial PRIMARY KEY, nome text);
INSERT INTO teste (nome) VALUES ('Replica funcionando!');

docker exec -it pg2 psql -U postgres -d appdb -c "SELECT * FROM teste;"
docker exec -it pg3 psql -U postgres -d appdb -c "SELECT * FROM teste;"