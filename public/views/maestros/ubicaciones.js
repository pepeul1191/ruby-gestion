var tablaDepartamentos = new Grid();
var tablaProvincias = new Grid();
var tablaDistritos = new Grid();

var UbicacionView = Backbone.View.extend({
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
		   url: STATICS_URL + 'templates/maestros/ubicacion.html', 
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
		var ajax_departamento = new AjaxPython(); 
		ajax_departamento.Constructor("GET", BASE_URL + "maestros/departamento/listar", "", false);
		tablaDepartamentos.BorrarTable();

   	tablaDepartamentos.SetTableId("tablaDepartamentos");
		tablaDepartamentos.SetTableObj("tablaDepartamentos");
		tablaDepartamentos.SetTableHeader(departamento_array_json_th);
		tablaDepartamentos.SetTableBody(departamento_array_json_td, departamento_array_json_btn_td, ajax_departamento);
		tablaDepartamentos.SetTableFooter(departamento_array_json_btn, false);
		tablaDepartamentos.SetLabelMensaje("#txtMensajeRpta");
		tablaDepartamentos.SetURLGuardar(BASE_URL + "maestros/departamento/guardar");

		tablaDepartamentos.MostrarTable();
	}
});


$(document).on("click", ".mootools", function() {
  var objeto = eval(this.get("objeto"));
  var eslabon_1 = new MostrarProvincias();
  var eslabon_2 = new MostrarDistritos();

  eslabon_1.SetearSiguienteInstancia(eslabon_2);

  var operacion = this.get("operacion"); console.log(operacion);

  eslabon_1.EjecutarOperacion(operacion, $(this), objeto);
});