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


## usersテーブル

|Column             |Type   |Options|
|------             |----   |-------|
|nickname           |string |null: false|
|email              |string |null: false  unique: true|
|password           |string | null: false |
|password_confirmation|string | null: false |
|name                 |string | null: false |
|name-kana            |string | null: false |
|birthday_id             |integer | null: false |


### Association
- has_many :items
- has_many :purchase records



## items テーブル

| Column              | Type   | Options                        |
| ------              | -------| ------------------------------ |
| name                | string  | null: false |
| explanation         | string | null: false |
| category_id            |integer | null: false |
| condition_id           |integer | null: false |
| del-fee_id             |integer | null: false |
| departure_id           |integer | null: false |
| days-until-shipping_id |integer | null: false |
| price               | string | null: false |


### Association
- belongs_to :user
- belongs_to :purchase record


## purchase_records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| items      | references | null: false, foreign_key: true |
| shipping   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippings テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| credit-num    | string     | null: false |
| credit-limit  | string     | null: false |
| security-code | string     | null: false |
| zip           | string     | null: false |
| prefecture_id | integer    | null: false | 
| city          | string     | null: false |
| street        | string     | null: false |
| building      | string     |             |
| phone         | string     | null: false |

### Association
- belongs_to :purchase record









