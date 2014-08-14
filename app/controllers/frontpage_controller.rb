class FrontpageController < ApplicationController
  before_action :show_projects_menu
  before_action :show_activities_menu
  layout 'application'

  def index
    main_project = Project.where(:shown_on_main => true).reorder('RANDOM()').first
    # main_activity = Activity.where(:shown_on_main => true).first
    @main_page_object = main_project
  end

  def team

  end

  def share_callback

  end

end