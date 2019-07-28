sudo -u postgres dropdb sweden
sudo -u postgres createdb --encoding=UTF8 --owner=giuser sweden
psql --username=postgres --dbname=sweden -c "CREATE EXTENSION postgis;"
psql --username=postgres --dbname=sweden -c "CREATE EXTENSION hstore;"
psql --username=postgres -d sweden -f ~/pgsnapshot_schema_0.6.sql
psql --username=postgres -d sweden -f ~/pgsnapshot_schema_0.6_bbox.sql


~/osmosi --read-pbf file="sweden-latest.osm.pbf" --log-progress --write-pgsql database=sweden host=localhost:5432 user=giuser password=hola


