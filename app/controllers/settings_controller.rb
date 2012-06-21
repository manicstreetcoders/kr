
class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user, :bypass => true
      redirect_to edit_setting_path
    else
      render 'edit'
    end
  end
end
