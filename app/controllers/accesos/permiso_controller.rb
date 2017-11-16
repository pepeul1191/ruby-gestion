class Accesos::PermisoController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'permiso/listar/' + params[:sistema_id])
	end

	def listar_asociados
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'permiso/listar_asociados/' + params[:sistema_id] + '/' + params[:rol_id])
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'permiso/guardar?data=' + params[:data])
	end
end
