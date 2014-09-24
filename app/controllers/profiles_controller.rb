class ProfilesController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @section_title = I18n.t('menu.profiles')
  end

  def show
    @section_title = @profile.name
    render :layout => 'project'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @profile = Profile.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params[:profile]
  end
end