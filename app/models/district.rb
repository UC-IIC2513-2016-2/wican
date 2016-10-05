class District < ApplicationRecord
  has_many :deputies
  has_many :municipalities
  belongs_to :circumscription
  validates :number, presence: true, numericality: :only_integer
end
