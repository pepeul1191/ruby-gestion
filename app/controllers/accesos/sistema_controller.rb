class Accesos::SistemaController < ApplicationController
	def listar
		render :plain => Accesos::Sistema.to_a.to_json
	end

	def usuario
	render :plain => DB_ACCESOS.fetch('
		SELECT T.id AS id, T.nombre AS nombre, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
		(
			SELECT id, nombre, 0 AS existe FROM sistemas
		) T
		LEFT JOIN
		(
			SELECT S.id, S.nombre, 1 AS existe FROM sistemas S
			INNER JOIN usuarios_sistemas US ON US.sistema_id = S.id
			WHERE US.usuario_id = ' + params[:usuario_id] + '
		) P
		ON T.id = P.id').to_a.to_json
	end
end
