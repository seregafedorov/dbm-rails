ActiveAdmin.register Activity do

  permit_params :name, :heading, :description, :link, :link_text, :attachment,
                gallery_images_attributes: [:image, :id, :_destroy],
                translations_attributes: [:id, :name, :heading, :description, :link, :link_text, :locale]


  form do |f|
    f.inputs "Детали" do
      f.translated_inputs "Translated fields", switch_locale: false do |t|
        t.input :name
        t.input :heading
        t.input :description
        t.input :link
        t.input :link_text
      end

      f.input :attachment, :as => :file

      f.has_many :gallery_images do |gallery_image|
        gallery_image.input :image
      end

    end
    f.actions
  end

end
