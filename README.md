# freemarket DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|
|name|string|null: false|
|hurigana|string|null: false|
|birthday|integer|null: false|
### Association
- has_many :comments
- has_one :card
- has_one :address
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|brand|string|null: false|
|condition|string|null: false|
|charge|integer|null: false|
|area|string|null: false|
|day|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :photos
- belongs_to :category

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|hurigana|string|null: false|
|postcode|integer|null: false|
|prefecture|stirng|null ;false|
|city|stirng|null: false|
|block|string|null: false|
|room|stirng||
|phonenumber|integer||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
## photoテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|stirng|null: false|
### Association
- has_many :items