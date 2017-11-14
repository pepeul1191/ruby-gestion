class Accesos::SistemaController < ApplicationController
    def listar
		render :plain => Accesos::Sistema.to_a.to_json
	end
end
