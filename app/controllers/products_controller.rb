class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:buy, :pay]
  before_action :set_product, only: [:show, :buy, :pay, :show, :edit, :update, :product_show, :destroy]
  before_action :set_category, only: [:index, :show, :product_show, :destroy]
  before_action :authenticate_user!, only: :new
  

  def index
    @categories = Category.find(1,2,8,6)
    @ladies_products = []
    @categories[0].children.each do |child_category|
      child_category.children.each do |grandchild_category|
        @ladies_products += grandchild_category.products
      end
    end
    @ladies_products.sort_by!{|ladies_product|ladies_product.created_at}.reverse!

    @mens_products = []
    @categories[1].children.each do |child_category|
      child_category.children.each do |grandchild_category|
        @mens_products += grandchild_category.products
      end
    end
    @mens_products.sort_by!{|mens_product|mens_product.created_at}.reverse!

    @electric_products = []
    @categories[2].children.each do |child_category|
      child_category.children.each do |grandchild_category|
        @electric_products += grandchild_category.products
      end
    end
    @electric_products.sort_by!{|electric_product|electric_product.created_at}.reverse!

    @hobby_products = []
    @categories[3].children.each do |child_category|
      child_category.children.each do |grandchild_category|
        @hobby_products += grandchild_category.products
      end
    end
    @hobby_products.sort_by!{|hobby_product|hobby_product.created_at}.reverse!

    @chanel_products = Product.where(brand_id: 125).order("created_at DESC")
    @ruiviton_products = Product.where(brand_id: 126).order("created_at DESC")
    @shupurimu_products = Product.where(brand_id: 127).order("created_at DESC")
    @naiki_products = Product.where(brand_id: 128).order("created_at DESC")
  end

  def new
    @product = Product.new
    @product.images.build
  end

  # def edit
  #   @g_category = Category.find(@product.category_id)
  #   @c_category = @g_category.parent
  #   @p_category = @c_category.parent
  #   @Categories = @p_category.children
  #   @clothe_default_size = @default_size.is_a? String
  #   if @product.brand_id != nil
  #     @brand_id = @product.brand_id
  #     @brand = Brand.find(@product.brand_id)
  #   end
  #   @all_brands = Brand.all
  # end

  # def update
  #   if @product.update(product_params)
  #     redirect_to product_show_product_path, notice: "変更しました。"
  #   else
  #     render :edit
  #   end
  # end
  
  def show
    @product = Product.find(params[:id])
    @user = @product.user
    @other_products = @user.products.where.not(id: @product.id)
    @ordered_other_products = @other_products.order('id DESC').limit(6)
    @parent_category_id = @product.category.ancestry[/.*\//, 0].sub(/\//,"")
    @parent_category_name = Category.find(@parent_category_id).name
    @child_category_id = @product.category.ancestry[/\/.*/, 0].sub(/\//,"")
    @child_category_name = Category.find(@child_category_id).name
    @same_category_products = Product.where(category_id: "#{@product.category_id}").where.not(id: @product.id).order('id DESC').limit(6)
    @reverse_ordered_products = Product.order('id DESC')
    if Product.where('id <?',@product.id).present?
      @previous_product = @reverse_ordered_products.where('id < ?',@product.id).first
    else
      @previous_product = Product.order('id DESC').first
    end  
    if Product.where('id >?',@product.id).present?
      @next_product = Product.where('id >?',@product.id).first
    else
      @next_product = Product.order('id ASC').first
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "出品が完了しました"
    else
      render :new 
    end
  end

  def destroy
    if @product.destroy
      redirect_to exhibit_list_user_path(id: current_user.id), notice: "削除しました"
    else
      render :product_show
    end
  end

  def product_show
    @images = @product.images
    @category = @product.category
  end

  def header_category
    @category_id = Category.find("#{params[:category_id]}").children
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
      amount: @product.price, 
      customer: @card.customer_id,
      currency: 'jpy',
    )
  end

  private

  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end

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
