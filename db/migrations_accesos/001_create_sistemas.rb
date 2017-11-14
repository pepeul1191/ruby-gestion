Sequel.migration do
  	up do
	    create_table(:usuarios) do
		      primary_key :id
		      String :usuario, null: false, size: 15
		      String :contrasenia, null: false, size: 30
		      String :correo, null: false, size: 30
	    end
  	end

	down do
		drop_table(:usuarios)
	end
end