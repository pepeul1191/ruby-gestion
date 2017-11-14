class Accesos::PermisoController < ApplicationController
    def listar
		render :plain => Accesos::Permiso.select(:id, :nombre, :llave).where(:sistema_id => params[:sistema_id]).to_a.to_json
	end
end
