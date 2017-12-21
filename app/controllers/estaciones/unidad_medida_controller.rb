class Estaciones::UnidadMedidaController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:estaciones] + 'unidad_medida/listar')
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:estaciones] + 'unidad_medida/guardar?data=' + params[:data])
	end

	def listar_select
		render :plain => get(CONSTANTS[:servicios][:estaciones] + 'unidad_medida/listar_select')
	end
end
