class CardsController < ApplicationController
  require "payjp"
  before_action :set_card


  def index   # カード確認画面
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
    else
      redirect_to action: "new" 
    end
  end

  def destroy   # カード情報削除
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] 
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to action: "new"
  end
  
  def new   # カード登録画面
    redirect_to action: "index" if card.present?
  end

  def create  # カード登録処理
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test', 
        email: current_user.email,
        card: params['payjp-token'], 
        metadata: {user_id: current_user.id} 
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end     
    end
  end

  private

  def set_card
    @card = current_user.cards.first if current_user.cards.present?
  end

end
