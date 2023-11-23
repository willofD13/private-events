class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  validates :username, presence: true,uniqueness: true, length: { minimum: 5}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5}
end
