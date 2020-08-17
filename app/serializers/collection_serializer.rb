class CollectionSerializer < ActiveModel::Serializer
    attributes :id
    has_many :artwork_collections
    has_many :artworks, through: :artwork_collections
end
