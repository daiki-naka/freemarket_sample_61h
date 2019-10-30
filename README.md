# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# freemarket_sampkle_61h DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|name_f|string|null: false|
|last_name|string|null: false|
|last_name_f|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|d_name|string|null: false|
|d_name_f|string|null: false|
|d_last_name|string|null: false|
|d_last_name_f|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|integer||
|v_good|integer||
|v_accept|integer||
|v_bad|integer||
|avatar|string||
|profile|text||
### Association
- has_many :products
- has_many :comments
- has_many :likes
- has_many :claims

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|status|string|null: false|
|d_charge|string|null: false|
|d_method|string|null: false|
|d_origin|string|null: false|
|d_interval|string|null: false|
|price|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|product_size|string||
### Association
- has_many :comments
- has_many :images
- has_many :likes
- belongs_to :user
- belongs_to :brand
- belongs_to :category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|message|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|claim_id|integer|null: false, foreign_key: true|
### Association
- has_one :claim
- belongs_to :user
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_one :product
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|profile|text|null: false|
### Association
- has_many :products

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## claimsテーブル
|Column|Type|Options|
|------|----|-------|
|violation|string|null: false|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|comment_id|integer|null: false, foreign_key: true|
### Association
- bolongs_to :comment
- belongs_to :user