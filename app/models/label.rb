class Label < ApplicationRecord
  belongs_to :site

  enum color: { :danger => '#dc3545', :primary => '#007bff', :success => '#28a745', :warning => '#ffc107', :dark => '#343a40', :light => '#f8f9fa' }
end
