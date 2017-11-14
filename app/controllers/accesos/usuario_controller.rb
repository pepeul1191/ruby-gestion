class Accesos::UsuarioController < ApplicationController
	def listar
		render :plain => DB_ACCESOS.fetch('
			SELECT U.id AS id, U.usuario AS usuario, A.momento AS momento, U.correo AS correo 
			FROM usuarios U INNER JOIN accesos A ON U.id = A.usuario_id GROUP BY U.usuario ORDER BY U.id').to_a.to_json
	end

	def logs
		render :plain => Accesos::Acceso.select(:id, :momento).where(:usuario_id => params[:usuario_id]).to_a.to_json
	end

	def obtener_usuario_correo
		render :plain => Accesos::Usuario.select(:usuario, :correo).where(:id => params[:usuario_id]).first.to_json
	end
	#listar_roles/:sistema_id/:usuario_id
	def listar_roles
		render :plain => DB_ACCESOS.fetch('
			SELECT T.id AS id, T.nombre AS nombre, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
			(
				SELECT id, nombre, 0 AS existe FROM roles WHERE sistema_id = ' + params[:sistema_id] + '
			) T
			LEFT JOIN
			(
				SELECT R.id, R.nombre, 1 AS existe  FROM roles R 
				INNER JOIN usuarios_roles UR ON R.id = UR.rol_id
				WHERE UR.usuario_id = ' + params[:usuario_id] + '
			) P
			ON T.id = P.id').to_a.to_json
	end
end
