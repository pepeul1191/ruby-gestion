var Router = Marionette.AppRouter.extend({
    routes: {
        "" : "index", 
        "ubicaciones" : "ubicacionIndex",
        "*actions" : "index"
    },
    ubicacionIndex: function(){
        var ubicacionView = new UbicacionView({});
        ubicacionView.render();
        ubicacionView.mostrarTabla();
    },
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