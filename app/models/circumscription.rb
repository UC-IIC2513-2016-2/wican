class Circumscription < ApplicationRecord
  has_many :senators
  validates :number, presence: true, numericality: :only_integer
  validates :name, presence: true
end
