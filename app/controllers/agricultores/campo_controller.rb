class Agricultores::CampoController < ApplicationController
	def listar
		campos = JSON.parse(get(CONSTANTS[:servicios][:agricultor] + 'campo/listar/' + params[:asociacion_id]))
		rpta = []
		if campos.length != 0
			campos.each do |campo|
				campo['distrito'] = get(CONSTANTS[:servicios][:ubicaciones] + 'distrito/nombre/' + campo['distrito_id'].to_s)
				rpta.push(campo)
			end
		end
		render :plain => rpta.to_json
	end
end
