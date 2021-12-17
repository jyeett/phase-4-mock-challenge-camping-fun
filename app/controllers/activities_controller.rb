class ActivitiesController < ApplicationController

    def index
        render json: Activity.all
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.signups.each{|signup| signup.destroy}
        activity.destroy
        head :no_content
    end
end
