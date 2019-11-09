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
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    set_card_information
  end

  def pay # 決済処理
    @card = Card.where(user_id: current_user.id).first
    set_card_information

    Payjp.api_key = "sk_test_096c8614c90cca98d1e32da1" #秘密鍵
    Payjp::Charge.create(
      amount: 1000, # 値段
      customer: @card.customer_id,
      currency: 'jpy',
    )
  end

  private

  def set_card_information
    if @card.present?
      Payjp.api_key = "sk_test_096c8614c90cca98d1e32da1" #秘密鍵
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
