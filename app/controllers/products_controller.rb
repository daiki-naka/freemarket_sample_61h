class ProductsController < ApplicationController
  
  def index
  end

  def new
  end

  def show
   @product = Product.find(params[:id])
   render controller:  "ImagesController", action:  "show"
  #  render controller:  "UsersController", action:  "show"
  end

  def product_params
    params.require(:product).permit(:name,:introduction)
  end
end
