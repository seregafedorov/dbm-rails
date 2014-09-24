ActiveAdmin.register Activity do
  menu :priority => 3

  config.filters = false

  permit_params :name, :heading, :description, :link, :link_text, :attachment, :slugged_url, :card_image, :position, :vimeo_video_str, :preview_video_image, :remove_attachment,
                gallery_images_attributes: [:image, :id, :_destroy],
                translations_attributes: [:id, :name, :heading, :description, :link, :link_text, :locale, :credit]

  # member_action :show_on_main, :method => :put do
  #   Activity.transaction do
  #     activity = Activity.friendly.find(params[:id])
  #     Project.update_all({:shown_on_main => false})
  #     Activity.update_all({:shown_on_main => false})
  #     activity.update_attribute(:shown_on_main, true)
  #     redirect_to admin_activities_path
  #   end
  # end

  index do
    column :id
    column :name do |activity|
      activity.name
    end
    actions do |activity|

    end
  end


  form do |f|
    f.inputs 'Детали' do
      f.input :slugged_url, as: :string
      f.input :position, as: :number
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :name, as: :string
        t.input :heading, as: :string
        t.input :description
        t.input :link, as: :string
        t.input :link_text, as: :string
        t.input :credit, as: string
      end

      f.input :attachment, :as => :file, :hint => (f.template.link_to(f.object.attachment.file.filename, f.object.attachment_url) if f.object.attachment.file)
      if f.object.attachment.file
        f.input :remove_attachment, as: :boolean
      end
      f.input :card_image, :as => :file, :hint => f.template.image_tag(f.object.card_image_url,  width: 400, height: 'auto' )

      f.input :vimeo_video_str, as: :string
      f.inputs 'Preview image', :multipart => true do
        f.input :preview_video_image, :as => :file, :hint => f.template.image_tag(f.object.preview_video_image_url,  width: 400, height: 'auto' )
        f.input :preview_video_image_cache, :as => :hidden
      end

      f.has_many :gallery_images do |gallery_image|
        unless gallery_image.object.new_record?
          gallery_image.input :_destroy, :as => :boolean, :label => 'Удалить'
        end
        gallery_image.inputs 'Attachment', :multipart => true do
          gallery_image.input :image, :as => :file, :hint => gallery_image.template.image_tag(gallery_image.object.image_url,  width: 400, height: 'auto' )
          gallery_image.input :image_cache, :as => :hidden
        end

        # gallery_image.input :image, :as => :file
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
