class Agricultores::ResponsableController < ApplicationController
	#protect_from_forgery except: :listar
	def listar
		render :plain => get(CONSTANTS[:servicios][:agricultor] + 'responsable/listar')
	end
end
