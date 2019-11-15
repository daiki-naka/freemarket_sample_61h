class UsersController < ApplicationController
  
  def index
  end

  def edit
  end
  
  def card
  end

  def logout
  end

  def identification
    @user = User.find(params[:id])
  end
  
  def new
  end
  
end
