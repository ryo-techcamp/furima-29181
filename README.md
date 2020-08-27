# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| --------------| ------  | ----------- |
| nick_name     | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| first_name    | string  | null: false |
| family_name   | string  | null: false |
| first_kana    | string  | null: false |
| family_kana   | string  | null: false |
| date          | date    | null: false |
### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column           | Type    　|Options           |
| -----------------| -------- | ------------------|
| image            | string   | null: false       |
| name　　　　　     | string   | null: false       |
| description      | text     | null: false       |
| category         | integer  | null: false       |
| status           | integer  | null: false       |
| delivery_fee     | integer  | null: false       |
| shipping_origin  | integer  | null: false       |
| date_of_shipment | integer  | null: false       |
| price            | integer  | null: false       |
| user_id          | integer  | null: false , foreign_key: true          |
### Association

- belongs_to:user
- has_one:buyer

## buyers テーブル
| Column          | Type       | Options                    |
| ----------------| ---------- | -------------------------- |
| user_id         | integer    | null: false , foreign_key: true          |
| item_id         | integer    | null: false , foreign_key: true          |

### Association

- has_one :shipping_address
- belongs_to :item
- belongs_to :user

## shipping_address テーブル 

| Column          | Type       | Options                    |
| ------          | ---------- | -------------------------- |
| postal_code     | string     | null: false                |
| prefecture      | integer    | null: false                |
| city            | string     | null: false                |
| address         | string     | null: false                |
| building_name   | string     |                            |
| phone_number    | string     | null: false                | 
| buyer_id        | integer    | null: false , foreign_key: true          |

### Association

- belongs_to :buyer

