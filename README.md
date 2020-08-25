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


## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| name         | string | null: false |
| name_reading | string | null: false |
| birthday     | string | null: false |

### Association

- has_many :item
- has_many :order
- has_many :comment
- has_one :address

## items テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| image       | binary     | null: false                    |
| item_name   | string     | null: false                    |
| text        | string     | null: false                    |
| item_status | string     | null: false                    |
| location    | string     | null: false                    |
| shipping    | string     | null: false                    |
| price       | integer    | null: false                    |

### Association

- has_many :comment
- has_many :category
- has_one :order

## addresses テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | integer    | null: false                    |
| building_name| string     | null: false                    |

### Association

- belongs_to :user

## comments テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| content_text | string     |                                |
| user         | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## categories テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| category     | string     |                                |
| user         | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |

### Association

- belongs_to :item