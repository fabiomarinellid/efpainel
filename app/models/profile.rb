class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :site

  scope :profile_user_id, -> (user_id) { all.where(user_id: user_id) }

  scope :profile_id, -> (id) { all.where(id: id) }

end
