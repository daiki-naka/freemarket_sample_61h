# README
# 概要
TECH::EXPERTの最終課題。メルカリのWebアプリケーションのリプロダクション。
## 開発環境
開発言語：ruby 2.5.1p57  
開発フレームワーク：Rails 5.2.3  
RDBMS：MySQL  
開発プラットフォーム：Github  
デプロイ先：AWSのEC2  
コーディングソフト：Visual Studio Code  
## 開発期間と平均作業時間
開発期間：10/26（土）-11/21（木）（休日2日を除いて25日間、22日（金）が発表会）  
1日あたりの平均作業時間：9~10時間（合計約240時間）  
人数：5名(26歳3名（女性1名含む）、24歳1名、44歳1名)  
開発スタイル：アジャイル型開発  
最初と最後の週を除く毎週金曜日にスプリントレビューを行った。  
朝のデイリースクラム、夜の一日の作業状況報告は毎日欠かさず行った。  
日常的にコミュニケーションを取りながら作業を進めていた。  
タスク管理はTrelloを使用。  

# DB設計
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
- has_many :cards

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
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :grand_category

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
|keyword1|text|null: false|
|keyword2|text|null: false|
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

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user
