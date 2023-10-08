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
  | Column             | Type   | Options                   |
  | ------------------------------------------------------- |
  | nickname           | string | null: false               |
  | email              | string | null: false, unique: true |
  | encrypted_password | string | null: false               |
  | first_name         | string | null: false               |
  | last_name          | string | null: false               |
  | kana_first_name    | string | null: false               |
  | kana_last_name     | string | null: false               |
  | birthday           | date   | null: false               |

  ### Association
  - has_many :items
  - has_many :purchases

  ### items テーブル
  | Column             | Type            | Option                        |
  | -------------------------------------------------------------------- |
  | user               | references      | null: false, foreign_key:true |
  | item               | string          | null: false                   |
  | text               | text            | null: false                   |
  | category_id        | integer         | null: false                   |
  | status_id          | integer         | null: false                   |
  | delivery_charge_id | integer         | null: false                   |
  | shipping_area_id   | integer         | null: false                   |
  | shipping_day_id    | integer         | null: false                   |
  | price              | integer         | null: false                   |

  ### Association
  - belongs_to :user
  - has_one :purchase

  ### purchases テーブル
  | Column  | Type         | Options                       |
  | ------------------------------------------------------ |
  | user    | references   | null: false, foreign_key:true |
  | item    | references   | null: false, foreign_key:true |

  ### Association
  - belongs_to :user
  - has_one :shipping_address
  - belongs_to :item
  
  ### shipping_addresses テーブル
  | Column           | Type         | Options                       |
  | ---- ---------------------------------------------------------- |
  | post_code        | string       | null: false                   |
  | shipping_area_id | integer      | null: false                   |
  | city             | string       | null: false                   |
  | street           | string       | null: false                   |
  | building         | string       | 
  | telephone        | string       | null: false                   |
  | purchase         | references   | null: false, foreign_key:true |

  ### Association
  - belongs_to :purchase