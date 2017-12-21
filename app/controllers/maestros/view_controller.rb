class Maestros::ViewController < ApplicationController
	def index
		@titulo_pagina = 'Gestión de Maestros'
		@modulo = 'Maestros'
		@title = 'Maestros'
		@css = 'dist/agricultores.min.css'
		@js_top = 'http://localhost:3000/'
		@menu = '[{"url" : "accesos/", "nombre" : "Accesos"},{"url" : "maestros/", "nombre" : "Maestros"},{"url" : "agricultores/", "nombre" : "Agricultores"},{"url" : "estaciones/", "nombre" : "Estaciones"}]'
		@items = [
				{
	        :subtitulo => 'Ubicaciones',
	        :items => [
	        	{
	        		:item => 'Departamentos, Provincias y Distritos',
	        		:url => 'maestros/#/ubicaciones'
	        	}
	        ], 
	      },
	      {
	        :subtitulo => 'Archivos',
	        :items => [
	        	{
	        		:item => 'Extensiones',
	        		:url => 'maestros/#/extensiones'
	        	}
	        ], 
	      },
	      {
	        :subtitulo => 'Estaciones',
	        :items => [
	        	{
	        		:item => 'Unidades de Medida',
	        		:url => 'maestros/#/unidad_medida'
	        	},
	        	{
	        		:item => 'Tipos de Estaciones',
	        		:url => 'maestros/#/tipo_estacion'
	        	}
	        ], 
	      },
			].to_json 
		@js_bottom = 'dist/maestros.min.js'
		@data = {
			:mensaje => false,
			:titulo_pagina => 'Gestión de Maestros', 
			:modulo => 'Maestros'
		}.to_json
		render :template => 'maestros/index', :layout => 'app'
	end
end
