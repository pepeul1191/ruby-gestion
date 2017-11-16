class Accesos::SubtituloController < ApplicationController
  def listar
		render :plain => get(CONSTANTS[:servicios][:accesos] + 'subtitulo/listar/' + params[:modulo_id])
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:accesos] + 'subtitulo/guardar?data=' + params[:data])
	end
end
