class Maestros::ProvinciaController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:ubicaciones] + 'provincia/listar/' + params[:departamento_id])
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:ubicaciones] + 'provincia/guardar?data=' + params[:data])
	end
end
