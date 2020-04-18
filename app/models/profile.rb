class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :site

  scope :profile, -> (user, site) { all.where(user_id: user, site_id: site, active: 1) }
  scope :profile_views, -> (user, site) { all.where(user_id: user, site_id: site, active: 1, read: 1) }

  scope :read_permit, -> (profile, user, site) { where(code: profile, user_id: user, site_id: site, active: 1, read: 1).size }
  scope :create_permit, -> (profile, user, site) { where(active: 1, create: 1, code: profile, user_id: user, site_id: site ).size }
  scope :edit_permit, -> (profile, user, site) { where(active: 1, edit: 1, code: profile, user_id: user, site_id: site ).size }
  scope :erase_permit, -> (profile, user, site) { where(active: 1, erase: 1, code: profile, user_id: user, site_id: site ).size }

end
