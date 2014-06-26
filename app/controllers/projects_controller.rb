class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @menu_projects = Project.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:project]
    end
end
