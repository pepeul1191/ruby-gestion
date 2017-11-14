# README

Ejecutar migración

	$ sequel -m path/to/migrations postgres://host/database
	$ sequel -m path/to/migrations sqlite://db/accesos.db

Ejecutar el 'down' de las migraciones de la última a la primera:

	$ sequel -m db/migrations -M 0 sqlite://db/accesos.db

Ejecutar el 'up' de las migraciones hasta un versión especifica:

	$ sequel -m db/migrations -M #version sqlite://db/accesos.db

Tipos de Datos de Columnas

	+ :string=>String
	+ :integer=>Integer
	+ :date=>Date
	+ :datetime=>[Time, DateTime].freeze, 
	+ :time=>Sequel::SQLTime, 
	+ :boolean=>[TrueClass, FalseClass].freeze, 
	+ :float=>Float
	+ :decimal=>BigDecimal
	+ :blob=>Sequel::SQL::Blob

---

### Fuentes:

+ https://snippets.aktagon.com/snippets/257-how-to-use-activerecord-without-rails
+ https://github.com/jeremyevans/sequel/blob/master/doc/schema_modification.rdoc
+ http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
+ http://www.rubydoc.info/gems/sequel/4.38.0/Sequel%2FDatabase%3Aschema
+ http://sequel.jeremyevans.net/rdoc/classes/Sequel/Database.html
+ http://sequel.jeremyevans.net/rdoc/classes/Sequel/Model/ClassMethods.html
