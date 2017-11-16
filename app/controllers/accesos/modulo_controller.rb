class Accesos::ModuloController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'modulo/listar/' + params[:sistema_id])
	end

	def guardar
	  data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
		sistema_id = data['extra']['sistema_id']
		rpta = [] 
		array_nuevos = []
		error = false
		execption = nil
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::Modulo.new(:nombre => nuevo['nombre'], :url => nuevo['url'], :sistema_id => sistema_id)
						n.save
						t = {:temporal => nuevo['id'], :nuevo_id => n.id}
						array_nuevos.push(t)
					end
				end
				if editados.length != 0
					editados.each do |editado|
						e = Accesos::Modulo.where(:id => editado['id']).first
						e.nombre = editado['nombre']
						e.url = editado['url']
						e.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::Modulo.where(:id => eliminado).delete
					end
				end
			rescue Exception => e
				Sequel::Rollback
				error = true
				execption = e	
			end
	  end
		if error == false
			render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado los cambios en los modulos', array_nuevos]}.to_json
		else
			render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en guardar la tabla de modulos', execption.message]}.to_json, status: 500
		end
	end
end
