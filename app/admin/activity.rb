ActiveAdmin.register Activity do

  permit_params :name, :heading, :description, :link, :link_text, :attachment


  form do |f|
    f.inputs "Детали" do
      f.input :name
      f.input :heading
      f.input :description
      f.input :link
      f.input :link_text
      f.input :attachment, :as => :file
    end
    f.actions
  end

end
