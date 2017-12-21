class Estaciones::ViewController < ApplicationController
	def index
		@titulo_pagina = 'Gestión de Estaciones'
		@modulo = 'Estaciones'
		@title = 'Estaciones'
		@css = 'dist/accesos.min.css'
		@js_top = 'http://localhost:3000/'
		@menu = '[{"url" : "accesos/", "nombre" : "Accesos"},{"url" : "maestros/", "nombre" : "Maestros"},{"url" : "agricultores/", "nombre" : "Agricultores"},{"url" : "estaciones/", "nombre" : "Estaciones"}]'
		@items = '[{"subtitulo":"Opciones","items":[{"item":"Gestión de Sensores","url":"estaciones/#/sensores"},{"item":"Datos de Sensores","url":"estaciones/#/datos"}]}]' 
		@js_bottom = 'dist/estaciones.min.js'
		@data = {
			:mensaje => false,
			:titulo_pagina => 'Gestión de Estaciones', 
			:modulo => 'Estaciones'
		}.to_json
		render :template => 'estaciones/index', :layout => 'app'
	end
end
