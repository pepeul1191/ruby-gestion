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

	def guardar
		render :plain => post(CONSTANTS[:servicios][:agricultor] + 'campo/guardar?data=' + params[:data])
	end

	def subir_foto
		Net::SFTP.start(CONSTANTS[:servicios][:ftp][:dominio], CONSTANTS[:servicios][:ftp][:usuario], :password => CONSTANTS[:servicios][:ftp][:contrasenia] ) do |sftp|
		  sftp.upload!(params[:myFile].path, "/home/pepe/Imágenes/nuevo.png")
		end
		render :plain => 'render subir_foto'
	end
end