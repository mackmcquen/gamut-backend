class Artwork < ApplicationRecord
    has_many :artwork_collections
    has_many :collections, through: :artwork_collections
end
