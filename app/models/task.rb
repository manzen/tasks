class Task < ApplicationRecord
  belongs_to :user
  belongs_to :priority
  belongs_to :section

  validates :name, {presence: true}
end
