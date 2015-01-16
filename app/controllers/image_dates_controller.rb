class ImageDatesController < ApplicationController
  before_action :set_image_date, only: [:show, :edit, :update, :destroy]
  # GET /image_dates
  # GET /image_dates.json

  def index
    @image_dates = ImageDate.where(:user_id => current_user.id)
  end


  def show
    @comments = Comment.where(:image_date_id => params[:id])
    @user = User.all
  end

  # GET /image_dates/new
  def new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @image_date = ImageDate.new
  end
  # GET /image_dates/1/edit
  def edit
    @image_dates_id = ImageDate.where(:id => params[:id])
    @image_dates_id.each do |f|
      @user_id = f.user_id
    end
  end

  # POST /image_dates
  # POST /image_dates.json
  def create
    @img_test = ""
    @image_date = ImageDate.new(image_date_params)
    @data = params[:date]
    respond_to do |format|
      if @image_date.save
        format.html { redirect_to @image_date, notice: 'Изображение добавленно' }
        format.json { render :show, status: :created, location: @image_date }
      else
        format.html { render :new }
        format.json { render json: @image_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_dates/1
  # PATCH/PUT /image_dates/1.json
  def update
    respond_to do |format|
      if @image_date.update(image_date_params)
        format.html { redirect_to @image_date, notice: 'Данные об изображении обновленны.' }
        format.json { render :show, status: :ok, location: @image_date }
      else
        format.html { render :edit }
        format.json { render json: @image_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_dates/1
  # DELETE /image_dates/1.json
  def destroy
    @image_date.destroy
    respond_to do |format|
      format.html { redirect_to image_dates_url, notice: 'Изображение удалено' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image_date
    @image_date = ImageDate.find(params[:id])
  end

    def image_date_params
      params.require(:image_date).permit(:date, :user_id, :image)
    end

end
