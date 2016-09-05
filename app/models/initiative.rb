class Initiative < ApplicationRecord
  belongs_to :ong

  scope :active, -> { where(active: true) }

  def short_description
    self.description.truncate(100)
  end
end
