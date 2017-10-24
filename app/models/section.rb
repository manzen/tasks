class Section < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :news, dependent: :destroy

  validates :name, {presence: true}
end
