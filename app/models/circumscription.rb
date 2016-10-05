class Circumscription < ApplicationRecord
  has_many :senators
  has_many :districts
  validates :number, presence: true, numericality: :only_integer
  validates :name, presence: true
end
