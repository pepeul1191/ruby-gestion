class Agricultores::ResponsableController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:agricultor] + 'responsable/listar')
	end

	def guardar
		render :plain => post(CONSTANTS[:servicios][:agricultor] + 'responsable/guardar?data=' + params[:data])
	end

	def buscar
		render :plain => get(CONSTANTS[:servicios][:agricultor] + 'responsable/buscar?responsable=' + params[:responsable])
	end
end
