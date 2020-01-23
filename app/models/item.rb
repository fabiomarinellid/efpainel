class Item < ApplicationRecord
  belongs_to :category
  belongs_to :label
  belongs_to :site

  enum active: {:disable => 0, :enable => 1}
  enum bestseller: {:not_highlight => 0, :highlight => 1}

  # gem money-rails
  monetize :price_cents
end
