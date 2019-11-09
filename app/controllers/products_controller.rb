class ProductsController < ApplicationController
  require 'payjp'

  def index
  end

  def new
  end

  def show
   @product = Product.find(params[:id])
   render controller:  "ImageController", action:  "show"
  end

  def buy # 購入確認
    @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
    set_card_information
  end

  def pay # 決済処理
    @card = Card.find_by(user_id: current_user.id)
    set_card_information

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] 
    Payjp::Charge.create(
      amount: 1000, # 値段
      customer: @card.customer_id,
      currency: 'jpy',
    )
  end

  private

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
