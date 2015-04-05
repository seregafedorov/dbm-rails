class DynamicContent < ActiveRecord::Base
  extend Enumerize

  enumerize :content_type, in: [:main_page], scope: true

  translates :content

  active_admin_translates :content

  def self.main_page
    DynamicContent.with_content_type(:main_page).first
  end


end