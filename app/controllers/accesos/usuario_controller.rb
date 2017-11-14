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
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en asociar/deasociar los sistemas al usuario', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado la asociación/deasociación de los sistemas al usuario', []]}.to_json
	end

	def asociar_roles
		data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
	  usuario_id = data['extra']['usuario_id']
	  rpta = [] 
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
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha registrado la asociación/deasociación de los roles al usuario', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha producido un error en asociar/deasociar los roles al usuario', []]}.to_json
	end

	def asociar_permisos
		data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
	  usuario_id = data['extra']['usuario_id']
	  rpta = [] 
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
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha registrado la asociación/deasociación de los permisos al usuario', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha producido un error en asociar/deasociar los permisos al usuario', []]}.to_json
	end
end
