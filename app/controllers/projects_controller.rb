class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :init_projects, only: [:index]

  def index
    @section_title = I18n.t('menu.projects')
  end

  def show
    @section_title = @project.name
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
