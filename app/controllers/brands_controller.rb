class BrandsController < ApplicationController

  def show
    @parents = Category.all.order("id ASC").limit(13)
    @brand = Brand.find(params[:id])

    @products = Product.where(brand_id: @brand.id)
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(125)

    @categories_duplicate = []
    @products.each do |product|
      @categories_duplicate << product.category
    end
    @categories = @categories_duplicate.uniq
  end

end
