var tablaEstacionSensor = new Grid();

var EstacionSensorView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
		//console.log("initialize");
	},
	render: function(estacion_id) {
		$("#btnModal").click(); 
		this.$el.html(this.getTemplate());
		var context = estacion_id;
		var source = $("#sensor-template").html();
		var template = Handlebars.compile(source);
		var html = template({estacion_id:context});
		this.$el.html(html);
	},
	getTemplate: function() {
		var data = { };
		var template = null;
		$.ajax({
		   url: STATICS_URL + 'templates/estaciones/estacion_sensor.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) { 
			   template = source
		   }
		});
		return template;
	},
	mostrarTabla: function(estacion_id){
		var array_extra_data_campo = [
			{tipo: "label", llave: "estacion_id", id : "txtIdeAsociacion"}
		];	
	},
});
