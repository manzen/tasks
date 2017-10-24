class Book < ApplicationRecord
  belongs_to :user
  belongs_to :section

  validates :name, {presence: true}
end
