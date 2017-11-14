class Accesos::SubtituloController < ApplicationController
    def listar
		render :plain => Accesos::Subtitulo.select(:id, :nombre).where(:modulo_id => params[:modulo_id]).to_a.to_json
	end
end
