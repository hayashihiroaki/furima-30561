# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :credit_card

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           |            |                                |       
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |       
| shipment_source | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## credit_cards テーブル

| Column           | Type      | Options                       |
| ---------------- | --------- | ----------------------------- |
| number           | integer   | null: false                   |
| explanation_date | integer   | null: false                   |
| security_code    | integer   | null: false                   |
| postal_code      | integer   | null: false                   |
| city             | string    | null: false                   |
| house_number     | string    | null: false                   |
| building_name    | string    |                               |
| phone_number     | integer   | null: false                   |
| user             | reference | null: false foreign_key: true |

### Association

- belongs_to :user