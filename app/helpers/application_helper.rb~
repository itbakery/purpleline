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

end
