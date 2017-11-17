var tablaCampo = new Grid();

var CampoView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
	},
	render: function() {
		this.$el.html(this.getTemplate());
		return this;
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'templates/agricultores/campo.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) {
		   	var template = Handlebars.compile(source);
		   	template_compiled = template(data);
		   }
		});
		return template_compiled;
	},
	mostrarTabla: function(){
		/*
		tablaCampo.BorrarTable();
   	var ajax_dao_asociacion = new AjaxPython(); 
   	ajax_dao_asociacion.Constructor("GET", BASE_URL + "accesos/usuario/listar", "", false);
   	tablaCampo.SetTableId("tablaCampo");
   	tablaCampo.SetTableObj("tablaCampo");
   	tablaCampo.SetTableHeader(usuario_array_json_th);
   	tablaCampo.SetTableBody(usuario_array_json_td, usuario_array_json_btn_td, ajax_dao_asociacion);
   	tablaCampo.SetTableFooter(usuario_array_json_btn, false);
   	tablaCampo.SetLabelMensaje("#txtMensajeRpta");
   	tablaCampo.SetURLGuardar(BASE_URL + "accesos/usuario/guardar");

   	tablaCampo.MostrarTable();
   	*/
	}
});
