class Maestros::DistritoController < ApplicationController
	def buscar
		render :plain => get(CONSTANTS[:servicios][:ubicaciones] + 'distrito/buscar?nombre=' + params[:distrito])
	end
end
