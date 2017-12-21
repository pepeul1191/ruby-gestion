class Estaciones::SensorController < ApplicationController
	#protect_from_forgery except: :listar
	def guardar
		render :plain => post(CONSTANTS[:servicios][:estaciones] + 'sensor/guardar?data=' + params[:data])
	end
end