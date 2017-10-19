class Task < ApplicationRecord
  belongs_to :user
  belongs_to :priority

  validates :name, {presence: true}
end
