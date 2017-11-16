class Accesos::RolController < ApplicationController
  def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'rol/listar/' + params[:sistema_id])
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
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::Rol.new(:nombre => nuevo['nombre'], :sistema_id => sistema_id)
						n.save
						t = {:temporal => nuevo['id'], :nuevo_id => n.id}
						array_nuevos.push(t)
					end
				end
				if editados.length != 0
					editados.each do |editado|
						e = Accesos::Rol.where(:id => editado['id']).first
						e.nombre = editado['nombre']
						e.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::Rol.where(:id => eliminado).delete
					end
				end
			rescue Exception => e
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en guardar la tabla de roles', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado los cambios en los roles', array_nuevos]}.to_json
	end

	def asociar_permisos
		data = JSON.parse(params[:data])
	  nuevos = data['nuevos']
 	  editados = data['editados']
	  eliminados = data['eliminados']
	  usuario_id = data['extra']
	  rol_id = data['extra']['id_rol']
	  rpta = [] 
	  DB_ACCESOS.transaction do
			begin  
				if nuevos.length != 0
					nuevos.each do |nuevo|
						n = Accesos::RolPermiso.new(:permiso_id => nuevo['id'], :rol_id => rol_id)
						n.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::RolPermiso.where(:permiso_id => eliminado, :rol_id => rol_id).delete
					end
				end
			rescue Exception => e
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha registrado la asociación/deasociación de los permisos al rol', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado los cambios en los roles', []]}.to_json
	end
end
