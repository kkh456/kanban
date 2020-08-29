class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :list, optional: true

  validates_uniqueness_of :list_id, scope: :user_id
end
