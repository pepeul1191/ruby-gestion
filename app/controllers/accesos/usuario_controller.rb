class Accesos::UsuarioController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar')
	end

	def logs
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar_accesos/' + params[:usuario_id])
	end

	def obtener_usuario_correo
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/obtener_usuario_correo/' + params[:usuario_id])
	end

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

	def listar_permisos
		render :plain => DB_ACCESOS.fetch('
			SELECT T.id AS id, T.nombre AS nombre, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe, T.llave AS llave FROM
			(
				SELECT id, nombre, llave, 0 AS existe FROM permisos WHERE sistema_id = ' + params[:sistema_id] + '
			) T
			LEFT JOIN
			(
				SELECT P.id, P.nombre,  P.llave, 1 AS existe  FROM permisos P 
				INNER JOIN usuarios_permisos UP ON P.id = UP.permiso_id
				WHERE UP.usuario_id = ' + params[:usuario_id] + '
			) P
			ON T.id = P.id').to_a.to_json
	end

	def guardar_sistemas
		data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
	  usuario_id = data['extra']['usuario_id']
	  rpta = []
		error = false
		execption = nil
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::UsuarioSistema.new(:sistema_id => nuevo['id'], :usuario_id => usuario_id)
						n.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::UsuarioSistema.where(:sistema_id => eliminado, :usuario_id => usuario_id).delete
					end
				end
			rescue Exception => e
				Sequel::Rollback
				error = true
				execption = e	
			end
	  end
		if error == false
			render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado la asociación/deasociación de los sistemas al usuario', []]}.to_json
		else
			render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en asociar/deasociar los sistemas al usuario', execption.message]}.to_json, status: 500
		end
	end

	def asociar_roles
		data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
	  usuario_id = data['extra']['usuario_id']
	  rpta = [] 
		error = false
		execption = nil
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::UsuarioRol.new(:rol_id => nuevo['id'], :usuario_id => usuario_id)
						n.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::UsuarioRol.where(:rol_id => eliminado, :usuario_id => usuario_id).delete
					end
				end
			rescue Exception => e
				Sequel::Rollback
				error = true
				execption = e	
			end
	  end
		if error == false
			render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado la asociación/deasociación de los roles al usuario', []]}.to_json
		else
			render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en asociar/deasociar los roles al usuario', execption.message]}.to_json, status: 500
		end
	end

	def asociar_permisos
		data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
	  usuario_id = data['extra']['usuario_id']
	  rpta = []
		error = false
		execption = nil
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::UsuarioPermiso.new(:permiso_id => nuevo['id'], :usuario_id => usuario_id)
						n.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::UsuarioPermiso.where(:permiso_id => eliminado, :usuario_id => usuario_id).delete
					end
				end
			rescue Exception => e
				error = true
				execption = e
				Sequel::Rollback 
			end
	  end
		if error == false
			render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado la asociación/deasociación de los permisos al usuario', []]}.to_json
		else
			render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en asociar/deasociar los permisos al usuario', execption.message]}.to_json, status: 500
		end
	end

	def nombre_repetido
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/nombre_repetido?data=' + params[:data])
	end

	def correo_repetido
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/correo_repetido?data=' + params[:data])
	end

	def guardar_usuario_correo
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/guardar_usuario_correo?usuario=' + params[:usuario])
	end
end
