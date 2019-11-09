class LikesController < ApplicationController
 def show
  @like = Like.create(params[:product_id,user_id :current_user.id]
  render "products_show.js"
 end

 def destroy
  @like = Like.destroy(params[:product_id, user_id: current_user.id]
  render "products_show.js"
 end

 def likes_params
  params.require(:like).permit(:product_id, :user_id)
end
