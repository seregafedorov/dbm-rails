ActiveAdmin.register Profile do
  menu :priority => 3

  config.filters = false

  permit_params :name, :tags, :description, :photo, :slugged_url, :remove_photo, :position,
                translations_attributes: [:id, :name, :tags, :description, :locale, :credit, :surname]

  member_action :toggle_visible, :method => :put do
    Profile.transaction do
      profile = Profile.friendly.find(params[:id])
      # Project.update_all({:shown_on_main => false})
      # Activity.update_all({:shown_on_main => false})
      profile.update_attribute(:visible, !profile.visible)
      redirect_to admin_profiles_path
    end
  end

  index do
    column :id
    column :name do |profile|
      "#{profile.name} #{profile.surname}"
    end
    actions do |profile|
      link_to (profile.visible ? 'Скрыть с сайта' : 'Показать на сайте'), toggle_visible_admin_profile_path(profile), :method => :put
    end
  end


  form do |f|
    f.inputs 'Детали' do
      f.input :slugged_url, as: :string
      f.input :position, as: :number
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :name, as: :string
        t.input :surname, as: :string
        t.input :tags, as: :string
        t.input :description
        t.input :credit, as: :string
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
    skip_filter :init_profiles

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end


end
