class Agricultores::CampoController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:agricultor] + 'campo/listar/' + params[:asociacion_id])
	end
end
