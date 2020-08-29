class Card < ApplicationRecord
  belongs_to :list
  has_many :users, through: :favorites

  validates :title, length: { in: 1..255 }
  validates :memo,  length: { maximum: 1000 }
end
