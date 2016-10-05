class Deputy < Representative
  belongs_to :district
  validates :name, presence: true
  validates :email, presence: true

  scope :for_municipality, -> (municipality_id) {
    return nil if municipality_id.blank?
    # más eficiente
    # joins('INNER JOIN municipalities ON deputies.district_id = municipalities.district_id')
    #   .where(municipalities: { id: municipality_id })

    # sin SQL
    joins(district: [:municipalities]).where(municipalities: { id: municipality_id })
  }
end
