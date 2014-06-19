class StaticPagesController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  private

  def layout_for_page
    # if params[:id].starts_with?('default_layout')
    #   'application'
    # else
    #   'empty_layout'
    # end
    'application'
  end
end