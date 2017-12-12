class Estaciones::TipoEstacionController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:estaciones] + 'tipo_estacion/listar')
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:estaciones] + 'tipo_estacion/guardar?data=' + params[:data])
	end
end
