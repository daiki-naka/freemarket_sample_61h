class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3
  before_action :validates_step3, only: :step4

  def step1
    @user = User.new
  end

  def step2
    birthday                        = birthday_join(params[:birthday])
    session[:nickname]              = user_params[:nickname]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name]             = user_params[:last_name]
    session[:name]                  = user_params[:name]
    session[:last_name_f]           = user_params[:last_name_f]
    session[:name_f]                = user_params[:name_f]
    session[:birthday]              = birthday
    session[:provider]              = session[:provider]
    session[:uid]                   = session[:uid]
    @user = User.new
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step4
    session[:d_last_name]     = user_params[:d_last_name]
    session[:d_name]          = user_params[:d_name]
    session[:d_last_name_f]   = user_params[:d_last_name_f]
    session[:d_name_f]        = user_params[:d_name_f]
    session[:postal_code]     = user_params[:postal_code]
    session[:prefecture]      = user_params[:prefecture]
    session[:city]            = user_params[:city]
    session[:address]         = user_params[:address]
    session[:building_name]   = user_params[:building_name]
    session[:d_phone_number]  = user_params[:d_phone_number]
    @user = User.new
  end

  def validates_step1
    birthday                        =  birthday_join(params[:birthday])
    session[:nickname]              = user_params[:nickname]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name]             = user_params[:last_name]
    session[:name]                  = user_params[:name]
    session[:last_name_f]           = user_params[:last_name_f]
    session[:name_f]                = user_params[:name_f]
    session[:birthday]              = birthday
    @user = User.new(
      nickname:               session[:nickname],
      email:                  session[:email],
      password:               session[:password],
      password_confirmation:  session[:password_confirmation],
      last_name:              session[:last_name],
      name:                   session[:name],
      last_name_f:            session[:last_name_f],
      name_f:                 session[:name_f],
      birthday:               session[:birthday]
    )
    render :step1 unless @user.valid?(:validates_step1)
  end

  def validates_step2
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      phone_number:          session[:phone_number],
      password:              "1234567",
      password_confirmation: "1234567",
      email:                 "123@gmail.com"
    )
    render :step2 unless @user.valid?(:validates_step2)
  end

  def validates_step3
    session[:d_last_name]     = user_params[:d_last_name]
    session[:d_name]          = user_params[:d_name]
    session[:d_last_name_f]   = user_params[:d_last_name_f]
    session[:d_name_f]        = user_params[:d_name_f]
    session[:postal_code]     = user_params[:postal_code]
    session[:prefecture]      = user_params[:prefecture]
    session[:city]            = user_params[:city]
    session[:address]         = user_params[:address]
    session[:building_name]   = user_params[:building_name]
    session[:d_phone_number]  = user_params[:d_phone_number]
    @user = User.new(
      d_last_name:           session[:d_last_name],
      d_name:                session[:d_name],
      d_last_name_f:         session[:d_last_name_f],
      d_name_f:              session[:d_name_f],
      postal_code:           session[:postal_code],
      prefecture:            session[:prefecture],
      city:                  session[:city],
      address:               session[:address],
      building_name:         session[:building_name],
      d_phone_number:        session[:d_phone_number],
      password:              "1234567",
      password_confirmation: "1234567",
      email:                 "123@gmail.com"
    )
    render :step3 unless @user.valid?(:validates_step3)
  end

  def complete
    @user = User.new(
      nickname:       session[:nickname],
      email:          session[:email],
      password:       session[:password],
      name:           session[:name],
      name_f:         session[:name_f],
      last_name:      session[:last_name],
      last_name_f:    session[:last_name_f],
      birthday:       session[:birthday],
      phone_number:   session[:phone_number],
      d_name:         session[:d_name],
      d_name_f:       session[:d_name_f],
      d_last_name:    session[:d_last_name],
      d_last_name_f:  session[:d_last_name_f],
      postal_code:    session[:postal_code],
      prefecture:     session[:prefecture],
      city:           session[:city],
      address:        session[:address],
      building_name:  session[:building_name],
      d_phone_number: session[:d_phone_number],
    )
    if @user.save
      session[:id] = @user.id
      redirect_to signup_complete_users_path
    else
      render :complete
    end
  end

  def signedIn
    email = session[:email]
    password = session[:password]
    if login(email, password)
      redirect_to root_path
    else
      render :complete
    end
  end


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :name,
      :name_f,
      :last_name,
      :last_name_f,
      :birthday,
      :phone_number,
      :d_name,
      :d_name_f,
      :d_last_name,
      :d_last_name_f,
      :postal_code,
      :prefecture,
      :city,
      :address,
      :building_name,
      :d_phone_number
    )
  end

  def birthday_join(date)

    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end

    birthday = Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    return birthday
  end

end
