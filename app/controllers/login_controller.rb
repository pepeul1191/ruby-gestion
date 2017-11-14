class LoginController < ApplicationController
	def index
		@title = 'Bienvenido'
		@css = 'dist/login.min.css'
		@js_top = 'http://localhost:3000/'
		@js_bottom = 'dist/login.min.js'
    @data = {
      :mensaje => false
    }.to_json
		render :template => 'login/index', :layout => 'blank'
	end

  def acceder
    rpta = Accesos::Usuario.where(:usuario => params[:usuario], :contrasenia => params[:contrasenia]).count
    if rpta == 1
      session[:estado] = 'autenticado'
      session[:usuario] = params[:usuario]
      session[:tiempo] = Time.now.strftime('%Y-%m-%d %H:%M:%S')

      redirect_to CONSTANTS[:BASE_URL] + 'home'
    else
      @title = 'Bienvenido'
      @css = 'dist/login.min.css'
      @js_top = 'http://localhost:3000/'
      @js_bottom = 'dist/login.min.js'
      @data = {
        :mensaje => true
      }.to_json
      render :template => 'login/index', :layout => 'blank'
    end    
  end

  def ver
    rpta = 'usuario : ' + session[:usuario] + '</br>' + 'estado : ' + session[:estado] + '</br>' + 'tiempo : ' + session[:tiempo]
    render :plain => rpta
  end

  def cerrar
    reset_session
    redirect_to CONSTANTS[:BASE_URL] + 'login'
  end
end
