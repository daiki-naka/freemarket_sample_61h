class UsersController < ApplicationController
  
  def index
  end

  def edit
  end
  
  def show
    @user = Users.find(params[:id]) 
  end

  def card
  end

  def logout
  end

  def identification
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:nickname,:v_good,:v_accept,:v_bad)
  end


  def new
  end
  
end
