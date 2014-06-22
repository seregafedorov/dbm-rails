ActiveAdmin.register Activity do

  permit_params :name, :heading, :description, :link, :link_text, :attachment,
                gallery_images_attributes: [:image, :id, :_destroy]


  form do |f|
    f.inputs "Детали" do
      f.input :name
      f.input :heading
      f.input :description
      f.input :link
      f.input :link_text
      f.input :attachment, :as => :file

      f.has_many :gallery_images do |gallery_image|
        gallery_image.input :image
      end

    end
    f.actions
  end

end
