class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
has_many :cards, dependent: :destroy
has_many :lists, dependent: :destroy
has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  def aleady_favorited?(list)
    self.favorites.exists?(list_id: list.id)
  end
end
