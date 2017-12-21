class Estaciones::EstacionController < ApplicationController
	#protect_from_forgery except: :listar
	def guardar
		render :plain => post(CONSTANTS[:servicios][:estaciones] + 'estacion/guardar?data=' + params[:data])
	end

	def listar
		render :plain => get(CONSTANTS[:servicios][:estaciones] + 'estacion/listar')
	end
end