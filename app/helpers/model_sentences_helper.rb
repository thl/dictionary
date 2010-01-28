module ModelSentencesHelper
  def show_model_sentence
    resultstr = ""
    resultstr << "<p><b>Model sentence: </b>"
    if @model_sentence.model_sentence != nil 
      resultstr << @model_sentence.model_sentence
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Language: </b>"
    if @model_sentence.language != nil 
      resultstr << @model_sentence.language
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Sentence type: </b>"
    if @model_sentence.sentence_type != nil 
      resultstr << @model_sentence.sentence_type
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source: </b>"
    resultstr << "<br>"
    if @model_sentence.source != nil 
      resultstr << @model_sentence.source
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Spelling: </b>"
    if @model_sentence.spelling != nil 
      resultstr << @model_sentence.spelling
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Major dialect family: </b>"
    if @model_sentence.major_dialect_family != nil 
      resultstr << @model_sentence.major_dialect_family
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Specific dialect: </b>"
    if @model_sentence.specific_dialect != nil 
      resultstr << @model_sentence.specific_dialect
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary genre: </b>"
    if @model_sentence.literary_genre != nil 
      resultstr << @model_sentence.literary_genre
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary period: </b>"
    if @model_sentence.literary_period != nil 
      resultstr << @model_sentence.literary_period
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary form: </b>"
    if @model_sentence.literary_form != nil 
      resultstr << @model_sentence.literary_form
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @model_sentence.image != nil 
      resultstr << @model_sentence.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    if @model_sentence.image_caption != nil 
      resultstr << @model_sentence.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @model_sentence.image_photographer != nil 
      resultstr << @model_sentence.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @model_sentence.image_link != nil 
      resultstr << @model_sentence.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    if @model_sentence.image_description != nil 
      resultstr << @model_sentence.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @model_sentence.audio != nil 
      resultstr << @model_sentence.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @model_sentence.audio_id_number != nil 
      resultstr << @model_sentence.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @model_sentence.audio_speaker != nil 
      resultstr << @model_sentence.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @model_sentence.audio_date != nil 
      resultstr << @model_sentence.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @model_sentence.audio_place_of_recording != nil 
      resultstr << @model_sentence.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @model_sentence.audio_link != nil 
      resultstr << @model_sentence.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<br>"
    if @model_sentence.audio_description != nil 
      resultstr << @model_sentence.audio_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @model_sentence.video != nil 
      resultstr << @model_sentence.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @model_sentence.video_id_number != nil 
      resultstr << @model_sentence.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @model_sentence.video_speaker != nil 
      resultstr << @model_sentence.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @model_sentence.video_date != nil 
      resultstr << @model_sentence.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @model_sentence.video_place_of_recording != nil 
      resultstr << @model_sentence.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @model_sentence.video_link != nil 
      resultstr << @model_sentence.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<br>"
    if @model_sentence.video_description != nil 
      resultstr << @model_sentence.video_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @model_sentence.analytical_note != nil 
      resultstr << @model_sentence.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_model_sentence
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('model_sentence', { :align => "left" })
    resultstr << sort_header_tag('language', { :align => "left" })
    resultstr << sort_header_tag('sentence_type', { :align => "left" })
    resultstr << sort_header_tag('source', { :align => "left" })
    resultstr << sort_header_tag('spelling', { :align => "left" })
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
    for model_sentence in @model_sentences
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.model_sentence.to_s unless model_sentence.model_sentence == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.language.to_s unless model_sentence.language == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.sentence_type.to_s unless model_sentence.sentence_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.source.to_s unless model_sentence.source == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.spelling.to_s unless model_sentence.spelling == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.major_dialect_family.to_s unless model_sentence.major_dialect_family == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.specific_dialect.to_s unless model_sentence.specific_dialect == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.literary_genre.to_s unless model_sentence.literary_genre == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.literary_period.to_s unless model_sentence.literary_period == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.literary_form.to_s unless model_sentence.literary_form == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.image.to_s unless model_sentence.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.image_caption.to_s unless model_sentence.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.image_photographer.to_s unless model_sentence.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.image_link.to_s unless model_sentence.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.image_description.to_s unless model_sentence.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.audio.to_s unless model_sentence.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.audio_id_number.to_s unless model_sentence.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.audio_speaker.to_s unless model_sentence.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.audio_date.to_s unless model_sentence.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.audio_place_of_recording.to_s unless model_sentence.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.audio_link.to_s unless model_sentence.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.video.to_s unless model_sentence.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.video_id_number.to_s unless model_sentence.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.video_speaker.to_s unless model_sentence.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.video_date.to_s unless model_sentence.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.video_place_of_recording.to_s unless model_sentence.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.video_link.to_s unless model_sentence.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence.analytical_note.to_s unless model_sentence.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => model_sentence.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => model_sentence.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => model_sentence.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_model_sentence
    resultstr = ""
    resultstr << "<p><b>Model sentence: </b><br>"
    resultstr << "<input size=32 name=model_sentence[model_sentence] type=text value=\""
    resultstr << @model_sentence.model_sentence if @model_sentence.model_sentence != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Language: </b><br>"
    resultstr << "<input size=80 name=model_sentence[language] type=text value=\""
    resultstr << @model_sentence.language if @model_sentence.language != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Sentence type: </b><br>"
    resultstr << "<input size=80 name=model_sentence[sentence_type] type=text value=\""
    resultstr << @model_sentence.sentence_type if @model_sentence.sentence_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source: </b><br>"
    resultstr << "<textarea cols=65 name=model_sentence[source] rows=3 wrap=virtual >"
    resultstr << @model_sentence.source if @model_sentence.source != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Spelling: </b><br>"
    resultstr << "<input size=80 name=model_sentence[spelling] type=text value=\""
    resultstr << @model_sentence.spelling if @model_sentence.spelling != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    resultstr << "<input size=80 name=model_sentence[major_dialect_family] type=text value=\""
    resultstr << @model_sentence.major_dialect_family if @model_sentence.major_dialect_family != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    resultstr << "<input size=80 name=model_sentence[specific_dialect] type=text value=\""
    resultstr << @model_sentence.specific_dialect if @model_sentence.specific_dialect != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=model_sentence[literary_genre] type=text value=\""
    resultstr << @model_sentence.literary_genre if @model_sentence.literary_genre != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=model_sentence[literary_period] type=text value=\""
    resultstr << @model_sentence.literary_period if @model_sentence.literary_period != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=model_sentence[literary_form] type=text value=\""
    resultstr << @model_sentence.literary_form if @model_sentence.literary_form != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=model_sentence[image] rows=3 wrap=virtual >"
    resultstr << @model_sentence.image if @model_sentence.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<input size=32 name=model_sentence[image_caption] type=text value=\""
    resultstr << @model_sentence.image_caption if @model_sentence.image_caption != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=model_sentence[image_photographer] type=text value=\""
    resultstr << @model_sentence.image_photographer if @model_sentence.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=model_sentence[image_link] rows=3 wrap=virtual >"
    resultstr << @model_sentence.image_link if @model_sentence.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<input size=32 name=model_sentence[image_description] type=text value=\""
    resultstr << @model_sentence.image_description if @model_sentence.image_description != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=model_sentence[audio] type=text value=\""
    resultstr << @model_sentence.audio if @model_sentence.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=model_sentence[audio_id_number] type=text value=\""
    resultstr << @model_sentence.audio_id_number if @model_sentence.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=model_sentence[audio_speaker] type=text value=\""
    resultstr << @model_sentence.audio_speaker if @model_sentence.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=model_sentence[audio_date] type=text value=\""
    resultstr << @model_sentence.audio_date if @model_sentence.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=model_sentence[audio_place_of_recording] type=text value=\""
    resultstr << @model_sentence.audio_place_of_recording if @model_sentence.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=model_sentence[audio_link] rows=3 wrap=virtual >"
    resultstr << @model_sentence.audio_link if @model_sentence.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=model_sentence[video] type=text value=\""
    resultstr << @model_sentence.video if @model_sentence.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=model_sentence[video_id_number] type=text value=\""
    resultstr << @model_sentence.video_id_number if @model_sentence.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=model_sentence[video_speaker] type=text value=\""
    resultstr << @model_sentence.video_speaker if @model_sentence.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=model_sentence[video_date] type=text value=\""
    resultstr << @model_sentence.video_date if @model_sentence.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=model_sentence[video_place_of_recording] type=text value=\""
    resultstr << @model_sentence.video_place_of_recording if @model_sentence.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=model_sentence[video_link] rows=3 wrap=virtual >"
    resultstr << @model_sentence.video_link if @model_sentence.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=model_sentence[analytical_note] rows=3 wrap=virtual >"
    resultstr << @model_sentence.analytical_note if @model_sentence.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_model_sentence
    resultstr = ""
    resultstr << "<b>Model sentence: </b>"
    resultstr << "<input type=hidden name=model_sentence[model_sentence] id=model_sentence[model_sentence] value=\""+@model_sentence.model_sentence.to_s+"\" >"
    if @model_sentence.model_sentence == nil or @model_sentence.model_sentence == ''
      @model_sentence.model_sentence = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :model_sentence, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[model_sentence]'}) +"<br>"
    resultstr << "<b>Language: </b>"
    if @model_sentence.language_type == nil
      title = 'Click to modify'
    else
      title = @model_sentence.language_type.title
    end
    resultstr << "<span id=\"model_sentence[language_type#{@model_sentence.id}]_selector\">"
    resultstr << '['+@model_sentence.language+']' if @model_sentence.language != nil
    resultstr << link_to_remote( title,{:update => "model_sentence[language_type#{@model_sentence.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'model_sentences', :action => 'display_category_selector', :id => @model_sentence.id, :params => {'data_id' => 184, 'model_name' => 'model_sentence', 'function_name' => "language_type", :update_id => "model_sentence[language_type#{@model_sentence.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('model_sentence[language_type"+@model_sentence.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('model_sentence[language_type"+@model_sentence.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('model_sentence[language_type"+@model_sentence.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('model_sentence[language_type"+@model_sentence.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Tibetan Dialect: </b>"
    resultstr << "<input type=hidden name=model_sentence[major_dialect_family] id=model_sentence[major_dialect_family"+@model_sentence.id.to_s+"] value=\""+@model_sentence.major_dialect_family.to_s+"\" >"
    if @model_sentence.major_dialect_family_type == nil
      title = 'Click to modify'
    else
      title = @model_sentence.major_dialect_family_type.title
    end
    resultstr << "<span id=\"model_sentence[major_dialect_family_type#{@model_sentence.id}]_selector\">"
    resultstr << '['+@model_sentence.major_dialect_family+']' if @model_sentence.major_dialect_family != nil
    resultstr << link_to_remote( title,{:update => "model_sentence[major_dialect_family_type#{@model_sentence.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'model_sentences', :action => 'display_category_selector', :id => @model_sentence.id, :params => {'data_id' => 638, 'model_name' => 'model_sentence', 'function_name' => "major_dialect_family_type", :update_id => "model_sentence[major_dialect_family_type#{@model_sentence.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('model_sentence[major_dialect_family_type"+@model_sentence.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('model_sentence[major_dialect_family_type"+@model_sentence.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('model_sentence[major_dialect_family_type"+@model_sentence.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('model_sentence[major_dialect_family_type"+@model_sentence.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Sentence type: </b>"
    resultstr << "<input type=hidden name=model_sentence[sentence_type] id=model_sentence[sentence_type] value=\""+@model_sentence.sentence_type.to_s+"\" >"
    if @model_sentence.sentence_type == nil or @model_sentence.sentence_type == ''
      @model_sentence.sentence_type = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :sentence_type, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[sentence_type]'}) +"<br>"
    resultstr << "<b>Source: </b>"
    resultstr << "<input type=hidden name=model_sentence[source] id=model_sentence[source] value=\""+@model_sentence.source.to_s+"\" >"
    if @model_sentence.source == nil or @model_sentence.source == ''
      @model_sentence.source = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :source, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[source]'}) +"<br>"
    resultstr << "<b>Spelling: </b>"
    resultstr << "<input type=hidden name=model_sentence[spelling] id=model_sentence[spelling] value=\""+@model_sentence.spelling.to_s+"\" >"
    if @model_sentence.spelling == nil or @model_sentence.spelling == ''
      @model_sentence.spelling = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[spelling]'}) +"<br>"
    # resultstr << in_place_form_editor_field( :model_sentence, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[major_dialect_family]'}) +"<br>"
    # resultstr << "<b>Specific dialect: </b>"
    # resultstr << "<input type=hidden name=model_sentence[specific_dialect] id=model_sentence[specific_dialect] value=\""+@model_sentence.specific_dialect.to_s+"\" >"
    # if @model_sentence.specific_dialect == nil or @model_sentence.specific_dialect == ''
    #   @model_sentence.specific_dialect = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :model_sentence, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[specific_dialect]'}) +"<br>"
    resultstr << "<b>Literary genre: </b>"
    resultstr << "<input type=hidden name=model_sentence[literary_genre] id=model_sentence[literary_genre"+@model_sentence.id.to_s+"] value=\""+@model_sentence.literary_genre.to_s+"\" >"
    if @model_sentence.literary_genre_type == nil
      title = 'Click to modify'
    else
      title = @model_sentence.literary_genre_type.title
    end
    resultstr << "<span id=\"model_sentence[literary_genre_type#{@model_sentence.id}]_selector\">"
    resultstr << '['+@model_sentence.literary_genre+']' if @model_sentence.literary_genre != nil
    resultstr << link_to_remote( title,{:update => "model_sentence[literary_genre_type#{@model_sentence.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'model_sentences', :action => 'display_category_selector', :id => @model_sentence.id, :params => {'data_id' => 119, 'model_name' => 'model_sentence', 'function_name' => "literary_genre_type", :update_id => "model_sentence[literary_genre_type#{@model_sentence.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('model_sentence[literary_genre_type"+@model_sentence.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('model_sentence[literary_genre_type"+@model_sentence.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('model_sentence[literary_genre_type"+@model_sentence.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('model_sentence[literary_genre_type"+@model_sentence.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Literary period: </b>"
    resultstr << "<input type=hidden name=model_sentence[literary_period] id=model_sentence[literary_period] value=\""+@model_sentence.literary_period.to_s+"\" >"
    if @model_sentence.literary_period_type == nil
      title = 'Click to modify'
    else
      title = @model_sentence.literary_period_type.title
    end
    resultstr << "<span id=\"model_sentence[literary_period_type#{@model_sentence.id}]_selector\">"
    resultstr << '['+@model_sentence.literary_period+']' if @model_sentence.literary_period != nil
    resultstr << link_to_remote( title,{:update => "model_sentence[literary_period_type#{@model_sentence.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'model_sentences', :action => 'display_category_selector', :id => @model_sentence.id, :params => {'data_id' => 187, 'model_name' => 'model_sentence', 'function_name' => "literary_period_type", :update_id => "model_sentence[literary_period_type#{@model_sentence.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('model_sentence[literary_period_type"+@model_sentence.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('model_sentence[literary_period_type"+@model_sentence.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('model_sentence[literary_period_type"+@model_sentence.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('model_sentence[literary_period_type"+@model_sentence.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Literary form: </b>"
    if @model_sentence.literary_form_type == nil
      title = 'Click to modify'
    else
      title = @model_sentence.literary_form_type.title
    end
    resultstr << "<span id=\"model_sentence[literary_form_type#{@model_sentence.id}]_selector\">"
    resultstr << '['+@model_sentence.literary_form+']' if @model_sentence.literary_form != nil
    resultstr << link_to_remote( title,{:update => "model_sentence[literary_form_type#{@model_sentence.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'model_sentences', :action => 'display_category_selector', :id => @model_sentence.id, :params => {'data_id' => 186, 'model_name' => 'model_sentence', 'function_name' => "literary_form_type", :update_id => "model_sentence[literary_form_type#{@model_sentence.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('model_sentence[literary_form_type"+@model_sentence.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('model_sentence[literary_form_type"+@model_sentence.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('model_sentence[literary_form_type"+@model_sentence.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('model_sentence[literary_form_type"+@model_sentence.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=model_sentence[analytical_note] id=model_sentence[analytical_note] value=\""+@model_sentence.analytical_note.to_s+"\" >"
    if @model_sentence.analytical_note == nil or @model_sentence.analytical_note == ''
      @model_sentence.analytical_note = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[analytical_note]'}) +"<br>"
  
		resultstr <<	"<span id=\"show_av_model_sentence"+@model_sentence.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_model_sentence"+@model_sentence.id.to_s+"');Element.show('hide_av_model_sentence"+@model_sentence.id.to_s+"');Element.show('av_model_sentence_"+@model_sentence.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_model_sentence"+@model_sentence.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_model_sentence"+@model_sentence.id.to_s+"');Element.show('show_av_model_sentence"+@model_sentence.id.to_s+"');Element.hide('av_model_sentence_"+@model_sentence.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_model_sentence_"+@model_sentence.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    
    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=model_sentence[image] id=model_sentence[image] value=\""+@model_sentence.image.to_s+"\" >"
    if @model_sentence.image == nil or @model_sentence.image == ''
      @model_sentence.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=model_sentence[image_caption] id=model_sentence[image_caption] value=\""+@model_sentence.image_caption.to_s+"\" >"
    if @model_sentence.image_caption == nil or @model_sentence.image_caption == ''
      @model_sentence.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=model_sentence[image_photographer] id=model_sentence[image_photographer] value=\""+@model_sentence.image_photographer.to_s+"\" >"
    if @model_sentence.image_photographer == nil or @model_sentence.image_photographer == ''
      @model_sentence.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=model_sentence[image_link] id=model_sentence[image_link] value=\""+@model_sentence.image_link.to_s+"\" >"
    if @model_sentence.image_link == nil or @model_sentence.image_link == ''
      @model_sentence.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=model_sentence[image_description] id=model_sentence[image_description] value=\""+@model_sentence.image_description.to_s+"\" >"
    if @model_sentence.image_description == nil or @model_sentence.image_description == ''
      @model_sentence.image_description = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :image_description, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[image_description]'}) +"<br>"
    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio] id=model_sentence[audio] value=\""+@model_sentence.audio.to_s+"\" >"
    if @model_sentence.audio == nil or @model_sentence.audio == ''
      @model_sentence.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio_id_number] id=model_sentence[audio_id_number] value=\""+@model_sentence.audio_id_number.to_s+"\" >"
    if @model_sentence.audio_id_number == nil or @model_sentence.audio_id_number == ''
      @model_sentence.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio_speaker] id=model_sentence[audio_speaker] value=\""+@model_sentence.audio_speaker.to_s+"\" >"
    if @model_sentence.audio_speaker == nil or @model_sentence.audio_speaker == ''
      @model_sentence.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio_date] id=model_sentence[audio_date] value=\""+@model_sentence.audio_date.to_s+"\" >"
    if @model_sentence.audio_date == nil or @model_sentence.audio_date == ''
      @model_sentence.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio_place_of_recording] id=model_sentence[audio_place_of_recording] value=\""+@model_sentence.audio_place_of_recording.to_s+"\" >"
    if @model_sentence.audio_place_of_recording == nil or @model_sentence.audio_place_of_recording == ''
      @model_sentence.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio_link] id=model_sentence[audio_link] value=\""+@model_sentence.audio_link.to_s+"\" >"
    if @model_sentence.audio_link == nil or @model_sentence.audio_link == ''
      @model_sentence.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=model_sentence[audio_description] id=model_sentence[audio_description] value=\""+@model_sentence.audio_description.to_s+"\" >"
    if @model_sentence.audio_description == nil or @model_sentence.audio_description == ''
      @model_sentence.audio_description = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[audio_description]'}) +"<br>"
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=model_sentence[video] id=model_sentence[video] value=\""+@model_sentence.video.to_s+"\" >"
    if @model_sentence.video == nil or @model_sentence.video == ''
      @model_sentence.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=model_sentence[video_id_number] id=model_sentence[video_id_number] value=\""+@model_sentence.video_id_number.to_s+"\" >"
    if @model_sentence.video_id_number == nil or @model_sentence.video_id_number == ''
      @model_sentence.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=model_sentence[video_speaker] id=model_sentence[video_speaker] value=\""+@model_sentence.video_speaker.to_s+"\" >"
    if @model_sentence.video_speaker == nil or @model_sentence.video_speaker == ''
      @model_sentence.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=model_sentence[video_date] id=model_sentence[video_date] value=\""+@model_sentence.video_date.to_s+"\" >"
    if @model_sentence.video_date == nil or @model_sentence.video_date == ''
      @model_sentence.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=model_sentence[video_place_of_recording] id=model_sentence[video_place_of_recording] value=\""+@model_sentence.video_place_of_recording.to_s+"\" >"
    if @model_sentence.video_place_of_recording == nil or @model_sentence.video_place_of_recording == ''
      @model_sentence.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=model_sentence[video_link] id=model_sentence[video_link] value=\""+@model_sentence.video_link.to_s+"\" >"
    if @model_sentence.video_link == nil or @model_sentence.video_link == ''
      @model_sentence.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=model_sentence[video_description] id=model_sentence[video_description] value=\""+@model_sentence.video_description.to_s+"\" >"
    if @model_sentence.video_description == nil or @model_sentence.video_description == ''
      @model_sentence.video_description = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'model_sentence[video_description]'}) +"<br>"
    resultstr << "</dd></dl></span>"
  end

  def show_edit_model_sentence
    resultstr = ""
    resultstr << "<p><b>Model sentence: </b><br>"
    if @model_sentence.model_sentence == nil or @model_sentence.model_sentence == ''
      @model_sentence.model_sentence = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :model_sentence, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Language: </b><br>"
    if @model_sentence.language == nil or @model_sentence.language == ''
      @model_sentence.language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :language, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Sentence type: </b><br>"
    if @model_sentence.sentence_type == nil or @model_sentence.sentence_type == ''
      @model_sentence.sentence_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :sentence_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source: </b><br>"
    if @model_sentence.source == nil or @model_sentence.source == ''
      @model_sentence.source = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :source, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Spelling: </b><br>"
    if @model_sentence.spelling == nil or @model_sentence.spelling == ''
      @model_sentence.spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :spelling, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    if @model_sentence.major_dialect_family == nil or @model_sentence.major_dialect_family == ''
      @model_sentence.major_dialect_family = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :major_dialect_family, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    if @model_sentence.specific_dialect == nil or @model_sentence.specific_dialect == ''
      @model_sentence.specific_dialect = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :specific_dialect, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary genre: </b><br>"
    if @model_sentence.literary_genre == nil or @model_sentence.literary_genre == ''
      @model_sentence.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :literary_genre, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary period: </b><br>"
    if @model_sentence.literary_period == nil or @model_sentence.literary_period == ''
      @model_sentence.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :literary_period, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary form: </b><br>"
    if @model_sentence.literary_form == nil or @model_sentence.literary_form == ''
      @model_sentence.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :literary_form, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @model_sentence.image == nil or @model_sentence.image == ''
      @model_sentence.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @model_sentence.image_caption == nil or @model_sentence.image_caption == ''
      @model_sentence.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :image_caption, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @model_sentence.image_photographer == nil or @model_sentence.image_photographer == ''
      @model_sentence.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @model_sentence.image_link == nil or @model_sentence.image_link == ''
      @model_sentence.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @model_sentence.image_description == nil or @model_sentence.image_description == ''
      @model_sentence.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :image_description, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @model_sentence.audio == nil or @model_sentence.audio == ''
      @model_sentence.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @model_sentence.audio_id_number == nil or @model_sentence.audio_id_number == ''
      @model_sentence.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @model_sentence.audio_speaker == nil or @model_sentence.audio_speaker == ''
      @model_sentence.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @model_sentence.audio_date == nil or @model_sentence.audio_date == ''
      @model_sentence.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @model_sentence.audio_place_of_recording == nil or @model_sentence.audio_place_of_recording == ''
      @model_sentence.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @model_sentence.audio_link == nil or @model_sentence.audio_link == ''
      @model_sentence.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @model_sentence.video == nil or @model_sentence.video == ''
      @model_sentence.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @model_sentence.video_id_number == nil or @model_sentence.video_id_number == ''
      @model_sentence.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @model_sentence.video_speaker == nil or @model_sentence.video_speaker == ''
      @model_sentence.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @model_sentence.video_date == nil or @model_sentence.video_date == ''
      @model_sentence.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @model_sentence.video_place_of_recording == nil or @model_sentence.video_place_of_recording == ''
      @model_sentence.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @model_sentence.video_link == nil or @model_sentence.video_link == ''
      @model_sentence.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @model_sentence.analytical_note == nil or @model_sentence.analytical_note == ''
      @model_sentence.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_model_sentence
    resultstr = ""
    resultstr << "<tr><td><b>Model sentence: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[model_sentence] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[language] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Sentence type: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[sentence_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[source] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Spelling: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[spelling] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tibetan Dialect: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[major_dialect_family] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
