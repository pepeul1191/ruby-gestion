class Accesos::RolController < ApplicationController
    def listar
		render :plain => Accesos::Rol.select(:id, :nombre).where(:sistema_id => params[:sistema_id]).to_a.to_json
	end
end
