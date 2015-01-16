class CalendarsController < ApplicationController
  def show
    if params[:profile_id] != nil
      @ch_user_id = params[:profile_id]
      else
      @ch_user_id = current_user.id
    end

    @calendar = ImageDate.where(:user_id => @ch_user_id)

    @user = User.where(:id => @ch_user_id)
    @user.each do |user|
    @user_name = user.name
    end

    @calendar_by_day = @calendar.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
