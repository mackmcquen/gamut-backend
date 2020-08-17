class ArtworksController < ApplicationController

    def index
        artworks = Artwork.all
        render json: artworks
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def create
        artwork = Artwork.create(artwork_params)
        render json: artwork
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end
end

private

def artwork_params
    params.require(:artwork).permit(:id, :image, :title, :artist, :date)
end
