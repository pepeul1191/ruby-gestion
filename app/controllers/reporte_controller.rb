class ReporteController < ApplicationController
	def max_min_avg_dias
    render :plain => get(CONSTANTS[:servicios][:sensores] + 'reporte/max_min_avg_dias?sensor_id=' + params[:sensor_id] + '&inicio=' + params[:inicio] + '&fin=' + params[:fin])
	end
  def datos_dia
    render :plain => get(CONSTANTS[:servicios][:sensores] + 'reporte/datos_dia?sensor_id=' + params[:sensor_id] + '&dia=' + params[:dia])
  end
end
