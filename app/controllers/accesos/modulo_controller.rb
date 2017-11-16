class Accesos::ModuloController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'modulo/listar/' + params[:sistema_id])
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'modulo/guardar?data=' + params[:data])
	end
end
