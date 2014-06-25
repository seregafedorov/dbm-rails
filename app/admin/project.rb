ActiveAdmin.register Project do

  permit_params :name, :card_info,
                translations_attributes: [:id, :name, :card_info, :locale],
                project_sections_attributes: [
                    :id, :_destroy,
                    translations_attributes: [:id, :name, :locale],
                    project_section_images_attributes: [
                        :id, :_destroy, :image,
                        translations_attributes: [:id, :caption, :locale]
                    ]
                ]


  form do |f|
    f.inputs 'Детали' do
      f.translated_inputs 'Translated fields', switch_locale: false do |t|
        t.input :name, as: :string
        t.input :card_info, as: :string
      end

      f.has_many :project_sections do |ps|
        ps.translated_inputs 'Translated fields', switch_locale: false do |t|
          t.input :name, as: :string
        end

        ps.has_many :project_section_images do |psi|
          psi.translated_inputs 'Translated fields', switch_locale: false do |t|
            t.input :caption, as: :string
          end
          psi.input :image, as: :file
        end


      end

    end
    f.actions
  end

end
