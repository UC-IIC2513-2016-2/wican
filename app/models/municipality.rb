class Municipality < ApplicationRecord
  belongs_to :district
  validates :name, presence: true
end
