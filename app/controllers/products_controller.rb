class ProductsController < ApplicationController

  def index
  end

  def new
  end

  def show
   @product = find(params[:id])
   render controller:  "ImagesController", action:  "show"
  end

  
end
