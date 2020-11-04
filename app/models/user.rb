class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :birthday,         presence: true
  validates :email,            presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,         presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :name_sei, presence: true
    validates :name_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :name_sei_kana,  presence: true
    validates :name_name_kana, presence: true
  end
end
