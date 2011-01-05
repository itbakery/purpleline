module ApplicationHelper
  def title(page_title)
    content_for(:title) {page_title}
  end
  def display_date(input_date)
    return input_date.strftime("%d %B %Y at %I:%M%p")
  end
  def display_date_short(input_date)
    return input_date.strftime("%d %B %Y at %I:%M%p")
  end
  
    # override select_tag to allow the ":include_blank => true" and ":prompt => 'whatever'" options
  include ActionView::Helpers::FormTagHelper
  alias_method :orig_select_tag, :select_tag
  def select_tag(name, select_options, options = {}, html_options = {})
    # remove the options that select_tag doesn't currently recognise
    include_blank = options.has_key?(:include_blank) && options.delete(:include_blank)
    prompt = options.has_key?(:prompt) && options.delete(:prompt)
    # if we didn't pass either - continue on as before
    return orig_select_tag(name, select_options, options.merge(html_options)) unless include_blank || prompt

    # otherwise, add them in ourselves
    prompt_option  = "<option value=\"\">" # to make sure it shows up as nil
    prompt_option += (prompt ? prompt.to_s : "") + "</option>"
    new_select_options = prompt_option + select_options
    orig_select_tag(name, new_select_options.html_safe, options.merge(html_options))
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")").html_safe)
  end

end
