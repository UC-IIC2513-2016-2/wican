class Ong < ApplicationRecord
  include ImageUploader[:logo]
  has_many :initiatives
  validates :name, presence: true
  validates :description, presence: true

  def some_initiatives(max = 5)
    initiatives.where(active: true).limit(max).order('RANDOM()')
  end
end
