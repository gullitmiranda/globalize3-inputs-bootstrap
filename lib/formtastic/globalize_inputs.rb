module Formtastic
  class FormBuilder
    def globalize_inputs(*args, &proc)
      index = options[:child_index] || "#{self.object.class.to_s}-#{self.object.object_id}"
      linker = ActiveSupport::SafeBuffer.new
      fields = ActiveSupport::SafeBuffer.new
      
      ::I18n.available_locales.each do |locale|
        active_class = ::I18n.locale == locale ? "in active" : ""
        linker << self.template.content_tag(:li,
          self.template.content_tag(:a,
            ::I18n.t("translation.#{locale}"),
            :href => "#lang-#{locale}",
            :"data-toggle" => "tab"
          ),
          class: "#{active_class}",
        )
        fields << self.template.content_tag(:div,
          self.semantic_fields_for(*(args.dup << self.object.translation_for(locale)), &proc),
          :id => "lang-#{locale}",
          class: "tab-pane fade #{active_class}"
        )
      end

      linker = self.template.content_tag(:ul, linker, class: "nav nav-tabs language-selection")
      fields = self.template.content_tag(:div, fields, class: "tab-content")

      html = self.template.content_tag(:div,
        linker + fields,
        id: "language-tabs-#{index}",
        class: "tabbable tabs-left"
      )
    end
  end
end
