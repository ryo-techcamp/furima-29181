# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| --------------| ------  | ----------- |
| nick_name     | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| sei           | string  | null: false |
| mei           | string  | null: false |
| sei_kana      | string  | null: false |
| mei_kana      | string  | null: false |
| date          | integer | null: false |
### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column           | Type    　|Options           |
| -----------------| -------- | ------------------|
| image            | string   | null: false       |
| product_name     | string   | null: false       |
| description      | text     | null: false       |
| category         | integer  | null: false       |
| status           | integer  | null: false       |
| delivery_fee     | integer  | null: false       |
| shipping_origin  | integer  | null: false       |
| date_of_shipment | integer  | null: false       |
| price            | integer  | null: false       |
### Association

- belongs_to:user
- has_one:buyer

## buyers テーブル
| Column          | Type       | Options                    |
| ------          | ---------- | -------------------------- |
| user_id         |            |                            |
| item_id         |            |                            |

### Association

- has_one :shipping_address

## shipping_address テーブル 

| Column          | Type       | Options                    |
| ------          | ---------- | -------------------------- |
| postal_code     | string     | null: false                |
| prefecture      | string     | null: false                |
| city            | string     | null: false                |
| address         | integer    | null: false                |
| building_name   | string     |                            |
| phone_number    | integer    | null: false                | 

### Association

- belongs_to :buyer

