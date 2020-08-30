class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :orders

  with_options presence: true do
    validates :birthday
    validates :nickname
    validates :email,    uniqueness: { case_sensitive: false },
                         format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: { minimum: 6 }
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } do
    validates :first_name
    validates :last_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :first_name_reading
    validates :last_name_reading
  end
end
