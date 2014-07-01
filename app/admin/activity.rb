ActiveAdmin.register Activity do
  menu :priority => 3

  config.filters = false

  permit_params :name, :heading, :description, :link, :link_text, :attachment, :slugged_url, :card_image,
                gallery_images_attributes: [:image, :id, :_destroy],
                translations_attributes: [:id, :name, :heading, :description, :link, :link_text, :locale]


  form do |f|
    f.inputs 'Детали' do
      f.input :slugged_url, as: :string
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :name, as: :string
        t.input :heading, as: :string
        t.input :description
        t.input :link, as: :string
        t.input :link_text, as: :string
      end

      f.input :attachment, :as => :file, :hint => f.template.link_to(f.object.attachment.file.filename, f.object.attachment_url )
      f.input :card_image, :as => :file, :hint => f.template.image_tag(f.object.card_image_url)

      f.has_many :gallery_images do |gallery_image|

        gallery_image.inputs 'Attachment', :multipart => true do
          gallery_image.input :image, :as => :file, :hint => gallery_image.template.image_tag(gallery_image.object.image_url)
          gallery_image.input :image_cache, :as => :hidden
        end

        # gallery_image.input :image, :as => :file
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
