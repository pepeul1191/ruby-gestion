class Maestros::DepartamentoController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:ubicaciones] + 'departamento/listar')
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:ubicaciones] + 'departamento/guardar?data=' + params[:data])
	end
end
