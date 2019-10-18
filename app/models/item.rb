class Item < ApplicationRecord
  belongs_to :category
  belongs_to :label
  belongs_to :site
end
