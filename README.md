# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name_sei           | string  | null: false |
| name_name          | string  | null: false |
| name_sei_kana      | string  | null: false |
| name_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :orders
- has_many :items

## items テーブル

| Column           | Type        | Options                        |
| ------           | ------      | -----------                    |
| title            | string      | null: false                    |
| explanation      | text        | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    |
| delivery_fee_id  | integer     | null: false                    |
| ship_form_id     | integer     | null: false                    |
| delivery_days_id | integer     | null: false                    |
| price            | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user

## order テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## address テーブル

| Column         | Type        | Options                        |
| ------         | ----------  | ------------------------------ |
| ship_form_id   | integer     | null: false                    |
| postal_code    | string      | null: false                    |
| phone_number   | string      | null: false                    |
| municipality   | string      | null: false                    |
| address        | string      | null: false                    |
| building_name  | string      |                                |
| order          | references  | null: false, foreign_key: true |

### Association

- belongs_to :order

