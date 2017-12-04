class Accesos::ViewController < ApplicationController
	def index
		@titulo_pagina = 'Gestión de Accesos'
		@modulo = 'Accesos'
		@title = 'Accesos'
		@css = 'dist/accesos.min.css'
		@js_top = 'http://localhost:3000/'
		@menu = '[{"url" : "accesos/", "nombre" : "Accesos"},{"url" : "maestros/", "nombre" : "Maestros"},{"url" : "agricultores/", "nombre" : "Agricultores"}]'
		@items = '[{"subtitulo":"","items":[{"item":"Gestión de Sistemas","url":"accesos/#/sistema"},{"item":"Gestión de Usuarios","url":"accesos/#/usuario"}]}]' 
		@js_bottom = 'dist/accesos.min.js'
		@data = {
			:mensaje => false,
			:titulo_pagina => 'Gestión de Accesos', 
			:modulo => 'Accesos'
		}.to_json
		render :template => 'accesos/index', :layout => 'app'
	end
end
