class Ong < ApplicationRecord
  has_many :initiatives

  def some_initiatives(max = 5)
    initiatives.where(active: true).limit(max).order('RANDOM()')
  end
end
