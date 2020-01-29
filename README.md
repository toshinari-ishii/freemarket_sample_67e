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
### Association
- has_many :comments
- has_many :photos
- has_many :categories,through: :items_categories
- has_many :items_categories

## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
### Association
- belongs_to :item
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

## category1テーブル
|Column|Type|Options|
|------|----|-------|
|name1|stirng|null: false|
### Association
- has_many :items_categories
- has_many :categories2

## category2テーブル
|Column|Type|Options|
|------|----|-------|
|name2|string|null: false|
|name1|references|null: false, foreign_key: true|
### Association
- belongs_to :category1
- has_many :categories3

### category3テーブル
|Column|Type|Options|
|------|----|-------|
|name3|string|null: false|
|name2|references|null: false, foreign_key: true|
### Association
- belongs_to :category2
