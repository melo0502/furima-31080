# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------  | ------  | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| name_kana | string  | null: false |
| birthday  | integer | null: false |

## items テーブル

| Column        | Type        | Options                        |
| ------        | ------      | -----------                    |
| title         | string      | null: false                    |
| explanation   | text        | null: false                    |
| category      | integer     | null: false                    |
| status        | integer     | null: false                    |
| delivery_fee  | integer     | null: false                    |
| ship_form     | integer     | null: false                    |
| delivery_days | integer     | null: false                    |
| price         | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |

## order テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## address テーブル

| Column        | Type        | Options                        |
| ------        | ----------  | ------------------------------ |
| postal_card   | integer     | null: false                    |
| prefectures   | integer     | null: false                    |
| phone_number  | integer     | null: false                    |
| municipality  | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      | null: false                    |
| order         | references  | null: false, foreign_key: true |