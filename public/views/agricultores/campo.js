var tablaCampo = new Grid();

var CampoView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
		//console.log("initialize");
	},
	render: function() {
		$("#btnModal").click(); 
		this.$el.html(this.getTemplate());
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
	mostrarTabla: function(asociacion_id){
		var array_extra_data_campo = [
			{tipo: "label", llave: "asociacion_id", id : "txtIdeAsociacion"}
		];	

		tablaCampo.BorrarTable();
   	var ajax_dao_asociacion = new AjaxPython(); 
   	ajax_dao_asociacion.Constructor("GET", BASE_URL + "agricultores/campo/listar/" + asociacion_id, "", false);
   	tablaCampo.SetTableId("tablaCampo");
   	tablaCampo.SetTableObj("tablaCampo");
   	tablaCampo.SetTableHeader(campo_array_json_th);
   	tablaCampo.SetTableBody(campo_array_json_td, campo_array_json_btn_td, ajax_dao_asociacion);
   	tablaCampo.SetTableFooter(campo_array_json_btn, false);
   	tablaCampo.SetLabelMensaje("#txtMensajeRptaModal");
   	tablaCampo.SetExtraData(array_extra_data_campo);
   	tablaCampo.SetURLGuardar(BASE_URL + "agricultores/campo/guardar");

   	tablaCampo.MostrarTable();
	}
});
