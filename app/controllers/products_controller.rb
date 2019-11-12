class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:buy, :pay]
  before_action :set_product, only: [:show, :edit, :update, :product_show, :destroy]

  def index
  end

  def show
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

  def edit
    @child = @product.category.parent
    @parent = @product.category.parent.parent
  end


  def update
    if @product.update(product_params)
      redirect_to  product_show_product_path(@product), notice: '編集しました。'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "削除しました"
    else
      render :product_show
    end
  end

  def product_show
    @images = @product.images
    @category = @product.category
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
    
  def buy # 購入確認
    set_card_information
  end

  def pay # 決済処理
    set_card_information

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] 
    Payjp::Charge.create(
      amount: 1000, # 値段
      customer: @card.customer_id,
      currency: 'jpy',
    )
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

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

  def set_card
    @card = current_user.cards.first if current_user.cards.present?
  end  

  def set_card_information
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] 
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_logo = "visa.svg"
      when "JCB"
        @card_logo = "jcb.svg"
      when "MasterCard"
        @card_logo = "mastercard.svg"
      when "American Express"
        @card_logo = "american-express.svg"
      when "Diners Club"
        @card_logo = "diners-club-international.svg"
      when "Discover"
        @card_logo = "discover.svg"
      end  
    end
  end
  
end
