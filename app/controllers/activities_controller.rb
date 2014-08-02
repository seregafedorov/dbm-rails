class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]
  before_action :init_projects_and_activities

  def index

  end

  def show

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params[:activity]
    end
end
