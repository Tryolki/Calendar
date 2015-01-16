class UserProfilesController < ApplicationController

  def show
    @user_params_profile = User.where(:id => current_user.id)
  end
end
