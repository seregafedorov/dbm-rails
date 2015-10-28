class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :show_projects_menu, only: [:index]

  def index
    @section_title = I18n.t('menu.projects')
  end

  def show
    @section_title = @project.name
    render :layout => 'project'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.where(visible: true).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:project]
    end
end
