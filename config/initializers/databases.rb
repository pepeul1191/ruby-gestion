Sequel::Model.plugin :json_serializer

DB_ACCESOS = Sequel.connect('sqlite://db/db_accesos.db')