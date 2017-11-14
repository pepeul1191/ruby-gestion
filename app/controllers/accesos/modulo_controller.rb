class Accesos::ModuloController < ApplicationController
    def listar
		render :plain => Accesos::Modulo.select(:id, :nombre, :url).where(:sistema_id => params[:sistema_id]).to_a.to_json
	end
end
