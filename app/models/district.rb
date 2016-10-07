class District < ApplicationRecord
  has_many :deputies
  belongs_to :circumscription
  validates :number, presence: true, numericality: :only_integer
end
