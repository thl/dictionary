module TopicalMapCategoriesHelper
  def category_selector_includes
    [javascript_include_tag('lightbox'), stylesheet_link_tag('lightbox')].join("\n")
  end
  def category_selector(main_category, instance_variable_name, field_name, includes = true, id=nil, update_id=nil)
    tag_prefix = "#{instance_variable_name}_#{field_name}"
    selected_category = instance_variable_get("@#{instance_variable_name.to_s}").send(field_name)
    return_str = includes ? category_selector_includes : ''
    return_str += "<span id=\"#{tag_prefix}_name\">"
    if selected_category.nil?
      return_str += '<i>None selected</i>'
      category_url = category_children_path(main_category)
    else
      return_str += selected_category.title
      category_url = category_children_path(main_category, :selected_category_id => selected_category.id)
    end
    return_str += "</span>\n("
    return_str += link_to("select #{h(main_category.title)}", category_url, :class => 'lbOn', :id => tag_prefix) +
                  ")\n" +
                  hidden_field(instance_variable_name, "#{field_name}_id") +
                  observe_field("#{tag_prefix}_id", :frequency => 0.5, :function => "new Ajax.Updater('junk','#{url_for(:controller => instance_variable_name.to_s.pluralize,:action => 'set_'+field_name+'_id', :id => id)} ',{parameters: {value: $('#{tag_prefix}_id').value, update_id: '#{update_id}'}});")
    return_str
  end
end