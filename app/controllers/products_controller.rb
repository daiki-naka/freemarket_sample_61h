class ProductsController < ApplicationController

  def index
  end

  def show
    @product = Product.find(params[:id])
    render controller:  "ImageController", action:  "show"
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "出品が完了しました"
    else
      render :new 
    end
  end

  def children_category
    @children_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def grandchild_category
    @grandchild_category = Category.find("#{params[:child_id]}").children
  end

  def product_size_brand 
    @product_name = Category.find_by(name: "#{params[:category_name]}")
    @grand_category_clothes = Grand_category.all
    @grand_category_shoes = Shoes_category.all
    @clothes = @grand_category_clothes.map { |c| c[:name] }
    @shoes = @grand_category_shoes.map { |s| s[:name] }
    if @clothes.include?(@product_name[:name])
      @size_form = 2
    elsif @shoes.include?(@product_name[:name])
      @size_form = 1
    else
      @size_form = 0
    end
  end

  def brand_search
    @brand_name = Brand.where('name LIKE ?', "%#{params[:keyword]}%")
    @brand_key1 = Brand.where('keyword1 LIKE ?', "%#{params[:keyword]}%")
    @brand_key2 = Brand.where('keyword2 LIKE ?', "%#{params[:keyword]}%")
    if @brand_name != []
      @brands = @brand_name
    elsif @brand_key1 != []
      @brands = @brand_key1
    else
      @brands = @brand_key2
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, 
      :introduction,
      :status,
      :d_charge,
      :d_method,
      :d_origin,
      :d_interval,
      :price,
      :product_size,
      :category_id,
      :brand_id,
      images_attributes:[:picture]
      ).merge(user_id: current_user.id)
  end
  
end
