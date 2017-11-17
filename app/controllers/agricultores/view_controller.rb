class Agricultores::ViewController < ApplicationController
	def index
		@titulo_pagina = 'Gestión de Agricultores'
		@modulo = 'Agricultores'
		@title = 'Agricultores'
		@css = 'dist/agricultores.min.css'
		@js_top = 'http://localhost:3000/'
		@menu = '[{"url" : "accesos", "nombre" : "Accesos"},{"url" : "libros", "nombre" : "Libros"},{"url" : "agricultores", "nombre" : "Agricultores"}]'
		@items = '[{"subtitulo":"","items":[{"item":"Gestión de Responsables","url":"agricultores/#/responsable"},{"item":"Gestión de Asociaciones","url":"agricultores/#/asociacion"},{"item":"Gestión de Campos","url":"agricultores/#/campo"}]}]' 
		@js_bottom = 'dist/agricultores.min.js'
		@data = {
			:mensaje => false,
			:titulo_pagina => 'Gestión de Agricultores', 
			:modulo => 'Agricultores'
		}.to_json
		render :template => 'agricultores/index', :layout => 'app'
	end
end
