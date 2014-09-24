ActiveAdmin.register Profile do
  menu :priority => 3

  config.filters = false

  permit_params :name, :tags, :description, :photo, :slugged_url, :remove_photo,
                translations_attributes: [:id, :name, :tags, :description, :locale]

  index do
    column :id
    column :name do |profile|
      profile.name
    end
    actions do |profile|

    end
  end


  form do |f|
    f.inputs 'Детали' do
      f.input :slugged_url, as: :string
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :name, as: :string
        t.input :tags, as: :string
        t.input :description

      end

      f.input :photo, :as => :file, :hint => (f.template.link_to(f.object.photo.file.filename, f.object.photo_url) if f.object.photo.file)
      if f.object.photo.file
        f.input :remove_photo, as: :boolean
      end


    end
    f.actions
  end

  controller do
    skip_filter :init_projects
    skip_filter :init_activities
    skip_filter :inti_profiles

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end


end
