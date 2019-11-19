# class Users::RegistrationsController < Devise::RegistrationsController

#   def step1
#     @user = User.new(
#       nickname: session[:nickname],
#       email: session[:email],
#       password: session[:password],
#       password_confirmation: session[:password],
#       )
#   end

#   def create
#     super
#     @user.uid = session[:uid]
#     @user.provider = session[:provider]
#     @user.save
#   end
# end