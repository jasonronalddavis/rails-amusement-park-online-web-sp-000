class AttractionsController < ApplicationController
    
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end


    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)

    end 

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end


    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_ratiing)
    end

end