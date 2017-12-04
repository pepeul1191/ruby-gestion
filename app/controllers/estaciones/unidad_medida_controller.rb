class Estaciones::UnidadMedidaController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:agricultor] + 'asociacion/listar')
	end
end
