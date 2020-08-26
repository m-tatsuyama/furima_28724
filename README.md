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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birthday           | date   | null: false |

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
| category    | integer    | null: false                    |
| item_status | integer    | null: false                    |
| charge      | integer    | null: false                    |
| location    | integer    | null: false                    |
| shipping    | integer    | null: false                    |
| price       | integer    | null: false                    |

### Association

- has_many :comment
- has_one :order

## addresses テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| order        | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building_name| string     |                                |

### Association

- belongs_to :order

## comments テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| content      | string     |                                |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## orders テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
