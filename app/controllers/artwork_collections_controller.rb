class ArtworkCollectionsController < ApplicationController

    def index
        artwork_collections = ArtworkCollection.all
        render json: artwork_collections
    end

    def create
        artwork_collection = ArtworkCollection.create(artwork_collection_params)
        render json: artwork_collection
    end
end

private

def artwork_collection_params
    params.require(:artwork_collection).permit(:id, :collection_id, :artwork_id)
end
