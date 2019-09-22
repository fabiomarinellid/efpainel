class Title < ApplicationRecord
  belongs_to :site

  mount_uploader :photologo, PhotologoUploader
end
