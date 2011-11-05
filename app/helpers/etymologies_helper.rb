module EtymologiesHelper
  def show_etymology
    resultstr = ""
    resultstr << "<p><b>Etymology: </b>"
    resultstr << "<br>"
    if @etymology.etymology != nil 
      resultstr << @etymology.etymology
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Etymology type: </b>"
    if @etymology.etymology_type != nil 
      resultstr << @etymology.etymology_type
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Loan language: </b>"
    if @etymology.loan_language != nil 
      resultstr << @etymology.loan_language
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Derivation: </b>"
    if @etymology.derivation != nil 
      resultstr << @etymology.derivation
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Major dialect family: </b>"
    if @etymology.major_dialect_family != nil 
      resultstr << @etymology.major_dialect_family
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Specific dialect: </b>"
    if @etymology.specific_dialect != nil 
      resultstr << @etymology.specific_dialect
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary genre: </b>"
    if @etymology.literary_genre != nil 
      resultstr << @etymology.literary_genre
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary period: </b>"
    if @etymology.literary_period != nil 
      resultstr << @etymology.literary_period
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary form: </b>"
    if @etymology.literary_form != nil 
      resultstr << @etymology.literary_form
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @etymology.image != nil 
      resultstr << @etymology.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    resultstr << "<br>"
    if @etymology.image_caption != nil 
      resultstr << @etymology.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @etymology.image_photographer != nil 
      resultstr << @etymology.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @etymology.image_link != nil 
      resultstr << @etymology.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    resultstr << "<br>"
    if @etymology.image_description != nil 
      resultstr << @etymology.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @etymology.audio != nil 
      resultstr << @etymology.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @etymology.audio_id_number != nil 
      resultstr << @etymology.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @etymology.audio_speaker != nil 
      resultstr << @etymology.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @etymology.audio_date != nil 
      resultstr << @etymology.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @etymology.audio_place_of_recording != nil 
      resultstr << @etymology.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @etymology.audio_link != nil 
      resultstr << @etymology.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<br>"
    if @etymology.audio_description != nil 
      resultstr << @etymology.audio_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @etymology.video != nil 
      resultstr << @etymology.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @etymology.video_id_number != nil 
      resultstr << @etymology.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @etymology.video_speaker != nil 
      resultstr << @etymology.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @etymology.video_date != nil 
      resultstr << @etymology.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @etymology.video_place_of_recording != nil 
      resultstr << @etymology.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @etymology.video_link != nil 
      resultstr << @etymology.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<br>"
    if @etymology.video_description != nil 
      resultstr << @etymology.video_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @etymology.analytical_note != nil 
      resultstr << @etymology.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_etymology
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('etymology', { :align => "left" })
    resultstr << sort_header_tag('etymology_type', { :align => "left" })
    resultstr << sort_header_tag('loan_language', { :align => "left" })
    resultstr << sort_header_tag('derivation', { :align => "left" })
    resultstr << sort_header_tag('major_dialect_family', { :align => "left" })
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
    for etymology in @etymologies
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.etymology.to_s unless etymology.etymology == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.etymology_type.to_s unless etymology.etymology_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.loan_language.to_s unless etymology.loan_language == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.derivation.to_s unless etymology.derivation == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.major_dialect_family.to_s unless etymology.major_dialect_family == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.specific_dialect.to_s unless etymology.specific_dialect == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.literary_genre.to_s unless etymology.literary_genre == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.literary_period.to_s unless etymology.literary_period == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.literary_form.to_s unless etymology.literary_form == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.image.to_s unless etymology.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.image_caption.to_s unless etymology.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.image_photographer.to_s unless etymology.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.image_link.to_s unless etymology.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.image_description.to_s unless etymology.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.audio.to_s unless etymology.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.audio_id_number.to_s unless etymology.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.audio_speaker.to_s unless etymology.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.audio_date.to_s unless etymology.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.audio_place_of_recording.to_s unless etymology.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.audio_link.to_s unless etymology.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.video.to_s unless etymology.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.video_id_number.to_s unless etymology.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.video_speaker.to_s unless etymology.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.video_date.to_s unless etymology.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.video_place_of_recording.to_s unless etymology.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.video_link.to_s unless etymology.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology.analytical_note.to_s unless etymology.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => etymology.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => etymology.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => etymology.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_etymology
    resultstr = ""
    resultstr << "<p><b>Etymology: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[etymology] rows=3 wrap=virtual >"
    resultstr << @etymology.etymology if @etymology.etymology != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Etymology type: </b><br>"
    resultstr << "<input size=80 name=etymology[etymology_type] type=text value=\""
    resultstr << @etymology.etymology_type if @etymology.etymology_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Loan language: </b><br>"
    resultstr << "<input size=80 name=etymology[loan_language] type=text value=\""
    resultstr << @etymology.loan_language if @etymology.loan_language != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Derivation: </b><br>"
    resultstr << "<input size=80 name=etymology[derivation] type=text value=\""
    resultstr << @etymology.derivation if @etymology.derivation != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    resultstr << "<input size=80 name=etymology[major_dialect_family] type=text value=\""
    resultstr << @etymology.major_dialect_family if @etymology.major_dialect_family != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    resultstr << "<input size=80 name=etymology[specific_dialect] type=text value=\""
    resultstr << @etymology.specific_dialect if @etymology.specific_dialect != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=etymology[literary_genre] type=text value=\""
    resultstr << @etymology.literary_genre if @etymology.literary_genre != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=etymology[literary_period] type=text value=\""
    resultstr << @etymology.literary_period if @etymology.literary_period != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=etymology[literary_form] type=text value=\""
    resultstr << @etymology.literary_form if @etymology.literary_form != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[image] rows=3 wrap=virtual >"
    resultstr << @etymology.image if @etymology.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[image_caption] rows=3 wrap=virtual >"
    resultstr << @etymology.image_caption if @etymology.image_caption != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=etymology[image_photographer] type=text value=\""
    resultstr << @etymology.image_photographer if @etymology.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[image_link] rows=3 wrap=virtual >"
    resultstr << @etymology.image_link if @etymology.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[image_description] rows=3 wrap=virtual >"
    resultstr << @etymology.image_description if @etymology.image_description != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=etymology[audio] type=text value=\""
    resultstr << @etymology.audio if @etymology.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=etymology[audio_id_number] type=text value=\""
    resultstr << @etymology.audio_id_number if @etymology.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=etymology[audio_speaker] type=text value=\""
    resultstr << @etymology.audio_speaker if @etymology.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=etymology[audio_date] type=text value=\""
    resultstr << @etymology.audio_date if @etymology.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=etymology[audio_place_of_recording] type=text value=\""
    resultstr << @etymology.audio_place_of_recording if @etymology.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[audio_link] rows=3 wrap=virtual >"
    resultstr << @etymology.audio_link if @etymology.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=etymology[video] type=text value=\""
    resultstr << @etymology.video if @etymology.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=etymology[video_id_number] type=text value=\""
    resultstr << @etymology.video_id_number if @etymology.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=etymology[video_speaker] type=text value=\""
    resultstr << @etymology.video_speaker if @etymology.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=etymology[video_date] type=text value=\""
    resultstr << @etymology.video_date if @etymology.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=etymology[video_place_of_recording] type=text value=\""
    resultstr << @etymology.video_place_of_recording if @etymology.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[video_link] rows=3 wrap=virtual >"
    resultstr << @etymology.video_link if @etymology.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=etymology[analytical_note] rows=3 wrap=virtual >"
    resultstr << @etymology.analytical_note if @etymology.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_etymology
    resultstr = ""
    resultstr << "<b>Etymology: </b>"
    #resultstr << "<input type=hidden name=etymology[etymology] id=etymology[etymology] value=\""+@etymology.etymology.to_s+"\" >"
    #if @etymology.etymology == nil or @etymology.etymology == ''
    #  @etymology.etymology = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :etymology, :etymology, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[etymology]'}) +"<br>"
    resultstr << "<span class='etymologies_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_etydiv" + "'>"
    edit_path = etymology_edit_url(:id => @etymology.id)
    if @etymology.etymology == nil or @etymology.etymology == ''
      t_etymology = 'Click to modify etymology'
    else
      t_etymology = @etymology.etymology      
    end    
    resultstr << link_to_remote(t_etymology, :url => edit_path, :update => "#{@etymology.id}_etydiv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"

    resultstr << "<b>Etymology type: </b>"
    #resultstr << "<input type=hidden name=etymology[etymology_type] id=etymology[etymology_type] value=\""+@etymology.etymology_type.to_s+"\" >"
    if @etymology.etymology_category == nil
      title = 'Click to modify'
    else
      title = @etymology.etymology_category.title
    end
    resultstr << "<span id=\"etymology[etymology_category#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.etymology_type+']' if @etymology.etymology_type != nil
    resultstr << link_to_remote( title,{:update => "etymology[etymology_category#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 182, 'model_name' => 'etymology', 'function_name' => "etymology_category", :update_id => "etymology[etymology_category#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[etymology_category"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[etymology_category"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[etymology_category"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[etymology_category"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # if @etymology.etymology_type == nil or @etymology.etymology_type == ''
    #   @etymology.etymology_type = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :etymology, :etymology_type, {}, {:select_options => @etymology_type, :fieldname => 'etymology[etymology_type]'})+"<br>"
    resultstr << "<b>Loan language: </b>"
    #resultstr << "<input type=hidden name=etymology[loan_language] id=etymology[loan_language] value=\""+@etymology.loan_language.to_s+"\" >"
    if @etymology.loan_language_type == nil
      title = 'Click to modify'
    else
      title = @etymology.loan_language_type.title
    end
    resultstr << "<span id=\"etymology[loan_language_type#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.loan_language+']' if @etymology.loan_language != nil
    resultstr << link_to_remote( title,{:update => "etymology[loan_language_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 184, 'model_name' => 'etymology', 'function_name' => "loan_language_type", :update_id => "etymology[loan_language_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[loan_language_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[loan_language_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[loan_language_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[loan_language_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # if @etymology.loan_language == nil or @etymology.loan_language == ''
    #   @etymology.loan_language = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :etymology, :loan_language, {}, {:select_options => @loan_language, :fieldname => 'etymology[loan_language]'})+"<br>"
    # resultstr << in_place_form_editor_field( :etymology, :loan_language, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[loan_language]'}) +"<br>"
    resultstr << "<b>Derivation type: </b>"
    #resultstr << "<input type=hidden name=etymology[derivation] id=etymology[derivation] value=\""+@etymology.derivation.to_s+"\" >"
    if @etymology.derivation_type == nil
      title = 'Click to modify'
    else
      title = @etymology.derivation_type.title
    end
    resultstr << "<span id=\"etymology[derivation_type#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.derivation+']' if @etymology.derivation != nil
    resultstr << link_to_remote( title,{:update => "etymology[derivation_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 180, 'model_name' => 'etymology', 'function_name' => "derivation_type", :update_id => "etymology[derivation_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[derivation_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[derivation_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[derivation_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[derivation_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    # if @etymology.derivation == nil or @etymology.derivation == ''
    #   @etymology.derivation = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :etymology, :derivation, {}, {:select_options => @derivation, :fieldname => 'etymology[derivation]'})+"<br>"
    resultstr << "<b>Tibetan Dialect: </b>"
    #resultstr << "<input type=hidden name=etymology[major_dialect_family] id=etymology[major_dialect_family"+@etymology.id.to_s+"] value=\""+@etymology.major_dialect_family.to_s+"\" >"
    if @etymology.major_dialect_family_type == nil
      title = 'Click to modify'
    else
      title = @etymology.major_dialect_family_type.title
    end
    resultstr << "<span id=\"etymology[major_dialect_family_type#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.major_dialect_family+']' if @etymology.major_dialect_family != nil
    resultstr << link_to_remote( title,{:update => "etymology[major_dialect_family_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 638, 'model_name' => 'etymology', 'function_name' => "major_dialect_family_type", :update_id => "etymology[major_dialect_family_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
        # if @etymology.major_dialect_family == nil or @etymology.major_dialect_family == ''
    #   @etymology.major_dialect_family = 'Click to modify'
    # end
    # resultstr <<  "<span id=etymology[major_dialect_family"+@etymology.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@etymology.id.to_s+";show_menu(etymology_dialect_menu,getCoord(arguments[0]));>"+@etymology.major_dialect_family+"</span><br>"
    # resultstr << in_place_form_editor_field( :etymology, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[major_dialect_family]'}) +"<br>"
    # resultstr << "<b>Specific dialect: </b>"
    # resultstr << "<input type=hidden name=etymology[specific_dialect] id=etymology[specific_dialect] value=\""+@etymology.specific_dialect.to_s+"\" >"
    # if @etymology.specific_dialect == nil or @etymology.specific_dialect == ''
    #   @etymology.specific_dialect = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :etymology, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[specific_dialect]'}) +"<br>"
    resultstr << "<b>Literary genre: </b>"
    #resultstr << "<input type=hidden name=etymology[literary_genre] id=etymology[literary_genre"+@etymology.id.to_s+"] value=\""+@etymology.literary_genre.to_s+"\" >"
    if @etymology.literary_genre_type == nil
      title = 'Click to modify'
    else
      title = @etymology.literary_genre_type.title
    end
    resultstr << "<span id=\"etymology[literary_genre_type#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.literary_genre+']' if @etymology.literary_genre != nil
    resultstr << link_to_remote( title,{:update => "etymology[literary_genre_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 119, 'model_name' => 'etymology', 'function_name' => "literary_genre_type", :update_id => "etymology[literary_genre_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "<script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # if @etymology.literary_genre == nil or @etymology.literary_genre == ''
    #   @etymology.literary_genre = 'Click to modify'
    # end
    # resultstr <<  "<span id=etymology[literary_genre"+@etymology.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@etymology.id.to_s+";show_menu(etymology_literary_genre_menu,getCoord(arguments[0]));>"+@etymology.literary_genre+"</span><br>"
    # resultstr << in_place_select_editor_field( :etymology, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'etymology[literary_genre]'})+"<br>"
    resultstr << "<b>Literary period: </b>"
    #resultstr << "<input type=hidden name=etymology[literary_period] id=etymology[literary_period] value=\""+@etymology.literary_period.to_s+"\" >"
    if @etymology.literary_period_type == nil
      title = 'Click to modify'
    else
      title = @etymology.literary_period_type.title
    end
    resultstr << "<span id=\"etymology[literary_period_type#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.literary_period+']' if @etymology.literary_period != nil
    resultstr << link_to_remote( title,{:update => "etymology[literary_period_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 187, 'model_name' => 'etymology', 'function_name' => "literary_period_type", :update_id => "etymology[literary_period_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[literary_period_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[literary_period_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[literary_period_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[literary_period_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # if @etymology.literary_period == nil or @etymology.literary_period == ''
    #   @etymology.literary_period = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :etymology, :literary_period, {}, {:select_options => @literary_period, :fieldname => 'etymology[literary_period]'})+"<br>"
    resultstr << "<b>Literary form: </b>"
    #resultstr << "<input type=hidden name=etymology[literary_form] id=etymology[literary_form] value=\""+@etymology.literary_form.to_s+"\" >"
    if @etymology.literary_form_type == nil
      title = 'Click to modify'
    else
      title = @etymology.literary_form_type.title
    end
    resultstr << "<span id=\"etymology[literary_form_type#{@etymology.id}]_selector\">"
    resultstr << '['+@etymology.literary_form+']' if @etymology.literary_form != nil
    resultstr << link_to_remote( title,{:update => "etymology[literary_form_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 186, 'model_name' => 'etymology', 'function_name' => "literary_form_type", :update_id => "etymology[literary_form_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[literary_form_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[literary_form_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[literary_form_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[literary_form_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # if @etymology.literary_form == nil or @etymology.literary_form == ''
    #   @etymology.literary_form = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :etymology, :literary_form, {}, {:select_options => @literary_form, :fieldname => 'etymology[literary_form]'})+"<br>"

    resultstr << "<b>Analytical note: </b>"
    #resultstr << "<input type=hidden name=etymology[analytical_note] id=etymology[analytical_note] value=\""+@etymology.analytical_note.to_s+"\" >"
    #if @etymology.analytical_note == nil or @etymology.analytical_note == ''
    #  @etymology.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :etymology, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_anotediv" + "'>"
    edit_path = etymology_analytical_note_edit_url(:id => @etymology.id)
    if @etymology.analytical_note == nil or @etymology.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @etymology.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@etymology.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
		resultstr <<	"<span id=\"show_av_etymology"+@etymology.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_etymology"+@etymology.id.to_s+"');Element.show('hide_av_etymology"+@etymology.id.to_s+"');Element.show('av_etymology_"+@etymology.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_etymology"+@etymology.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_etymology"+@etymology.id.to_s+"');Element.show('show_av_etymology"+@etymology.id.to_s+"');Element.hide('av_etymology_"+@etymology.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_etymology_"+@etymology.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<b>Image: </b>"
    #resultstr << "<input type=hidden name=etymology[image] id=etymology[image] value=\""+@etymology.image.to_s+"\" >"
    if @etymology.image == nil or @etymology.image == ''
      @etymology.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    #resultstr << "<input type=hidden name=etymology[image_caption] id=etymology[image_caption] value=\""+@etymology.image_caption.to_s+"\" >"
    if @etymology.image_caption == nil or @etymology.image_caption == ''
      @etymology.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    #resultstr << "<input type=hidden name=etymology[image_photographer] id=etymology[image_photographer] value=\""+@etymology.image_photographer.to_s+"\" >"
    if @etymology.image_photographer == nil or @etymology.image_photographer == ''
      @etymology.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    #resultstr << "<input type=hidden name=etymology[image_link] id=etymology[image_link] value=\""+@etymology.image_link.to_s+"\" >"
    if @etymology.image_link == nil or @etymology.image_link == ''
      @etymology.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
   # resultstr << "<input type=hidden name=etymology[image_description] id=etymology[image_description] value=\""+@etymology.image_description.to_s+"\" >"
    #if @etymology.image_description == nil or @etymology.image_description == ''
    #  @etymology.image_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :etymology, :image_description, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_imagedescdiv" + "'>"
    edit_path = etymology_image_description_edit_url(:id => @etymology.id)
    if @etymology.image_description == nil or @etymology.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @etymology.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@etymology.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    #resultstr << "<input type=hidden name=etymology[audio] id=etymology[audio] value=\""+@etymology.audio.to_s+"\" >"
    if @etymology.audio == nil or @etymology.audio == ''
      @etymology.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_id_number] id=etymology[audio_id_number] value=\""+@etymology.audio_id_number.to_s+"\" >"
    if @etymology.audio_id_number == nil or @etymology.audio_id_number == ''
      @etymology.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_speaker] id=etymology[audio_speaker] value=\""+@etymology.audio_speaker.to_s+"\" >"
    if @etymology.audio_speaker == nil or @etymology.audio_speaker == ''
      @etymology.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_date] id=etymology[audio_date] value=\""+@etymology.audio_date.to_s+"\" >"
    if @etymology.audio_date == nil or @etymology.audio_date == ''
      @etymology.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_place_of_recording] id=etymology[audio_place_of_recording] value=\""+@etymology.audio_place_of_recording.to_s+"\" >"
    if @etymology.audio_place_of_recording == nil or @etymology.audio_place_of_recording == ''
      @etymology.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_link] id=etymology[audio_link] value=\""+@etymology.audio_link.to_s+"\" >"
    if @etymology.audio_link == nil or @etymology.audio_link == ''
      @etymology.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_description] id=etymology[audio_description] value=\""+@etymology.audio_description.to_s+"\" >"
    #if @etymology.audio_description == nil or @etymology.audio_description == ''
    #  @etymology.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :etymology, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_audiodescdiv" + "'>"
    edit_path = etymology_audio_description_edit_url(:id => @etymology.id)
    if @etymology.audio_description == nil or @etymology.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @etymology.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@etymology.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Video: </b>"
    #resultstr << "<input type=hidden name=etymology[video] id=etymology[video] value=\""+@etymology.video.to_s+"\" >"
    if @etymology.video == nil or @etymology.video == ''
      @etymology.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    #resultstr << "<input type=hidden name=etymology[video_id_number] id=etymology[video_id_number] value=\""+@etymology.video_id_number.to_s+"\" >"
    if @etymology.video_id_number == nil or @etymology.video_id_number == ''
      @etymology.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    #resultstr << "<input type=hidden name=etymology[video_speaker] id=etymology[video_speaker] value=\""+@etymology.video_speaker.to_s+"\" >"
    if @etymology.video_speaker == nil or @etymology.video_speaker == ''
      @etymology.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    #resultstr << "<input type=hidden name=etymology[video_date] id=etymology[video_date] value=\""+@etymology.video_date.to_s+"\" >"
    if @etymology.video_date == nil or @etymology.video_date == ''
      @etymology.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    #resultstr << "<input type=hidden name=etymology[video_place_of_recording] id=etymology[video_place_of_recording] value=\""+@etymology.video_place_of_recording.to_s+"\" >"
    if @etymology.video_place_of_recording == nil or @etymology.video_place_of_recording == ''
      @etymology.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    #resultstr << "<input type=hidden name=etymology[video_link] id=etymology[video_link] value=\""+@etymology.video_link.to_s+"\" >"
    if @etymology.video_link == nil or @etymology.video_link == ''
      @etymology.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    #resultstr << "<input type=hidden name=etymology[video_description] id=etymology[video_description] value=\""+@etymology.video_description.to_s+"\" >"
    #if @etymology.video_description == nil or @etymology.video_description == ''
    #  @etymology.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :etymology, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_videodescdiv" + "'>"
    edit_path = etymology_video_description_edit_url(:id => @etymology.id)
    if @etymology.video_description == nil or @etymology.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @etymology.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@etymology.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "</dd></dl></span>"
  end

  def modal_edit_dynamic_etymology
    resultstr = ""
    resultstr << "<b>Etymology: </b>"
    #resultstr << "<input type=hidden name=etymology[etymology] id=etymology[etymology] value=\""+@etymology.etymology.to_s+"\" >"
    
    resultstr << "<span class='etymologies_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_etypopupdiv" + "'>"
    #edit_path = etymology_edit_url(:id => @etymology.id)
    edit_path = etymology_popupedit_url(:id => @etymology.id)
    if @etymology.etymology == nil or @etymology.etymology == ''
      t_etymology = 'Click to modify etymology'
    else
      t_etymology = @etymology.etymology      
    end    
    resultstr << link_to_remote(t_etymology, :url => edit_path, :update => "#{@etymology.id}_etypopupdiv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"

    resultstr << "<b>Etymology type: </b>"
    #resultstr << "<input type=hidden name=etymology[etymology_type] id=etymology[etymology_type] value=\""+@etymology.etymology_type.to_s+"\" >"
    #if @etymology.etymology_category == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.etymology_category.title
    #end
    #resultstr << "<span id=\"etymology[etymology_category#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.etymology_type+']' if @etymology.etymology_type != nil
    #resultstr << link_to_remote( title,{:update => "etymology[etymology_category#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 182, 'model_name' => 'etymology', 'function_name' => "etymology_category", :update_id => "etymology[etymology_category#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[etymology_category"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[etymology_category"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[etymology_category"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[etymology_category"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    ## if @etymology.etymology_type == nil or @etymology.etymology_type == ''
    ##   @etymology.etymology_type = 'Click to modify'
    ## end
    ## resultstr << in_place_select_editor_field( :etymology, :etymology_type, {}, {:select_options => @etymology_type, :fieldname => 'etymology[etymology_type]'})+"<br>"
    #before update
    #@data = Category.find(182)
    ##resultstr << category_selector(@data, :etymology, :etymology_category, true, :hasTree => 'true', :singleSelectionTree => 'true')
    #if @etymology.etymology_category == nil
    #  title = ''
    #else
    #  title = @etymology.etymology_category.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :etymology_category,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"

    #<!-- Etymology type div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 182), :update => "#{@etymology.id}_etymology_etymology_category_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@etymology.id}_etymology_etymology_category_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 182})		
		assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 182})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"

    resultstr << "<b>Loan language: </b>"
    #resultstr << "<input type=hidden name=etymology[loan_language] id=etymology[loan_language] value=\""+@etymology.loan_language.to_s+"\" >"
    #if @etymology.loan_language_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.loan_language_type.title
    #end
    #resultstr << "<span id=\"etymology[loan_language_type#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.loan_language+']' if @etymology.loan_language != nil
    #resultstr << link_to_remote( title,{:update => "etymology[loan_language_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 184, 'model_name' => 'etymology', 'function_name' => "loan_language_type", :update_id => "etymology[loan_language_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[loan_language_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[loan_language_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[loan_language_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[loan_language_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    ## if @etymology.loan_language == nil or @etymology.loan_language == ''
    ##   @etymology.loan_language = 'Click to modify'
    ## end
    ## resultstr << in_place_select_editor_field( :etymology, :loan_language, {}, {:select_options => @loan_language, :fieldname => 'etymology[loan_language]'})+"<br>"
    ## resultstr << in_place_form_editor_field( :etymology, :loan_language, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[loan_language]'}) +"<br>"
    #before update
    #@data = Category.find(184)
    ##resultstr << category_selector(@data, :etymology, :loan_language_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @etymology.loan_language_type == nil
    #  title = ''
    #else
    #  title = @etymology.loan_language_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :loan_language_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
    #<!-- Loan Language div single association -->
 		edit_path = etymology_loan_language_edit_url(:id => @etymology.id)
    resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => edit_path, :update => "#{@etymology.id}_etymology_loan_language_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
   	resultstr << "<div id='" + "#{@etymology.id}_etymology_loan_language_type_div" + "'>"  
  	assoc = @etymology.loan_language_type.title  if !@etymology.loan_language_type.blank? 
    #resultstr << "<table><tr><td>" + "#{assoc}" + "</td></tr></table>"
    resultstr << "<table><tr><td>"
    if !@etymology.loan_language_type.blank? 
      resultstr << link_to (@etymology.loan_language_type.title, @etymology.loan_language_type.get_url_with_parent)
    end
    resultstr << "</td></tr></table>"
   	resultstr << "</div><br />"
  	resultstr << "</div><br />"
  	
    #<!-- Loan language div -->
		#resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 184), :update => "#{@etymology.id}_etymology_loan_language_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		##resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		#resultstr << "<div id='" + "#{@etymology.id}_etymology_loan_language_type_div" + "'>" 
		##resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 184})		
		#assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 184})
    #resultstr << "<table><tr><td>" + "#{assoc.collect{|a| a.category.title}.join(', ')}" + "</td></tr></table><br />"
		#resultstr << "</div>"


    resultstr << "<b>Derivation type: </b>"
    #resultstr << "<input type=hidden name=etymology[derivation] id=etymology[derivation] value=\""+@etymology.derivation.to_s+"\" >"
    #if @etymology.derivation_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.derivation_type.title
    #end
    #resultstr << "<span id=\"etymology[derivation_type#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.derivation+']' if @etymology.derivation != nil
    #resultstr << link_to_remote( title,{:update => "etymology[derivation_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 180, 'model_name' => 'etymology', 'function_name' => "derivation_type", :update_id => "etymology[derivation_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[derivation_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[derivation_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[derivation_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[derivation_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"  
    ## if @etymology.derivation == nil or @etymology.derivation == ''
    ##   @etymology.derivation = 'Click to modify'
    ## end
    ## resultstr << in_place_select_editor_field( :etymology, :derivation, {}, {:select_options => @derivation, :fieldname => 'etymology[derivation]'})+"<br>"
    #before update
    #@data = Category.find(180)
    ##resultstr << category_selector(@data, :etymology, :derivation_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @etymology.derivation_type == nil
    #  title = ''
    #else
    #  title = @etymology.derivation_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :derivation_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"

    #<!-- Derivation Type div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 180), :update => "#{@etymology.id}_etymology_derivation_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@etymology.id}_etymology_derivation_type_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 180})		
		assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 180})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		

    resultstr << "<b>Tibetan Dialect: </b>"
    #resultstr << "<input type=hidden name=etymology[major_dialect_family] id=etymology[major_dialect_family"+@etymology.id.to_s+"] value=\""+@etymology.major_dialect_family.to_s+"\" >"
    #if @etymology.major_dialect_family_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.major_dialect_family_type.title
    #end
    #resultstr << "<span id=\"etymology[major_dialect_family_type#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.major_dialect_family+']' if @etymology.major_dialect_family != nil
    #resultstr << link_to_remote( title,{:update => "etymology[major_dialect_family_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 638, 'model_name' => 'etymology', 'function_name' => "major_dialect_family_type", :update_id => "etymology[major_dialect_family_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[major_dialect_family_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #    # if @etymology.major_dialect_family == nil or @etymology.major_dialect_family == ''
    ##   @etymology.major_dialect_family = 'Click to modify'
    ## end
    ## resultstr <<  "<span id=etymology[major_dialect_family"+@etymology.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@etymology.id.to_s+";show_menu(etymology_dialect_menu,getCoord(arguments[0]));>"+@etymology.major_dialect_family+"</span><br>"
    ## resultstr << in_place_form_editor_field( :etymology, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[major_dialect_family]'}) +"<br>"
    ## resultstr << "<b>Specific dialect: </b>"
    ## resultstr << "<input type=hidden name=etymology[specific_dialect] id=etymology[specific_dialect] value=\""+@etymology.specific_dialect.to_s+"\" >"
    ## if @etymology.specific_dialect == nil or @etymology.specific_dialect == ''
    ##   @etymology.specific_dialect = 'Click to modify'
    ## end
    ## resultstr << in_place_form_editor_field( :etymology, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[specific_dialect]'}) +"<br>"
    #before update
    #@data = Category.find(638)
    ##resultstr << category_selector(@data, :etymology, :major_dialect_family_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @etymology.major_dialect_family_type == nil
    #  title = ''
    #else
    #  title = @etymology.major_dialect_family_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :major_dialect_family_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
    #<!-- Tibetan Dialect div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 638), :update => "#{@etymology.id}_etymology_major_dialect_family_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@etymology.id}_etymology_major_dialect_family_type_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 638})		
		assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 638})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		
    
    resultstr << "<b>Literary genre: </b>"
    #resultstr << "<input type=hidden name=etymology[literary_genre] id=etymology[literary_genre"+@etymology.id.to_s+"] value=\""+@etymology.literary_genre.to_s+"\" >"
    #if @etymology.literary_genre_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.literary_genre_type.title
    #end
    #resultstr << "<span id=\"etymology[literary_genre_type#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.literary_genre+']' if @etymology.literary_genre != nil
    #resultstr << link_to_remote( title,{:update => "etymology[literary_genre_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 119, 'model_name' => 'etymology', 'function_name' => "literary_genre_type", :update_id => "etymology[literary_genre_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "<script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[literary_genre_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    ## if @etymology.literary_genre == nil or @etymology.literary_genre == ''
    ##   @etymology.literary_genre = 'Click to modify'
    ## end
    ## resultstr <<  "<span id=etymology[literary_genre"+@etymology.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@etymology.id.to_s+";show_menu(etymology_literary_genre_menu,getCoord(arguments[0]));>"+@etymology.literary_genre+"</span><br>"
    ## resultstr << in_place_select_editor_field( :etymology, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'etymology[literary_genre]'})+"<br>"
    #before update
    #@data = Category.find(119)
    ##resultstr << category_selector(@data, :etymology, :literary_genre_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @etymology.literary_genre_type == nil
    #  title = ''
    #else
    #  title = @etymology.literary_genre_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :literary_genre_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
    #<!-- Literary genre div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 119), :update => "#{@etymology.id}_etymology_literary_genre_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@etymology.id}_etymology_literary_genre_type_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 119})		
		assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 119})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		
    
    resultstr << "<b>Literary period: </b>"
    #resultstr << "<input type=hidden name=etymology[literary_period] id=etymology[literary_period] value=\""+@etymology.literary_period.to_s+"\" >"
    #if @etymology.literary_period_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.literary_period_type.title
    #end
    #resultstr << "<span id=\"etymology[literary_period_type#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.literary_period+']' if @etymology.literary_period != nil
    #resultstr << link_to_remote( title,{:update => "etymology[literary_period_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 187, 'model_name' => 'etymology', 'function_name' => "literary_period_type", :update_id => "etymology[literary_period_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[literary_period_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[literary_period_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[literary_period_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[literary_period_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    ## if @etymology.literary_period == nil or @etymology.literary_period == ''
    ##   @etymology.literary_period = 'Click to modify'
    ## end
    ## resultstr << in_place_select_editor_field( :etymology, :literary_period, {}, {:select_options => @literary_period, :fieldname => 'etymology[literary_period]'})+"<br>"
    #before update
    #@data = Category.find(187)
    ##resultstr << category_selector(@data, :etymology, :literary_period_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @etymology.literary_period_type == nil
    #  title = ''
    #else
    #  title = @etymology.literary_period_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :literary_period_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"

    #<!-- Literary period div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 187), :update => "#{@etymology.id}_etymology_literary_period_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@etymology.id}_etymology_literary_period_type_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 187})		
		assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 187})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		

    resultstr << "<b>Literary form: </b>"
    #resultstr << "<input type=hidden name=etymology[literary_form] id=etymology[literary_form] value=\""+@etymology.literary_form.to_s+"\" >"
    #if @etymology.literary_form_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @etymology.literary_form_type.title
    #end
    #resultstr << "<span id=\"etymology[literary_form_type#{@etymology.id}]_selector\">"
    #resultstr << '['+@etymology.literary_form+']' if @etymology.literary_form != nil
    #resultstr << link_to_remote( title,{:update => "etymology[literary_form_type#{@etymology.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'etymologies', :action => 'display_category_selector', :id => @etymology.id, :params => {'data_id' => 186, 'model_name' => 'etymology', 'function_name' => "literary_form_type", :update_id => "etymology[literary_form_type#{@etymology.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('etymology[literary_form_type"+@etymology.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('etymology[literary_form_type"+@etymology.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('etymology[literary_form_type"+@etymology.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('etymology[literary_form_type"+@etymology.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    ## if @etymology.literary_form == nil or @etymology.literary_form == ''
    ##   @etymology.literary_form = 'Click to modify'
    ## end
    ## resultstr << in_place_select_editor_field( :etymology, :literary_form, {}, {:select_options => @literary_form, :fieldname => 'etymology[literary_form]'})+"<br>"
    #before update
    #@data = Category.find(186)
    ##resultstr << category_selector(@data, :etymology, :literary_form_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    #if @etymology.literary_form_type == nil
    #  title = ''
    #else
    #  title = @etymology.literary_form_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :etymology,
  	#				:selectable => false,
  	#				:fieldname => :literary_form_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"

    #<!-- Literary form div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_etymology_association_url(@etymology.id, 186), :update => "#{@etymology.id}_etymology_literary_form_type_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'etymologies', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@etymology.id}_etymology_literary_form_type_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_etymology_associations/index', :locals => {:data_id => 186})		
		assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => 186})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent}.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
		

    resultstr << "<b>Analytical note: </b>"
    #resultstr << "<input type=hidden name=etymology[analytical_note] id=etymology[analytical_note] value=\""+@etymology.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_anotediv" + "'>"
    edit_path = etymology_analytical_note_edit_url(:id => @etymology.id)
    if @etymology.analytical_note == nil or @etymology.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @etymology.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@etymology.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
		#resultstr <<	"<span id=\"show_av_etymology"+@etymology.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_etymology"+@etymology.id.to_s+"');Element.show('hide_av_etymology"+@etymology.id.to_s+"');Element.show('av_etymology_"+@etymology.id.to_s+"');", :title => 'Show')+"</span>"
		#resultstr <<	"<span id=\"hide_av_etymology"+@etymology.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_etymology"+@etymology.id.to_s+"');Element.show('show_av_etymology"+@etymology.id.to_s+"');Element.hide('av_etymology_"+@etymology.id.to_s+"');", :title => 'Hide')+"</span>"
    #resultstr << "<span id=\"av_etymology_"+@etymology.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<b>Edit Multimedia Data: </b>"
    resultstr << "<input type='button' name='toggleh1' value='show/hide multimedia' id='toggleh1'><br>"
    resultstr << "<div class='showhide'>"
    resultstr << "<b>Image: </b>"
    #resultstr << "<input type=hidden name=etymology[image] id=etymology[image] value=\""+@etymology.image.to_s+"\" >"
    if @etymology.image == nil or @etymology.image == ''
      @etymology.image = 'Click to modify'
    end
    #resultstr << in_place_form_editor_field( :etymology, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image]'}) +"<br>"
    resultstr <<      in_place_editor_field( :etymology, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image]'}) 
    resultstr << "<br>"
    resultstr << "<b>Image caption: </b>"
    #resultstr << "<input type=hidden name=etymology[image_caption] id=etymology[image_caption] value=\""+@etymology.image_caption.to_s+"\" >"
    if @etymology.image_caption == nil or @etymology.image_caption == ''
      @etymology.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image_caption]'}) 
    resultstr << "<br>"
    resultstr << "<b>Image photographer: </b>"
    #resultstr << "<input type=hidden name=etymology[image_photographer] id=etymology[image_photographer] value=\""+@etymology.image_photographer.to_s+"\" >"
    if @etymology.image_photographer == nil or @etymology.image_photographer == ''
      @etymology.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[image_photographer]'}) 
    resultstr << "<br>"
    
    resultstr << "<b>Image link: </b>"
    #resultstr << "<input type=hidden name=etymology[image_link] id=etymology[image_link] value=\""+@etymology.image_link.to_s+"\" >"
    if @etymology.image_link == nil or @etymology.image_link == ''
      @etymology.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[image_link]'}) 
    resultstr << "<br>"
    resultstr << "<b>Image description: </b>"
    #resultstr << "<input type=hidden name=etymology[image_description] id=etymology[image_description] value=\""+@etymology.image_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_imagedescdiv" + "'>"
    edit_path = etymology_image_description_edit_url(:id => @etymology.id)
    if @etymology.image_description == nil or @etymology.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @etymology.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@etymology.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    #resultstr << "<input type=hidden name=etymology[audio] id=etymology[audio] value=\""+@etymology.audio.to_s+"\" >"
    if @etymology.audio == nil or @etymology.audio == ''
      @etymology.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio id number: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_id_number] id=etymology[audio_id_number] value=\""+@etymology.audio_id_number.to_s+"\" >"
    if @etymology.audio_id_number == nil or @etymology.audio_id_number == ''
      @etymology.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_id_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio speaker: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_speaker] id=etymology[audio_speaker] value=\""+@etymology.audio_speaker.to_s+"\" >"
    if @etymology.audio_speaker == nil or @etymology.audio_speaker == ''
      @etymology.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_speaker]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio date: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_date] id=etymology[audio_date] value=\""+@etymology.audio_date.to_s+"\" >"
    if @etymology.audio_date == nil or @etymology.audio_date == ''
      @etymology.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_date]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio place of recording: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_place_of_recording] id=etymology[audio_place_of_recording] value=\""+@etymology.audio_place_of_recording.to_s+"\" >"
    if @etymology.audio_place_of_recording == nil or @etymology.audio_place_of_recording == ''
      @etymology.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[audio_place_of_recording]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio link: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_link] id=etymology[audio_link] value=\""+@etymology.audio_link.to_s+"\" >"
    if @etymology.audio_link == nil or @etymology.audio_link == ''
      @etymology.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[audio_link]'}) 
    resultstr << "<br>"
    resultstr << "<b>Audio description: </b>"
    #resultstr << "<input type=hidden name=etymology[audio_description] id=etymology[audio_description] value=\""+@etymology.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_audiodescdiv" + "'>"
    edit_path = etymology_audio_description_edit_url(:id => @etymology.id)
    if @etymology.audio_description == nil or @etymology.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @etymology.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@etymology.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Video: </b>"
    #resultstr << "<input type=hidden name=etymology[video] id=etymology[video] value=\""+@etymology.video.to_s+"\" >"
    if @etymology.video == nil or @etymology.video == ''
      @etymology.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video id number: </b>"
    #resultstr << "<input type=hidden name=etymology[video_id_number] id=etymology[video_id_number] value=\""+@etymology.video_id_number.to_s+"\" >"
    if @etymology.video_id_number == nil or @etymology.video_id_number == ''
      @etymology.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_id_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video speaker: </b>"
    #resultstr << "<input type=hidden name=etymology[video_speaker] id=etymology[video_speaker] value=\""+@etymology.video_speaker.to_s+"\" >"
    if @etymology.video_speaker == nil or @etymology.video_speaker == ''
      @etymology.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_speaker]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video date: </b>"
    #resultstr << "<input type=hidden name=etymology[video_date] id=etymology[video_date] value=\""+@etymology.video_date.to_s+"\" >"
    if @etymology.video_date == nil or @etymology.video_date == ''
      @etymology.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_date]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video place of recording: </b>"
    #resultstr << "<input type=hidden name=etymology[video_place_of_recording] id=etymology[video_place_of_recording] value=\""+@etymology.video_place_of_recording.to_s+"\" >"
    if @etymology.video_place_of_recording == nil or @etymology.video_place_of_recording == ''
      @etymology.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology[video_place_of_recording]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video link: </b>"
    #resultstr << "<input type=hidden name=etymology[video_link] id=etymology[video_link] value=\""+@etymology.video_link.to_s+"\" >"
    if @etymology.video_link == nil or @etymology.video_link == ''
      @etymology.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'etymology[video_link]'}) 
    resultstr << "<br>"
    resultstr << "<b>Video description: </b>"
    #resultstr << "<input type=hidden name=etymology[video_description] id=etymology[video_description] value=\""+@etymology.video_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@etymology.id}_videodescdiv" + "'>"
    edit_path = etymology_video_description_edit_url(:id => @etymology.id)
    if @etymology.video_description == nil or @etymology.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @etymology.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@etymology.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
        
    resultstr << "</div>" #showhide
    #resultstr << "</dd></dl></span>"
  end
  
  def show_edit_etymology
    resultstr = ""
    resultstr << "<p><b>Etymology: </b><br>"
    if @etymology.etymology == nil or @etymology.etymology == ''
      @etymology.etymology = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :etymology, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Etymology type: </b><br>"
    if @etymology.etymology_type == nil or @etymology.etymology_type == ''
      @etymology.etymology_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :etymology_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Loan language: </b><br>"
    if @etymology.loan_language == nil or @etymology.loan_language == ''
      @etymology.loan_language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :loan_language, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Derivation: </b><br>"
    if @etymology.derivation == nil or @etymology.derivation == ''
      @etymology.derivation = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :derivation, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    if @etymology.major_dialect_family == nil or @etymology.major_dialect_family == ''
      @etymology.major_dialect_family = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :major_dialect_family, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    if @etymology.specific_dialect == nil or @etymology.specific_dialect == ''
      @etymology.specific_dialect = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :specific_dialect, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary genre: </b><br>"
    if @etymology.literary_genre == nil or @etymology.literary_genre == ''
      @etymology.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :literary_genre, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary period: </b><br>"
    if @etymology.literary_period == nil or @etymology.literary_period == ''
      @etymology.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :literary_period, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary form: </b><br>"
    if @etymology.literary_form == nil or @etymology.literary_form == ''
      @etymology.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :literary_form, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @etymology.image == nil or @etymology.image == ''
      @etymology.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @etymology.image_caption == nil or @etymology.image_caption == ''
      @etymology.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_caption, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @etymology.image_photographer == nil or @etymology.image_photographer == ''
      @etymology.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @etymology.image_link == nil or @etymology.image_link == ''
      @etymology.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @etymology.image_description == nil or @etymology.image_description == ''
      @etymology.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :image_description, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @etymology.audio == nil or @etymology.audio == ''
      @etymology.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @etymology.audio_id_number == nil or @etymology.audio_id_number == ''
      @etymology.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @etymology.audio_speaker == nil or @etymology.audio_speaker == ''
      @etymology.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @etymology.audio_date == nil or @etymology.audio_date == ''
      @etymology.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @etymology.audio_place_of_recording == nil or @etymology.audio_place_of_recording == ''
      @etymology.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @etymology.audio_link == nil or @etymology.audio_link == ''
      @etymology.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @etymology.video == nil or @etymology.video == ''
      @etymology.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @etymology.video_id_number == nil or @etymology.video_id_number == ''
      @etymology.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @etymology.video_speaker == nil or @etymology.video_speaker == ''
      @etymology.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @etymology.video_date == nil or @etymology.video_date == ''
      @etymology.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @etymology.video_place_of_recording == nil or @etymology.video_place_of_recording == ''
      @etymology.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @etymology.video_link == nil or @etymology.video_link == ''
      @etymology.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @etymology.analytical_note == nil or @etymology.analytical_note == ''
      @etymology.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_etymology
    resultstr = ""
    resultstr << "<tr><td><b>Etymology: </b></td>"
    resultstr << "<td><input size=50 name=etymology[etymology] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Etymology type: </b></td>"
    resultstr << "<td><input size=50 name=etymology[etymology_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Loan language: </b></td>"
    resultstr << "<td><input size=50 name=etymology[loan_language] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Derivation: </b></td>"
    resultstr << "<td><input size=50 name=etymology[derivation] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tibetan Dialect: </b></td>"
    resultstr << "<td><input size=50 name=etymology[major_dialect_family] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=etymology[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=etymology[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=etymology[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=etymology[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=etymology[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=etymology[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=etymology[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=etymology[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=etymology[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=etymology[video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=etymology[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
