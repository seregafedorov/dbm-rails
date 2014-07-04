ActiveAdmin.register Project do
  menu :priority => 2

  config.filters = false

  permit_params :name, :card_info, :feat_heading, :feat_lead, :card_image, :tag, :slugged_url, :locale, :position,
                translations_attributes: [:id, :name, :card_info, :feat_heading, :feat_lead, :locale, :tag],
                project_sections_attributes: [
                    :id, :_destroy, :position, :locale,
                    translations_attributes: [:id, :name, :subheading, :section_text, :locale],
                    project_section_images_attributes: [
                        :id, :_destroy, :image,
                        translations_attributes: [:id, :caption, :locale]
                    ]
                ]

  after_save do |p|
    p.set_project_section_positions!
  end

  member_action :show_on_main, :method => :put do
    Project.transaction do
      project = Project.friendly.find(params[:id])
      Project.update_all({:shown_on_main => false})
      Activity.update_all({:shown_on_main => false})
      project.update_attribute(:shown_on_main, true)
      redirect_to admin_projects_path
    end
  end

  index do
    column :id
    column :name do |project|
      project.name
    end
    actions do |project|
      unless project.shown_on_main
        link_to 'Показать на главной', show_on_main_admin_project_path(project), :method => :put
      end
    end
  end


  form do |f|
    f.inputs 'Детали' do
      f.input :slugged_url, as: :string
      f.input :position, as: :number
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :name, as: :string
        t.input :card_info, as: :string
        t.input :feat_heading, as: :string
        t.input :feat_lead, as: :text
        t.input :tag, as: :string
      end

      f.input :card_image, as: :file, :hint => f.template.image_tag(f.object.card_image_url)
      f.input :card_image_cache, :as => :hidden

      f.has_many :project_sections do |ps|
        unless ps.object.new_record?
          ps.input :_destroy, :as => :boolean, :label => 'Удалить'
        end
        ps.input :position
        ps.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
          t.input :name, as: :string
          t.input :subheading, as: :string
          t.input :section_text, as: :text
        end

        ps.has_many :project_section_images do |psi|
          psi.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
            t.input :caption, as: :string
          end
          psi.input :image, as: :file, :hint => psi.template.image_tag(psi.object.image_url)
          psi.input :image_cache, as: :hidden
        end


      end

    end
    f.actions
  end


  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

end
