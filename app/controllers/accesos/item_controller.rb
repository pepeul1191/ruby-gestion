class Accesos::ItemController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'item/listar/' + params[:subtitulo_id])
	end
	
	def guardar
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'item/guardar?data=' + params[:data])
	end
end
