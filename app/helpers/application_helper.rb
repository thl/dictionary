# The methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def test_helper
  end

  def stylesheet_link_tag_html4( _n )
    return stylesheet_link_tag( _n ).gsub( ' />', '>' )
  end
  
  def get_content_old(url)
      begin
        doc = Hpricot(open(url))
        yield doc
      rescue Errno::EHOSTUNREACH
        "Can't connect to #{url}"
      rescue Errno::ETIMEDOUT
        "Can't connect to #{url}"
      rescue SocketError
        "Can't connect to #{url}"      
      end
  end

  def banner
      get_content('http://www.thlib.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
        content = document.at("//div[@id=masthead-title]")
        $title = content.to_html
        content = document.at("//div[@id=thdlmenu-link-1]")
        $menu1 = content.to_html
        content = document.at("//div[@id=highslide-html-1]")
        $menu1_content = content.to_html
        content = document.at("//div[@id=thdlmenu-link-2]")
        $menu2 = content.to_html
        content = document.at("//div[@id=highslide-html-2]")
        $menu2_content = content.to_html
        content = document.at("//ul[@id=masthead-navbar]")
        $navbar = content.to_html
        content = document.at("//div[@id=side-column]")
        $sidebar = content.to_html
        content = document.at("//div[@id=footer]")
        $footer = content.to_html
        
        content = document.at("//div[@id=masthead-banner]")
        content.to_html
      end
  end

  def title
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=masthead-title]")
      #   content.to_html
      # end
      $title
  end

  def menu1
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=thdlmenu-link-1]")
      #   content.to_html
      # end
      $menu1
  end

  def menu1_content
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=highslide-html-1]")
      #   content.to_html
      # end
      $menu1_content
  end

  def menu2
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=thdlmenu-link-2]")
      #   content.to_html
      # end
      $menu2
  end

  def menu2_content
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=highslide-html-2]")
      #   content.to_html
      # end
      $menu2_content
  end

  def navbar
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//ul[@id=masthead-navbar]")
      #   content.to_html
      # end
      $navbar
  end
  
  def side_column
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=side-column]")
      #   content.to_html
      # end
      $sidebar
  end

  def footer
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=footer]")
      #   content.to_html
      # end
      $footer
  end

  # def banner
  #     get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
  #       content = document.at("//div[@id=masthead-banner]")
  #       content.to_html
  #     end
  # end

  
  def in_place_select_editor_field(object,
                                   method,
                                   tag_options = {},
                                   in_place_editor_options = {})
    tag = ::ActionView::Helpers::InstanceTag.new(object, method, self)
    tag_options = { :tag => "span",
                    :id => "#{object}_#{method}_#{tag.object.id}_in_place_editor",
                    :class => "in_place_editor_field"}.merge!(tag_options)
    in_place_editor_options[:url] =
      in_place_editor_options[:url] ||
        url_for({ :action => "set_#{object}_#{method}", :id => tag.object.id })
                tag.to_content_tag(tag_options.delete(:tag), tag_options) +
        in_place_select_editor(tag_options[:id], in_place_editor_options)
  end

  def in_place_select_editor(field_id, options = {})
    select_options = options[:select_options].map{|opt| escape_javascript(opt)}
    function = "new Ajax.InPlaceSelectEditor(" 
    function << "'#{field_id}', " 
    function << "'#{url_for(options[:url])}' " 
    puts "================== #{options}"
    # print " =============== new Array('"+select_options.join("','") +"')\n"
    js_options = {}
    js_options['selectOptionsHTML'] = " new Array('"+select_options.join("','") +"')"
    js_options['fieldname'] = %('#{options[:fieldname]}') if options[:fieldname]
    js_options['externalControl'] = "'#{options[:external_control]}'" if options[:external_control]
    
    function << (', ' + options_for_javascript(js_options
#         {
#         'selectOptionsHTML' => " new Array('"+
#                               select_options.join("','") +
#                               "')"# ,
# #         'fieldname' => options[:fieldname]
#         }
      )
    ) if options[:select_options]

    function << ' )'
    javascript_tag(function)
  end

      def in_place_form_editor(field_id, options = {})
        function =  "new Ajax.InPlaceEditor("
        function << "'#{field_id}', "
        function << "'#{url_for(options[:url])}'"

        js_options = {}
        js_options['cancelText'] = %('#{options[:cancel_text]}') if options[:cancel_text]
        js_options['okText'] = %('#{options[:save_text]}') if options[:save_text]
        js_options['loadingText'] = %('#{options[:loading_text]}') if options[:loading_text]
        js_options['rows'] = options[:rows] if options[:rows]
        js_options['cols'] = options[:cols] if options[:cols]
        js_options['size'] = options[:size] if options[:size]
        js_options['externalControl'] = "'#{options[:external_control]}'" if options[:external_control]
        js_options['loadTextURL'] = "'#{url_for(options[:load_text_url])}'" if options[:load_text_url]        
        js_options['ajaxOptions'] = options[:options] if options[:options]
        js_options['evalScripts'] = options[:script] if options[:script]
        js_options['callback']   = "function(form) { return #{options[:with]} }" if options[:with]

        js_options['fieldname'] = %('#{options[:fieldname]}') if options[:fieldname]
        #print '*********************'
        #print options[:fieldname]
        #print "\n"
        function << (', ' + options_for_javascript(js_options)) unless js_options.empty?
        
        function << ')'

        javascript_tag(function)
      end
      
      # Renders the value of the specified object and method with in-place editing capabilities.
      #
      # See the RDoc on ActionController::InPlaceEditing to learn more about this.
      def in_place_form_editor_field(object, method, tag_options = {}, in_place_editor_options = {})
        tag = ::ActionView::Helpers::InstanceTag.new(object, method, self)
        # puts "]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] #{object} = #{method} = #{in_place_editor_options}"
        #print "----------"+object.to_s+"\n"
        tag_options = {:tag => "span", :id => "#{object}_#{method}_#{tag.object.id}_in_place_editor", :class => "in_place_editor_field"}.merge!(tag_options)
        in_place_editor_options[:url] = in_place_editor_options[:url] || url_for({ :action => "set_#{object}_#{method}", :id => tag.object.id })
        # puts "------ content = #{tag.to_content_tag(tag_options.delete(:tag), tag_options)}"
        tag.to_content_tag(tag_options.delete(:tag), tag_options) +
        in_place_form_editor(tag_options[:id], in_place_editor_options)
      end

    def display_history
      resultstr = ''
      resultstr << update_history unless update_history == nil
      resultstr << "<br>"
      resultstr << link_to_function(image_tag('close_up.gif', :border=>0),'Element.hide("edit_box");')
      resultstr << "<br>"
      return resultstr
    end
    
    def side_column_links
      
    end

    def stylesheets
      styles = stylesheet_link_tag('base')
      styles += "\n"
      styles += stylesheet_link_tag('modalbox')
      styles += "\n"
      styles += stylesheet_link_tag('menu')
      styles += "\n"
      styles += stylesheet_link_tag('http://www.thlib.org/global/css/thdl_style.css')
      styles += "\n"
      styles += stylesheet_link_tag('http://www.thlib.org//reference/dictionaries/tibetan-dictionary/css/tibetan-dictionary.css')
      styles += "\n"
      styles += stylesheet_link_tag('thdl_public')
      
      return styles
    end
      
    def javascripts
      js = javascript_include_tag :defaults
      js += "\n"
      js += javascript_include_tag 'in_place_select_editor'
      js += "\n"
      js += javascript_include_tag 'modalbox','menu', 'menu_items', 'menu_tpl'
      
      return js
    end

end
