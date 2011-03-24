# The methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def test_helper
  end
  
  # Temporary rewriting of this method to avoid conflicts with the new category_selector defined in kmaps_integration;
  # this method will be removed once this app's references to category_selector jive with the kmaps_integration's 
  # category_selector. 
  #def category_selector(a1, a2, a3, a4, a5, a6)
  #end

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
      get_content('http://www.thlib.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-offsite.php') do |document|
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
  
  #def side_column
      # get_content('http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-template.php') do |document|
      #   content = document.at("//div[@id=side-column]")
      #   content.to_html
      # end
  #    $sidebar
  #end

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
    
    def stylesheet_files
      super + ['jquery.autocomplete', 'jquery.checktree','thickbox', 'modalbox', 'menu', 'http://www.thlib.org/global/css/thdl_style.css', 'http://www.thlib.org//reference/dictionaries/tibetan-dictionary/css/tibetan-dictionary.css', 'thdl_public']
    end

    def javascript_files
      if @current_section == :home
        super 
      else 
        if @current_section == :showview
          super + ['thickbox-compressed']
        else
          ['jquery','jquery-ui'] + super +  ['jquery.inplace.pack','jquery.autocomplete', 'jquery.checktree', 'model-searcher','thickbox-compressed', 'modalbox','menu', 'menu_items', 'menu_tpl']
          #super +  ['jquery.inplace.pack','jquery.autocomplete', 'jquery.checktree', 'model-searcher','thickbox-compressed', 'modalbox','menu', 'menu_items', 'menu_tpl']
        end
      end
    end
    
    def tmb_url
      hostname = Socket.gethostname.downcase
      if hostname =~ /sds[3-578].itc.virginia.edu/
        tmb = 'http://tmb.thlib.org'
      elsif hostname == 'sds6.itc.virginia.edu'
        tmb = 'http://tmb.staging.thlib.org'
      elsif hostname == 'dev.thlib.org'
        tmb = 'http://tmb.dev.thlib.org'
      else
        tmb = 'http://tmb.thlib.org'
      end
      return tmb
    end
    
    def app_host_url
      hostname = Socket.gethostname.downcase
      if hostname =~ /sds[3-578].itc.virginia.edu/
        app_host = 'http://thlib.org'
      elsif hostname == 'sds6.itc.virginia.edu'
        app_host = 'http://staging.thlib.org'
      elsif hostname == 'dev.thlib.org'
        app_host = 'http://dev.thlib.org'
      else
        app_host = 'http://thlib.org'
      end
      return app_host
    end
    
    def side_column_links
      host_url = app_host_url
      str = "	<h4 id=\"side-home-link\"><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/\" title=\"Tibetan Dictionary Home\">Tibetan Dictionary Home</a></h4>"
      str += "<h3 class=\"head\">#{link_to 'Tibetan Dictionary Project', '#nogo', {:hreflang => 'Description for Tibetan Dictionary Project.'}}</h3>\n<ul>\n"
  	  #str += "<li>#{link_to 'Home', root_path, {:hreflang => 'Dictionary Home.'}}</li>\n" 
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20overview.html\" title=\"\">Project Overview</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20introduction.html\" title=\"\">Historical Dictionary Intro</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/translate.php\" title=\"\">Tibetan Translation</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20status%20report.html\" title=\"\">Status</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl tibetan historical dictionary help.html\" title=\"\">Dictionaries Help</a></li>"
  	  
  	  #if !session[:user].nil?
  	    str += "<li class=\"loggedon\">#{link_to 'Edit', edit_main_definition_path, {:hreflang => 'Dictionary Edit.'}}</li>\n"   
  	    str += "<li class=\"loggedon\">#{link_to 'New', new_main_definition_path, {:hreflang => 'Dictionary New.'}}</li>\n" 
      #end
      str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/sitewiki/c06fa8cf-c49c-4ebc-007f-482de5382105/tibetan historical dictionary editorial manual.html\">Editorial Manual</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20about%20us.html\" title=\"\">About Us</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20how%20to%20participate.html\" title=\"\">How to Participate</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20sponsors.html\" title=\"\">Sponsors</a></li>"
			str += "<li><a href=\"#{host_url}/reference/dictionaries/tibetan-dictionary/about/wiki/thdl%20tibetan%20historical%20dictionary%20how%20to%20cite.html\" title=\"\">How to Cite</a></li>"
			str += "<li><a href=\"javascript:linkTo_UnCryptMailto('nbjmup;uimAdpmmbc/jud/wjshjojb/fev');\">Contact Us</a></li>"
      str += "</ul>"
      
  		str += "<h3 class=\"head global-links\"><a href=\"#nogo\" title=\"\">Reference</a></h3>"
      str += "\n<ul>\n"
      str += "<li><a href=\"#{host_url}/reference/\" title=\"Link to Reference Home Page\">Reference Home</a></li>"
    	str += "<li><a href=\"#{host_url}/reference/bibliographies/\" title=\"\">Bibliographies</a></li>"
    	str += "<li><a href=\"#{host_url}/reference/dictionaries/\" title=\"\">Dictionaries</a></li>"
    	str += "<li><a href=\"#{host_url}/reference/search-places/\" title=\"\">Search for Places</a></li>"
    	str += "<li><a href=\"#{host_url}/reference/tibetan-grammar/\" title=\"\">Tibetan Grammars</a></li>"
    	str += "<li><a href=\"#{host_url}/reference/tibetan-translation/\" title=\"\">Tibetan Translation</a></li>"
    	str += "<li><a href=\"#{host_url}/reference/timelines/\" title=\"\">Timelines</a></li>"
    	str += "<li>#{link_to 'Topical Map Builder', tmb_url}</li>"
    	str += "<li><a href=\"#{host_url}/reference/transliteration/\" title=\"\">Transliteration</a></li>"
      str += "</ul>"
      
      return str      
    end
    
    def login_status
      ''
    end
    
    def tinymce_show_action(edit_action)
      case edit_action
      when "analytical_note_edit"
        "analytical_note_show"
      when "image_description_edit"
        "image_description_show"
      when "audio_description_edit"
        "audio_description_show"
      when "video_description_edit"
        "video_description_show"
      when "metadata_note_edit"
        "metadata_note_show"
      when "passage_edit"
        "passage_show"  
      when "translation_edit"
        "translation_show"
      when "translation_popupedit"
        "translation_popupshow"   
      when "source_note_edit"
        "source_note_show"  
      when "translation_equivalent_edit"
        "translation_equivalent_show"
      when "translation_equivalent_popupedit"
        "translation_equivalent_popupshow"
      when "model_sentence_edit"
        "model_sentence_show"    
      end
    end
    
    def tinymce_update_action(edit_action)
      case edit_action
      when "analytical_note_edit"
        "update_analytical_note"
      when "image_description_edit"
        "update_image_description"
      when "audio_description_edit"
        "update_audio_description"
      when "video_description_edit"
        "update_video_description"
      when "metadata_note_edit"
        "update_metadata_note"
      when "passage_edit"
        "update_passage" 
      when "translation_edit"
        "update_translation"
      when "translation_popupedit"
        "update_popuptranslation"   
      when "source_note_edit"
        "update_source_note"   
      when "translation_equivalent_edit"
        "update_translation_equivalent"  
      when "translation_equivalent_popupedit"
        "update_popup_translation_equivalent"
      when "model_sentence_edit"
        "update_model_sentence" 
      end
    end
    
    def tinymce_edit_url(controller, update_action, id)
      case update_action
      when "update_analytical_note", "analytical_note_show"
        case controller
        when "definitions"
          definition_analytical_note_edit_url(:id => id)
        when "etymologies"
          etymology_analytical_note_edit_url(:id => id)
        when "pronunciations"
          pronunciation_analytical_note_edit_url(:id => id)
        when "literary_quotations"
          literary_quotation_analytical_note_edit_url(:id => id) 
        when "translations"
          translation_analytical_note_edit_url(:id => id) 
        when "translation_equivalents"
          translation_equivalent_analytical_note_edit_url(:id => id)  
        when "spellings"
          spelling_analytical_note_edit_url(:id => id)
        when "model_sentences"
            model_sentence_analytical_note_edit_url(:id => id)
        when "oral_quotations"
          oral_quotation_analytical_note_edit_url(:id => id)      
        end
      when "update_image_description", "image_description_show"
        case controller
          when "definitions"
            definition_image_description_edit_url(:id => id)
          when "etymologies"
            etymology_image_description_edit_url(:id => id)
          when "pronunciations"
            pronunciation_image_description_edit_url(:id => id)
          when "literary_quotations"
            literary_quotation_image_description_edit_url(:id => id) 
          when "translation_equivalents"
            translation_equivalent_image_description_edit_url(:id => id) 
          when "spellings"
            spelling_image_description_edit_url(:id => id) 
          when "model_sentences"
            model_sentence_image_description_edit_url(:id => id) 
          when "oral_quotations"
            oral_quotation_image_description_edit_url(:id => id)  
        end
      when "update_audio_description", "audio_description_show"
        case controller
          when "definitions"
            definition_audio_description_edit_url(:id => id)
          when "etymologies"
            etymology_audio_description_edit_url(:id => id)
          when "pronunciations"
            pronunciation_audio_description_edit_url(:id => id)
          when "literary_quotations"
            literary_quotation_audio_description_edit_url(:id => id) 
          when "spellings"
            spelling_audio_description_edit_url(:id => id)
          when "model_sentences"
            model_sentence_audio_description_edit_url(:id => id)
          when "oral_quotations"
            oral_quotation_audio_description_edit_url(:id => id)       
        end
      when "update_video_description", "video_description_show"
        case controller
          when "definitions"
            definition_video_description_edit_urll(:id => id)
          when "etymologies"
            etymology_video_description_edit_url(:id => id)
          when "pronunciations"
            pronunciation_video_description_edit_url(:id => id)
          when "literary_quotations"
            literary_quotation_video_description_edit_url(:id => id) 
          when "spellings"
            spelling_video_description_edit_url(:id => id)
          when "model_sentences"
            model_sentence_video_description_edit_url(:id => id)   
          when "oral_quotations"
            oral_quotation_video_description_edit_url(:id => id)  
        end
      when "update_passage", "passage_show"
        case controller
          when "literary_quotations"
            literary_quotation_passage_edit_url(:id => id)  
        end  
      when "update_metadata_note", "metadata_note_show"
        case controller
          when "metas"
            meta_metadata_note_edit_url(:id => id)  
        end
      when "update_translation", "translation_show"
        case controller
          when "translations"
            translation_translation_edit_url(:id => id)  
        end
      when "update_popuptranslation", "translation_popupshow"
        case controller
          when "translations"
            translation_translation_popupedit_url(:id => id)  
        end  
      when "update_source_note", "source_note_show"
        case controller
          when "sources"
            source_source_note_edit_url(:id => id)  
        end 
      when "update_translation_equivalent", "translation_equivalent_show"
        case controller
          when "translation_equivalents"
            translation_equivalent_translation_equivalent_edit_url(:id => id)  
        end
      when "update_popup_translation_equivalent", "translation_equivalent_popupshow"
        case controller
          when "translation_equivalents"
            translation_equivalent_translation_equivalent_popupedit_url(:id => id)  
        end
      when "update_model_sentence", "model_sentence_show"
        case controller
          when "model_sentences"
            model_sentence_model_sentence_edit_url(:id => id)  
        end     
      end            
    end
    
    def tinymce_field(edit_action)
      case edit_action
      when "analytical_note_edit"
        "analytical_note"
      when "image_description_edit"
        "image_description"
      when "audio_description_edit"
        "audio_description"
      when "video_description_edit"
        "video_description"
      when "metadata_note_edit"
        "metadata_note"  
      when "passage_edit"
        "passage"
      when "translation_edit"
        "translation" 
      when "translation_popupedit"
        "translation"  
      when "source_note_edit"
        "source_note" 
      when "translation_equivalent_edit"
        "translation_equivalent"
      when "translation_equivalent_popupedit"
        "translation_equivalent"
      when "model_sentence_edit"
        "model_sentence"      
      end
    end
    
    def tinymce_field_show(update_action)
      case update_action
      when "update_analytical_note", "analytical_note_show"
        "analytical_note"
      when "update_image_description", "image_description_show"
        "image_description"
      when "update_audio_description", "audio_description_show"
        "audio_description"
      when "update_video_description", "video_description_show"
        "video_description"
      when "update_metadata_note", "metadata_note_show"
        "metadata_note"
      when "update_passage", "passage_show"
        "passage" 
      when "update_translation", "translation_show"
        "translation"
      when "update_popuptranslation", "translation_popupshow"
        "translation"  
      when "update_source_note", "source_note_show"
        "source_note" 
      when "update_translation_equivalent", "translation_equivalent_show"
        "translation_equivalent"
      when "update_popup_translation_equivalent", "translation_equivalent_popupshow"
        "translation_equivalent"  
      when "update_model_sentence", "model_sentence_show"
        "model_sentence"        
      end
    end
    

  end
