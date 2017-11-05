class Card < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true 

end
