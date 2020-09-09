class UsersController < ApplicationController
  # before_action :authenticate_user!, except: :index
  def index
    @user = User.new
  end
end

def destroy
  @user = User.find(params[:id])
  return redirect_to action: :index if @user.destroy 
end