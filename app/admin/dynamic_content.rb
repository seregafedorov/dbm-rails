ActiveAdmin.register DynamicContent do
  menu :priority => 1

  config.filters = false

  permit_params :content_type,
                translations_attributes: [:id, :content, :locale]

  index do
    column :id
    column :content_type
    actions do |dynamic_content|

    end
  end


  form do |f|
    f.inputs 'Детали' do
      f.input :content_type, as: :select, collection: DynamicContent.content_type.values
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :content, as: :text
      end
    end
    f.actions
  end

  controller do
    skip_filter :init_projects
    skip_filter :init_activities
    skip_filter :init_profiles

  end


end
