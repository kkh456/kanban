class List < ApplicationRecord
  belongs_to :user

  has_many :cards, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, length: { in: 1..255 }

  def liked_by(user)
    Like.find_by(user_id: user.id, list_id: list.id)
  end
end
