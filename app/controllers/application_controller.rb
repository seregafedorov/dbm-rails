class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :init_projects
  before_action :init_activities

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def init_projects
    @projects = Project.all
  end

  def init_activities
    @activities = Activity.all
  end

  def show_projects_menu
    @show_projects = true
  end

  def show_activities_menu
    @show_activities = true
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end


end
