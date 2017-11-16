class Accesos::PermisoController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'permiso/listar/' + params[:sistema_id])
	end

	def listar_asociados
		render :plain => DB_ACCESOS.fetch('
		SELECT T.id AS id, T.nombre AS nombre, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe, T.llave AS llave FROM 
		(
			SELECT id, nombre, llave, 0 AS existe FROM permisos WHERE sistema_id = ' + params[:sistema_id] + ' 
		) T
		LEFT JOIN
		(
			SELECT P.id, P.nombre,  P.llave, 1 AS existe  FROM permisos P 
			INNER JOIN roles_permisos RP ON P.id = RP.permiso_id
			WHERE RP.rol_id =  ' + params[:rol_id] + ' 
		) P
		ON T.id = P.id').to_a.to_json
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'permiso/guardar?data=' + params[:data])
	end
end
