class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  has_many :cards
  has_many :sns_credentials
  has_many :products

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =              /\A(?=.*?[a-z])(?=.*?\d)(?=.*?\W)[!-~]+\z/i
  VALID_PHONE_REGEX =                 /\A\d{10,11}\z/
  VALID_KANA_REGEX =                  /\A[ァ-ヶー－]+\z/
  VALID_POST_REGEX =                  /\A\d{7}\z/

  #ユーザー登録
  #form1のバリデーション
  validates :nickname,                presence: true, length: {maximum: 20}, on: :validates_step1
  validates :email,                   format: { with: VALID_EMAIL_REGEX }, on: :validates_step1
  validates :last_name,               presence: true, length: {maximum: 35}, on: :validates_step1
  validates :name,                    presence: true, length: {maximum: 35}, on: :validates_step1
  validates :last_name_f,             presence: true, format: { with: VALID_KANA_REGEX }, length: {maximum: 35}, on: :validates_step1
  validates :name_f,                  presence: true, format: { with: VALID_KANA_REGEX }, length: {maximum: 35}, on: :validates_step1
  validates :birthday,                presence: true, on: :validates_step1
  
  #form2のバリデーション
  validates :phone_number,            presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX }, on: :validates_step2

  #form3のバリデーション
  validates :d_last_name,             presence: true, length: {maximum: 35}, on: :validates_step3
  validates :d_name,                  presence: true, length: {maximum: 35}, on: :validates_step3
  validates :d_last_name_f,           presence: true, format: { with: VALID_KANA_REGEX }, length: {maximum: 35}, on: :validates_step3
  validates :d_name_f,                presence: true, format: { with: VALID_KANA_REGEX }, length: {maximum: 35}, on: :validates_step3
  validates :postal_code,             presence: true, format: { with: VALID_POST_REGEX }, on: :validates_step3
  validates :prefecture,              presence: true, on: :validates_step3
  validates :city,                    presence: true, length: {maximum: 35}, on: :validates_step3
  validates :address,                 presence: true, length: {maximum: 125}, on: :validates_step3
  validates :building_name,           length: {maximum: 125}, on: :validates_step3
  validates :d_phone_number,          length: {maximum: 20}, on: :validates_step3

  def self.without_sns_data(auth)
    user = User.find_by(email: auth.info.email)

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token.first(7)
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.find(snscredential.user_id)
    if user.nil?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(7)
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end


end

