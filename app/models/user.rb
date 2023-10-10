class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthday, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}
       


end