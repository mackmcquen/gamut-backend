class Collection < ApplicationRecord
    belongs_to :user
    validates_uniqueness_of :user_id, :message => 'User can only have one Collection'
    has_many :artwork_collections
    has_many :artworks, through: :artwork_collections
end
