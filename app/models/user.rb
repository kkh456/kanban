class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
has_many :cards, dependent: :destroy
has_many :lists, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :group_users
has_many :groups, through: :group_users
has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  def already_favorited?(list)
    self.favorites.exists?(list_id: list.id)
  end
end
