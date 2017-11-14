class Accesos::ItemController < ApplicationController
    def listar
		render :plain => Accesos::Item.select(:id, :nombre, :url).where(:subtitulo_id => params[:subtitulo_id]).to_a.to_json
	end
end
