module TranslationsHelper
  def show_translation
    resultstr = ""
    resultstr << "<p><b>Translation: </b>"
    resultstr << "<br>"
    if @translation.translation != nil 
      resultstr << @translation.translation
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Language: </b>"
    if @translation.language != nil 
      resultstr << @translation.language
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @translation.analytical_note != nil 
      resultstr << @translation.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_translation
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('translation', { :align => "left" })
    resultstr << sort_header_tag('language', { :align => "left" })
    resultstr << sort_header_tag('analytical_note', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for translation in @translations
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation.translation.to_s unless translation.translation == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation.language.to_s unless translation.language == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation.analytical_note.to_s unless translation.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => translation.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => translation.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => translation.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_translation
    resultstr = ""
    resultstr << "<p><b>Translation: </b><br>"
    resultstr << "<textarea cols=65 name=translation[translation] rows=3 wrap=virtual >"
    resultstr << @translation.translation if @translation.translation != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Language: </b><br>"
    resultstr << "<input size=80 name=translation[language] type=text value=\""
    resultstr << @translation.language if @translation.language != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=translation[analytical_note] rows=3 wrap=virtual >"
    resultstr << @translation.analytical_note if @translation.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_translation
    resultstr = ""
    resultstr << "<b>Translation: </b>"
    resultstr << "<input type=hidden name=translation[translation] id=translation[translation] value=\""+@translation.translation.to_s+"\" >"
    #if @translation.translation == nil or @translation.translation == ''
    #  @translation.translation = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :translation, :translation, {}, {:cols => 80, :rows => 10, :fieldname => 'translation[translation]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@translation.id}_translationdiv" + "'>"
    edit_path = translation_translation_edit_url(:id => @translation.id)
    if @translation.translation == nil or @translation.translation == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @translation.translation      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@translation.id}_translationdiv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"

    resultstr << "<b>Language: </b>"
    resultstr << "<input type=hidden name=translation[language] id=translation[language] value=\""+@translation.language.to_s+"\" >"
    if @translation.language_type == nil
      title = 'Click to modify'
    else
      title = @translation.language_type.title
    end
    resultstr << "<span id=\"translation[language_type#{@translation.id}]_selector\">"
    resultstr << '['+@translation.language+']' if @translation.language != nil
    resultstr << link_to_remote( title,{:update => "translation[language_type#{@translation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'translations', :action => 'display_category_selector', :id => @translation.id, :params => {'data_id' => 184, 'model_name' => 'translation', 'function_name' => "language_type", :update_id => "translation[language_type#{@translation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('translation[language_type"+@translation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('translation[language_type"+@translation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('translation[language_type"+@translation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('translation[language_type"+@translation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=translation[analytical_note] id=translation[analytical_note] value=\""+@translation.analytical_note.to_s+"\" >"
    #if @translation.analytical_note == nil or @translation.analytical_note == ''
    #  @translation.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :translation, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'translation[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@translation.id}_anotediv" + "'>"
    edit_path = translation_analytical_note_edit_url(:id => @translation.id)
    if @translation.analytical_note == nil or @translation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @translation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@translation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"

  end

  def modal_edit_dynamic_translationa
    debugger
    resultstr = ""
    resultstr << "<b>Translation: </b>"
    @data = Category.find(184)
    resultstr << category_selector(@data, :definition, :language_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "<br>"
  end
  
  def modal_edit_dynamic_translation
    resultstr = ""
    resultstr << "<b>Translation: </b>"
    #resultstr << "<input type=hidden name=translation[translation] id=translation[translation] value=\""+@translation.translation.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@translation.id}_translationpopupdiv" + "'>"
    edit_path = translation_translation_popupedit_url(:id => @translation.id)
    if @translation.translation == nil or @translation.translation == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @translation.translation      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@translation.id}_translationpopupdiv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"

    resultstr << "<b>Language: </b>"
    #resultstr << "<input type=hidden name=translation[language] id=translation[language] value=\""+@translation.language.to_s+"\" >"
    #if @translation.language_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @translation.language_type.title
    #end
    #resultstr << "<span id=\"translation[language_type#{@translation.id}]_selector\">"
    #resultstr << '['+@translation.language+']' if @translation.language != nil
    #resultstr << link_to_remote( title,{:update => "translation[language_type#{@translation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'translations', :action => 'display_category_selector', :id => @translation.id, :params => {'data_id' => 184, 'model_name' => 'translation', 'function_name' => "language_type", :update_id => "translation[language_type#{@translation.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('translation[language_type"+@translation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('translation[language_type"+@translation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('translation[language_type"+@translation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('translation[language_type"+@translation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #@data = Category.find(184)
    ##resultstr << category_selector(@data, :translation, :language_type, false, :hasTree => 'false', :singleSelectionTree => 'true')    
    #if @translation.language_type == nil
    #  title = ''
    #else
    #  title = @translation.language_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data, 
  	#				:varname => :translation,
  	#				:selectable => false,
  	#				:fieldname => :language_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
 
 		#<!-- Language div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_translation_association_url(@translation.id, 184), :update => "#{@translation.id}_translation_language_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'translations', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@translation.id}_translation_language_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_translation_associations/index', :locals => {:data_id => 184})		
		assoc = @translation.category_translation_associations.find(:all, :conditions => {:category_branch_id => 184})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
 
        
    resultstr << "<b>Analytical note: </b>"
    #resultstr << "<input type=hidden name=translation[analytical_note] id=translation[analytical_note] value=\""+@translation.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@translation.id}_anotediv" + "'>"
    edit_path = translation_analytical_note_edit_url(:id => @translation.id)
    if @translation.analytical_note == nil or @translation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @translation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@translation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
  end


  def show_edit_translation
    resultstr = ""
    resultstr << "<p><b>Translation: </b><br>"
    if @translation.translation == nil or @translation.translation == ''
      @translation.translation = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation, :translation, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Language: </b><br>"
    if @translation.language == nil or @translation.language == ''
      @translation.language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation, :language, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @translation.analytical_note == nil or @translation.analytical_note == ''
      @translation.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_translation
    resultstr = ""
    resultstr << "<tr><td><b>Translation: </b></td>"
    resultstr << "<td><input size=50 name=translation[translation] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language: </b></td>"
    resultstr << "<td><input size=50 name=translation[language] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=translation[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
