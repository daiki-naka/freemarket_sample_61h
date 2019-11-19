class Product < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :users, through: :likes, dependent: :destroy
  has_many :likes
  has_many :like_users, through: :likes, source: :user

  validates :name, :introduction, :status, :d_charge, :d_method, :d_origin, :d_interval, :category_id, :price,  presence: true
 

  #user にいいね！されたproductを取得。like_usersというカラムは存在しないが、
  #既に存在するhas_many :usersと区別する必要があるため、名称を変更。
  #末尾にsource: :userと書くことで,usersを取得できる。

  def add_like(user)
    likes.create(user_id: user.id)
  end
  
  def remove_like(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like?(user)
    like_users.include?(user)
  end
end

  

