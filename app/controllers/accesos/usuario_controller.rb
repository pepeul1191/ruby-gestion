class Accesos::UsuarioController < ApplicationController
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar')
	end

	def logs
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar_accesos/' + params[:usuario_id])
	end

	def obtener_usuario_correo
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/obtener_usuario_correo/' + params[:usuario_id])
	end

	def listar_roles
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar_roles/' + params[:sistema_id] + '/' + params[:usuario_id])
	end

	def listar_permisos
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'usuario/listar_permisos/' + params[:sistema_id] + '/' + params[:usuario_id])
	end

	def guardar_sistemas
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/guardar_sistemas?data=' + params[:data])
	end

	def asociar_roles
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/asociar_roles?data=' + params[:data])
	end

	def asociar_permisos
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/asociar_permisos?data=' + params[:data])
	end

	def nombre_repetido
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/nombre_repetido?data=' + params[:data])
	end

	def correo_repetido
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/correo_repetido?data=' + params[:data])
	end

	def guardar_usuario_correo
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'usuario/guardar_usuario_correo?usuario=' + params[:usuario])
	end
end
