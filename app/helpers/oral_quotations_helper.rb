module OralQuotationsHelper
  def show_oral_quotation
    resultstr = ""
    resultstr << "<p><b>Source: </b>"
    if @oral_quotation.source != nil 
      resultstr << @oral_quotation.source
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source title: </b>"
    if @oral_quotation.source_title != nil 
      resultstr << @oral_quotation.source_title
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speaker: </b>"
    if @oral_quotation.source_speaker != nil 
      resultstr << @oral_quotation.source_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speaker dialect: </b>"
    if @oral_quotation.source_speaker_dialect != nil 
      resultstr << @oral_quotation.source_speaker_dialect
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speech type: </b>"
    if @oral_quotation.source_speech_type != nil 
      resultstr << @oral_quotation.source_speech_type
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source location within title: </b>"
    if @oral_quotation.source_location_within_title != nil 
      resultstr << @oral_quotation.source_location_within_title
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speech context: </b>"
    if @oral_quotation.source_speech_context != nil 
      resultstr << @oral_quotation.source_speech_context
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speech date: </b>"
    if @oral_quotation.source_speech_date != nil 
      resultstr << @oral_quotation.source_speech_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speech date Tibetan: </b>"
    if @oral_quotation.source_speech_date_tibetan != nil 
      resultstr << @oral_quotation.source_speech_date_tibetan
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source speech date Western: </b>"
    if @oral_quotation.source_speech_date_western != nil 
      resultstr << @oral_quotation.source_speech_date_western
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source location of speech: </b>"
    if @oral_quotation.source_location_of_speech != nil 
      resultstr << @oral_quotation.source_location_of_speech
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source type: </b>"
    if @oral_quotation.source_type != nil 
      resultstr << @oral_quotation.source_type
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Transcript in tibetan: </b>"
    resultstr << "<br>"
    if @oral_quotation.transcript_in_tibetan != nil 
      resultstr << @oral_quotation.transcript_in_tibetan
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Translation of transcript: </b>"
    resultstr << "<br>"
    if @oral_quotation.translation_of_transcript != nil 
      resultstr << @oral_quotation.translation_of_transcript
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @oral_quotation.image != nil 
      resultstr << @oral_quotation.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    if @oral_quotation.image_caption != nil 
      resultstr << @oral_quotation.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @oral_quotation.image_photographer != nil 
      resultstr << @oral_quotation.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @oral_quotation.image_link != nil 
      resultstr << @oral_quotation.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    if @oral_quotation.image_description != nil 
      resultstr << @oral_quotation.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @oral_quotation.audio != nil 
      resultstr << @oral_quotation.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @oral_quotation.audio_id_number != nil 
      resultstr << @oral_quotation.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @oral_quotation.audio_speaker != nil 
      resultstr << @oral_quotation.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @oral_quotation.audio_date != nil 
      resultstr << @oral_quotation.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @oral_quotation.audio_place_of_recording != nil 
      resultstr << @oral_quotation.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @oral_quotation.audio_link != nil 
      resultstr << @oral_quotation.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<br>"
    if @oral_quotation.audio_description != nil 
      resultstr << @oral_quotation.audio_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @oral_quotation.video != nil 
      resultstr << @oral_quotation.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @oral_quotation.video_id_number != nil 
      resultstr << @oral_quotation.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @oral_quotation.video_speaker != nil 
      resultstr << @oral_quotation.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @oral_quotation.video_date != nil 
      resultstr << @oral_quotation.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @oral_quotation.video_place_of_recording != nil 
      resultstr << @oral_quotation.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @oral_quotation.video_link != nil 
      resultstr << @oral_quotation.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<br>"
    if @oral_quotation.video_description != nil 
      resultstr << @oral_quotation.video_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @oral_quotation.analytical_note != nil 
      resultstr << @oral_quotation.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_oral_quotation
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('source', { :align => "left" })
    resultstr << sort_header_tag('source_title', { :align => "left" })
    resultstr << sort_header_tag('source_speaker', { :align => "left" })
    resultstr << sort_header_tag('source_speaker_dialect', { :align => "left" })
    resultstr << sort_header_tag('source_speech_type', { :align => "left" })
    resultstr << sort_header_tag('source_location_within_title', { :align => "left" })
    resultstr << sort_header_tag('source_speech_context', { :align => "left" })
    resultstr << sort_header_tag('source_speech_date', { :align => "left" })
    resultstr << sort_header_tag('source_speech_date_tibetan', { :align => "left" })
    resultstr << sort_header_tag('source_speech_date_western', { :align => "left" })
    resultstr << sort_header_tag('source_location_of_speech', { :align => "left" })
    resultstr << sort_header_tag('source_type', { :align => "left" })
    resultstr << sort_header_tag('transcript_in_tibetan', { :align => "left" })
    resultstr << sort_header_tag('translation_of_transcript', { :align => "left" })
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
    for oral_quotation in @oral_quotations
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source.to_s unless oral_quotation.source == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_title.to_s unless oral_quotation.source_title == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speaker.to_s unless oral_quotation.source_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speaker_dialect.to_s unless oral_quotation.source_speaker_dialect == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speech_type.to_s unless oral_quotation.source_speech_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_location_within_title.to_s unless oral_quotation.source_location_within_title == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speech_context.to_s unless oral_quotation.source_speech_context == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speech_date.to_s unless oral_quotation.source_speech_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speech_date_tibetan.to_s unless oral_quotation.source_speech_date_tibetan == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_speech_date_western.to_s unless oral_quotation.source_speech_date_western == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_location_of_speech.to_s unless oral_quotation.source_location_of_speech == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.source_type.to_s unless oral_quotation.source_type == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.transcript_in_tibetan.to_s unless oral_quotation.transcript_in_tibetan == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.translation_of_transcript.to_s unless oral_quotation.translation_of_transcript == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.image.to_s unless oral_quotation.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.image_caption.to_s unless oral_quotation.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.image_photographer.to_s unless oral_quotation.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.image_link.to_s unless oral_quotation.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.image_description.to_s unless oral_quotation.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.audio.to_s unless oral_quotation.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.audio_id_number.to_s unless oral_quotation.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.audio_speaker.to_s unless oral_quotation.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.audio_date.to_s unless oral_quotation.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.audio_place_of_recording.to_s unless oral_quotation.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.audio_link.to_s unless oral_quotation.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.video.to_s unless oral_quotation.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.video_id_number.to_s unless oral_quotation.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.video_speaker.to_s unless oral_quotation.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.video_date.to_s unless oral_quotation.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.video_place_of_recording.to_s unless oral_quotation.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.video_link.to_s unless oral_quotation.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	oral_quotation.analytical_note.to_s unless oral_quotation.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => oral_quotation.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => oral_quotation.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => oral_quotation.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_oral_quotation
    resultstr = ""
    resultstr << "<p><b>Source: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source] type=text value=\""
    resultstr << @oral_quotation.source if @oral_quotation.source != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source title: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_title] type=text value=\""
    resultstr << @oral_quotation.source_title if @oral_quotation.source_title != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speaker: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speaker] type=text value=\""
    resultstr << @oral_quotation.source_speaker if @oral_quotation.source_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speaker dialect: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speaker_dialect] type=text value=\""
    resultstr << @oral_quotation.source_speaker_dialect if @oral_quotation.source_speaker_dialect != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speech type: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speech_type] type=text value=\""
    resultstr << @oral_quotation.source_speech_type if @oral_quotation.source_speech_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source location within title: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_location_within_title] type=text value=\""
    resultstr << @oral_quotation.source_location_within_title if @oral_quotation.source_location_within_title != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speech context: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speech_context] type=text value=\""
    resultstr << @oral_quotation.source_speech_context if @oral_quotation.source_speech_context != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speech date: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speech_date] type=text value=\""
    resultstr << @oral_quotation.source_speech_date if @oral_quotation.source_speech_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speech date Tibetan: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speech_date_tibetan] type=text value=\""
    resultstr << @oral_quotation.source_speech_date_tibetan if @oral_quotation.source_speech_date_tibetan != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source speech date Western: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_speech_date_western] type=text value=\""
    resultstr << @oral_quotation.source_speech_date_western if @oral_quotation.source_speech_date_western != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source location of speech: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_location_of_speech] type=text value=\""
    resultstr << @oral_quotation.source_location_of_speech if @oral_quotation.source_location_of_speech != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Source type: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[source_type] type=text value=\""
    resultstr << @oral_quotation.source_type if @oral_quotation.source_type != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Transcript in tibetan: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[transcript_in_tibetan] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.transcript_in_tibetan if @oral_quotation.transcript_in_tibetan != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Translation of transcript: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[translation_of_transcript] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.translation_of_transcript if @oral_quotation.translation_of_transcript != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[image] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.image if @oral_quotation.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<input size=32 name=oral_quotation[image_caption] type=text value=\""
    resultstr << @oral_quotation.image_caption if @oral_quotation.image_caption != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[image_photographer] type=text value=\""
    resultstr << @oral_quotation.image_photographer if @oral_quotation.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[image_link] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.image_link if @oral_quotation.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<input size=32 name=oral_quotation[image_description] type=text value=\""
    resultstr << @oral_quotation.image_description if @oral_quotation.image_description != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[audio] type=text value=\""
    resultstr << @oral_quotation.audio if @oral_quotation.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[audio_id_number] type=text value=\""
    resultstr << @oral_quotation.audio_id_number if @oral_quotation.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[audio_speaker] type=text value=\""
    resultstr << @oral_quotation.audio_speaker if @oral_quotation.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[audio_date] type=text value=\""
    resultstr << @oral_quotation.audio_date if @oral_quotation.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[audio_place_of_recording] type=text value=\""
    resultstr << @oral_quotation.audio_place_of_recording if @oral_quotation.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[audio_link] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.audio_link if @oral_quotation.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[video] type=text value=\""
    resultstr << @oral_quotation.video if @oral_quotation.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[video_id_number] type=text value=\""
    resultstr << @oral_quotation.video_id_number if @oral_quotation.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[video_speaker] type=text value=\""
    resultstr << @oral_quotation.video_speaker if @oral_quotation.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[video_date] type=text value=\""
    resultstr << @oral_quotation.video_date if @oral_quotation.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=oral_quotation[video_place_of_recording] type=text value=\""
    resultstr << @oral_quotation.video_place_of_recording if @oral_quotation.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[video_link] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.video_link if @oral_quotation.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=oral_quotation[analytical_note] rows=3 wrap=virtual >"
    resultstr << @oral_quotation.analytical_note if @oral_quotation.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_oral_quotation
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    resultstr << "<input type=hidden name=oral_quotation[source] id=oral_quotation[source] value=\""+@oral_quotation.source.to_s+"\" >"
    if @oral_quotation.source == nil or @oral_quotation.source == ''
      @oral_quotation.source = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :source, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source]'}) +"<br>"
    resultstr << "<b>Source title: </b>"
    resultstr << @oral_quotation.source_title if @oral_quotation.source_title != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_title] id=oral_quotation[source_title] value=\""+@oral_quotation.source_title.to_s+"\" >"
    # if @oral_quotation.source_title == nil or @oral_quotation.source_title == ''
    #   @oral_quotation.source_title = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_title, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_title]'}) +"<br>"
    resultstr << "<b>Source type: </b>"
    resultstr << @oral_quotation.source_type if @oral_quotation.source_type != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_type] id=oral_quotation[source_type] value=\""+@oral_quotation.source_type.to_s+"\" >"
    # if @oral_quotation.source_type == nil or @oral_quotation.source_type == ''
    #   @oral_quotation.source_type = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_type, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_type]'}) +"<br>"
    resultstr << "<b>Source speaker: </b>"
    resultstr << "<input type=hidden name=oral_quotation[source_speaker] id=oral_quotation[source_speaker] value=\""+@oral_quotation.source_speaker.to_s+"\" >"
    if @oral_quotation.source_speaker == nil or @oral_quotation.source_speaker == ''
      @oral_quotation.source_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :source_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speaker]'}) +"<br>"
    resultstr << "<b>Source speaker Tibetan dialect: </b>"
    resultstr << "<input type=hidden name=oral_quotation[source_speaker_dialect] id=oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"] value=\""+@oral_quotation.source_speaker_dialect.to_s+"\" >"
    if @oral_quotation.source_speaker_dialect_type == nil
      title = 'Click to modify'
    else
      title = @oral_quotation.source_speaker_dialect_type.title
    end
    resultstr << "<span id=\"oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector\">"
    resultstr << '['+@oral_quotation.source_speaker_dialect+']' if @oral_quotation.source_speaker_dialect != nil
    resultstr << link_to_remote( title,{:update => "oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'oral_quotations', :action => 'display_category_selector', :id => @oral_quotation.id, :params => {'data_id' => 638, 'model_name' => 'oral_quotation', 'function_name' => "source_speaker_dialect_type", :update_id => "oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    # if @oral_quotation.source_speaker_dialect == nil or @oral_quotation.source_speaker_dialect == ''
    #   @oral_quotation.source_speaker_dialect = 'Click to modify'
    # end
    # 
    # resultstr <<  "<span id=oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@oral_quotation.id.to_s+";show_menu(oral_quotation_dialect_menu,getCoord(arguments[0]));>"+@oral_quotation.source_speaker_dialect+"</span><br>"
    # resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value', 'mouseover', function(e){ e=document.getElementById('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value');e.style.backgroundColor='#FFFF99'; });Event.observe('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value', 'mouseout', function(e){ new Effect.Highlight('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speaker_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speaker_dialect]'}) +"<br>"
    resultstr << "<b>Transcript in Tibetan: </b>"
    # resultstr << @oral_quotation.transcript_in_tibetan if @oral_quotation.transcript_in_tibetan != nil
    resultstr << "<br>"
    resultstr << "<input type=hidden name=oral_quotation[transcript_in_tibetan] id=oral_quotation[transcript_in_tibetan] value=\""+@oral_quotation.transcript_in_tibetan.to_s+"\" >"
    if @oral_quotation.transcript_in_tibetan == nil or @oral_quotation.transcript_in_tibetan == ''
      @oral_quotation.transcript_in_tibetan = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :transcript_in_tibetan, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[transcript_in_tibetan]'}) +"<br>"
    # resultstr << "<b>Translation of transcript: </b>"
    # # resultstr << @oral_quotation.translation_of_transcript if @oral_quotation.translation_of_transcript != nil
    # resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[translation_of_transcript] id=oral_quotation[translation_of_transcript] value=\""+@oral_quotation.translation_of_transcript.to_s+"\" >"
    # if @oral_quotation.translation_of_transcript == nil or @oral_quotation.translation_of_transcript == ''
    #   @oral_quotation.translation_of_transcript = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :translation_of_transcript, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[translation_of_transcript]'}) +"<br>"
    resultstr << "<b>Source speech type: </b>"
    resultstr << @oral_quotation.source_speech_type if @oral_quotation.source_speech_type != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_type] id=oral_quotation[source_speech_type] value=\""+@oral_quotation.source_speech_type.to_s+"\" >"
    # if @oral_quotation.source_speech_type == nil or @oral_quotation.source_speech_type == ''
    #   @oral_quotation.source_speech_type = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_type, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_type]'}) +"<br>"
    resultstr << "<b>Source speech context: </b>"
    resultstr << @oral_quotation.source_speech_context if @oral_quotation.source_speech_context != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_context] id=oral_quotation[source_speech_context] value=\""+@oral_quotation.source_speech_context.to_s+"\" >"
    # if @oral_quotation.source_speech_context == nil or @oral_quotation.source_speech_context == ''
    #   @oral_quotation.source_speech_context = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_context, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_context]'}) +"<br>"
    resultstr << "<b>Source location within title: </b>"
    # resultstr << @oral_quotation.source_location_within_title if @oral_quotation.source_location_within_title != nil
    # resultstr << "<br>"
    resultstr << "<input type=hidden name=oral_quotation[source_location_within_title] id=oral_quotation[source_location_within_title] value=\""+@oral_quotation.source_location_within_title.to_s+"\" >"
    if @oral_quotation.source_location_within_title == nil or @oral_quotation.source_location_within_title == ''
      @oral_quotation.source_location_within_title = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :source_location_within_title, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_location_within_title]'}) +"<br>"
    resultstr << "<b>Source speech date: </b>"
    resultstr << @oral_quotation.source_speech_date if @oral_quotation.source_speech_date != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date] id=oral_quotation[source_speech_date] value=\""+@oral_quotation.source_speech_date.to_s+"\" >"
    # if @oral_quotation.source_speech_date == nil or @oral_quotation.source_speech_date == ''
    #   @oral_quotation.source_speech_date = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date]'}) +"<br>"
    resultstr << "<b>Source speech date Tibetan: </b>"
    resultstr << @oral_quotation.source_speech_date_tibetan if @oral_quotation.source_speech_date_tibetan != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date_tibetan] id=oral_quotation[source_speech_date_tibetan] value=\""+@oral_quotation.source_speech_date_tibetan.to_s+"\" >"
    # if @oral_quotation.source_speech_date_tibetan == nil or @oral_quotation.source_speech_date_tibetan == ''
    #   @oral_quotation.source_speech_date_tibetan = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_date_tibetan, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date_tibetan]'}) +"<br>"
    resultstr << "<b>Source speech date Western: </b>"
    resultstr << @oral_quotation.source_speech_date_western if @oral_quotation.source_speech_date_western != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date_western] id=oral_quotation[source_speech_date_western] value=\""+@oral_quotation.source_speech_date_western.to_s+"\" >"
    # if @oral_quotation.source_speech_date_western == nil or @oral_quotation.source_speech_date_western == ''
    #   @oral_quotation.source_speech_date_western = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_date_western, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date_western]'}) +"<br>"
    resultstr << "<b>Source location of speech: </b>"
    resultstr << @oral_quotation.source_location_of_speech if @oral_quotation.source_location_of_speech != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_location_of_speech] id=oral_quotation[source_location_of_speech] value=\""+@oral_quotation.source_location_of_speech.to_s+"\" >"
    # if @oral_quotation.source_location_of_speech == nil or @oral_quotation.source_location_of_speech == ''
    #   @oral_quotation.source_location_of_speech = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_location_of_speech, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_location_of_speech]'}) +"<br>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=oral_quotation[analytical_note] id=oral_quotation[analytical_note] value=\""+@oral_quotation.analytical_note.to_s+"\" >"
    #if @oral_quotation.analytical_note == nil or @oral_quotation.analytical_note == ''
    #  @oral_quotation.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_anotediv" + "'>"
    edit_path = oral_quotation_analytical_note_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.analytical_note == nil or @oral_quotation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @oral_quotation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@oral_quotation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		resultstr <<	"<span id=\"show_av_oral_quotation"+@oral_quotation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('hide_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('av_oral_quotation_"+@oral_quotation.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_oral_quotation"+@oral_quotation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('show_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.hide('av_oral_quotation_"+@oral_quotation.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_oral_quotation_"+@oral_quotation.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image] id=oral_quotation[image] value=\""+@oral_quotation.image.to_s+"\" >"
    if @oral_quotation.image == nil or @oral_quotation.image == ''
      @oral_quotation.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_caption] id=oral_quotation[image_caption] value=\""+@oral_quotation.image_caption.to_s+"\" >"
    if @oral_quotation.image_caption == nil or @oral_quotation.image_caption == ''
      @oral_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_photographer] id=oral_quotation[image_photographer] value=\""+@oral_quotation.image_photographer.to_s+"\" >"
    if @oral_quotation.image_photographer == nil or @oral_quotation.image_photographer == ''
      @oral_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_link] id=oral_quotation[image_link] value=\""+@oral_quotation.image_link.to_s+"\" >"
    if @oral_quotation.image_link == nil or @oral_quotation.image_link == ''
      @oral_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_description] id=oral_quotation[image_description] value=\""+@oral_quotation.image_description.to_s+"\" >"
    #if @oral_quotation.image_description == nil or @oral_quotation.image_description == ''
    #  @oral_quotation.image_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :image_description, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_imagedescdiv" + "'>"
    edit_path = oral_quotation_image_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.image_description == nil or @oral_quotation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @oral_quotation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@oral_quotation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio] id=oral_quotation[audio] value=\""+@oral_quotation.audio.to_s+"\" >"
    if @oral_quotation.audio == nil or @oral_quotation.audio == ''
      @oral_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_id_number] id=oral_quotation[audio_id_number] value=\""+@oral_quotation.audio_id_number.to_s+"\" >"
    if @oral_quotation.audio_id_number == nil or @oral_quotation.audio_id_number == ''
      @oral_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_speaker] id=oral_quotation[audio_speaker] value=\""+@oral_quotation.audio_speaker.to_s+"\" >"
    if @oral_quotation.audio_speaker == nil or @oral_quotation.audio_speaker == ''
      @oral_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_date] id=oral_quotation[audio_date] value=\""+@oral_quotation.audio_date.to_s+"\" >"
    if @oral_quotation.audio_date == nil or @oral_quotation.audio_date == ''
      @oral_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_place_of_recording] id=oral_quotation[audio_place_of_recording] value=\""+@oral_quotation.audio_place_of_recording.to_s+"\" >"
    if @oral_quotation.audio_place_of_recording == nil or @oral_quotation.audio_place_of_recording == ''
      @oral_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_link] id=oral_quotation[audio_link] value=\""+@oral_quotation.audio_link.to_s+"\" >"
    if @oral_quotation.audio_link == nil or @oral_quotation.audio_link == ''
      @oral_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_description] id=oral_quotation[audio_description] value=\""+@oral_quotation.audio_description.to_s+"\" >"
    #if @oral_quotation.audio_description == nil or @oral_quotation.audio_description == ''
    #  @oral_quotation.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_audiodescdiv" + "'>"
    edit_path = oral_quotation_audio_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.audio_description == nil or @oral_quotation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @oral_quotation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@oral_quotation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video] id=oral_quotation[video] value=\""+@oral_quotation.video.to_s+"\" >"
    if @oral_quotation.video == nil or @oral_quotation.video == ''
      @oral_quotation.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_id_number] id=oral_quotation[video_id_number] value=\""+@oral_quotation.video_id_number.to_s+"\" >"
    if @oral_quotation.video_id_number == nil or @oral_quotation.video_id_number == ''
      @oral_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_speaker] id=oral_quotation[video_speaker] value=\""+@oral_quotation.video_speaker.to_s+"\" >"
    if @oral_quotation.video_speaker == nil or @oral_quotation.video_speaker == ''
      @oral_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_date] id=oral_quotation[video_date] value=\""+@oral_quotation.video_date.to_s+"\" >"
    if @oral_quotation.video_date == nil or @oral_quotation.video_date == ''
      @oral_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_place_of_recording] id=oral_quotation[video_place_of_recording] value=\""+@oral_quotation.video_place_of_recording.to_s+"\" >"
    if @oral_quotation.video_place_of_recording == nil or @oral_quotation.video_place_of_recording == ''
      @oral_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_link] id=oral_quotation[video_link] value=\""+@oral_quotation.video_link.to_s+"\" >"
    if @oral_quotation.video_link == nil or @oral_quotation.video_link == ''
      @oral_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_description] id=oral_quotation[video_description] value=\""+@oral_quotation.audio_description.to_s+"\" >"
    #if @oral_quotation.video_description == nil or @oral_quotation.video_description == ''
    #  @oral_quotation.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_videodescdiv" + "'>"
    edit_path = oral_quotation_video_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.video_description == nil or @oral_quotation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @oral_quotation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@oral_quotation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "</dd></dl></span>"
  end

  def edit_dynamic_oral_quotation
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    resultstr << "<input type=hidden name=oral_quotation[source] id=oral_quotation[source] value=\""+@oral_quotation.source.to_s+"\" >"
    if @oral_quotation.source == nil or @oral_quotation.source == ''
      @oral_quotation.source = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :source, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source]'}) +"<br>"
    resultstr << "<b>Source title: </b>"
    resultstr << @oral_quotation.source_title if @oral_quotation.source_title != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_title] id=oral_quotation[source_title] value=\""+@oral_quotation.source_title.to_s+"\" >"
    # if @oral_quotation.source_title == nil or @oral_quotation.source_title == ''
    #   @oral_quotation.source_title = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_title, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_title]'}) +"<br>"
    resultstr << "<b>Source type: </b>"
    resultstr << @oral_quotation.source_type if @oral_quotation.source_type != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_type] id=oral_quotation[source_type] value=\""+@oral_quotation.source_type.to_s+"\" >"
    # if @oral_quotation.source_type == nil or @oral_quotation.source_type == ''
    #   @oral_quotation.source_type = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_type, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_type]'}) +"<br>"
    resultstr << "<b>Source speaker: </b>"
    resultstr << "<input type=hidden name=oral_quotation[source_speaker] id=oral_quotation[source_speaker] value=\""+@oral_quotation.source_speaker.to_s+"\" >"
    if @oral_quotation.source_speaker == nil or @oral_quotation.source_speaker == ''
      @oral_quotation.source_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :source_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speaker]'}) +"<br>"
    resultstr << "<b>Source speaker Tibetan dialect: </b>"
    resultstr << "<input type=hidden name=oral_quotation[source_speaker_dialect] id=oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"] value=\""+@oral_quotation.source_speaker_dialect.to_s+"\" >"
    if @oral_quotation.source_speaker_dialect_type == nil
      title = 'Click to modify'
    else
      title = @oral_quotation.source_speaker_dialect_type.title
    end
    resultstr << "<span id=\"oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector\">"
    resultstr << '['+@oral_quotation.source_speaker_dialect+']' if @oral_quotation.source_speaker_dialect != nil
    resultstr << link_to_remote( title,{:update => "oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'oral_quotations', :action => 'display_category_selector', :id => @oral_quotation.id, :params => {'data_id' => 638, 'model_name' => 'oral_quotation', 'function_name' => "source_speaker_dialect_type", :update_id => "oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    # if @oral_quotation.source_speaker_dialect == nil or @oral_quotation.source_speaker_dialect == ''
    #   @oral_quotation.source_speaker_dialect = 'Click to modify'
    # end
    # 
    # resultstr <<  "<span id=oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@oral_quotation.id.to_s+";show_menu(oral_quotation_dialect_menu,getCoord(arguments[0]));>"+@oral_quotation.source_speaker_dialect+"</span><br>"
    # resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value', 'mouseover', function(e){ e=document.getElementById('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value');e.style.backgroundColor='#FFFF99'; });Event.observe('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value', 'mouseout', function(e){ new Effect.Highlight('oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"]_value',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speaker_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speaker_dialect]'}) +"<br>"
    resultstr << "<b>Transcript in Tibetan: </b>"
    # resultstr << @oral_quotation.transcript_in_tibetan if @oral_quotation.transcript_in_tibetan != nil
    resultstr << "<br>"
    resultstr << "<input type=hidden name=oral_quotation[transcript_in_tibetan] id=oral_quotation[transcript_in_tibetan] value=\""+@oral_quotation.transcript_in_tibetan.to_s+"\" >"
    if @oral_quotation.transcript_in_tibetan == nil or @oral_quotation.transcript_in_tibetan == ''
      @oral_quotation.transcript_in_tibetan = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :transcript_in_tibetan, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[transcript_in_tibetan]'}) +"<br>"
    # resultstr << "<b>Translation of transcript: </b>"
    # # resultstr << @oral_quotation.translation_of_transcript if @oral_quotation.translation_of_transcript != nil
    # resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[translation_of_transcript] id=oral_quotation[translation_of_transcript] value=\""+@oral_quotation.translation_of_transcript.to_s+"\" >"
    # if @oral_quotation.translation_of_transcript == nil or @oral_quotation.translation_of_transcript == ''
    #   @oral_quotation.translation_of_transcript = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :translation_of_transcript, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[translation_of_transcript]'}) +"<br>"
    resultstr << "<b>Source speech type: </b>"
    resultstr << @oral_quotation.source_speech_type if @oral_quotation.source_speech_type != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_type] id=oral_quotation[source_speech_type] value=\""+@oral_quotation.source_speech_type.to_s+"\" >"
    # if @oral_quotation.source_speech_type == nil or @oral_quotation.source_speech_type == ''
    #   @oral_quotation.source_speech_type = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_type, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_type]'}) +"<br>"
    resultstr << "<b>Source speech context: </b>"
    resultstr << @oral_quotation.source_speech_context if @oral_quotation.source_speech_context != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_context] id=oral_quotation[source_speech_context] value=\""+@oral_quotation.source_speech_context.to_s+"\" >"
    # if @oral_quotation.source_speech_context == nil or @oral_quotation.source_speech_context == ''
    #   @oral_quotation.source_speech_context = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_context, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_context]'}) +"<br>"
    resultstr << "<b>Source location within title: </b>"
    # resultstr << @oral_quotation.source_location_within_title if @oral_quotation.source_location_within_title != nil
    # resultstr << "<br>"
    resultstr << "<input type=hidden name=oral_quotation[source_location_within_title] id=oral_quotation[source_location_within_title] value=\""+@oral_quotation.source_location_within_title.to_s+"\" >"
    if @oral_quotation.source_location_within_title == nil or @oral_quotation.source_location_within_title == ''
      @oral_quotation.source_location_within_title = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :source_location_within_title, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_location_within_title]'}) +"<br>"
    resultstr << "<b>Source speech date: </b>"
    resultstr << @oral_quotation.source_speech_date if @oral_quotation.source_speech_date != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date] id=oral_quotation[source_speech_date] value=\""+@oral_quotation.source_speech_date.to_s+"\" >"
    # if @oral_quotation.source_speech_date == nil or @oral_quotation.source_speech_date == ''
    #   @oral_quotation.source_speech_date = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date]'}) +"<br>"
    resultstr << "<b>Source speech date Tibetan: </b>"
    resultstr << @oral_quotation.source_speech_date_tibetan if @oral_quotation.source_speech_date_tibetan != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date_tibetan] id=oral_quotation[source_speech_date_tibetan] value=\""+@oral_quotation.source_speech_date_tibetan.to_s+"\" >"
    # if @oral_quotation.source_speech_date_tibetan == nil or @oral_quotation.source_speech_date_tibetan == ''
    #   @oral_quotation.source_speech_date_tibetan = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_date_tibetan, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date_tibetan]'}) +"<br>"
    resultstr << "<b>Source speech date Western: </b>"
    resultstr << @oral_quotation.source_speech_date_western if @oral_quotation.source_speech_date_western != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date_western] id=oral_quotation[source_speech_date_western] value=\""+@oral_quotation.source_speech_date_western.to_s+"\" >"
    # if @oral_quotation.source_speech_date_western == nil or @oral_quotation.source_speech_date_western == ''
    #   @oral_quotation.source_speech_date_western = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_speech_date_western, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date_western]'}) +"<br>"
    resultstr << "<b>Source location of speech: </b>"
    resultstr << @oral_quotation.source_location_of_speech if @oral_quotation.source_location_of_speech != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_location_of_speech] id=oral_quotation[source_location_of_speech] value=\""+@oral_quotation.source_location_of_speech.to_s+"\" >"
    # if @oral_quotation.source_location_of_speech == nil or @oral_quotation.source_location_of_speech == ''
    #   @oral_quotation.source_location_of_speech = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :source_location_of_speech, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_location_of_speech]'}) +"<br>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=oral_quotation[analytical_note] id=oral_quotation[analytical_note] value=\""+@oral_quotation.analytical_note.to_s+"\" >"
    #if @oral_quotation.analytical_note == nil or @oral_quotation.analytical_note == ''
    #  @oral_quotation.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_anotediv" + "'>"
    edit_path = oral_quotation_analytical_note_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.analytical_note == nil or @oral_quotation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @oral_quotation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@oral_quotation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		resultstr <<	"<span id=\"show_av_oral_quotation"+@oral_quotation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('hide_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('av_oral_quotation_"+@oral_quotation.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_oral_quotation"+@oral_quotation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('show_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.hide('av_oral_quotation_"+@oral_quotation.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_oral_quotation_"+@oral_quotation.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image] id=oral_quotation[image] value=\""+@oral_quotation.image.to_s+"\" >"
    if @oral_quotation.image == nil or @oral_quotation.image == ''
      @oral_quotation.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_caption] id=oral_quotation[image_caption] value=\""+@oral_quotation.image_caption.to_s+"\" >"
    if @oral_quotation.image_caption == nil or @oral_quotation.image_caption == ''
      @oral_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_photographer] id=oral_quotation[image_photographer] value=\""+@oral_quotation.image_photographer.to_s+"\" >"
    if @oral_quotation.image_photographer == nil or @oral_quotation.image_photographer == ''
      @oral_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_link] id=oral_quotation[image_link] value=\""+@oral_quotation.image_link.to_s+"\" >"
    if @oral_quotation.image_link == nil or @oral_quotation.image_link == ''
      @oral_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=oral_quotation[image_description] id=oral_quotation[image_description] value=\""+@oral_quotation.image_description.to_s+"\" >"
    #if @oral_quotation.image_description == nil or @oral_quotation.image_description == ''
    #  @oral_quotation.image_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :image_description, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_imagedescdiv" + "'>"
    edit_path = oral_quotation_image_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.image_description == nil or @oral_quotation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @oral_quotation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@oral_quotation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio] id=oral_quotation[audio] value=\""+@oral_quotation.audio.to_s+"\" >"
    if @oral_quotation.audio == nil or @oral_quotation.audio == ''
      @oral_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_id_number] id=oral_quotation[audio_id_number] value=\""+@oral_quotation.audio_id_number.to_s+"\" >"
    if @oral_quotation.audio_id_number == nil or @oral_quotation.audio_id_number == ''
      @oral_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_speaker] id=oral_quotation[audio_speaker] value=\""+@oral_quotation.audio_speaker.to_s+"\" >"
    if @oral_quotation.audio_speaker == nil or @oral_quotation.audio_speaker == ''
      @oral_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_date] id=oral_quotation[audio_date] value=\""+@oral_quotation.audio_date.to_s+"\" >"
    if @oral_quotation.audio_date == nil or @oral_quotation.audio_date == ''
      @oral_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_place_of_recording] id=oral_quotation[audio_place_of_recording] value=\""+@oral_quotation.audio_place_of_recording.to_s+"\" >"
    if @oral_quotation.audio_place_of_recording == nil or @oral_quotation.audio_place_of_recording == ''
      @oral_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_link] id=oral_quotation[audio_link] value=\""+@oral_quotation.audio_link.to_s+"\" >"
    if @oral_quotation.audio_link == nil or @oral_quotation.audio_link == ''
      @oral_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=oral_quotation[audio_description] id=oral_quotation[audio_description] value=\""+@oral_quotation.audio_description.to_s+"\" >"
    #if @oral_quotation.audio_description == nil or @oral_quotation.audio_description == ''
    #  @oral_quotation.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_audiodescdiv" + "'>"
    edit_path = oral_quotation_audio_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.audio_description == nil or @oral_quotation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @oral_quotation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@oral_quotation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video] id=oral_quotation[video] value=\""+@oral_quotation.video.to_s+"\" >"
    if @oral_quotation.video == nil or @oral_quotation.video == ''
      @oral_quotation.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_id_number] id=oral_quotation[video_id_number] value=\""+@oral_quotation.video_id_number.to_s+"\" >"
    if @oral_quotation.video_id_number == nil or @oral_quotation.video_id_number == ''
      @oral_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_speaker] id=oral_quotation[video_speaker] value=\""+@oral_quotation.video_speaker.to_s+"\" >"
    if @oral_quotation.video_speaker == nil or @oral_quotation.video_speaker == ''
      @oral_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_date] id=oral_quotation[video_date] value=\""+@oral_quotation.video_date.to_s+"\" >"
    if @oral_quotation.video_date == nil or @oral_quotation.video_date == ''
      @oral_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_place_of_recording] id=oral_quotation[video_place_of_recording] value=\""+@oral_quotation.video_place_of_recording.to_s+"\" >"
    if @oral_quotation.video_place_of_recording == nil or @oral_quotation.video_place_of_recording == ''
      @oral_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_link] id=oral_quotation[video_link] value=\""+@oral_quotation.video_link.to_s+"\" >"
    if @oral_quotation.video_link == nil or @oral_quotation.video_link == ''
      @oral_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :oral_quotation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=oral_quotation[video_description] id=oral_quotation[video_description] value=\""+@oral_quotation.audio_description.to_s+"\" >"
    #if @oral_quotation.video_description == nil or @oral_quotation.video_description == ''
    #  @oral_quotation.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :oral_quotation, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_videodescdiv" + "'>"
    edit_path = oral_quotation_video_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.video_description == nil or @oral_quotation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @oral_quotation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@oral_quotation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "</dd></dl></span>"
  end

  def modal_edit_dynamic_oral_quotation
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[source] id=oral_quotation[source] value=\""+@oral_quotation.source.to_s+"\" >"
    if @oral_quotation.source == nil or @oral_quotation.source == ''
      @oral_quotation.source = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source]'}) +"<br>"
    resultstr << "<b>Source title: </b>"
    #resultstr << @oral_quotation.source_title if @oral_quotation.source_title != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_title] id=oral_quotation[source_title] value=\""+@oral_quotation.source_title.to_s+"\" >"
    if @oral_quotation.source_title == nil or @oral_quotation.source_title == ''
      @oral_quotation.source_title = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_title, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_title]'}) +"<br>"
    resultstr << "<b>Source type: </b>"
    #resultstr << @oral_quotation.source_type if @oral_quotation.source_type != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_type] id=oral_quotation[source_type] value=\""+@oral_quotation.source_type.to_s+"\" >"
    if @oral_quotation.source_type == nil or @oral_quotation.source_type == ''
      @oral_quotation.source_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_type, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_type]'}) +"<br>"
    resultstr << "<b>Source speaker: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[source_speaker] id=oral_quotation[source_speaker] value=\""+@oral_quotation.source_speaker.to_s+"\" >"
    if @oral_quotation.source_speaker == nil or @oral_quotation.source_speaker == ''
      @oral_quotation.source_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speaker]'}) +"<br>"
    resultstr << "<b>Source speaker Tibetan dialect: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[source_speaker_dialect] id=oral_quotation[source_speaker_dialect"+@oral_quotation.id.to_s+"] value=\""+@oral_quotation.source_speaker_dialect.to_s+"\" >"
    #if @oral_quotation.source_speaker_dialect_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @oral_quotation.source_speaker_dialect_type.title
    #end
    #resultstr << "<span id=\"oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector\">"
    #resultstr << '['+@oral_quotation.source_speaker_dialect+']' if @oral_quotation.source_speaker_dialect != nil
    #resultstr << link_to_remote( title,{:update => "oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'oral_quotations', :action => 'display_category_selector', :id => @oral_quotation.id, :params => {'data_id' => 638, 'model_name' => 'oral_quotation', 'function_name' => "source_speaker_dialect_type", :update_id => "oral_quotation[source_speaker_dialect_type#{@oral_quotation.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('oral_quotation[source_speaker_dialect_type"+@oral_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    @data = Category.find(638)
    resultstr << category_selector(@data, :oral_quotation, :source_speaker_dialect_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "<br>"
    
    resultstr << "<b>Transcript in Tibetan: </b>"
    # resultstr << @oral_quotation.transcript_in_tibetan if @oral_quotation.transcript_in_tibetan != nil
    #resultstr << "<br>"
    #resultstr << "<input type=hidden name=oral_quotation[transcript_in_tibetan] id=oral_quotation[transcript_in_tibetan] value=\""+@oral_quotation.transcript_in_tibetan.to_s+"\" >"
    if @oral_quotation.transcript_in_tibetan == nil or @oral_quotation.transcript_in_tibetan == ''
      @oral_quotation.transcript_in_tibetan = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :transcript_in_tibetan, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[transcript_in_tibetan]'}) +"<br>"
    # resultstr << "<b>Translation of transcript: </b>"
    # # resultstr << @oral_quotation.translation_of_transcript if @oral_quotation.translation_of_transcript != nil
    # resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[translation_of_transcript] id=oral_quotation[translation_of_transcript] value=\""+@oral_quotation.translation_of_transcript.to_s+"\" >"
    # if @oral_quotation.translation_of_transcript == nil or @oral_quotation.translation_of_transcript == ''
    #   @oral_quotation.translation_of_transcript = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :oral_quotation, :translation_of_transcript, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[translation_of_transcript]'}) +"<br>"
    resultstr << "<b>Source speech type: </b>"
    #resultstr << @oral_quotation.source_speech_type if @oral_quotation.source_speech_type != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_type] id=oral_quotation[source_speech_type] value=\""+@oral_quotation.source_speech_type.to_s+"\" >"
    if @oral_quotation.source_speech_type == nil or @oral_quotation.source_speech_type == ''
      @oral_quotation.source_speech_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_type, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_type]'}) +"<br>"
    resultstr << "<b>Source speech context: </b>"
    #resultstr << @oral_quotation.source_speech_context if @oral_quotation.source_speech_context != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_context] id=oral_quotation[source_speech_context] value=\""+@oral_quotation.source_speech_context.to_s+"\" >"
    if @oral_quotation.source_speech_context == nil or @oral_quotation.source_speech_context == ''
      @oral_quotation.source_speech_context = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_context, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_context]'}) +"<br>"
    resultstr << "<b>Source location within title: </b>"
    # resultstr << @oral_quotation.source_location_within_title if @oral_quotation.source_location_within_title != nil
    # resultstr << "<br>"
    #resultstr << "<input type=hidden name=oral_quotation[source_location_within_title] id=oral_quotation[source_location_within_title] value=\""+@oral_quotation.source_location_within_title.to_s+"\" >"
    if @oral_quotation.source_location_within_title == nil or @oral_quotation.source_location_within_title == ''
      @oral_quotation.source_location_within_title = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_location_within_title, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_location_within_title]'}) +"<br>"
    resultstr << "<b>Source speech date: </b>"
    resultstr << @oral_quotation.source_speech_date if @oral_quotation.source_speech_date != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date] id=oral_quotation[source_speech_date] value=\""+@oral_quotation.source_speech_date.to_s+"\" >"
    if @oral_quotation.source_speech_date == nil or @oral_quotation.source_speech_date == ''
      @oral_quotation.source_speech_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date]'}) +"<br>"
    resultstr << "<b>Source speech date Tibetan: </b>"
    resultstr << @oral_quotation.source_speech_date_tibetan if @oral_quotation.source_speech_date_tibetan != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date_tibetan] id=oral_quotation[source_speech_date_tibetan] value=\""+@oral_quotation.source_speech_date_tibetan.to_s+"\" >"
    if @oral_quotation.source_speech_date_tibetan == nil or @oral_quotation.source_speech_date_tibetan == ''
      @oral_quotation.source_speech_date_tibetan = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_date_tibetan, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date_tibetan]'}) +"<br>"
    resultstr << "<b>Source speech date Western: </b>"
    resultstr << @oral_quotation.source_speech_date_western if @oral_quotation.source_speech_date_western != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_speech_date_western] id=oral_quotation[source_speech_date_western] value=\""+@oral_quotation.source_speech_date_western.to_s+"\" >"
    if @oral_quotation.source_speech_date_western == nil or @oral_quotation.source_speech_date_western == ''
      @oral_quotation.source_speech_date_western = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_date_western, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_speech_date_western]'}) +"<br>"
    resultstr << "<b>Source location of speech: </b>"
    resultstr << @oral_quotation.source_location_of_speech if @oral_quotation.source_location_of_speech != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=oral_quotation[source_location_of_speech] id=oral_quotation[source_location_of_speech] value=\""+@oral_quotation.source_location_of_speech.to_s+"\" >"
    if @oral_quotation.source_location_of_speech == nil or @oral_quotation.source_location_of_speech == ''
      @oral_quotation.source_location_of_speech = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_location_of_speech, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[source_location_of_speech]'}) +"<br>"
    resultstr << "<b>Analytical note: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[analytical_note] id=oral_quotation[analytical_note] value=\""+@oral_quotation.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_anotediv" + "'>"
    edit_path = oral_quotation_analytical_note_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.analytical_note == nil or @oral_quotation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @oral_quotation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@oral_quotation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		#resultstr <<	"<span id=\"show_av_oral_quotation"+@oral_quotation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('hide_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('av_oral_quotation_"+@oral_quotation.id.to_s+"');", :title => 'Show')+"</span>"
		#resultstr <<	"<span id=\"hide_av_oral_quotation"+@oral_quotation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.show('show_av_oral_quotation"+@oral_quotation.id.to_s+"');Element.hide('av_oral_quotation_"+@oral_quotation.id.to_s+"');", :title => 'Hide')+"</span>"
    #resultstr << "<span id=\"av_oral_quotation_"+@oral_quotation.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<b>Edit Multimedia Data: </b>"
    resultstr << "<input type='button' name='toggleh1' value='show/hide multimedia' id='toggleh1'><br>"
    resultstr << "<div class='showhide'>"

    resultstr << "<b>Image: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[image] id=oral_quotation[image] value=\""+@oral_quotation.image.to_s+"\" >"
    if @oral_quotation.image == nil or @oral_quotation.image == ''
      @oral_quotation.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[image_caption] id=oral_quotation[image_caption] value=\""+@oral_quotation.image_caption.to_s+"\" >"
    if @oral_quotation.image_caption == nil or @oral_quotation.image_caption == ''
      @oral_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[image_photographer] id=oral_quotation[image_photographer] value=\""+@oral_quotation.image_photographer.to_s+"\" >"
    if @oral_quotation.image_photographer == nil or @oral_quotation.image_photographer == ''
      @oral_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[image_link] id=oral_quotation[image_link] value=\""+@oral_quotation.image_link.to_s+"\" >"
    if @oral_quotation.image_link == nil or @oral_quotation.image_link == ''
      @oral_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[image_description] id=oral_quotation[image_description] value=\""+@oral_quotation.image_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_imagedescdiv" + "'>"
    edit_path = oral_quotation_image_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.image_description == nil or @oral_quotation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @oral_quotation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@oral_quotation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio] id=oral_quotation[audio] value=\""+@oral_quotation.audio.to_s+"\" >"
    if @oral_quotation.audio == nil or @oral_quotation.audio == ''
      @oral_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio_id_number] id=oral_quotation[audio_id_number] value=\""+@oral_quotation.audio_id_number.to_s+"\" >"
    if @oral_quotation.audio_id_number == nil or @oral_quotation.audio_id_number == ''
      @oral_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio_speaker] id=oral_quotation[audio_speaker] value=\""+@oral_quotation.audio_speaker.to_s+"\" >"
    if @oral_quotation.audio_speaker == nil or @oral_quotation.audio_speaker == ''
      @oral_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio_date] id=oral_quotation[audio_date] value=\""+@oral_quotation.audio_date.to_s+"\" >"
    if @oral_quotation.audio_date == nil or @oral_quotation.audio_date == ''
      @oral_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio_place_of_recording] id=oral_quotation[audio_place_of_recording] value=\""+@oral_quotation.audio_place_of_recording.to_s+"\" >"
    if @oral_quotation.audio_place_of_recording == nil or @oral_quotation.audio_place_of_recording == ''
      @oral_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio_link] id=oral_quotation[audio_link] value=\""+@oral_quotation.audio_link.to_s+"\" >"
    if @oral_quotation.audio_link == nil or @oral_quotation.audio_link == ''
      @oral_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[audio_description] id=oral_quotation[audio_description] value=\""+@oral_quotation.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_audiodescdiv" + "'>"
    edit_path = oral_quotation_audio_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.audio_description == nil or @oral_quotation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @oral_quotation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@oral_quotation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Video: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video] id=oral_quotation[video] value=\""+@oral_quotation.video.to_s+"\" >"
    if @oral_quotation.video == nil or @oral_quotation.video == ''
      @oral_quotation.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video_id_number] id=oral_quotation[video_id_number] value=\""+@oral_quotation.video_id_number.to_s+"\" >"
    if @oral_quotation.video_id_number == nil or @oral_quotation.video_id_number == ''
      @oral_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video_speaker] id=oral_quotation[video_speaker] value=\""+@oral_quotation.video_speaker.to_s+"\" >"
    if @oral_quotation.video_speaker == nil or @oral_quotation.video_speaker == ''
      @oral_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video_date] id=oral_quotation[video_date] value=\""+@oral_quotation.video_date.to_s+"\" >"
    if @oral_quotation.video_date == nil or @oral_quotation.video_date == ''
      @oral_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video_place_of_recording] id=oral_quotation[video_place_of_recording] value=\""+@oral_quotation.video_place_of_recording.to_s+"\" >"
    if @oral_quotation.video_place_of_recording == nil or @oral_quotation.video_place_of_recording == ''
      @oral_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'oral_quotation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video_link] id=oral_quotation[video_link] value=\""+@oral_quotation.video_link.to_s+"\" >"
    if @oral_quotation.video_link == nil or @oral_quotation.video_link == ''
      @oral_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'oral_quotation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    #resultstr << "<input type=hidden name=oral_quotation[video_description] id=oral_quotation[video_description] value=\""+@oral_quotation.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@oral_quotation.id}_videodescdiv" + "'>"
    edit_path = oral_quotation_video_description_edit_url(:id => @oral_quotation.id)
    if @oral_quotation.video_description == nil or @oral_quotation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @oral_quotation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@oral_quotation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "</div>" #showhide
    #resultstr << "</dd></dl></span>"
  end



  def show_edit_oral_quotation
    resultstr = ""
    resultstr << "<p><b>Source: </b><br>"
    if @oral_quotation.source == nil or @oral_quotation.source == ''
      @oral_quotation.source = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source title: </b><br>"
    if @oral_quotation.source_title == nil or @oral_quotation.source_title == ''
      @oral_quotation.source_title = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_title, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speaker: </b><br>"
    if @oral_quotation.source_speaker == nil or @oral_quotation.source_speaker == ''
      @oral_quotation.source_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speaker dialect: </b><br>"
    if @oral_quotation.source_speaker_dialect == nil or @oral_quotation.source_speaker_dialect == ''
      @oral_quotation.source_speaker_dialect = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speaker_dialect, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speech type: </b><br>"
    if @oral_quotation.source_speech_type == nil or @oral_quotation.source_speech_type == ''
      @oral_quotation.source_speech_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source location within title: </b><br>"
    if @oral_quotation.source_location_within_title == nil or @oral_quotation.source_location_within_title == ''
      @oral_quotation.source_location_within_title = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_location_within_title, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speech context: </b><br>"
    if @oral_quotation.source_speech_context == nil or @oral_quotation.source_speech_context == ''
      @oral_quotation.source_speech_context = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_context, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speech date: </b><br>"
    if @oral_quotation.source_speech_date == nil or @oral_quotation.source_speech_date == ''
      @oral_quotation.source_speech_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speech date Tibetan: </b><br>"
    if @oral_quotation.source_speech_date_tibetan == nil or @oral_quotation.source_speech_date_tibetan == ''
      @oral_quotation.source_speech_date_tibetan = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_date_tibetan, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source speech date Western: </b><br>"
    if @oral_quotation.source_speech_date_western == nil or @oral_quotation.source_speech_date_western == ''
      @oral_quotation.source_speech_date_western = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_speech_date_western, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source location of speech: </b><br>"
    if @oral_quotation.source_location_of_speech == nil or @oral_quotation.source_location_of_speech == ''
      @oral_quotation.source_location_of_speech = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_location_of_speech, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Source type: </b><br>"
    if @oral_quotation.source_type == nil or @oral_quotation.source_type == ''
      @oral_quotation.source_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :source_type, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Transcript in tibetan: </b><br>"
    if @oral_quotation.transcript_in_tibetan == nil or @oral_quotation.transcript_in_tibetan == ''
      @oral_quotation.transcript_in_tibetan = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :transcript_in_tibetan, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Translation of transcript: </b><br>"
    if @oral_quotation.translation_of_transcript == nil or @oral_quotation.translation_of_transcript == ''
      @oral_quotation.translation_of_transcript = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :translation_of_transcript, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @oral_quotation.image == nil or @oral_quotation.image == ''
      @oral_quotation.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @oral_quotation.image_caption == nil or @oral_quotation.image_caption == ''
      @oral_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_caption, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @oral_quotation.image_photographer == nil or @oral_quotation.image_photographer == ''
      @oral_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @oral_quotation.image_link == nil or @oral_quotation.image_link == ''
      @oral_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @oral_quotation.image_description == nil or @oral_quotation.image_description == ''
      @oral_quotation.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :image_description, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @oral_quotation.audio == nil or @oral_quotation.audio == ''
      @oral_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @oral_quotation.audio_id_number == nil or @oral_quotation.audio_id_number == ''
      @oral_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @oral_quotation.audio_speaker == nil or @oral_quotation.audio_speaker == ''
      @oral_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @oral_quotation.audio_date == nil or @oral_quotation.audio_date == ''
      @oral_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @oral_quotation.audio_place_of_recording == nil or @oral_quotation.audio_place_of_recording == ''
      @oral_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @oral_quotation.audio_link == nil or @oral_quotation.audio_link == ''
      @oral_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @oral_quotation.video == nil or @oral_quotation.video == ''
      @oral_quotation.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @oral_quotation.video_id_number == nil or @oral_quotation.video_id_number == ''
      @oral_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @oral_quotation.video_speaker == nil or @oral_quotation.video_speaker == ''
      @oral_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @oral_quotation.video_date == nil or @oral_quotation.video_date == ''
      @oral_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @oral_quotation.video_place_of_recording == nil or @oral_quotation.video_place_of_recording == ''
      @oral_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @oral_quotation.video_link == nil or @oral_quotation.video_link == ''
      @oral_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @oral_quotation.analytical_note == nil or @oral_quotation.analytical_note == ''
      @oral_quotation.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :oral_quotation, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_oral_quotation
    resultstr = ""
    resultstr << "<tr><td><b>Source: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source title: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_title] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speaker: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speaker Tibetan dialect: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speaker_dialect] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speech type: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speech_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source location within title: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_location_within_title] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speech context: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speech_context] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speech date: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speech_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speech date Tibetan: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speech_date_tibetan] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source speech date Western: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_speech_date_western] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source location of speech: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_location_of_speech] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source type: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[source_type] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Transcript in Tibetan: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[transcript_in_tibetan] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Translation of transcript: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[translation_of_transcript] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[Video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=oral_quotation[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
