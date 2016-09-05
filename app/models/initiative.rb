class Initiative < ApplicationRecord
  belongs_to :ong
  has_many :signs, class_name: 'InitiativeSign'
  scope :active, -> { where(active: true) }

  def short_description
    self.description.truncate(100)
  end
end
