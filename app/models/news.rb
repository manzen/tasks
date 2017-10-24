class News < ApplicationRecord
  belongs_to :user
  belongs_to :section

  validates :url, {presence: true}
end
