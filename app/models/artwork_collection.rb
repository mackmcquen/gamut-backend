class ArtworkCollection < ApplicationRecord
    belongs_to :artwork
    belongs_to :collection
end
