class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, dependent: :destroy

  validates :email, {presence: true, uniqueness: true}
  validates :encrypted_password, {presence: true}
  validates :name, {presence: true}

end
