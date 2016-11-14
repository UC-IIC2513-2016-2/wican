class OngSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :initiatives

  link(:self) { ong_url(object) }

  class InitiativeSerializer < ActiveModel::Serializer
    attributes :title
    link(:self) { ong_initiative_url(object.ong_id, object) }
  end
end
