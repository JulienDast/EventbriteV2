class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:users]
  before_action :only_see_own_page, only: [:show, :edit, :update, :destroy]
  
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @admin_event = Event.all
  end

  def only_see_own_page
    @users = User.find(params[:id])  
    if current_user != @users
      redirect_to root_path
    end
  end

end
