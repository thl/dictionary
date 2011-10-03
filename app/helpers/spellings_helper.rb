module SpellingsHelper
  def show_spelling
    resultstr = ""
    resultstr << "<p><b>Spelling: </b>"
    if @spelling.spelling != nil 
      resultstr << @spelling.spelling
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Basis of spelling: </b>"
    if @spelling.basis_of_spelling != nil 
      resultstr << @spelling.basis_of_spelling
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Spelling type: </b>"
    if @spelling.spelling_type != nil 
      resultstr << @spelling.spelling_type
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Specific dialect: </b>"
    if @spelling.specific_dialect != nil 
      resultstr << @spelling.specific_dialect
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary genre: </b>"
    if @spelling.literary_genre != nil 
      resultstr << @spelling.literary_genre
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary period: </b>"
    if @spelling.literary_period != nil 
      resultstr << @spelling.literary_period
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary form: </b>"
    if @spelling.literary_form != nil 
      resultstr << @spelling.literary_form
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @spelling.image != nil 
      resultstr << @spelling.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    resultstr << "<br>"
    if @spelling.image_caption != nil 
      resultstr << @spelling.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @spelling.image_photographer != nil 
      resultstr << @spelling.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @spelling.image_link != nil 
      resultstr << @spelling.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    resultstr << "<br>"
    if @spelling.image_description != nil 
      resultstr << @spelling.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @spelling.audio != nil 
      resultstr << @spelling.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @spelling.audio_id_number != nil 
      resultstr << @spelling.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @spelling.audio_speaker != nil 
      resultstr << @spelling.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @spelling.audio_date != nil 
      resultstr << @spelling.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @spelling.audio_place_of_recording != nil 
      resultstr << @spelling.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @spelling.audio_link != nil 
      resultstr << @spelling.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<br>"
    if @spelling.audio_description != nil 
      resultstr << @spelling.audio_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @spelling.video != nil 
      resultstr << @spelling.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @spelling.video_id_number != nil 
      resultstr << @spelling.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @spelling.video_speaker != nil 
      resultstr << @spelling.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @spelling.video_date != nil 
      resultstr << @spelling.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @spelling.video_place_of_recording != nil 
      resultstr << @spelling.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @spelling.video_link != nil 
      resultstr << @spelling.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<br>"
    if @spelling.video_description != nil 
      resultstr << @spelling.video_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @spelling.analytical_note != nil 
      resultstr << @spelling.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_spelling
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('spelling', { :align => "left" })
    resultstr << sort_header_tag('basis_of_spelling', { :align => "left" })
    resultstr << sort_header_tag('spelling_type', { :align => "left" })
    resultstr << sort_header_tag('specific_dialect', { :align => "left" })
    resultstr << sort_header_tag('literary_genre', { :align => "left" })
    resultstr << sort_header_tag('literary_period', { :align => "left" })
    resultstr << sort_header_tag('literary_form', { :align => "left" })
    resultstr << sort_header_tag('image', { :align => "left" })
    resultstr << sort_header_tag('image_caption', { :align => "left" })
    resultstr << sort_header_tag('image_photographer', { :align => "left" })
    resultstr << sort_header_tag('image_link', { :align => "left" })
    resultstr << sort_header_tag('image_description', { :align => "left" })
    resultstr << sort_header_tag('audio', { :align => "left" })
    resultstr << sort_header_tag('audio_id_number', { :align => "left" })
    resultstr << sort_header_tag('audio_speaker', { :align => "left" })
    resultstr << sort_header_tag('audio_date', { :align => "left" })
    resultstr << sort_header_tag('audio_place_of_recording', { :align => "left" })
    resultstr << sort_header_tag('audio_link', { :align => "left" })
    resultstr << sort_header_tag('video', { :align => "left" })
    resultstr << sort_header_tag('video_id_number', { :align => "left" })
    resultstr << sort_header_tag('video_speaker', { :align => "left" })
    resultstr << sort_header_tag('video_date', { :align => "left" })
    resultstr << sort_header_tag('video_place_of_recording', { :align => "left" })
    resultstr << sort_header_tag('video_link', { :align => "left" })
    resultstr << sort_header_tag('analytical_note', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for spelling in @spellings
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.spelling.to_s unless spelling.spelling == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.basis_of_spelling.to_s unless spelling.basis_of_spelling == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.spelling_type.to_s unless spelling.spelling_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.specific_dialect.to_s unless spelling.specific_dialect == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.literary_genre.to_s unless spelling.literary_genre == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.literary_period.to_s unless spelling.literary_period == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.literary_form.to_s unless spelling.literary_form == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.image.to_s unless spelling.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.image_caption.to_s unless spelling.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.image_photographer.to_s unless spelling.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.image_link.to_s unless spelling.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.image_description.to_s unless spelling.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.audio.to_s unless spelling.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.audio_id_number.to_s unless spelling.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.audio_speaker.to_s unless spelling.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.audio_date.to_s unless spelling.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.audio_place_of_recording.to_s unless spelling.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.audio_link.to_s unless spelling.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.video.to_s unless spelling.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.video_id_number.to_s unless spelling.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.video_speaker.to_s unless spelling.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.video_date.to_s unless spelling.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.video_place_of_recording.to_s unless spelling.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.video_link.to_s unless spelling.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling.analytical_note.to_s unless spelling.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => spelling.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => spelling.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => spelling.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_spelling
    resultstr = ""
    resultstr << "<p><b>Spelling: </b><br>"
    resultstr << "<input size=80 name=spelling[spelling] type=text value=\""
    resultstr << @spelling.spelling if @spelling.spelling != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Basis of spelling: </b><br>"
    resultstr << "<input size=80 name=spelling[basis_of_spelling] type=text value=\""
    resultstr << @spelling.basis_of_spelling if @spelling.basis_of_spelling != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Spelling type: </b><br>"
    resultstr << "<input size=80 name=spelling[spelling_type] type=text value=\""
    resultstr << @spelling.spelling_type if @spelling.spelling_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    resultstr << "<input size=80 name=spelling[specific_dialect] type=text value=\""
    resultstr << @spelling.specific_dialect if @spelling.specific_dialect != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=spelling[literary_genre] type=text value=\""
    resultstr << @spelling.literary_genre if @spelling.literary_genre != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=spelling[literary_period] type=text value=\""
    resultstr << @spelling.literary_period if @spelling.literary_period != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=spelling[literary_form] type=text value=\""
    resultstr << @spelling.literary_form if @spelling.literary_form != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[image] rows=3 wrap=virtual >"
    resultstr << @spelling.image if @spelling.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[image_caption] rows=3 wrap=virtual >"
    resultstr << @spelling.image_caption if @spelling.image_caption != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=spelling[image_photographer] type=text value=\""
    resultstr << @spelling.image_photographer if @spelling.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[image_link] rows=3 wrap=virtual >"
    resultstr << @spelling.image_link if @spelling.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[image_description] rows=3 wrap=virtual >"
    resultstr << @spelling.image_description if @spelling.image_description != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=spelling[audio] type=text value=\""
    resultstr << @spelling.audio if @spelling.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=spelling[audio_id_number] type=text value=\""
    resultstr << @spelling.audio_id_number if @spelling.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=spelling[audio_speaker] type=text value=\""
    resultstr << @spelling.audio_speaker if @spelling.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=spelling[audio_date] type=text value=\""
    resultstr << @spelling.audio_date if @spelling.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=spelling[audio_place_of_recording] type=text value=\""
    resultstr << @spelling.audio_place_of_recording if @spelling.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[audio_link] rows=3 wrap=virtual >"
    resultstr << @spelling.audio_link if @spelling.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=spelling[video] type=text value=\""
    resultstr << @spelling.video if @spelling.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=spelling[video_id_number] type=text value=\""
    resultstr << @spelling.video_id_number if @spelling.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=spelling[video_speaker] type=text value=\""
    resultstr << @spelling.video_speaker if @spelling.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=spelling[video_date] type=text value=\""
    resultstr << @spelling.video_date if @spelling.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=spelling[video_place_of_recording] type=text value=\""
    resultstr << @spelling.video_place_of_recording if @spelling.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[video_link] rows=3 wrap=virtual >"
    resultstr << @spelling.video_link if @spelling.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=spelling[analytical_note] rows=3 wrap=virtual >"
    resultstr << @spelling.analytical_note if @spelling.analytical_note != nil
    resultstr << "</textarea>"
  end

  def modal_edit_dynamic_spelling
    resultstr = ""
    resultstr << "<b>Spelling: </b>"
    #resultstr << "<input type=hidden name=spelling[spelling] id=spelling[spelling] value=\""+@spelling.spelling.to_s+"\" >"
    if @spelling.spelling == nil or @spelling.spelling == ''
      @spelling.spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[spelling]'}) 
    resultstr << "<br>"
    resultstr << "<b>Basis of spelling: </b>"
    #resultstr << "<input type=hidden name=spelling[basis_of_spelling] id=spelling[basis_of_spelling] value=\""+@spelling.basis_of_spelling.to_s+"\" >"
    #if @spelling.basis_of_spelling_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @spelling.basis_of_spelling_type.title
    #end
    #resultstr << "<span id=\"spelling[basis_of_spelling_type#{@spelling.id}]_selector\">"
    #resultstr << '['+@spelling.basis_of_spelling+']' if @spelling.basis_of_spelling != nil
    #resultstr << link_to_remote( title,{:update => "spelling[basis_of_spelling_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 191, 'model_name' => 'spelling', 'function_name' => "basis_of_spelling_type", :update_id => "spelling[basis_of_spelling_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_form_editor_field( :spelling, :basis_of_spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[basis_of_spelling]'}) +"<br>"
    #before update
    #@data = Category.find(191)
    ##resultstr << category_selector(@data, :spelling, :basis_of_spelling_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @spelling.basis_of_spelling_type == nil
    #  title = ''
    #else
    #  title = @spelling.basis_of_spelling_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :spelling,
  	#				:selectable => false,
  	#				:fieldname => :basis_of_spelling_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
    #<!-- Basis of spelling div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_spelling_association_url(@spelling.id, 191), :update => "#{@spelling.id}_spelling_basis_of_spelling_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'spellings', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@spelling.id}_spelling_basis_of_spelling_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_spelling_associations/index', :locals => {:data_id => 191})		
		assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => 191})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
    
    
    resultstr << "<b>Spelling type: </b>"
    #resultstr << "<input type=hidden name=spelling[spelling_type] id=spelling[spelling_type] value=\""+@spelling.spelling_type.to_s+"\" >"
    #if @spelling.spelling_category == nil
    #  title = 'Click to modify'
    #else 
    #  title = @spelling.spelling_category.title
    #end
    #resultstr << "<span id=\"spelling[spelling_category#{@spelling.id}]_selector\">"
    #resultstr << '['+@spelling.spelling_type+']' if @spelling.spelling_type != nil
    #resultstr << link_to_remote( title,{:update => "spelling[spelling_category#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 4091, 'model_name' => 'spelling', 'function_name' => "spelling_category", :update_id => "spelling[spelling_category#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[spelling_category"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[spelling_category"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[spelling_category"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[spelling_category"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(4091)
    ##resultstr << category_selector(@data, :spelling, :spelling_category, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @spelling.spelling_category == nil
    #  title = ''
    #else
    #  title = @spelling.spelling_category.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :spelling,
  	#				:selectable => false,
  	#				:fieldname => :spelling_category,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
    #<!-- Basis of spelling div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_spelling_association_url(@spelling.id, 4091), :update => "#{@spelling.id}_spelling_spelling_category_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'spellings', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@spelling.id}_spelling_spelling_category_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_spelling_associations/index', :locals => {:data_id => 4091})		
		assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => 4091})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		
    
    resultstr << "<b>Dialect type: </b>"
    #resultstr << "<input type=hidden name=spelling[major_dialect_family] id=spelling[major_dialect_family"+@spelling.id.to_s+"] value=\""+@spelling.major_dialect_family.to_s+"\" >"
    #if @spelling.major_dialect_family_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @spelling.major_dialect_family_type.title
    #end
    #resultstr << "<span id=\"spelling[major_dialect_family_type#{@spelling.id}]_selector\">"
    #resultstr << '['+@spelling.major_dialect_family+']' if @spelling.major_dialect_family != nil
    #resultstr << link_to_remote( title,{:update => "spelling[major_dialect_family_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings', :action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 638, 'model_name' => 'spelling', 'function_name' => "major_dialect_family_type", :update_id => "spelling[major_dialect_family_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(638)
    ##resultstr << category_selector(@data, :spelling, :major_dialect_family_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @spelling.major_dialect_family_type == nil
    #  title = ''
    #else
    #  title = @spelling.major_dialect_family_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :spelling,
  	#				:selectable => false,
  	#				:fieldname => :major_dialect_family_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
    #<!-- Dialect type div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_spelling_association_url(@spelling.id, 638), :update => "#{@spelling.id}_spelling_major_dialect_family_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'spellings', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@spelling.id}_spelling_major_dialect_family_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_spelling_associations/index', :locals => {:data_id => 638})		
		assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => 638})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"


    resultstr << "<b>Literary genre: </b>"
    #resultstr << "<input type=hidden name=spelling[literary_genre] id=spelling[literary_genre"+@spelling.id.to_s+"] value=\""+@spelling.literary_genre.to_s+"\" >"
    #if @spelling.literary_genre_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @spelling.literary_genre_type.title
    #end
    #resultstr << "<span id=\"spelling[literary_genre_type#{@spelling.id}]_selector\">"
    #resultstr << '['+@spelling.literary_genre+']' if @spelling.literary_genre != nil
    #resultstr << link_to_remote( title,{:update => "spelling[literary_genre_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 119, 'model_name' => 'spelling', 'function_name' => "literary_genre_type", :update_id => "spelling[literary_genre_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(119)
    ##resultstr << category_selector(@data, :spelling, :literary_genre_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @spelling.literary_genre_type == nil
    #  title = ''
    #else
    #  title = @spelling.literary_genre_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :spelling,
  	#				:selectable => false,
  	#				:fieldname => :literary_genre_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"

    #<!-- Literary genre div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_spelling_association_url(@spelling.id, 119), :update => "#{@spelling.id}_spelling_literary_genre_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'spellings', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@spelling.id}_spelling_literary_genre_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_spelling_associations/index', :locals => {:data_id => 119})		
		assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => 119})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"


    resultstr << "<b>Literary period: </b>"
    #resultstr << "<input type=hidden name=spelling[literary_period] id=spelling[literary_period] value=\""+@spelling.literary_period.to_s+"\" >"
    #if @spelling.literary_period_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @spelling.literary_period_type.title
    #end
    #resultstr << "<span id=\"spelling[literary_period_type#{@spelling.id}]_selector\">"
    #resultstr << '['+@spelling.literary_period+']' if @spelling.literary_period != nil
    #resultstr << link_to_remote( title,{:update => "spelling[literary_period_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 187, 'model_name' => 'spelling', 'function_name' => "literary_period_type", :update_id => "spelling[literary_period_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[literary_period_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[literary_period_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[literary_period_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[literary_period_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(187)
    ##resultstr << category_selector(@data, :spelling, :literary_period_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @spelling.literary_period_type == nil
    #  title = ''
    #else
    #  title = @spelling.literary_period_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :spelling,
  	#				:selectable => false,
  	#				:fieldname => :literary_period_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"

    #<!-- Literary period div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_spelling_association_url(@spelling.id, 187), :update => "#{@spelling.id}_spelling_literary_period_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'spellings', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@spelling.id}_spelling_literary_period_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_spelling_associations/index', :locals => {:data_id => 187})		
		assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => 187})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		
		
    resultstr << "<b>Literary form: </b>"
    #resultstr << "<input type=hidden name=spelling[literary_form] id=spelling[literary_form] value=\""+@spelling.literary_form.to_s+"\" >"
    #if @spelling.literary_form_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @spelling.literary_form_type.title
    #end
    #resultstr << "<span id=\"spelling[literary_form_type#{@spelling.id}]_selector\">"
    #resultstr << '['+@spelling.literary_form+']' if @spelling.literary_form != nil
    #resultstr << link_to_remote( title,{:update => "spelling[literary_form_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 186, 'model_name' => 'spelling', 'function_name' => "literary_form_type", :update_id => "spelling[literary_form_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[literary_form_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[literary_form_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[literary_form_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[literary_form_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #before update
    #@data = Category.find(186)
    ##resultstr << category_selector(@data, :spelling, :literary_form_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @spelling.literary_form_type == nil
    #  title = ''
    #else
    #  title = @spelling.literary_form_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :spelling,
  	#				:selectable => false,
  	#				:fieldname => :literary_form_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
     
    #<!-- Literary form div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_spelling_association_url(@spelling.id, 186), :update => "#{@spelling.id}_spelling_literary_form_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'spellings', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@spelling.id}_spelling_literary_form_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_spelling_associations/index', :locals => {:data_id => 186})		
		assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => 186})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>" 
       
    resultstr << "<b>Analytical note: </b>"
    #resultstr << "<input type=hidden name=spelling[analytical_note] id=spelling[analytical_note] value=\""+@spelling.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_anotediv" + "'>"
    edit_path = spelling_analytical_note_edit_url(:id => @spelling.id)
    if @spelling.analytical_note == nil or @spelling.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @spelling.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@spelling.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		#resultstr <<	"<span id=\"show_av_spelling"+@spelling.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_spelling"+@spelling.id.to_s+"');Element.show('hide_av_spelling"+@spelling.id.to_s+"');Element.show('av_spelling_"+@spelling.id.to_s+"');", :title => 'Show')+"</span>"
		#resultstr <<	"<span id=\"hide_av_spelling"+@spelling.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_spelling"+@spelling.id.to_s+"');Element.show('show_av_spelling"+@spelling.id.to_s+"');Element.hide('av_spelling_"+@spelling.id.to_s+"');", :title => 'Hide')+"</span>"
    #resultstr << "<span id=\"av_spelling_"+@spelling.id.to_s+"\" style=\"display:none\"><dl><dd>"
    resultstr << "<b>Edit Multimedia Data: </b>"
    resultstr << "<input type='button' name='toggleh1' value='show/hide multimedia' id='toggleh1'><br>"
    resultstr << "<div class='showhide'>"  
      
    resultstr << "<b>Image: </b>"
    #resultstr << "<input type=hidden name=spelling[image] id=spelling[image] value=\""+@spelling.image.to_s+"\" >"
    if @spelling.image == nil or @spelling.image == ''
      @spelling.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image]'})
    resultstr << "<br>"
    resultstr << "<b>Image caption: </b>"
    #resultstr << "<input type=hidden name=spelling[image_caption] id=spelling[image_caption] value=\""+@spelling.image_caption.to_s+"\" >"
    if @spelling.image_caption == nil or @spelling.image_caption == ''
      @spelling.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image_caption]'}) 
    resultstr << "<br>"
    resultstr << "<b>Image photographer: </b>"
    #resultstr << "<input type=hidden name=spelling[image_photographer] id=spelling[image_photographer] value=\""+@spelling.image_photographer.to_s+"\" >"
    if @spelling.image_photographer == nil or @spelling.image_photographer == ''
      @spelling.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[image_photographer]'}) 
    resultstr << "<br>"
    resultstr << "<b>Image link: </b>"
    #resultstr << "<input type=hidden name=spelling[image_link] id=spelling[image_link] value=\""+@spelling.image_link.to_s+"\" >"
    if @spelling.image_link == nil or @spelling.image_link == ''
      @spelling.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image_link]'}) 
    resultstr << "<br>"
 
    resultstr << "<b>Image description: </b>"
    #resultstr << "<input type=hidden name=spelling[image_description] id=spelling[image_description] value=\""+@spelling.image_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_imagedescdiv" + "'>"
    edit_path = spelling_image_description_edit_url(:id => @spelling.id)
    if @spelling.image_description == nil or @spelling.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @spelling.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@spelling.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    #resultstr << "<input type=hidden name=spelling[audio] id=spelling[audio] value=\""+@spelling.audio.to_s+"\" >"
    if @spelling.audio == nil or @spelling.audio == ''
      @spelling.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio id number: </b>"
    #resultstr << "<input type=hidden name=spelling[audio_id_number] id=spelling[audio_id_number] value=\""+@spelling.audio_id_number.to_s+"\" >"
    if @spelling.audio_id_number == nil or @spelling.audio_id_number == ''
      @spelling.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_id_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio speaker: </b>"
    #resultstr << "<input type=hidden name=spelling[audio_speaker] id=spelling[audio_speaker] value=\""+@spelling.audio_speaker.to_s+"\" >"
    if @spelling.audio_speaker == nil or @spelling.audio_speaker == ''
      @spelling.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_speaker]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio date: </b>"
    #resultstr << "<input type=hidden name=spelling[audio_date] id=spelling[audio_date] value=\""+@spelling.audio_date.to_s+"\" >"
    if @spelling.audio_date == nil or @spelling.audio_date == ''
      @spelling.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_date]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio place of recording: </b>"
    #resultstr << "<input type=hidden name=spelling[audio_place_of_recording] id=spelling[audio_place_of_recording] value=\""+@spelling.audio_place_of_recording.to_s+"\" >"
    if @spelling.audio_place_of_recording == nil or @spelling.audio_place_of_recording == ''
      @spelling.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_place_of_recording]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio link: </b>"
    #resultstr << "<input type=hidden name=spelling[audio_link] id=spelling[audio_link] value=\""+@spelling.audio_link.to_s+"\" >"
    if @spelling.audio_link == nil or @spelling.audio_link == ''
      @spelling.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[audio_link]'}) 
    resultstr << "<br>"

    resultstr << "<b>Audio description: </b>"
    #resultstr << "<input type=hidden name=spelling[audio_description] id=spelling[audio_description] value=\""+@spelling.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_audiodescdiv" + "'>"
    edit_path = spelling_audio_description_edit_url(:id => @spelling.id)
    if @spelling.audio_description == nil or @spelling.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @spelling.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@spelling.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Video: </b>"
    #resultstr << "<input type=hidden name=spelling[video] id=spelling[video] value=\""+@spelling.video.to_s+"\" >"
    if @spelling.video == nil or @spelling.video == ''
      @spelling.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video id number: </b>"
    #resultstr << "<input type=hidden name=spelling[video_id_number] id=spelling[video_id_number] value=\""+@spelling.video_id_number.to_s+"\" >"
    if @spelling.video_id_number == nil or @spelling.video_id_number == ''
      @spelling.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_id_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video speaker: </b>"
    #resultstr << "<input type=hidden name=spelling[video_speaker] id=spelling[video_speaker] value=\""+@spelling.video_speaker.to_s+"\" >"
    if @spelling.video_speaker == nil or @spelling.video_speaker == ''
      @spelling.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_speaker]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video date: </b>"
    #resultstr << "<input type=hidden name=spelling[video_date] id=spelling[video_date] value=\""+@spelling.video_date.to_s+"\" >"
    if @spelling.video_date == nil or @spelling.video_date == ''
      @spelling.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_date]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video place of recording: </b>"
    #resultstr << "<input type=hidden name=spelling[video_place_of_recording] id=spelling[video_place_of_recording] value=\""+@spelling.video_place_of_recording.to_s+"\" >"
    if @spelling.video_place_of_recording == nil or @spelling.video_place_of_recording == ''
      @spelling.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_place_of_recording]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video link: </b>"
    #resultstr << "<input type=hidden name=spelling[video_link] id=spelling[video_link] value=\""+@spelling.video_link.to_s+"\" >"
    if @spelling.video_link == nil or @spelling.video_link == ''
      @spelling.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[video_link]'}) 
    resultstr << "<br>"
 
    resultstr << "<b>Video description: </b>"
    #resultstr << "<input type=hidden name=spelling[video_description] id=spelling[video_description] value=\""+@spelling.video_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_videodescdiv" + "'>"
    edit_path = spelling_video_description_edit_url(:id => @spelling.id)
    if @spelling.video_description == nil or @spelling.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @spelling.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@spelling.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "</div>" #showhide
    
    #resultstr << "</dd></dl></span>"
  end

  def edit_dynamic_spelling
    resultstr = ""
    resultstr << "<b>Spelling: </b>"
    resultstr << "<input type=hidden name=spelling[spelling] id=spelling[spelling] value=\""+@spelling.spelling.to_s+"\" >"
    if @spelling.spelling == nil or @spelling.spelling == ''
      @spelling.spelling = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[spelling]'}) +"<br>"
    resultstr << "<b>Basis of spelling: </b>"
    resultstr << "<input type=hidden name=spelling[basis_of_spelling] id=spelling[basis_of_spelling] value=\""+@spelling.basis_of_spelling.to_s+"\" >"
    if @spelling.basis_of_spelling_type == nil
      title = 'Click to modify'
    else
      title = @spelling.basis_of_spelling_type.title
    end
    resultstr << "<span id=\"spelling[basis_of_spelling_type#{@spelling.id}]_selector\">"
    resultstr << '['+@spelling.basis_of_spelling+']' if @spelling.basis_of_spelling != nil
    resultstr << link_to_remote( title,{:update => "spelling[basis_of_spelling_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 191, 'model_name' => 'spelling', 'function_name' => "basis_of_spelling_type", :update_id => "spelling[basis_of_spelling_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[basis_of_spelling_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_form_editor_field( :spelling, :basis_of_spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[basis_of_spelling]'}) +"<br>"
    resultstr << "<b>Spelling type: </b>"
    resultstr << "<input type=hidden name=spelling[spelling_type] id=spelling[spelling_type] value=\""+@spelling.spelling_type.to_s+"\" >"
    if @spelling.spelling_category == nil
      title = 'Click to modify'
    else 
      title = @spelling.spelling_category.title
    end
    # resultstr << in_place_select_editor_field( :spelling, :spelling_type, {}, {:select_options => @spelling_type, :fieldname => 'spelling[spelling_type]'})+"<br>"

    resultstr << "<span id=\"spelling[spelling_category#{@spelling.id}]_selector\">"
    resultstr << '['+@spelling.spelling_type+']' if @spelling.spelling_type != nil
    resultstr << link_to_remote( title,{:update => "spelling[spelling_category#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 4091, 'model_name' => 'spelling', 'function_name' => "spelling_category", :update_id => "spelling[spelling_category#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[spelling_category"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[spelling_category"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[spelling_category"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[spelling_category"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"


    # resultstr << in_place_form_editor_field( :spelling, :spelling_type, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[spelling_type]'}) +"<br>"


    resultstr << "<b>Tibetan Dialect: </b>"
    resultstr << "<input type=hidden name=spelling[major_dialect_family] id=spelling[major_dialect_family"+@spelling.id.to_s+"] value=\""+@spelling.major_dialect_family.to_s+"\" >"
    if @spelling.major_dialect_family_type == nil
      title = 'Click to modify'
    else
      title = @spelling.major_dialect_family_type.title
    end
    resultstr << "<span id=\"spelling[major_dialect_family_type#{@spelling.id}]_selector\">"
    resultstr << '['+@spelling.major_dialect_family+']' if @spelling.major_dialect_family != nil
    resultstr << link_to_remote( title,{:update => "spelling[major_dialect_family_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings', :action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 638, 'model_name' => 'spelling', 'function_name' => "major_dialect_family_type", :update_id => "spelling[major_dialect_family_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[major_dialect_family_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Literary genre: </b>"
    resultstr << "<input type=hidden name=spelling[literary_genre] id=spelling[literary_genre"+@spelling.id.to_s+"] value=\""+@spelling.literary_genre.to_s+"\" >"
    if @spelling.literary_genre_type == nil
      title = 'Click to modify'
    else
      title = @spelling.literary_genre_type.title
    end
    resultstr << "<span id=\"spelling[literary_genre_type#{@spelling.id}]_selector\">"
    resultstr << '['+@spelling.literary_genre+']' if @spelling.literary_genre != nil
    resultstr << link_to_remote( title,{:update => "spelling[literary_genre_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 119, 'model_name' => 'spelling', 'function_name' => "literary_genre_type", :update_id => "spelling[literary_genre_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[literary_genre_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Literary period: </b>"
    resultstr << "<input type=hidden name=spelling[literary_period] id=spelling[literary_period] value=\""+@spelling.literary_period.to_s+"\" >"
    if @spelling.literary_period_type == nil
      title = 'Click to modify'
    else
      title = @spelling.literary_period_type.title
    end
    resultstr << "<span id=\"spelling[literary_period_type#{@spelling.id}]_selector\">"
    resultstr << '['+@spelling.literary_period+']' if @spelling.literary_period != nil
    resultstr << link_to_remote( title,{:update => "spelling[literary_period_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 187, 'model_name' => 'spelling', 'function_name' => "literary_period_type", :update_id => "spelling[literary_period_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[literary_period_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[literary_period_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[literary_period_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[literary_period_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Literary form: </b>"
    resultstr << "<input type=hidden name=spelling[literary_form] id=spelling[literary_form] value=\""+@spelling.literary_form.to_s+"\" >"
    if @spelling.literary_form_type == nil
      title = 'Click to modify'
    else
      title = @spelling.literary_form_type.title
    end
    resultstr << "<span id=\"spelling[literary_form_type#{@spelling.id}]_selector\">"
    resultstr << '['+@spelling.literary_form+']' if @spelling.literary_form != nil
    resultstr << link_to_remote( title,{:update => "spelling[literary_form_type#{@spelling.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'spellings',:action => 'display_category_selector', :id => @spelling.id, :params => {'data_id' => 186, 'model_name' => 'spelling', 'function_name' => "literary_form_type", :update_id => "spelling[literary_form_type#{@spelling.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('spelling[literary_form_type"+@spelling.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('spelling[literary_form_type"+@spelling.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('spelling[literary_form_type"+@spelling.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('spelling[literary_form_type"+@spelling.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=spelling[analytical_note] id=spelling[analytical_note] value=\""+@spelling.analytical_note.to_s+"\" >"
    #if @spelling.analytical_note == nil or @spelling.analytical_note == ''
    #  @spelling.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :spelling, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_anotediv" + "'>"
    edit_path = spelling_analytical_note_edit_url(:id => @spelling.id)
    if @spelling.analytical_note == nil or @spelling.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @spelling.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@spelling.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		resultstr <<	"<span id=\"show_av_spelling"+@spelling.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_spelling"+@spelling.id.to_s+"');Element.show('hide_av_spelling"+@spelling.id.to_s+"');Element.show('av_spelling_"+@spelling.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_spelling"+@spelling.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_spelling"+@spelling.id.to_s+"');Element.show('show_av_spelling"+@spelling.id.to_s+"');Element.hide('av_spelling_"+@spelling.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_spelling_"+@spelling.id.to_s+"\" style=\"display:none\"><dl><dd>"
    
    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=spelling[image] id=spelling[image] value=\""+@spelling.image.to_s+"\" >"
    if @spelling.image == nil or @spelling.image == ''
      @spelling.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=spelling[image_caption] id=spelling[image_caption] value=\""+@spelling.image_caption.to_s+"\" >"
    if @spelling.image_caption == nil or @spelling.image_caption == ''
      @spelling.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=spelling[image_photographer] id=spelling[image_photographer] value=\""+@spelling.image_photographer.to_s+"\" >"
    if @spelling.image_photographer == nil or @spelling.image_photographer == ''
      @spelling.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=spelling[image_link] id=spelling[image_link] value=\""+@spelling.image_link.to_s+"\" >"
    if @spelling.image_link == nil or @spelling.image_link == ''
      @spelling.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=spelling[image_description] id=spelling[image_description] value=\""+@spelling.image_description.to_s+"\" >"
    #if @spelling.image_description == nil or @spelling.image_description == ''
    #  @spelling.image_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :spelling, :image_description, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_imagedescdiv" + "'>"
    edit_path = spelling_image_description_edit_url(:id => @spelling.id)
    if @spelling.image_description == nil or @spelling.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @spelling.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@spelling.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=spelling[audio] id=spelling[audio] value=\""+@spelling.audio.to_s+"\" >"
    if @spelling.audio == nil or @spelling.audio == ''
      @spelling.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=spelling[audio_id_number] id=spelling[audio_id_number] value=\""+@spelling.audio_id_number.to_s+"\" >"
    if @spelling.audio_id_number == nil or @spelling.audio_id_number == ''
      @spelling.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=spelling[audio_speaker] id=spelling[audio_speaker] value=\""+@spelling.audio_speaker.to_s+"\" >"
    if @spelling.audio_speaker == nil or @spelling.audio_speaker == ''
      @spelling.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=spelling[audio_date] id=spelling[audio_date] value=\""+@spelling.audio_date.to_s+"\" >"
    if @spelling.audio_date == nil or @spelling.audio_date == ''
      @spelling.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=spelling[audio_place_of_recording] id=spelling[audio_place_of_recording] value=\""+@spelling.audio_place_of_recording.to_s+"\" >"
    if @spelling.audio_place_of_recording == nil or @spelling.audio_place_of_recording == ''
      @spelling.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=spelling[audio_link] id=spelling[audio_link] value=\""+@spelling.audio_link.to_s+"\" >"
    if @spelling.audio_link == nil or @spelling.audio_link == ''
      @spelling.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=spelling[audio_description] id=spelling[audio_description] value=\""+@spelling.audio_description.to_s+"\" >"
    #if @spelling.audio_description == nil or @spelling.audio_description == ''
    #  @spelling.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :spelling, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_audiodescdiv" + "'>"
    edit_path = spelling_audio_description_edit_url(:id => @spelling.id)
    if @spelling.audio_description == nil or @spelling.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @spelling.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@spelling.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=spelling[video] id=spelling[video] value=\""+@spelling.video.to_s+"\" >"
    if @spelling.video == nil or @spelling.video == ''
      @spelling.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=spelling[video_id_number] id=spelling[video_id_number] value=\""+@spelling.video_id_number.to_s+"\" >"
    if @spelling.video_id_number == nil or @spelling.video_id_number == ''
      @spelling.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=spelling[video_speaker] id=spelling[video_speaker] value=\""+@spelling.video_speaker.to_s+"\" >"
    if @spelling.video_speaker == nil or @spelling.video_speaker == ''
      @spelling.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=spelling[video_date] id=spelling[video_date] value=\""+@spelling.video_date.to_s+"\" >"
    if @spelling.video_date == nil or @spelling.video_date == ''
      @spelling.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=spelling[video_place_of_recording] id=spelling[video_place_of_recording] value=\""+@spelling.video_place_of_recording.to_s+"\" >"
    if @spelling.video_place_of_recording == nil or @spelling.video_place_of_recording == ''
      @spelling.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=spelling[video_link] id=spelling[video_link] value=\""+@spelling.video_link.to_s+"\" >"
    if @spelling.video_link == nil or @spelling.video_link == ''
      @spelling.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=spelling[video_description] id=spelling[video_description] value=\""+@spelling.video_description.to_s+"\" >"
    #if @spelling.video_description == nil or @spelling.video_description == ''
    #  @spelling.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :spelling, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'spelling[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@spelling.id}_videodescdiv" + "'>"
    edit_path = spelling_video_description_edit_url(:id => @spelling.id)
    if @spelling.video_description == nil or @spelling.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @spelling.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@spelling.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    
    resultstr << "</dd></dl></span>"
  end
  

  def show_edit_spelling
    resultstr = ""
    resultstr << "<p><b>Spelling: </b><br>"
    if @spelling.spelling == nil or @spelling.spelling == ''
      @spelling.spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :spelling, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Basis of spelling: </b><br>"
    if @spelling.basis_of_spelling == nil or @spelling.basis_of_spelling == ''
      @spelling.basis_of_spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :basis_of_spelling, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Spelling type: </b><br>"
    if @spelling.spelling_type == nil or @spelling.spelling_type == ''
      @spelling.spelling_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :spelling_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    if @spelling.specific_dialect == nil or @spelling.specific_dialect == ''
      @spelling.specific_dialect = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :specific_dialect, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary genre: </b><br>"
    if @spelling.literary_genre == nil or @spelling.literary_genre == ''
      @spelling.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :literary_genre, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary period: </b><br>"
    if @spelling.literary_period == nil or @spelling.literary_period == ''
      @spelling.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :literary_period, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary form: </b><br>"
    if @spelling.literary_form == nil or @spelling.literary_form == ''
      @spelling.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :literary_form, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @spelling.image == nil or @spelling.image == ''
      @spelling.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @spelling.image_caption == nil or @spelling.image_caption == ''
      @spelling.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_caption, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @spelling.image_photographer == nil or @spelling.image_photographer == ''
      @spelling.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @spelling.image_link == nil or @spelling.image_link == ''
      @spelling.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @spelling.image_description == nil or @spelling.image_description == ''
      @spelling.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :image_description, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @spelling.audio == nil or @spelling.audio == ''
      @spelling.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @spelling.audio_id_number == nil or @spelling.audio_id_number == ''
      @spelling.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @spelling.audio_speaker == nil or @spelling.audio_speaker == ''
      @spelling.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @spelling.audio_date == nil or @spelling.audio_date == ''
      @spelling.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @spelling.audio_place_of_recording == nil or @spelling.audio_place_of_recording == ''
      @spelling.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @spelling.audio_link == nil or @spelling.audio_link == ''
      @spelling.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @spelling.video == nil or @spelling.video == ''
      @spelling.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @spelling.video_id_number == nil or @spelling.video_id_number == ''
      @spelling.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @spelling.video_speaker == nil or @spelling.video_speaker == ''
      @spelling.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @spelling.video_date == nil or @spelling.video_date == ''
      @spelling.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @spelling.video_place_of_recording == nil or @spelling.video_place_of_recording == ''
      @spelling.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @spelling.video_link == nil or @spelling.video_link == ''
      @spelling.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @spelling.analytical_note == nil or @spelling.analytical_note == ''
      @spelling.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_spelling
    resultstr = ""
    resultstr << "<tr><td><b>Spelling: </b></td>"
    resultstr << "<td><input size=50 name=spelling[spelling] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Basis of spelling: </b></td>"
    resultstr << "<td><input size=50 name=spelling[basis_of_spelling] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Spelling type: </b></td>"
    resultstr << "<td><input size=50 name=spelling[spelling_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Specific dialect: </b></td>"
    resultstr << "<td><input size=50 name=spelling[specific_dialect] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=spelling[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=spelling[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=spelling[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=spelling[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=spelling[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=spelling[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=spelling[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=spelling[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=spelling[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=spelling[video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=spelling[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
