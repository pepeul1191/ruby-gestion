class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  before_action :set_header
  before_action :validate_csrf_token
  private
  def validate_csrf_token
    if request.method == 'POST'
      if request.params[:csrfmiddlewaretoken] != CONSTANTS[:CSRF] && CONSTANTS[:ambiente] != 'produccion' 
        render :plain => {:tipo_mensaje => 'error', :mensaje => ['CSRF token error', 'CSRF token error']}.to_json, status: 500
      end
    end
  end

  private
  def get(url)
    response = HTTParty.get(URI.encode(url))
    response.body
  end

  private
  def post(url)
    response = HTTParty.post(URI.encode(url))
    response.body
  end

  def set_header
    response.set_header('server', 'ruby, Ubuntu')
    response.set_header('Access-Control-Allow-Origin', '*')
    response.set_header('Access-Control-Allow-Methods', 'POST, PUT, DELETE, GET, OPTIONS')
    response.set_header('Access-Control-Request-Method', '*')
    response.set_header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization')
  end

  def not_found
    redirect_to CONSTANTS[:BASE_URL] + 'error/access/404'
  end
end
