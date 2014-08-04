class FrontpageController < ApplicationController
  before_action :init_projects
  before_action :init_activities
  layout 'application'

  def index
    main_project = Project.where(:shown_on_main => true).first
    main_activity = Activity.where(:shown_on_main => true).first
    @main_page_object = main_project ? main_project : main_activity
  end

  def team

  end

  def share_callback

  end

end