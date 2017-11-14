class Accesos::ViewController < ApplicationController
  def index
		render :template => 'accesos/index', :layout => 'app'
	end
end
