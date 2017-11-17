var Router = Marionette.AppRouter.extend({
    routes: {
        "" : "index", 
        "responsable" : "responsableIndex",
        "asociacion" : "asociacionIndex",
        "campo" : "campoIndex",
        "*actions" : "index"
    },
    responsableIndex: function(){
        var responsableView = new ResponsableView({});
        responsableView.render();
        //responsableView.mostrarTabla();
    },
    asociacionIndex: function(){
        var asociacionView = new AsociacionView({});
        asociacionView.render();
        //asociacionView.mostrarTabla();
    },
    campoIndex: function(){
        var campoView = new CampoView({});
        campoView.render();
        //campoView.mostrarTabla();
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