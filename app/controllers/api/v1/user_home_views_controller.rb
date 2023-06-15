class Api::V1::UserHomeViewsController < ApplicationController
  def create
    user_home_view = UserHomeView.new(user_home_view_params)
    user_home_view.save
  end

  private
  def user_home_view_params
    params.require(:user_home_view).permit(:user_id, :home_id)
  end
end
