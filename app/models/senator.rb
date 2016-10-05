class Senator < Representative
  belongs_to :circumscription
  validates :name, presence: true
  validates :email, presence: true

  scope :for_municipality, -> (municipality_id) {
    return nil if municipality_id.blank?
    joins(circumscription: [districts: [:municipalities]])
      .where(municipalities: { id: municipality_id })
  }
end
