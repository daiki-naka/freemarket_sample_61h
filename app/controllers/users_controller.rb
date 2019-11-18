class UsersController < ApplicationController
  before_action :set_category
  
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
  
  private

  def set_category
    parents = Category.all.order("id ASC").limit(13)
    ladies = parents.find(1)
    @ladies_child = ladies.children
  end
  
end
