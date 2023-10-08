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


### Association
- has_many :items
- has_many :purchase records



## items テーブル

| Column              | Type   | Options                        |
| ------              | -------| ------------------------------ |
| image               | text   | null: false |
| explanation         | string | null: false |
| category            | string | null: false |
| condition           | string | null: false |
| del-fee             | string | null: false |
| departure           | string | null: false |
| days-until-shipping | string | null: false |
| price               | string | null: false |


### Association
- belongs_to :user
- belongs_to :purchase record


## purchase records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| items_id      | references | null: false, foreign_key: true |
| shipping_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippings テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| zip           | string     | null: false |
| prefecture    | string     | null: false | 
| city          | string     | null: false |
| street        | string     | null: false |
| building      | string     | null: false |
| phone         | string     | null: false |

### Association
- belongs_to :purchase record









