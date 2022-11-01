class SpicesController < ApplicationController

    def index 
        render json: Spice.all
    end
    
    def create 
        spice = Spice.create(params.permit(:title, :image, :description, :notes, :rating))
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.update(params.permit(:title, :image, :description, :notes, :rating))
            render json: spice
        else
            render json: {error: "Spice not found"}
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}
        end
    end
end
