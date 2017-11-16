class Accesos::RolController < ApplicationController
  def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'rol/listar/' + params[:sistema_id])
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'rol/guardar?data=' + params[:data])
	end

	def asociar_permisos
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'rol/asociar_permisos?data=' + params[:data])
	end
end
