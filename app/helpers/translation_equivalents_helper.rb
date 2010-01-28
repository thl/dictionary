module TranslationEquivalentsHelper
  def show_translation_equivalent
    resultstr = ""
    resultstr << "<p><b>Translation equivalent: </b>"
    if @translation_equivalent.translation_equivalent != nil 
      resultstr << @translation_equivalent.translation_equivalent
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Language: </b>"
    if @translation_equivalent.language != nil 
      resultstr << @translation_equivalent.language
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @translation_equivalent.image != nil 
      resultstr << @translation_equivalent.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    if @translation_equivalent.image_caption != nil 
      resultstr << @translation_equivalent.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @translation_equivalent.image_photographer != nil 
      resultstr << @translation_equivalent.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @translation_equivalent.image_link != nil 
      resultstr << @translation_equivalent.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    if @translation_equivalent.image_description != nil 
      resultstr << @translation_equivalent.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @translation_equivalent.audio != nil 
      resultstr << @translation_equivalent.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @translation_equivalent.audio_id_number != nil 
      resultstr << @translation_equivalent.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @translation_equivalent.audio_speaker != nil 
      resultstr << @translation_equivalent.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @translation_equivalent.audio_date != nil 
      resultstr << @translation_equivalent.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @translation_equivalent.audio_place_of_recording != nil 
      resultstr << @translation_equivalent.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @translation_equivalent.audio_link != nil 
      resultstr << @translation_equivalent.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @translation_equivalent.video != nil 
      resultstr << @translation_equivalent.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @translation_equivalent.video_id_number != nil 
      resultstr << @translation_equivalent.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @translation_equivalent.video_speaker != nil 
      resultstr << @translation_equivalent.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @translation_equivalent.video_date != nil 
      resultstr << @translation_equivalent.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @translation_equivalent.video_place_of_recording != nil 
      resultstr << @translation_equivalent.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @translation_equivalent.video_link != nil 
      resultstr << @translation_equivalent.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @translation_equivalent.analytical_note != nil 
      resultstr << @translation_equivalent.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_translation_equivalent
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('translation_equivalent', { :align => "left" })
    resultstr << sort_header_tag('language', { :align => "left" })
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
    for translation_equivalent in @translation_equivalents
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.translation_equivalent.to_s unless translation_equivalent.translation_equivalent == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.language.to_s unless translation_equivalent.language == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.image.to_s unless translation_equivalent.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.image_caption.to_s unless translation_equivalent.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.image_photographer.to_s unless translation_equivalent.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.image_link.to_s unless translation_equivalent.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.image_description.to_s unless translation_equivalent.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.audio.to_s unless translation_equivalent.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.audio_id_number.to_s unless translation_equivalent.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.audio_speaker.to_s unless translation_equivalent.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.audio_date.to_s unless translation_equivalent.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.audio_place_of_recording.to_s unless translation_equivalent.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.audio_link.to_s unless translation_equivalent.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.video.to_s unless translation_equivalent.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.video_id_number.to_s unless translation_equivalent.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.video_speaker.to_s unless translation_equivalent.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.video_date.to_s unless translation_equivalent.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.video_place_of_recording.to_s unless translation_equivalent.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.video_link.to_s unless translation_equivalent.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	translation_equivalent.analytical_note.to_s unless translation_equivalent.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => translation_equivalent.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => translation_equivalent.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => translation_equivalent.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_translation_equivalent
    resultstr = ""
    resultstr << "<p><b>Translation equivalent: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[translation_equivalent] type=text value=\""
    resultstr << @translation_equivalent.translation_equivalent if @translation_equivalent.translation_equivalent != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Language: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[language] type=text value=\""
    resultstr << @translation_equivalent.language if @translation_equivalent.language != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=translation_equivalent[image] rows=3 wrap=virtual >"
    resultstr << @translation_equivalent.image if @translation_equivalent.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<input size=32 name=translation_equivalent[image_caption] type=text value=\""
    resultstr << @translation_equivalent.image_caption if @translation_equivalent.image_caption != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[image_photographer] type=text value=\""
    resultstr << @translation_equivalent.image_photographer if @translation_equivalent.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=translation_equivalent[image_link] rows=3 wrap=virtual >"
    resultstr << @translation_equivalent.image_link if @translation_equivalent.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<input size=32 name=translation_equivalent[image_description] type=text value=\""
    resultstr << @translation_equivalent.image_description if @translation_equivalent.image_description != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[audio] type=text value=\""
    resultstr << @translation_equivalent.audio if @translation_equivalent.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[audio_id_number] type=text value=\""
    resultstr << @translation_equivalent.audio_id_number if @translation_equivalent.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[audio_speaker] type=text value=\""
    resultstr << @translation_equivalent.audio_speaker if @translation_equivalent.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[audio_date] type=text value=\""
    resultstr << @translation_equivalent.audio_date if @translation_equivalent.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[audio_place_of_recording] type=text value=\""
    resultstr << @translation_equivalent.audio_place_of_recording if @translation_equivalent.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=translation_equivalent[audio_link] rows=3 wrap=virtual >"
    resultstr << @translation_equivalent.audio_link if @translation_equivalent.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[video] type=text value=\""
    resultstr << @translation_equivalent.video if @translation_equivalent.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[video_id_number] type=text value=\""
    resultstr << @translation_equivalent.video_id_number if @translation_equivalent.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[video_speaker] type=text value=\""
    resultstr << @translation_equivalent.video_speaker if @translation_equivalent.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[video_date] type=text value=\""
    resultstr << @translation_equivalent.video_date if @translation_equivalent.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=translation_equivalent[video_place_of_recording] type=text value=\""
    resultstr << @translation_equivalent.video_place_of_recording if @translation_equivalent.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=translation_equivalent[video_link] rows=3 wrap=virtual >"
    resultstr << @translation_equivalent.video_link if @translation_equivalent.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=translation_equivalent[analytical_note] rows=3 wrap=virtual >"
    resultstr << @translation_equivalent.analytical_note if @translation_equivalent.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_translation_equivalent
    resultstr = ""
    resultstr << "<b>Translation equivalent: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[translation_equivalent] id=translation_equivalent[translation_equivalent] value=\""+@translation_equivalent.translation_equivalent.to_s+"\" >"
    if @translation_equivalent.translation_equivalent == nil or @translation_equivalent.translation_equivalent == ''
      @translation_equivalent.translation_equivalent = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :translation_equivalent, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[translation_equivalent]'}) +"<br>"
    resultstr << "<b>Language: </b>"
    if @translation_equivalent.language_type == nil
      title = 'Click to modify'
    else
      title = @translation_equivalent.language_type.title
    end
    resultstr << "<span id=\"translation_equivalent[language_type#{@translation_equivalent.id}]_selector\">"
    resultstr << '['+@translation_equivalent.language+']' if @translation_equivalent.language != nil
    resultstr << link_to_remote( title,{:update => "translation_equivalent[language_type#{@translation_equivalent.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'translation_equivalents', :action => 'display_category_selector', :id => @translation_equivalent.id, :params => {'data_id' => 184, 'model_name' => 'translation_equivalent', 'function_name' => "language_type", :update_id => "translation_equivalent[language_type#{@translation_equivalent.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('translation_equivalent[language_type"+@translation_equivalent.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('translation_equivalent[language_type"+@translation_equivalent.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('translation_equivalent[language_type"+@translation_equivalent.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('translation_equivalent[language_type"+@translation_equivalent.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[analytical_note] id=translation_equivalent[analytical_note] value=\""+@translation_equivalent.analytical_note.to_s+"\" >"
    if @translation_equivalent.analytical_note == nil or @translation_equivalent.analytical_note == ''
      @translation_equivalent.analytical_note = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'translation_equivalent[analytical_note]'}) +"<br>"

		resultstr <<	"<span id=\"show_av_translation_equivalent"+@translation_equivalent.id.to_s+"\"><b>Edit A/V Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_translation_equivalent"+@translation_equivalent.id.to_s+"');Element.show('hide_av_translation_equivalent"+@translation_equivalent.id.to_s+"');Element.show('av_translation_equivalent_"+@translation_equivalent.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_translation_equivalent"+@translation_equivalent.id.to_s+"\" style=\"display:none\"><b>Hide A/V Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_translation_equivalent"+@translation_equivalent.id.to_s+"');Element.show('show_av_translation_equivalent"+@translation_equivalent.id.to_s+"');Element.hide('av_translation_equivalent_"+@translation_equivalent.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_translation_equivalent_"+@translation_equivalent.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    
    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[image] id=translation_equivalent[image] value=\""+@translation_equivalent.image.to_s+"\" >"
    if @translation_equivalent.image == nil or @translation_equivalent.image == ''
      @translation_equivalent.image = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :translation_equivalent, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'translation_equivalent[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[image_caption] id=translation_equivalent[image_caption] value=\""+@translation_equivalent.image_caption.to_s+"\" >"
    if @translation_equivalent.image_caption == nil or @translation_equivalent.image_caption == ''
      @translation_equivalent.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[image_photographer] id=translation_equivalent[image_photographer] value=\""+@translation_equivalent.image_photographer.to_s+"\" >"
    if @translation_equivalent.image_photographer == nil or @translation_equivalent.image_photographer == ''
      @translation_equivalent.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[image_link] id=translation_equivalent[image_link] value=\""+@translation_equivalent.image_link.to_s+"\" >"
    if @translation_equivalent.image_link == nil or @translation_equivalent.image_link == ''
      @translation_equivalent.image_link = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :translation_equivalent, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'translation_equivalent[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[image_description] id=translation_equivalent[image_description] value=\""+@translation_equivalent.image_description.to_s+"\" >"
    if @translation_equivalent.image_description == nil or @translation_equivalent.image_description == ''
      @translation_equivalent.image_description = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :image_description, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[image_description]'}) +"<br>"
    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[audio] id=translation_equivalent[audio] value=\""+@translation_equivalent.audio.to_s+"\" >"
    if @translation_equivalent.audio == nil or @translation_equivalent.audio == ''
      @translation_equivalent.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[audio_id_number] id=translation_equivalent[audio_id_number] value=\""+@translation_equivalent.audio_id_number.to_s+"\" >"
    if @translation_equivalent.audio_id_number == nil or @translation_equivalent.audio_id_number == ''
      @translation_equivalent.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[audio_speaker] id=translation_equivalent[audio_speaker] value=\""+@translation_equivalent.audio_speaker.to_s+"\" >"
    if @translation_equivalent.audio_speaker == nil or @translation_equivalent.audio_speaker == ''
      @translation_equivalent.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[audio_date] id=translation_equivalent[audio_date] value=\""+@translation_equivalent.audio_date.to_s+"\" >"
    if @translation_equivalent.audio_date == nil or @translation_equivalent.audio_date == ''
      @translation_equivalent.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[audio_place_of_recording] id=translation_equivalent[audio_place_of_recording] value=\""+@translation_equivalent.audio_place_of_recording.to_s+"\" >"
    if @translation_equivalent.audio_place_of_recording == nil or @translation_equivalent.audio_place_of_recording == ''
      @translation_equivalent.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[audio_link] id=translation_equivalent[audio_link] value=\""+@translation_equivalent.audio_link.to_s+"\" >"
    if @translation_equivalent.audio_link == nil or @translation_equivalent.audio_link == ''
      @translation_equivalent.audio_link = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :translation_equivalent, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'translation_equivalent[audio_link]'}) +"<br>"
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[video] id=translation_equivalent[video] value=\""+@translation_equivalent.video.to_s+"\" >"
    if @translation_equivalent.video == nil or @translation_equivalent.video == ''
      @translation_equivalent.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[video_id_number] id=translation_equivalent[video_id_number] value=\""+@translation_equivalent.video_id_number.to_s+"\" >"
    if @translation_equivalent.video_id_number == nil or @translation_equivalent.video_id_number == ''
      @translation_equivalent.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[video_speaker] id=translation_equivalent[video_speaker] value=\""+@translation_equivalent.video_speaker.to_s+"\" >"
    if @translation_equivalent.video_speaker == nil or @translation_equivalent.video_speaker == ''
      @translation_equivalent.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[video_date] id=translation_equivalent[video_date] value=\""+@translation_equivalent.video_date.to_s+"\" >"
    if @translation_equivalent.video_date == nil or @translation_equivalent.video_date == ''
      @translation_equivalent.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[video_place_of_recording] id=translation_equivalent[video_place_of_recording] value=\""+@translation_equivalent.video_place_of_recording.to_s+"\" >"
    if @translation_equivalent.video_place_of_recording == nil or @translation_equivalent.video_place_of_recording == ''
      @translation_equivalent.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :translation_equivalent, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'translation_equivalent[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=translation_equivalent[video_link] id=translation_equivalent[video_link] value=\""+@translation_equivalent.video_link.to_s+"\" >"
    if @translation_equivalent.video_link == nil or @translation_equivalent.video_link == ''
      @translation_equivalent.video_link = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :translation_equivalent, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'translation_equivalent[video_link]'}) +"<br>"
    resultstr << "</dd></dl></span>"
  end

  def show_edit_translation_equivalent
    resultstr = ""
    resultstr << "<p><b>Translation equivalent: </b><br>"
    if @translation_equivalent.translation_equivalent == nil or @translation_equivalent.translation_equivalent == ''
      @translation_equivalent.translation_equivalent = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :translation_equivalent, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Language: </b><br>"
    if @translation_equivalent.language == nil or @translation_equivalent.language == ''
      @translation_equivalent.language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :language, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @translation_equivalent.image == nil or @translation_equivalent.image == ''
      @translation_equivalent.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @translation_equivalent.image_caption == nil or @translation_equivalent.image_caption == ''
      @translation_equivalent.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :image_caption, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @translation_equivalent.image_photographer == nil or @translation_equivalent.image_photographer == ''
      @translation_equivalent.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @translation_equivalent.image_link == nil or @translation_equivalent.image_link == ''
      @translation_equivalent.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @translation_equivalent.image_description == nil or @translation_equivalent.image_description == ''
      @translation_equivalent.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :image_description, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @translation_equivalent.audio == nil or @translation_equivalent.audio == ''
      @translation_equivalent.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @translation_equivalent.audio_id_number == nil or @translation_equivalent.audio_id_number == ''
      @translation_equivalent.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @translation_equivalent.audio_speaker == nil or @translation_equivalent.audio_speaker == ''
      @translation_equivalent.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @translation_equivalent.audio_date == nil or @translation_equivalent.audio_date == ''
      @translation_equivalent.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @translation_equivalent.audio_place_of_recording == nil or @translation_equivalent.audio_place_of_recording == ''
      @translation_equivalent.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @translation_equivalent.audio_link == nil or @translation_equivalent.audio_link == ''
      @translation_equivalent.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @translation_equivalent.video == nil or @translation_equivalent.video == ''
      @translation_equivalent.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @translation_equivalent.video_id_number == nil or @translation_equivalent.video_id_number == ''
      @translation_equivalent.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @translation_equivalent.video_speaker == nil or @translation_equivalent.video_speaker == ''
      @translation_equivalent.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @translation_equivalent.video_date == nil or @translation_equivalent.video_date == ''
      @translation_equivalent.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @translation_equivalent.video_place_of_recording == nil or @translation_equivalent.video_place_of_recording == ''
      @translation_equivalent.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @translation_equivalent.video_link == nil or @translation_equivalent.video_link == ''
      @translation_equivalent.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @translation_equivalent.analytical_note == nil or @translation_equivalent.analytical_note == ''
      @translation_equivalent.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :translation_equivalent, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_translation_equivalent
    resultstr = ""
    resultstr << "<tr><td><b>Translation equivalent: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[translation_equivalent] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[language] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=translation_equivalent[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
