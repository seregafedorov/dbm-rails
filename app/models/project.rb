class Project < ActiveRecord::Base
  translates :name, :card_info, :feat_heading, :feat_lead, :tag, :credit

  has_many :project_sections
  has_many :project_relations, foreign_key: 'parent_id'
  has_many :related_projects, through: :project_relations, source: :child

  accepts_nested_attributes_for :project_relations

  extend FriendlyId
  friendly_id :slugged_url, use: [:slugged, :history]

  active_admin_translates :name, :card_info, :feat_heading, :feat_lead, :tag, :credit
  accepts_nested_attributes_for :project_sections, :allow_destroy => true
  accepts_nested_attributes_for :project_relations, :allow_destroy => true

  mount_uploader :card_image, CardImageUploader

  default_scope -> { order(:position, :updated_at) }


  # before_validation :set_project_section_position

  def should_generate_new_friendly_id?
    slug.blank? || slugged_url_changed?
  end

  def set_project_section_positions!

    if project_sections.size > 0
      positions = project_sections.map { |item| item.position }

      max_position = positions.max { |p1, p2| p1 <=> p2 }
      max_position = max_position + 10

      project_sections.each do |section|
        if section.position == 0
          section.update_attribute(:position, max_position)
          max_position = max_position + 10
        end
      end

    end
  end

end
