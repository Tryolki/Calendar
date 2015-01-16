class UserGallerysController < ApplicationController
  def show
    @ch_id = params[:profile_id]
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @image_date_gallery = ImageDate.where(:user_id => @ch_id, :date => @date)
  end
end
