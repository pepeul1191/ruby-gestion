class Accesos::SistemaController < ApplicationController
	#protect_from_forgery except: :listar

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

	def guardar
	  data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
		rpta = [] 
		array_nuevos = []
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::Sistema.new(:nombre => nuevo['nombre'], :version => nuevo['version'], :repositorio => nuevo['repositorio'])
						n.save
						t = {:temporal => nuevo['id'], :nuevo_id => n.id}
						array_nuevos.push(t)
					end
				end
				if editados.length != 0
					editados.each do |editado|
						e = Accesos::Sistema.where(:id => editado['id']).first
						e.nombre = editado['nombre']
						e.version = editado['version']
						e.repositorio = editado['repositorio']
						e.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::Sistema.where(:id => eliminado).delete
					end
				end
			rescue Exception => e
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en guardar la tabla de sistemas', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado los cambios en los sistemas', array_nuevos]}.to_json
	end
end
