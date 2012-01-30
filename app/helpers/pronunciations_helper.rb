module PronunciationsHelper
  def show_pronunciation
    resultstr = ""
    resultstr << "<b>Phonetic transliteration: </b>"
    # resultstr << "<br>"
    if @pronunciation.phonetic_transliteration != nil 
      resultstr << @pronunciation.phonetic_transliteration
    end 
    resultstr << "<br>"
    resultstr << "<b>Pronunciation type: </b>"
    if @pronunciation.pronunciation_type != nil 
      resultstr << @pronunciation.pronunciation_type
    end 
    resultstr << "<br>"
    resultstr << "<b>Major dialect family: </b>"
    if @pronunciation.major_dialect_family != nil 
      resultstr << @pronunciation.major_dialect_family
    end 
    resultstr << "<br>"
    resultstr << "<b>Specific dialect: </b>"
    if @pronunciation.specific_dialect != nil 
      resultstr << @pronunciation.specific_dialect
    end 
    resultstr << "<br>"
    resultstr << "<b>Literary genre: </b>"
    if @pronunciation.literary_genre != nil 
      resultstr << @pronunciation.literary_genre
    end 
    resultstr << "<br>"
    resultstr << "<b>Literary period: </b>"
    if @pronunciation.literary_period != nil 
      resultstr << @pronunciation.literary_period
    end 
    resultstr << "<br>"
    resultstr << "<b>Literary form: </b>"
    if @pronunciation.literary_form != nil 
      resultstr << @pronunciation.literary_form
    end 
    resultstr << "<br>"
    resultstr << "<b>Image: </b>"
    # resultstr << "<br>"
    if @pronunciation.image != nil 
      resultstr << @pronunciation.image
    end 
    resultstr << "<br>"
    resultstr << "<b>Image caption: </b>"
    if @pronunciation.image_caption != nil 
      resultstr << @pronunciation.image_caption
    end 
    resultstr << "<br>"
    resultstr << "<b>Image photographer: </b>"
    if @pronunciation.image_photographer != nil 
      resultstr << @pronunciation.image_photographer
    end 
    resultstr << "<br>"
    resultstr << "<b>Image link: </b>"
    # resultstr << "<br>"
    if @pronunciation.image_link != nil 
      resultstr << @pronunciation.image_link
    end 
    resultstr << "<br>"
    resultstr << "<b>Image description: </b>"
    if @pronunciation.image_description != nil 
      resultstr << @pronunciation.image_description
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio: </b>"
    if @pronunciation.audio != nil 
      resultstr << @pronunciation.audio
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio id number: </b>"
    if @pronunciation.audio_id_number != nil 
      resultstr << @pronunciation.audio_id_number
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio speaker: </b>"
    if @pronunciation.audio_speaker != nil 
      resultstr << @pronunciation.audio_speaker
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio date: </b>"
    if @pronunciation.audio_date != nil 
      resultstr << @pronunciation.audio_date
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio place of recording: </b>"
    if @pronunciation.audio_place_of_recording != nil 
      resultstr << @pronunciation.audio_place_of_recording
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio link: </b>"
    # resultstr << "<br>"
    if @pronunciation.audio_link != nil 
      resultstr << @pronunciation.audio_link
    end 
    resultstr << "<br>"
    resultstr << "<b>Audio description: </b>"
    # resultstr << "<br>"
    if @pronunciation.audio_description != nil 
      resultstr << @pronunciation.audio_description
    end 
    resultstr << "<br>"
    resultstr << "<b>Video: </b>"
    if @pronunciation.video != nil 
      resultstr << @pronunciation.video
    end 
    resultstr << "<br>"
    resultstr << "<b>Video id number: </b>"
    if @pronunciation.video_id_number != nil 
      resultstr << @pronunciation.video_id_number
    end 
    resultstr << "<br>"
    resultstr << "<b>Video speaker: </b>"
    if @pronunciation.video_speaker != nil 
      resultstr << @pronunciation.video_speaker
    end 
    resultstr << "<br>"
    resultstr << "<b>Video date: </b>"
    if @pronunciation.video_date != nil 
      resultstr << @pronunciation.video_date
    end 
    resultstr << "<br>"
    resultstr << "<b>Video place of recording: </b>"
    if @pronunciation.video_place_of_recording != nil 
      resultstr << @pronunciation.video_place_of_recording
    end 
    resultstr << "<br>"
    resultstr << "<b>Video link: </b>"
    # resultstr << "<br>"
    if @pronunciation.video_link != nil 
      resultstr << @pronunciation.video_link
    end 
    resultstr << "<br>"
    resultstr << "<b>Video description: </b>"
    # resultstr << "<br>"
    if @pronunciation.video_description != nil 
      resultstr << @pronunciation.video_description
    end 
    resultstr << "<br>"
    resultstr << "<b>Analytical note: </b>"
    # resultstr << "<br>"
    if @pronunciation.analytical_note != nil 
      resultstr << @pronunciation.analytical_note
    end 
    resultstr << "<br>"
  end

  def list_pronunciation
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('phonetic_transliteration', { :align => "left" })
    resultstr << sort_header_tag('pronunciation_type', { :align => "left" })
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
    for pronunciation in @pronunciations
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.phonetic_transliteration.to_s unless pronunciation.phonetic_transliteration == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.pronunciation_type.to_s unless pronunciation.pronunciation_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.major_dialect_family.to_s unless pronunciation.major_dialect_family == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.specific_dialect.to_s unless pronunciation.specific_dialect == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.literary_genre.to_s unless pronunciation.literary_genre == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.literary_period.to_s unless pronunciation.literary_period == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.literary_form.to_s unless pronunciation.literary_form == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.image.to_s unless pronunciation.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.image_caption.to_s unless pronunciation.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.image_photographer.to_s unless pronunciation.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.image_link.to_s unless pronunciation.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.image_description.to_s unless pronunciation.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.audio.to_s unless pronunciation.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.audio_id_number.to_s unless pronunciation.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.audio_speaker.to_s unless pronunciation.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.audio_date.to_s unless pronunciation.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.audio_place_of_recording.to_s unless pronunciation.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.audio_link.to_s unless pronunciation.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.video.to_s unless pronunciation.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.video_id_number.to_s unless pronunciation.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.video_speaker.to_s unless pronunciation.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.video_date.to_s unless pronunciation.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.video_place_of_recording.to_s unless pronunciation.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.video_link.to_s unless pronunciation.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation.analytical_note.to_s unless pronunciation.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => pronunciation.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => pronunciation.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => pronunciation.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_pronunciation
    resultstr = ""
    resultstr << "<p><b>Phonetic transliteration: </b><br>"
    resultstr << "<textarea cols=65 name=pronunciation[phonetic_transliteration] rows=3 wrap=virtual >"
    resultstr << @pronunciation.phonetic_transliteration if @pronunciation.phonetic_transliteration != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Pronunciation type: </b><br>"
    resultstr << "<input size=80 name=pronunciation[pronunciation_type] type=text value=\""
    resultstr << @pronunciation.pronunciation_type if @pronunciation.pronunciation_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    resultstr << "<input size=80 name=pronunciation[major_dialect_family] type=text value=\""
    resultstr << @pronunciation.major_dialect_family if @pronunciation.major_dialect_family != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    resultstr << "<input size=80 name=pronunciation[specific_dialect] type=text value=\""
    resultstr << @pronunciation.specific_dialect if @pronunciation.specific_dialect != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=pronunciation[literary_genre] type=text value=\""
    resultstr << @pronunciation.literary_genre if @pronunciation.literary_genre != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=pronunciation[literary_period] type=text value=\""
    resultstr << @pronunciation.literary_period if @pronunciation.literary_period != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=pronunciation[literary_form] type=text value=\""
    resultstr << @pronunciation.literary_form if @pronunciation.literary_form != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=pronunciation[image] rows=3 wrap=virtual >"
    resultstr << @pronunciation.image if @pronunciation.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<input size=32 name=pronunciation[image_caption] type=text value=\""
    resultstr << @pronunciation.image_caption if @pronunciation.image_caption != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=pronunciation[image_photographer] type=text value=\""
    resultstr << @pronunciation.image_photographer if @pronunciation.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=pronunciation[image_link] rows=3 wrap=virtual >"
    resultstr << @pronunciation.image_link if @pronunciation.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<input size=32 name=pronunciation[image_description] type=text value=\""
    resultstr << @pronunciation.image_description if @pronunciation.image_description != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=pronunciation[audio] type=text value=\""
    resultstr << @pronunciation.audio if @pronunciation.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=pronunciation[audio_id_number] type=text value=\""
    resultstr << @pronunciation.audio_id_number if @pronunciation.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=pronunciation[audio_speaker] type=text value=\""
    resultstr << @pronunciation.audio_speaker if @pronunciation.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=pronunciation[audio_date] type=text value=\""
    resultstr << @pronunciation.audio_date if @pronunciation.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=pronunciation[audio_place_of_recording] type=text value=\""
    resultstr << @pronunciation.audio_place_of_recording if @pronunciation.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=pronunciation[audio_link] rows=3 wrap=virtual >"
    resultstr << @pronunciation.audio_link if @pronunciation.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=pronunciation[video] type=text value=\""
    resultstr << @pronunciation.video if @pronunciation.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=pronunciation[video_id_number] type=text value=\""
    resultstr << @pronunciation.video_id_number if @pronunciation.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=pronunciation[video_speaker] type=text value=\""
    resultstr << @pronunciation.video_speaker if @pronunciation.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=pronunciation[video_date] type=text value=\""
    resultstr << @pronunciation.video_date if @pronunciation.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=pronunciation[video_place_of_recording] type=text value=\""
    resultstr << @pronunciation.video_place_of_recording if @pronunciation.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=pronunciation[video_link] rows=3 wrap=virtual >"
    resultstr << @pronunciation.video_link if @pronunciation.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=pronunciation[analytical_note] rows=3 wrap=virtual >"
    resultstr << @pronunciation.analytical_note if @pronunciation.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_pronunciation
    resultstr = ""
    resultstr << "<b>Phonetic transliteration: </b>"
    resultstr << "<input type=hidden name=pronunciation[phonetic_transliteration] id=pronunciation[phonetic_transliteration] value=\""+@pronunciation.phonetic_transliteration.to_s+"\" >"
    if @pronunciation.phonetic_transliteration == nil or @pronunciation.phonetic_transliteration == ''
      @pronunciation.phonetic_transliteration = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :phonetic_transliteration, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[phonetic_transliteration]'}) +"<br>"
    resultstr << "<b>Pronunciation type: </b>"
    resultstr << "<input type=hidden name=pronunciation[pronunciation_type] id=pronunciation[pronunciation_type] value=\""+@pronunciation.pronunciation_type.to_s+"\" >"
    if @pronunciation.pronunciation_category == nil
      title = 'Click to modify'
    else
      title = @pronunciation.pronunciation_category.title
    end
    resultstr << "<span id=\"pronunciation[pronunciation_category#{@pronunciation.id}]_selector\">"
    resultstr << '['+@pronunciation.pronunciation_type+']' if @pronunciation.pronunciation_type != nil
    resultstr << link_to_remote( title,{:update => "pronunciation[pronunciation_category#{@pronunciation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'pronunciations', :action => 'display_category_selector', :id => @pronunciation.id, :params => {'data_id' => 189, 'model_name' => 'pronunciation', 'function_name' => "pronunciation_category", :update_id => "pronunciation[pronunciation_category#{@pronunciation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Tibetan Dialect: </b>"
    resultstr << "<input type=hidden name=pronunciation[major_dialect_family] id=pronunciation[major_dialect_family"+@pronunciation.id.to_s+"] value=\""+@pronunciation.major_dialect_family.to_s+"\" >"
    if @pronunciation.major_dialect_family_type == nil
      title = 'Click to modify'
    else
      title = @pronunciation.major_dialect_family_type.title
    end
    resultstr << "<span id=\"pronunciation[major_dialect_family_type#{@pronunciation.id}]_selector\">"
    resultstr << '['+@pronunciation.major_dialect_family+']' if @pronunciation.major_dialect_family != nil
    resultstr << link_to_remote( title,{:update => "pronunciation[major_dialect_family_type#{@pronunciation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'pronunciations', :action => 'display_category_selector', :id => @pronunciation.id, :params => {'data_id' => 638, 'model_name' => 'pronunciation', 'function_name' => "major_dialect_family_type", :update_id => "pronunciation[major_dialect_family_type#{@pronunciation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_form_editor_field( :pronunciation, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[major_dialect_family]'}) +"<br>"
    # resultstr << "<b>Specific dialect: </b>"
    # resultstr << "<input type=hidden name=pronunciation[specific_dialect] id=pronunciation[specific_dialect] value=\""+@pronunciation.specific_dialect.to_s+"\" >"
    # if @pronunciation.specific_dialect == nil or @pronunciation.specific_dialect == ''
    #   @pronunciation.specific_dialect = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :pronunciation, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[specific_dialect]'}) +"<br>"

    # resultstr << "<b>Literary genre: </b>"
    # resultstr << "<input type=hidden name=pronunciation[literary_genre] id=pronunciation[literary_genre] value=\""+@pronunciation.literary_genre.to_s+"\" >"
    # if @pronunciation.literary_genre == nil or @pronunciation.literary_genre == ''
    #   @pronunciation.literary_genre = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :pronunciation, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'pronunciation[literary_genre]'})+"<br>"
    # resultstr << "<b>Literary period: </b>"
    # resultstr << "<input type=hidden name=pronunciation[literary_period] id=pronunciation[literary_period] value=\""+@pronunciation.literary_period.to_s+"\" >"
    # if @pronunciation.literary_period == nil or @pronunciation.literary_period == ''
    #   @pronunciation.literary_period = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :pronunciation, :literary_period, {}, {:select_options => @literary_period, :fieldname => 'pronunciation[literary_period]'})+"<br>"
    # resultstr << "<b>Literary form: </b>"
    # resultstr << "<input type=hidden name=pronunciation[literary_form] id=pronunciation[literary_form] value=\""+@pronunciation.literary_form.to_s+"\" >"
    # if @pronunciation.literary_form == nil or @pronunciation.literary_form == ''
    #   @pronunciation.literary_form = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :pronunciation, :literary_form, {}, {:select_options => @literary_form, :fieldname => 'pronunciation[literary_form]'})+"<br>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=pronunciation[analytical_note] id=pronunciation[analytical_note] value=\""+@pronunciation.analytical_note.to_s+"\" >"
    #if @pronunciation.analytical_note == nil or @pronunciation.analytical_note == ''
    #  @pronunciation.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :pronunciation, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_anotediv" + "'>"
    edit_path = pronunciation_analytical_note_edit_url(:id => @pronunciation.id)
    if @pronunciation.analytical_note == nil or @pronunciation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @pronunciation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@pronunciation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
		resultstr <<	"<span id=\"show_av_pronunciation"+@pronunciation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_pronunciation"+@pronunciation.id.to_s+"');Element.show('hide_av_pronunciation"+@pronunciation.id.to_s+"');Element.show('av_pronunciation_"+@pronunciation.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_pronunciation"+@pronunciation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_pronunciation"+@pronunciation.id.to_s+"');Element.show('show_av_pronunciation"+@pronunciation.id.to_s+"');Element.hide('av_pronunciation_"+@pronunciation.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_pronunciation_"+@pronunciation.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    
    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=pronunciation[image] id=pronunciation[image] value=\""+@pronunciation.image.to_s+"\" >"
    if @pronunciation.image == nil or @pronunciation.image == ''
      @pronunciation.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=pronunciation[image_caption] id=pronunciation[image_caption] value=\""+@pronunciation.image_caption.to_s+"\" >"
    if @pronunciation.image_caption == nil or @pronunciation.image_caption == ''
      @pronunciation.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=pronunciation[image_photographer] id=pronunciation[image_photographer] value=\""+@pronunciation.image_photographer.to_s+"\" >"
    if @pronunciation.image_photographer == nil or @pronunciation.image_photographer == ''
      @pronunciation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=pronunciation[image_link] id=pronunciation[image_link] value=\""+@pronunciation.image_link.to_s+"\" >"
    if @pronunciation.image_link == nil or @pronunciation.image_link == ''
      @pronunciation.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=pronunciation[image_description] id=pronunciation[image_description] value=\""+@pronunciation.image_description.to_s+"\" >"
    #if @pronunciation.image_description == nil or @pronunciation.image_description == ''
    #  @pronunciation.image_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :pronunciation, :image_description, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_imagedescdiv" + "'>"
    edit_path = pronunciation_image_description_edit_url(:id => @pronunciation.id)
    if @pronunciation.image_description == nil or @pronunciation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @pronunciation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@pronunciation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio] id=pronunciation[audio] value=\""+@pronunciation.audio.to_s+"\" >"
    if @pronunciation.audio == nil or @pronunciation.audio == ''
      @pronunciation.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio_id_number] id=pronunciation[audio_id_number] value=\""+@pronunciation.audio_id_number.to_s+"\" >"
    if @pronunciation.audio_id_number == nil or @pronunciation.audio_id_number == ''
      @pronunciation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio_speaker] id=pronunciation[audio_speaker] value=\""+@pronunciation.audio_speaker.to_s+"\" >"
    if @pronunciation.audio_speaker == nil or @pronunciation.audio_speaker == ''
      @pronunciation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio_date] id=pronunciation[audio_date] value=\""+@pronunciation.audio_date.to_s+"\" >"
    if @pronunciation.audio_date == nil or @pronunciation.audio_date == ''
      @pronunciation.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio_place_of_recording] id=pronunciation[audio_place_of_recording] value=\""+@pronunciation.audio_place_of_recording.to_s+"\" >"
    if @pronunciation.audio_place_of_recording == nil or @pronunciation.audio_place_of_recording == ''
      @pronunciation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio_link] id=pronunciation[audio_link] value=\""+@pronunciation.audio_link.to_s+"\" >"
    if @pronunciation.audio_link == nil or @pronunciation.audio_link == ''
      @pronunciation.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=pronunciation[audio_description] id=pronunciation[audio_description] value=\""+@pronunciation.audio_description.to_s+"\" >"
    #if @pronunciation.audio_description == nil or @pronunciation.audio_description == ''
    #  @pronunciation.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :pronunciation, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_audiodescdiv" + "'>"
    edit_path = pronunciation_audio_description_edit_url(:id => @pronunciation.id)
    if @pronunciation.audio_description == nil or @pronunciation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @pronunciation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@pronunciation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=pronunciation[video] id=pronunciation[video] value=\""+@pronunciation.video.to_s+"\" >"
    if @pronunciation.video == nil or @pronunciation.video == ''
      @pronunciation.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=pronunciation[video_id_number] id=pronunciation[video_id_number] value=\""+@pronunciation.video_id_number.to_s+"\" >"
    if @pronunciation.video_id_number == nil or @pronunciation.video_id_number == ''
      @pronunciation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=pronunciation[video_speaker] id=pronunciation[video_speaker] value=\""+@pronunciation.video_speaker.to_s+"\" >"
    if @pronunciation.video_speaker == nil or @pronunciation.video_speaker == ''
      @pronunciation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=pronunciation[video_date] id=pronunciation[video_date] value=\""+@pronunciation.video_date.to_s+"\" >"
    if @pronunciation.video_date == nil or @pronunciation.video_date == ''
      @pronunciation.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=pronunciation[video_place_of_recording] id=pronunciation[video_place_of_recording] value=\""+@pronunciation.video_place_of_recording.to_s+"\" >"
    if @pronunciation.video_place_of_recording == nil or @pronunciation.video_place_of_recording == ''
      @pronunciation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=pronunciation[video_link] id=pronunciation[video_link] value=\""+@pronunciation.video_link.to_s+"\" >"
    if @pronunciation.video_link == nil or @pronunciation.video_link == ''
      @pronunciation.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=pronunciation[video_description] id=pronunciation[video_description] value=\""+@pronunciation.audio_description.to_s+"\" >"
    #if @pronunciation.video_description == nil or @pronunciation.video_description == ''
    #  @pronunciation.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :pronunciation, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_videodescdiv" + "'>"
    edit_path = pronunciation_video_description_edit_url(:id => @pronunciation.id)
    if @pronunciation.video_description == nil or @pronunciation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @pronunciation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@pronunciation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "</dd></dl></span>"
  end

  def show_edit_pronunciation
    resultstr = ""
    resultstr << "<p><b>Phonetic transliteration: </b><br>"
    if @pronunciation.phonetic_transliteration == nil or @pronunciation.phonetic_transliteration == ''
      @pronunciation.phonetic_transliteration = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :phonetic_transliteration, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Pronunciation type: </b><br>"
    if @pronunciation.pronunciation_type == nil or @pronunciation.pronunciation_type == ''
      @pronunciation.pronunciation_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :pronunciation_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    if @pronunciation.major_dialect_family == nil or @pronunciation.major_dialect_family == ''
      @pronunciation.major_dialect_family = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :major_dialect_family, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    if @pronunciation.specific_dialect == nil or @pronunciation.specific_dialect == ''
      @pronunciation.specific_dialect = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :specific_dialect, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary genre: </b><br>"
    if @pronunciation.literary_genre == nil or @pronunciation.literary_genre == ''
      @pronunciation.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :literary_genre, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary period: </b><br>"
    if @pronunciation.literary_period == nil or @pronunciation.literary_period == ''
      @pronunciation.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :literary_period, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary form: </b><br>"
    if @pronunciation.literary_form == nil or @pronunciation.literary_form == ''
      @pronunciation.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :literary_form, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @pronunciation.image == nil or @pronunciation.image == ''
      @pronunciation.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @pronunciation.image_caption == nil or @pronunciation.image_caption == ''
      @pronunciation.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_caption, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @pronunciation.image_photographer == nil or @pronunciation.image_photographer == ''
      @pronunciation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @pronunciation.image_link == nil or @pronunciation.image_link == ''
      @pronunciation.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @pronunciation.image_description == nil or @pronunciation.image_description == ''
      @pronunciation.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_description, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @pronunciation.audio == nil or @pronunciation.audio == ''
      @pronunciation.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @pronunciation.audio_id_number == nil or @pronunciation.audio_id_number == ''
      @pronunciation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @pronunciation.audio_speaker == nil or @pronunciation.audio_speaker == ''
      @pronunciation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @pronunciation.audio_date == nil or @pronunciation.audio_date == ''
      @pronunciation.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @pronunciation.audio_place_of_recording == nil or @pronunciation.audio_place_of_recording == ''
      @pronunciation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @pronunciation.audio_link == nil or @pronunciation.audio_link == ''
      @pronunciation.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @pronunciation.video == nil or @pronunciation.video == ''
      @pronunciation.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @pronunciation.video_id_number == nil or @pronunciation.video_id_number == ''
      @pronunciation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @pronunciation.video_speaker == nil or @pronunciation.video_speaker == ''
      @pronunciation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @pronunciation.video_date == nil or @pronunciation.video_date == ''
      @pronunciation.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @pronunciation.video_place_of_recording == nil or @pronunciation.video_place_of_recording == ''
      @pronunciation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @pronunciation.video_link == nil or @pronunciation.video_link == ''
      @pronunciation.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @pronunciation.analytical_note == nil or @pronunciation.analytical_note == ''
      @pronunciation.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_pronunciation
    resultstr = ""
    resultstr << "<tr><td><b>Phonetic transliteration: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[phonetic_transliteration] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Pronunciation type: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[pronunciation_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tibetan Dialect: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[major_dialect_family] type=text value=\""
    resultstr << "\" /></td></tr>"
    # resultstr << "<tr><td><b>Literary genre: </b></td>"
    # resultstr << "<td><input size=50 name=pronunciation[literary_genre] type=text value=\""
    # resultstr << "\" /></td></tr>"
    # resultstr << "<tr><td><b>Literary period: </b></td>"
    # resultstr << "<td><input size=50 name=pronunciation[literary_period] type=text value=\""
    # resultstr << "\" /></td></tr>"
    # resultstr << "<tr><td><b>Literary form: </b></td>"
    # resultstr << "<td><input size=50 name=pronunciation[literary_form] type=text value=\""
    # resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

  def modal_edit_dynamic_pronunciation
    resultstr = ""
    resultstr << "<b>Phonetic transliteration: </b>"
    #resultstr << "<input type=hidden name=pronunciation[phonetic_transliteration] id=pronunciation[phonetic_transliteration] value=\""+@pronunciation.phonetic_transliteration.to_s+"\" >"
    if @pronunciation.phonetic_transliteration == nil or @pronunciation.phonetic_transliteration == ''
      @pronunciation.phonetic_transliteration = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :phonetic_transliteration, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[phonetic_transliteration]'}) 
    
    resultstr << "<br><b>Pronunciation type: </b>"
    #resultstr << "<input type=hidden name=pronunciation[pronunciation_type] id=pronunciation[pronunciation_type] value=\""+@pronunciation.pronunciation_type.to_s+"\" >"
    #if @pronunciation.pronunciation_category == nil
    #  title = 'Click to modify'
    #else
    #  title = @pronunciation.pronunciation_category.title
    #end
    #resultstr << "<span id=\"pronunciation[pronunciation_category#{@pronunciation.id}]_selector\">"
    #resultstr << '['+@pronunciation.pronunciation_type+']' if @pronunciation.pronunciation_type != nil
    #resultstr << link_to_remote( title,{:update => "pronunciation[pronunciation_category#{@pronunciation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'pronunciations', :action => 'display_category_selector', :id => @pronunciation.id, :params => {'data_id' => 189, 'model_name' => 'pronunciation', 'function_name' => "pronunciation_category", :update_id => "pronunciation[pronunciation_category#{@pronunciation.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('pronunciation[pronunciation_category"+@pronunciation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    @data = Category.find(189)
    @pronunciation_type = @data.children.collect {|l| [ h(l.title), l.id ] } #@data.children.collect(&:id)
    #resultstr << category_selector(@data, :pronunciation, :pronunciation_category, true, :hasTree => 'true', :singleSelectionTree => 'true')
    resultstr << select(:pronunciation, :pronunciation_category_id, @pronunciation_type, { :include_blank => true })
    resultstr << "<br>"
    resultstr << "<b>Tibetan Dialect: </b>"
    #resultstr << "<input type=hidden name=pronunciation[major_dialect_family] id=pronunciation[major_dialect_family"+@pronunciation.id.to_s+"] value=\""+@pronunciation.major_dialect_family.to_s+"\" >"
    #if @pronunciation.major_dialect_family_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @pronunciation.major_dialect_family_type.title
    #end
    #resultstr << "<span id=\"pronunciation[major_dialect_family_type#{@pronunciation.id}]_selector\">"
    #resultstr << '['+@pronunciation.major_dialect_family+']' if @pronunciation.major_dialect_family != nil
    #resultstr << link_to_remote( title,{:update => "pronunciation[major_dialect_family_type#{@pronunciation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'pronunciations', :action => 'display_category_selector', :id => @pronunciation.id, :params => {'data_id' => 638, 'model_name' => 'pronunciation', 'function_name' => "major_dialect_family_type", :update_id => "pronunciation[major_dialect_family_type#{@pronunciation.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('pronunciation[major_dialect_family_type"+@pronunciation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    #@data = Category.find(638)
    ##resultstr << category_selector(@data, :pronunciation, :major_dialect_family_type, true, :hasTree => 'true', :singleSelectionTree => 'true')
    #if @pronunciation.major_dialect_family_type == nil
    #  title = ''
    #else
    #  title = @pronunciation.major_dialect_family_type.title
    #end
    #resultstr << " <table class='mobj' border='0' cellspacing='0'>"
  	#resultstr <<
  	#			category_fields({
  	#				:subject => {:display => title, :label => ''}, 
  	#				:root => @data,
  	#				:varname => :pronunciation,
  	#				:selectable => false,
  	#				:fieldname => :major_dialect_family_type,
  	#				:include_js => true
  	#			})
  	#resultstr << "<tr><td></td></tr>"
  	#resultstr << "</table>"
    #resultstr << "<br>"
    
 		#<!-- Tibetan Dialect div -->
		resultstr << link_to_remote(image_tag('pencil.png',:border => 0), :url => new_category_pronunciation_association_url(@pronunciation.id, 638), :update => "#{@pronunciation.id}_pronunciation_major_dialect_family_div", :method => :get, :html => {:class => 'definitions_show'} )  
		#resultstr << link_to image_tag('cross.png',:border => 0), url_for(:controller => 'pronunciations', :action => 'public_remove_language' , :update => 'definition_space', :complete => 're_initialize();',  :id => d.id, :parent_id => parent_id, :head_id => head_id),  :title=>'Remove Language', :confirm => "Are you sure you want to remove this Language?" 
 		resultstr << "<div id='" + "#{@pronunciation.id}_pronunciation_major_dialect_family_div" + "'>" 
		#resultstr << render_to_string(:partial => 'category_pronunciation_associations/index', :locals => {:data_id => 638})		
		assoc = @pronunciation.category_pronunciation_associations.find(:all, :conditions => {:category_branch_id => 638})
    resultstr << "<table><tr><td>" + "#{assoc.collect{|a| link_to a.category.title, a.category.get_url_with_parent, :target => '_blank' }.join(', ')}" + "</td></tr></table><br />"
		resultstr << "</div>"
    
    # resultstr << in_place_form_editor_field( :pronunciation, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[major_dialect_family]'}) +"<br>"
    # resultstr << "<b>Specific dialect: </b>"
    # resultstr << "<input type=hidden name=pronunciation[specific_dialect] id=pronunciation[specific_dialect] value=\""+@pronunciation.specific_dialect.to_s+"\" >"
    # if @pronunciation.specific_dialect == nil or @pronunciation.specific_dialect == ''
    #   @pronunciation.specific_dialect = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :pronunciation, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[specific_dialect]'}) +"<br>"

    # resultstr << "<b>Literary genre: </b>"
    # resultstr << "<input type=hidden name=pronunciation[literary_genre] id=pronunciation[literary_genre] value=\""+@pronunciation.literary_genre.to_s+"\" >"
    # if @pronunciation.literary_genre == nil or @pronunciation.literary_genre == ''
    #   @pronunciation.literary_genre = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :pronunciation, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'pronunciation[literary_genre]'})+"<br>"
    # resultstr << "<b>Literary period: </b>"
    # resultstr << "<input type=hidden name=pronunciation[literary_period] id=pronunciation[literary_period] value=\""+@pronunciation.literary_period.to_s+"\" >"
    # if @pronunciation.literary_period == nil or @pronunciation.literary_period == ''
    #   @pronunciation.literary_period = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :pronunciation, :literary_period, {}, {:select_options => @literary_period, :fieldname => 'pronunciation[literary_period]'})+"<br>"
    # resultstr << "<b>Literary form: </b>"
    # resultstr << "<input type=hidden name=pronunciation[literary_form] id=pronunciation[literary_form] value=\""+@pronunciation.literary_form.to_s+"\" >"
    # if @pronunciation.literary_form == nil or @pronunciation.literary_form == ''
    #   @pronunciation.literary_form = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :pronunciation, :literary_form, {}, {:select_options => @literary_form, :fieldname => 'pronunciation[literary_form]'})+"<br>"

    resultstr << "<b>Analytical note: </b>"
    #resultstr << "<input type=hidden name=pronunciation[analytical_note] id=pronunciation[analytical_note] value=\""+@pronunciation.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_anotediv" + "'>"
    edit_path = pronunciation_analytical_note_edit_url(:id => @pronunciation.id)
    if @pronunciation.analytical_note == nil or @pronunciation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @pronunciation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@pronunciation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
		#resultstr <<	"<span id=\"show_av_pronunciation"+@pronunciation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_pronunciation"+@pronunciation.id.to_s+"');Element.show('hide_av_pronunciation"+@pronunciation.id.to_s+"');Element.show('av_pronunciation_"+@pronunciation.id.to_s+"');", :title => 'Show')+"</span>"
		#resultstr <<	"<span id=\"hide_av_pronunciation"+@pronunciation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_pronunciation"+@pronunciation.id.to_s+"');Element.show('show_av_pronunciation"+@pronunciation.id.to_s+"');Element.hide('av_pronunciation_"+@pronunciation.id.to_s+"');", :title => 'Hide')+"</span>"
    #resultstr << "<span id=\"av_pronunciation_"+@pronunciation.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<b>Edit Multimedia Data: </b>"
    resultstr << "<input type='button' name='toggleh1' value='show/hide multimedia' id='toggleh1'><br>"
    resultstr << "<div class='showhide'>"
    resultstr << "<b>Image: </b>"
    #resultstr << "<input type=hidden name=pronunciation[image] id=pronunciation[image] value=\""+@pronunciation.image.to_s+"\" >"
    if @pronunciation.image == nil or @pronunciation.image == ''
      @pronunciation.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    #resultstr << "<input type=hidden name=pronunciation[image_caption] id=pronunciation[image_caption] value=\""+@pronunciation.image_caption.to_s+"\" >"
    if @pronunciation.image_caption == nil or @pronunciation.image_caption == ''
      @pronunciation.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    #resultstr << "<input type=hidden name=pronunciation[image_photographer] id=pronunciation[image_photographer] value=\""+@pronunciation.image_photographer.to_s+"\" >"
    if @pronunciation.image_photographer == nil or @pronunciation.image_photographer == ''
      @pronunciation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    #resultstr << "<input type=hidden name=pronunciation[image_link] id=pronunciation[image_link] value=\""+@pronunciation.image_link.to_s+"\" >"
    if @pronunciation.image_link == nil or @pronunciation.image_link == ''
      @pronunciation.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    #resultstr << "<input type=hidden name=pronunciation[image_description] id=pronunciation[image_description] value=\""+@pronunciation.image_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_imagedescdiv" + "'>"
    edit_path = pronunciation_image_description_edit_url(:id => @pronunciation.id)
    if @pronunciation.image_description == nil or @pronunciation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @pronunciation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@pronunciation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Audio: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio] id=pronunciation[audio] value=\""+@pronunciation.audio.to_s+"\" >"
    if @pronunciation.audio == nil or @pronunciation.audio == ''
      @pronunciation.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio_id_number] id=pronunciation[audio_id_number] value=\""+@pronunciation.audio_id_number.to_s+"\" >"
    if @pronunciation.audio_id_number == nil or @pronunciation.audio_id_number == ''
      @pronunciation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio_speaker] id=pronunciation[audio_speaker] value=\""+@pronunciation.audio_speaker.to_s+"\" >"
    if @pronunciation.audio_speaker == nil or @pronunciation.audio_speaker == ''
      @pronunciation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio_date] id=pronunciation[audio_date] value=\""+@pronunciation.audio_date.to_s+"\" >"
    if @pronunciation.audio_date == nil or @pronunciation.audio_date == ''
      @pronunciation.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio_place_of_recording] id=pronunciation[audio_place_of_recording] value=\""+@pronunciation.audio_place_of_recording.to_s+"\" >"
    if @pronunciation.audio_place_of_recording == nil or @pronunciation.audio_place_of_recording == ''
      @pronunciation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio_link] id=pronunciation[audio_link] value=\""+@pronunciation.audio_link.to_s+"\" >"
    if @pronunciation.audio_link == nil or @pronunciation.audio_link == ''
      @pronunciation.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    #resultstr << "<input type=hidden name=pronunciation[audio_description] id=pronunciation[audio_description] value=\""+@pronunciation.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_audiodescdiv" + "'>"
    edit_path = pronunciation_audio_description_edit_url(:id => @pronunciation.id)
    if @pronunciation.audio_description == nil or @pronunciation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @pronunciation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@pronunciation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Video: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video] id=pronunciation[video] value=\""+@pronunciation.video.to_s+"\" >"
    if @pronunciation.video == nil or @pronunciation.video == ''
      @pronunciation.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video_id_number] id=pronunciation[video_id_number] value=\""+@pronunciation.video_id_number.to_s+"\" >"
    if @pronunciation.video_id_number == nil or @pronunciation.video_id_number == ''
      @pronunciation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video_speaker] id=pronunciation[video_speaker] value=\""+@pronunciation.video_speaker.to_s+"\" >"
    if @pronunciation.video_speaker == nil or @pronunciation.video_speaker == ''
      @pronunciation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video_date] id=pronunciation[video_date] value=\""+@pronunciation.video_date.to_s+"\" >"
    if @pronunciation.video_date == nil or @pronunciation.video_date == ''
      @pronunciation.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video_place_of_recording] id=pronunciation[video_place_of_recording] value=\""+@pronunciation.video_place_of_recording.to_s+"\" >"
    if @pronunciation.video_place_of_recording == nil or @pronunciation.video_place_of_recording == ''
      @pronunciation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video_link] id=pronunciation[video_link] value=\""+@pronunciation.video_link.to_s+"\" >"
    if @pronunciation.video_link == nil or @pronunciation.video_link == ''
      @pronunciation.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'pronunciation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    #resultstr << "<input type=hidden name=pronunciation[video_description] id=pronunciation[video_description] value=\""+@pronunciation.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@pronunciation.id}_videodescdiv" + "'>"
    edit_path = pronunciation_video_description_edit_url(:id => @pronunciation.id)
    if @pronunciation.video_description == nil or @pronunciation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @pronunciation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@pronunciation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    resultstr << "</div>" #showhide
    #resultstr << "</dd></dl></span>"
  end



end
