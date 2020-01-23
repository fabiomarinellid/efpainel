class Observation < ApplicationRecord
  belongs_to :site

  enum active: {:disable => 0, :enable => 1}
end
