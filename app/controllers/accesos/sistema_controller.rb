class Accesos::SistemaController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'sistema/listar')
	end

	def usuario
			render :plain => get(CONSTANTS[:servicios][:accesos] + 'sistema/usuario/' + params[:usuario_id])
	end

	def guardar
			render :plain => post(CONSTANTS[:servicios][:accesos] + 'sistema/guardar?data=' + params[:data])
	end
end
