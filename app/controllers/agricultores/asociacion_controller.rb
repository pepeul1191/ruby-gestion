class Agricultores::AsociacionController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:agricultor] + 'asociacion/listar')
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:agricultor] + 'asociacion/guardar?data=' + params[:data])
	end
end
