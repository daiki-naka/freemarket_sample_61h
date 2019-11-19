class LikesController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destory]
def create
  @product = Product.find(params[:product_id])
  if !@product.add_like(current_user)
    @product.like(current_user)
    @product.reload
    respond_to do |format|
      format.html{redirect_to request.referrer || root_url }   
      format.js
      # request.referer 遷移前のURLを取得
    end
  end
end

def destroy
  @product = Like.find(params[:id]).product
  if @product.like?(current_user)
    @product.remove_like(current_user)
    @product.reload
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
end
