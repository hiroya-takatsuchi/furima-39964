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

# テーブル設計

  ### users テーブル
  | Column             | Type    | Options                   |
  | ------------------------------------------------------- |
  | nickname           | string | null: false               |
  | email              | string | null: false, unique: true |
  | encrypted_password | string | null: false               |
  | confirm_password   | string | null: false               |
  | first_name         | string | null: false               |
  | last_name          | string | null: false               |
  | kana_first_name    | string | null: false               |
  | kana_last_name     | string | null: false               |
  | birthday           | date   | null: false               |

  ### Association
  - has_many :items
  - has_many :purchases

  ### items テーブル
  | Column             | Type           | Option      |
  | ------------------------------------------------- |
  | item               | string         | null: false |
  | text               | text           | null: false |
  | category_id        | string         | null: false |
  | status_id          | string         | null: false |
  | delivery_charge_id | string         | null: false |
  | shipping_area_id   | string         | null: false |
  | shipping_day_id    | string         | null: false |
  | price              | integer        | null: false |

  ### Association
  - belongs_to :users
  - belongs_to :purchases

  ### purchases テーブル
  | Column  | Type         | Options                       |
  | ------------------------------------------------------ |
  | use_id  | references   | null: false, foreign_key:true |
  | item    | references   | null: false, foreign_key:true |

  ### Association
  - belongs_to :users
  - has_one :shipping address
  - has_many :items
 
  ### shipping address テーブル
  | Column  | Type       | Options                       |
  | ---- ----------------------------------------------- |
  | user_id | references | null: false, foreign_key:true |
  | address | string     | null: false                   |

  ### Association
  - belongs_to :purchase