class UsersController < ApplicationController
  before_action :set_category
  
  def index
  end
  
  def card
  end

  def logout
  end

  def exhibit_list
    @products = Product.where(user_id: current_user.id)
  end

  def identification
    @user = User.find(params[:id])
  end
  
  private

  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end
  
end
