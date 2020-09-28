# README アプリケーション情報

## アプリケーション概要
フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

- 接続先情報
https://furima-28724.herokuapp.com/

- User認証
ID/Pass
ID: admin
Pass: 2222

- テスト用アカウント等
- 購入者用
メールアドレス: bbb@bbb
パスワード: 111qqq
- 購入用カード情報
番号：4242424242424242
期限：7 / 23
セキュリティコード：123
- 出品者用
メールアドレス名: ppp@ppp
パスワード: 111qqq

## 開発状況
- 開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello
- 開発期間と平均作業時間
開発期間：約4週間
1日あたりの平均作業時間：約9時間
合計：252時間程度

## 動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
 - 接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
- 出品方法
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 購入方法
テストアカウントでログイン→トップページから商品検索→商品選択→商品購入
確認後、ログアウト処理をお願いします。

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

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル 

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| image       | binary     | null: false                    |
| name        | string     | null: false                    |
| text        | string     | null: false                    |
| category    | integer    | null: false                    |
| item_status | integer    | null: false                    |
| charge      | integer    | null: false                    |
| location    | integer    | null: false                    |
| shipping    | integer    | null: false                    |
| price       | integer    | null: false                    |

### Association

- has_many :comments
- has_one :order
- belongs_to :user

## addresses テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| order        | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building_name| string     |                                |
| phone        | string     | null: false                    |

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
- has_one :address

