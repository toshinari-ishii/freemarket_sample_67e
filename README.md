# freemarket DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|hurigana|string|null: false|
|birthday|integer|null: false|
|postcode|integer|null: false|
|prefecture|stirng|null: false|
|city|stirng|null: false|
|block|string|null: false|
|room|stirng|null: true|
|phone_number|integer|null: true|
### Association
- has_many :comments
- has_one :card
- has_many :items
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|condition|string|null: false|
|burden|integer|null: false|
|area|string|null: false|
|day|integer|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|buyer_id|null: ture|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :photos
- belongs_to :category
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## photoテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|stirng|null: false|
### Association
- has_many :items