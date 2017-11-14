class Accesos::UsuarioController < ApplicationController
    def listar
		render :plain => DB_ACCESOS.fetch('
        	SELECT U.id AS id, U.usuario AS usuario, A.momento AS momento, U.correo AS correo 
        	FROM usuarios U INNER JOIN accesos A ON U.id = A.usuario_id GROUP BY U.usuario ORDER BY U.id').to_a.to_json
	end
end
