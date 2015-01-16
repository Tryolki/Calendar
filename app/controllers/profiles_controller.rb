class ProfilesController < ApplicationController
  def index
    @id_of_image = []
    @date = Date.today
    @users = User.select('*')
    @last_image = ImageDate.select('*')
    @last_image.each {|img| @id_of_image << img.id if img.date == @date}
    @img = ImageDate.where(:date => @date, :id => @id_of_image[rand(@id_of_image.length)])
  end

  def show
    @user_params_profile = User.where(:id => params[:id])
  end

  def search
    @user = params[:search_user]
    if @user.include? "@"
      @user = User.where( {email: [@user, @user.capitalize]})
    else
      @user = User.where( {name: [@user, @user.capitalize]})
    end
    if @user = ""
      @user = User.select("*")
    end
  end
end
