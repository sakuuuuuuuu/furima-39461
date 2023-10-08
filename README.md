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
|encrypted_password |string | null: false |
|name_last          |string | null: false |
|name_first         |string | null: false |
|name_last_kana     |string | null: false |
|name_first_kana    |string | null: false |
|birth_year_id         |integer | null: false |
|birth_month_id         |integer | null: false |
|birth_day_id         |integer | null: false |


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
- belongs_to :purchase_record


## purchase_records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| shipping   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_many   :shipping

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
| purchase_record| references | null: false, foreign_key: true |


### Association
- has_many :purchase_record









