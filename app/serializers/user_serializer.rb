class UserSerializer < ActiveModel::Serializer
    attributes :id
    has_one :collection
    has_many :artworks, through: :artwork_collections
  end
