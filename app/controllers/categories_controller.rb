class CategoriesController < ApplicationController


  def show
    @category = Category.find(params[:id])
    if @category.ancestry == nil
      @products = []
      @category.children.each do |child_category|
        child_category.children.each do |grandchild_category|
          @products += grandchild_category.products
        end
      end
    elsif @category.ancestry.match(/\//)
      @products = Product.where(category_id: @category.id)
    else
      @products = []
      @category.children.each do |child_category|
        @products += child_category.products
      end
    end
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(125)
  end

end

