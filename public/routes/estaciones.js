var Router = Marionette.AppRouter.extend({
    routes: {
        'email/:email': 'showEmail',
        "" : "index", 
        "sensores" : "sensoresIndex",
        "datos" : "datosIndex",
        "estacion/sensor/:estacion_id" : "estacionSensor", 
        "*actions" : "index"
    },
    showEmail: function(email) {
        // show the email
        alert(email);
    },
    sensoresIndex: function(){
        var sensoresIndex = new SensoresView({});
        sensoresIndex.render();
        sensoresIndex.mostrarTabla();
    },
    datosIndex: function(){
        var datosIndex = new DatosView({});
        datosIndex.render();
        datosIndex.formReportes();
    },
    estacionSensor: function(estacion_id){
        var estacionSensorView = new EstacionSensorView({});
        estacionSensorView.render(estacion_id);
        $("#txtIdeAsociacion").html(estacion_id);
        estacionSensorView.mostrarTabla(estacion_id);
    }
});
    
var App = Marionette.Application.extend({
    region: '#body-app',
    onStart() {
        var router = new Router();
        Backbone.history.start();
    }
});

var myApp = new App();
myApp.start();