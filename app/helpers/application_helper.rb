module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "RIO"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def toon_prijs(prijs)
    number_to_currency(prijs,:unit=>'€ ')
  end


  def link_to_remove_fields(name, f, options = {})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end

  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{ association }", :onsubmit => "return $(this.)validate();") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to_function(name, "add_fields(this, \"#{ association }\", \"#{ escape_javascript(fields) }\")", options)
  end
end
