class User < ApplicationRecord
    has_secure_password
    validates :username, :email, uniqueness: { case_sensitive: false }
    has_one :collection
    has_many :artwork_collections, through: :collection
    has_many :artworks, through: :artwork_collections
    before_create :create_collection

    def create_collection
        collection = build_collection(:title => 'Collection')
    end
end
