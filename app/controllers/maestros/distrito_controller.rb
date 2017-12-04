class Maestros::DistritoController < ApplicationController
	def buscar
		render :plain => get(CONSTANTS[:servicios][:ubicaciones] + 'distrito/buscar?nombre=' + params[:distrito])
	end

	def listar
		render :plain => get(CONSTANTS[:servicios][:ubicaciones] + 'distrito/listar/' + params[:provincia_id])
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:ubicaciones] + 'distrito/guardar?data=' + params[:data])
	end
end
