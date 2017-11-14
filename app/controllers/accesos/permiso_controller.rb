class Accesos::PermisoController < ApplicationController
    def listar
        render :plain => Accesos::Permiso.select(:id, :nombre, :llave).where(:sistema_id => params[:sistema_id]).to_a.to_json
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
						n = Accesos::Permiso.new(:nombre => nuevo['nombre'], :llave => nuevo['llave'], :sistema_id => sistema_id)
						n.save
						t = {:temporal => nuevo['id'], :nuevo_id => n.id}
						array_nuevos.push(t)
					end
				end
				if editados.length != 0
					editados.each do |editado|
						e = Accesos::Permiso.where(:id => editado['id']).first
						e.nombre = editado['nombre']
						e.llave = editado['llave']
						e.save
					end
				end
				if eliminados.length != 0
					eliminados.each do |eliminado|
						Accesos::Permiso.where(:id => eliminado).delete
					end
				end
			rescue Exception => e
				raise Sequel::Rollback  
				render :plain => {:tipo_mensaje => 'error', :mensaje => ['Se ha producido un error en guardar la tabla de permisos', e.message]}.to_json, status: 500
			end
	  end
		render :plain => {:tipo_mensaje => 'success', :mensaje => ['Se ha registrado los cambios en los permisos', array_nuevos]}.to_json
	end
end
