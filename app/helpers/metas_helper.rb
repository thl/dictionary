module MetasHelper
  def edit_source
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    resultstr << "<input type=hidden name=source[source_id] id=source[source_id] value=\""+@source.source_id.to_s+"\" >"
    if @source.source_id == nil or @source.source_id == ''
      @source.source_id = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :source_id, {}, {:cols => 50, :rows => 1, :fieldname => 'source[source_id]'}) +"<br>"
    resultstr << "<b>Source type: </b>"
    resultstr << "<input type=hidden name=source[source_type] id=source[source_type] value=\""+@source.source_type.to_s+"\" >"
    if @source.source_type == nil or @source.source_type == ''
      @source.source_type = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :source, :source_type, {}, {:select_options => @source_type, :fieldname => 'source[source_type]'})+"<br>"

    resultstr << "<b>Page number: </b>"
    resultstr << "<input type=hidden name=source[page_number] id=source[page_number] value=\""+@source.page_number.to_s+"\" >"
    if @source.page_number == nil or @source.page_number == ''
      @source.page_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[page_number]'}) +"<br>"
    resultstr << "<b>Source note: </b>"
    resultstr << "<input type=hidden name=source[source_note] id=source[source_note] value=\""+@source.source_note.to_s+"\" >"
    if @source.source_note == nil or @source.source_note == ''
      @source.source_note = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :source_note, {}, {:cols => 70, :rows => 4, :fieldname => 'source[source_note]'}) +"<br>"
    
  end

  def show_source
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    if @source.source_id != nil 
      resultstr << @source.source_id
    end 
    resultstr << "<br>"
    resultstr << "<b>Source type: </b>"
    if @source.source_type != nil 
      resultstr << @source.source_type
    end 
    resultstr << "<br>"
    resultstr << "<b>Page number: </b>"
    if @source.page_number != nil 
      resultstr << @source.page_number
    end 
    resultstr << "<br>"
    resultstr << "<b>Source note: </b>"
    if @source.source_note != nil 
      resultstr << @source.source_note
    end 
    resultstr << "<br>"
  end
  
  def show_meta
    resultstr = ""
    resultstr << "<p><b>Project: </b>"
    if @meta.project != nil 
      resultstr << @meta.project
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source: </b>"
    if @meta.source != nil 
      resultstr << @meta.source
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source type: </b>"
    if @meta.source_type != nil 
      resultstr << @meta.source_type
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Metadata note: </b>"
    resultstr << "<br>"
    if @meta.metadata_note != nil 
      resultstr << @meta.metadata_note
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Precedence: </b>"
    if @meta.precedence != nil 
      resultstr << @meta.precedence
    end 
    resultstr << "</p>"
  end

  def list_meta
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('project', { :align => "left" })
    resultstr << sort_header_tag('source', { :align => "left" })
    resultstr << sort_header_tag('source_type', { :align => "left" })
    resultstr << sort_header_tag('metadata_note', { :align => "left" })
    resultstr << sort_header_tag('precedence', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for metum in @metas
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	metum.project.to_s unless metum.project == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	metum.source.to_s unless metum.source == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	metum.source_type.to_s unless metum.source_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	metum.metadata_note.to_s unless metum.metadata_note == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	metum.precedence.to_s unless metum.precedence == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => metum.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => metum.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => metum.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_meta
    resultstr = ""
    resultstr << "<p><b>Project: </b><br>"
    resultstr << "<input size=80 name=meta[project] type=text value=\""
    resultstr << @meta.project if @meta.project != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source: </b><br>"
    resultstr << "<input size=80 name=meta[source] type=text value=\""
    resultstr << @meta.source if @meta.source != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source type: </b><br>"
    resultstr << "<input size=80 name=meta[source_type] type=text value=\""
    resultstr << @meta.source_type if @meta.source_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Metadata note: </b><br>"
    resultstr << "<textarea cols=65 name=meta[metadata_note] rows=3 wrap=virtual >"
    resultstr << @meta.metadata_note if @meta.metadata_note != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Precedence: </b><br>"
    resultstr << "<input size=32 name=meta[precedence] type=text value=\""
    resultstr << @meta.precedence if @meta.precedence != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_meta
    resultstr = ""
    resultstr << "<b>Project: </b>"
    resultstr << "<input type=hidden name=meta[project] id=meta[project] value=\""+@meta.project.to_s+"\" >"
    if @meta.project_type == nil or @meta.project_type == ''
      title = 'Click to modify'
    else
      title = @meta.project_type.title
    end
    resultstr << "<span id=\"meta[project_type#{@meta.id}]_selector\">"
    resultstr << '['+@meta.project+']' if @meta.project != nil
    resultstr << link_to_remote( title,{:update => "meta[project_type#{@meta.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'metas', :action => 'display_category_selector', :id => @meta.id, :params => {'data_id' => 236, 'model_name' => 'meta', 'function_name' => "project_type", :update_id => "meta[project_type#{@meta.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('meta[project_type"+@meta.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('meta[project_type"+@meta.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('meta[project_type"+@meta.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('meta[project_type"+@meta.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << "<b>Source ID: </b>"
    # resultstr << "<input type=hidden name=meta[source] id=meta[source] value=\""+@meta.source.to_s+"\" >"
    # if @meta.source == nil or @meta.source == ''
    #   @meta.source = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :meta, :source, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[source]'}) +"<br>"
    # resultstr << "<b>Source type: </b>"
    # resultstr << "<input type=hidden name=meta[source_type] id=meta[source_type] value=\""+@meta.source_type.to_s+"\" >"
    # if @meta.source_type == nil or @meta.source_type == ''
    #   @meta.source_type = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :meta, :source_type, {}, {:select_options => @source_type, :fieldname => 'meta[source_type]'})+"<br>"
    # resultstr << "<b>Title: </b>"
    # resultstr << @meta.title unless @meta.title == nil
    # resultstr << "<br>"
    # 
    # resultstr << "<b>Author: </b>"
    # resultstr << @meta.author unless @meta.author == nil
    # resultstr << "<br>"
    # 
    # # resultstr << "<b>Page number: </b>"
    # # resultstr << "<input type=hidden name=meta[page_number] id=meta[page_number] value=\""+@meta.page_number.to_s+"\" >"
    # # if @meta.page_number == nil or @meta.page_number == ''
    # #   @meta.page_number = 'Click to modify'
    # # end
    # # resultstr << in_place_form_editor_field( :meta, :page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[page_number]'}) +"<br>"
    # # resultstr << @meta.page_number unless @meta.page_number == nil
    # # resultstr << "<br>"
    # 
    # resultstr << "<b>Date of publication: </b>"
    # resultstr << @meta.date_of_publication unless @meta.date_of_publication == nil
    # resultstr << "<br>"
    # 
    # resultstr << "<b>Publisher: </b>"
    # resultstr << @meta.publisher unless @meta.publisher == nil
    # resultstr << "<br>"
    # 
    # resultstr << "<b>Place of publication: </b>"
    # resultstr << @meta.place_of_publicatio unless @meta.place_of_publication == nil
    # resultstr << "<br>"

    resultstr << "<b>Metadata note: </b>"
    resultstr << "<input type=hidden name=meta[metadata_note] id=meta[metadata_note] value=\""+@meta.metadata_note.to_s+"\" >"
    #if @meta.metadata_note == nil or @meta.metadata_note == ''
    #  @meta.metadata_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :meta, :metadata_note, {}, {:cols => 80, :rows => 10, :fieldname => 'meta[metadata_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@meta.id}_anotediv" + "'>"
    edit_path = meta_metadata_note_edit_url(:id => @meta.id)
    if @meta.metadata_note == nil or @meta.metadata_note == ''
      t_note = 'Click to modify'
    else
      t_note = @meta.metadata_note      
    end    
    resultstr << link_to_remote(t_note, :url => edit_path, :update => "#{@meta.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


    resultstr << "<b>Precedence: </b>"
    resultstr << "<input type=hidden name=meta[precedence] id=meta[precedence] value=\""+@meta.precedence.to_s+"\" >"
    if @meta.precedence == nil or @meta.precedence == ''
      @meta.precedence = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :meta, :precedence, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[precedence]'}) +"<br>"
    resultstr << "<b>Language: </b>"
    
    if @meta.language_type == nil or @meta.language_type == ''
      title = 'Click to modify'
    else
      title = @meta.language_type.title
    end
    resultstr << "<span id=\"meta[language_type#{@meta.id}]_selector\">"
    resultstr << '['+@meta.language+']' if @meta.language != nil
    resultstr << link_to_remote( title,{:update => "meta[language_type#{@meta.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'metas',:action => 'display_category_selector', :id => @meta.id, :params => {'data_id' => 184, 'model_name' => 'meta', 'function_name' => "language_type", :update_id => "meta[language_type#{@meta.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('meta[language_type"+@meta.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('meta[language_type"+@meta.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('meta[language_type"+@meta.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('meta[language_type"+@meta.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
  end

  def modal_edit_dynamic_meta
    resultstr = ""
    #resultstr << "<b>Project: </b>"
    #resultstr << "<input type=hidden name=meta[project] id=meta[project] value=\""+@meta.project.to_s+"\" >"
    resultstr << "<b>Project Type: </b>"
    #if @meta.project_type == nil or @meta.project_type == ''
    #  title = 'Click to modify'
    #else
    #  title = @meta.project_type.title
    #end
    #resultstr << "<span id=\"meta[project_type#{@meta.id}]_selector\">"
    #resultstr << '['+@meta.project+']' if @meta.project != nil
    #resultstr << link_to_remote( title,{:update => "meta[project_type#{@meta.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'metas', :action => 'display_category_selector', :id => @meta.id, :params => {'data_id' => 236, 'model_name' => 'meta', 'function_name' => "project_type", :update_id => "meta[project_type#{@meta.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('meta[project_type"+@meta.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('meta[project_type"+@meta.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('meta[project_type"+@meta.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('meta[project_type"+@meta.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(236)
    ##resultstr << category_selector(@data, :meta, :project_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @meta.project_type == nil
    #  title = ''
    #else
    #  title = @meta.project_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :meta,
  	#				:selectable => false,
  	#				:fieldname => :project_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>" 
    #<!-- Project Type div -->
 		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_meta_association_url(@meta.id, 236), :update => "#{@meta.id}_meta_project_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'metas', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@meta.id}_meta_project_type_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_meta_associations/index', :locals => {:data_id => 236})		
		assoc = @meta.category_meta_associations.find(:all, :conditions => {:category_branch_id => 236})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}"  + "</td></tr></table><br />"
		resultstr << "</div>"
 
    # resultstr << "<b>Source ID: </b>"
    # resultstr << "<input type=hidden name=meta[source] id=meta[source] value=\""+@meta.source.to_s+"\" >"
    # if @meta.source == nil or @meta.source == ''
    #   @meta.source = 'Click to modify'
    # end
    ## resultstr << in_place_form_editor_field( :meta, :source, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[source]'}) +"<br>"
    #resultstr << "<b>Source type: </b>"
    ## resultstr << "<input type=hidden name=meta[source_type] id=meta[source_type] value=\""+@meta.source_type.to_s+"\" >"
    #if @meta.source_type == nil or @meta.source_type == ''
    #  @meta.source_type = 'Click to modify'
    #end
    ## resultstr << in_place_select_editor_field( :meta, :source_type, {}, {:select_options => @source_type, :fieldname => 'meta[source_type]'})+"<br>"
    #resultstr << select(:meta, :source_type, @source_type) + "<br>"
    
    resultstr << "<b>Title: </b>"
    #resultstr << @meta.title unless @meta.title == nil
    #resultstr << "<br>"
    if @meta.title == nil or @meta.title == ''
      @meta.title = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :title, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[title]'}) 
    
    # 
    resultstr << "<br><b>Author: </b>"
    # resultstr << @meta.author unless @meta.author == nil
    # resultstr << "<br>"
    if @meta.author == nil or @meta.author == ''
      @meta.author = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :author, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[author]'}) 
     
    # # resultstr << "<b>Page number: </b>"
    # # resultstr << "<input type=hidden name=meta[page_number] id=meta[page_number] value=\""+@meta.page_number.to_s+"\" >"
    # # if @meta.page_number == nil or @meta.page_number == ''
    # #   @meta.page_number = 'Click to modify'
    # # end
    # # resultstr << in_place_form_editor_field( :meta, :page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[page_number]'}) +"<br>"
    # # resultstr << @meta.page_number unless @meta.page_number == nil
    # # resultstr << "<br>"
    # 
    resultstr << "<br><b>Date of publication: </b>"
    # resultstr << @meta.date_of_publication unless @meta.date_of_publication == nil
    # resultstr << "<br>"
    if @meta.date_of_publication == nil or @meta.date_of_publication == ''
      @meta.date_of_publication = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :date_of_publication, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[date_of_publication]'}) 
     
    resultstr << "<br><b>Publisher: </b>"
    # resultstr << @meta.publisher unless @meta.publisher == nil
    # resultstr << "<br>"
    if @meta.publisher == nil or @meta.publisher == ''
      @meta.publisher = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :publisher, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[publisher]'}) 
    
    
    resultstr << "<br><b>Place of publication: </b>"
    # resultstr << @meta.place_of_publicatio unless @meta.place_of_publication == nil
    # resultstr << "<br>"
    if @meta.place_of_publication == nil or @meta.place_of_publication == ''
      @meta.place_of_publication = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :place_of_publication, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[place_of_publication]'}) 

    resultstr << "<br><b>Metadata note: </b>"
    #resultstr << "<input type=hidden name=meta[metadata_note] id=meta[metadata_note] value=\""+@meta.metadata_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@meta.id}_anotediv" + "'>"
    edit_path = meta_metadata_note_edit_url(:id => @meta.id)
    if @meta.metadata_note == nil or @meta.metadata_note == ''
      t_note = 'Click to modify'
    else
      t_note = @meta.metadata_note      
    end    
    resultstr << link_to_remote(t_note, :url => edit_path, :update => "#{@meta.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


    resultstr << "<b>Precedence: </b>"
    #resultstr << "<input type=hidden name=meta[precedence] id=meta[precedence] value=\""+@meta.precedence.to_s+"\" >"
    if @meta.precedence == nil or @meta.precedence == ''
      @meta.precedence = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :precedence, {}, {:cols => 50, :rows => 1, :fieldname => 'meta[precedence]'}) 
    
    resultstr << "<br><b>Language: </b>"
    #if @meta.language_type == nil or @meta.language_type == ''
    #  title = 'Click to modify'
    #else
    #  title = @meta.language_type.title
    #end
    #resultstr << "<span id=\"meta[language_type#{@meta.id}]_selector\">"
    #resultstr << '['+@meta.language+']' if @meta.language != nil
    #resultstr << link_to_remote( title,{:update => "meta[language_type#{@meta.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'metas',:action => 'display_category_selector', :id => @meta.id, :params => {'data_id' => 184, 'model_name' => 'meta', 'function_name' => "language_type", :update_id => "meta[language_type#{@meta.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('meta[language_type"+@meta.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('meta[language_type"+@meta.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('meta[language_type"+@meta.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('meta[language_type"+@meta.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(184)
    ##resultstr << category_selector(@data, :meta, :language_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @meta.language_type == nil
    #  title = ''
    #else
    #  title = @meta.language_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :meta,
  	#				:selectable => false,
  	#				:fieldname => :language_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
  	#resultstr << "<br>"
  	
  	##<!-- Language div -->
 		#resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_meta_association_url(@meta.id, 184), :update => "#{@meta.id}_meta_language_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		##resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'metas', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		#resultstr << "<div id='" + "#{@meta.id}_meta_language_type_div" + "'>" 
		##resultstr << render_to_string(:partial => 'category_meta_associations/index', :locals => {:data_id => 184})		
		#assoc = @meta.category_meta_associations.find(:all, :conditions => {:category_branch_id => 184})
    #resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		#resultstr << "</div>"
  	
  	##<!-- Language div single association -->
 		#edit_path = meta_language_edit_url(:id => @meta.id)
    #resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => edit_path, :update => "#{@meta.id}_meta_language_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
   	#resultstr << "<div id='" + "#{@meta.id}_meta_language_type_div" + "'>" 
  	#assoc = @meta.language_type.title  if !@meta.language_type.blank? 
    ##resultstr << "<table><tr><td>" + "#{assoc}" + "</td></tr></table>"
    #resultstr << "<table><tr><td>"
    #if !@meta.language_type.blank? 
    #  resultstr << link_to (@meta.language_type.title, @meta.language_type.get_url_with_parent)
    #end
    #resultstr << "</td></tr></table>"
   	#resultstr << "</div><br />"
  	#resultstr << "</div><br />"

    #removing the Language div and transforming into a selector, not using the pluging but using the current single association
    @data = Category.find(184)
    @language_type = @data.children.collect {|l| [ h(l.title), l.id ] }
    resultstr << select(:meta, :language_type_id, @language_type, { :include_blank => true })
    resultstr << "<br>"
    
  end

  def show_edit_meta
    resultstr = ""
    resultstr << "<p><b>Project: </b><br>"
    if @meta.project == nil or @meta.project == ''
      @meta.project = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :project, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source: </b><br>"
    if @meta.source == nil or @meta.source == ''
      @meta.source = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :source, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source type: </b><br>"
    if @meta.source_type == nil or @meta.source_type == ''
      @meta.source_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :source_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Metadata note: </b><br>"
    if @meta.metadata_note == nil or @meta.metadata_note == ''
      @meta.metadata_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :metadata_note, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Precedence: </b><br>"
    if @meta.precedence == nil or @meta.precedence == ''
      @meta.precedence = 'Click to modify'
    end
    resultstr << in_place_editor_field( :meta, :precedence, {}, :rows => 1) +"<br>"
  end

  def search_meta
    resultstr = ""
    resultstr << "<tr><td><b>Project: </b></td>"
    resultstr << "<td><input size=50 name=meta[project] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source: </b></td>"
    resultstr << "<td><input size=50 name=meta[source] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source type: </b></td>"
    resultstr << "<td><input size=50 name=meta[source_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Metadata note: </b></td>"
    resultstr << "<td><input size=50 name=meta[metadata_note] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Precedence: </b></td>"
    resultstr << "<td><input size=50 name=meta[precedence] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
