class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def create
     User.create!(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :avatar_cache)
  end
end
