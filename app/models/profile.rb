class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :site

  scope :profile, -> (user_id) { all.where(user_id: user_id) }

end
