class FrontpageController < ApplicationController
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