ActiveAdmin.register Project do
  menu :priority => 2
  permit_params :name, :card_info, :feat_heading, :feat_lead, :card_image, :tag,
                translations_attributes: [:id, :name, :card_info, :feat_heading, :feat_lead, :locale, :tag],
                project_sections_attributes: [
                    :id, :_destroy,
                    translations_attributes: [:id, :name, :subheading, :section_text, :locale],
                    project_section_images_attributes: [
                        :id, :_destroy, :image,
                        translations_attributes: [:id, :caption, :locale]
                    ]
                ]


  form do |f|
    f.inputs 'Детали' do
      f.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
        t.input :name, as: :string
        t.input :card_info, as: :string
        t.input :feat_heading, as: :string
        t.input :feat_lead, as: :string
        t.input :tag, as: :string
      end

      f.input :card_image, as: :file, :hint => f.template.image_tag(f.object.card_image_url)
      f.input :card_image_cache, :as => :hidden

      f.has_many :project_sections do |ps|
        ps.translated_inputs 'Translated fields', switch_locale: false, auto_sort: false do |t|
          t.input :name, as: :string
          t.input :subheading, as: :string
          t.input :section_text, as: :string
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

end
