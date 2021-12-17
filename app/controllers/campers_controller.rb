class CampersController < ApplicationController

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        new_camper = Camper.new(camper_params)
        # render json: new_camper, status: :created
        if new_camper.save
            render json: new_camper, status: :created
        else
            render json: {errors: new_camper.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    def camper_params
        params.permit(:name, :age)
    end
end
