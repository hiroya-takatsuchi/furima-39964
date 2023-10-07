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
  |Column    |Type    | Options     |
  |---------------------------------|
  | name     | string | null: false |
  | nickname | string | null: false |
  | email    | string | null: false |
  | password | string | null: false |
  | birthday | string | null: false |

  ### Association
  - belongs_to :items
  - has_many   :purchase

  ### items テーブル
  | Column          | Type           | Option      |
  |------------------------------------------------|
  | item            | string         | null: false |
  | text            | string         | null: false |
  | category        | string         | null: false |
  | status          | string         | null: false |
  | delivery_charge | string         | null: false |
  | shipping_area   | string         | null: false |
  | shipping_day    | string         | null: false |
  | price           | integer        | null: false |

  ### Association
  - has_many :users
  - belongs_to :shipping address

  ### purchase テーブル
  | Column | Type      | Options     |
  |----------------------------------|
  | use_id  | references   | null: false, foreign_key:true |
  | item    | references   | null: false, foreign_key:true |

  ### Association
  - belongs_to :users
  - has_one :shipping address
 
  ### shipping address テーブル
  | Column  | Type       | Options     |
  |----- ------------------------------|
  | user_id | references | null: false, foreign_key:true |
  | address | string     | null: false                   |

  ### Association
  - has_many :items
  - belongs_to :purchase