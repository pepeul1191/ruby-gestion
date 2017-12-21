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
		rpta = nil
		Net::SFTP.start(CONSTANTS[:servicios][:ftp][:dominio], CONSTANTS[:servicios][:ftp][:usuario], :password => CONSTANTS[:servicios][:ftp][:contrasenia] ) do |sftp|
			id_generado = get(CONSTANTS[:servicios][:archivos] + 'imagen/obtener_id')
			file_name_array = params[:myFile].path.split('.')
			extension = file_name_array[file_name_array.length - 1].strip
			sftp.upload(params[:myFile].path, CONSTANTS[:servicios][:ftp][:ruta] + id_generado + '.' + extension)
			imagen = {
				:id => id_generado,
        #:nombre => 'Corbett', 
        :nombre_generado => id_generado + '.' + extension, 
        :extension => extension,
        :ruta => CONSTANTS[:servicios][:ftp][:ruta] + id_generado + '.' + extension,
        #:altura => ,
        #:anchura => ,
        #:mime => ,
      }
      rpta = post(CONSTANTS[:servicios][:archivos] + 'imagen/crear?data=' + imagen.to_json)
		end
		render :plain => rpta
	end

	def obtener_ruta_foto
		render :plain => get(CONSTANTS[:servicios][:archivos] + 'imagen/obtener_ruta_archivo/' + params[:imagen_id].to_s)
	end

	def estacion
		render :plain => get(CONSTANTS[:servicios][:estaciones] + 'estacion/campo/' + params[:campo_id].to_s)
	end
end