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
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar_roles/' + params[:sistema_id] + '/' + params[:usuario_id])
	end

	def listar_permisos
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar_permisos/' + params[:sistema_id] + '/' + params[:usuario_id])
	end

	def guardar_sistemas
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/guardar_sistemas?data=' + params[:data])
	end

	def asociar_roles
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/asociar_roles?data=' + params[:data])
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
