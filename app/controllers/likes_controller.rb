class LikesController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destory]
#   def create
#   @records = Likes.where(user_id: current_user.id)
#   @current_product_record = @records.find_by(product_id: @product)
#   if !@product.user_id == current_user.id && @current_product_record ?
#     = render partial: 'like_form_1', locals: { group: @group} 
#   elsif !@product.user_id == current_user.id && ！@current_product_record ?
#     = render partial: 'like_form_2'
#   else
#     # 処理なし
#  end


# def add_like(user)
#   likes.create(user_id: user.id)
# end

# def remove_like(user)
#   likes.find_by(user_id: user.id).destroy
# end


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




#  def destroy
#   @like = Like.destroy(params[:product_id, user_id: current_user.id])
#   if @like.destroy
#     respond_to do |format|
#       format.json
#  end

#  def likes_params
#   params.require(:like).permit(:product_id, :user_id)
#  end
# end
