module LiteraryQuotationsHelper
  def show_literary_quotation
    resultstr = ""
    resultstr << "<p><b>Source: </b>"
    resultstr << "<br>"
    if @literary_quotation.source != nil 
      resultstr << @literary_quotation.source
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Source ID: </b>"
    if @literary_quotation.source_id != nil 
      resultstr << @literary_quotation.source_id
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Title: </b>"
    if @literary_quotation.title != nil 
      resultstr << @literary_quotation.title
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Author: </b>"
    if @literary_quotation.author != nil 
      resultstr << @literary_quotation.author
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Western date: </b>"
    if @literary_quotation.western_date != nil 
      resultstr << @literary_quotation.western_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Western date note: </b>"
    resultstr << "<br>"
    if @literary_quotation.western_date_note != nil 
      resultstr << @literary_quotation.western_date_note
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Tibetan date: </b>"
    if @literary_quotation.tibetan_date != nil 
      resultstr << @literary_quotation.tibetan_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Tibetan date note: </b>"
    resultstr << "<br>"
    if @literary_quotation.tibetan_date_note != nil 
      resultstr << @literary_quotation.tibetan_date_note
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Edition: </b>"
    if @literary_quotation.edition != nil 
      resultstr << @literary_quotation.edition
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary genre: </b>"
    if @literary_quotation.literary_genre != nil 
      resultstr << @literary_quotation.literary_genre
    end 
    resultstr << "</p>"
    resultstr << "<p><b>ISBN: </b>"
    if @literary_quotation.isbn != nil 
      resultstr << @literary_quotation.isbn
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Publisher: </b>"
    if @literary_quotation.publisher != nil 
      resultstr << @literary_quotation.publisher
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Place of publication: </b>"
    if @literary_quotation.place_of_publication != nil 
      resultstr << @literary_quotation.place_of_publication
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Published date: </b>"
    if @literary_quotation.published_date != nil 
      resultstr << @literary_quotation.published_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Volume number: </b>"
    if @literary_quotation.volume_number != nil 
      resultstr << @literary_quotation.volume_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary period: </b>"
    if @literary_quotation.literary_period != nil 
      resultstr << @literary_quotation.literary_period
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary form: </b>"
    if @literary_quotation.literary_form != nil 
      resultstr << @literary_quotation.literary_form
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Passage: </b>"
    if @literary_quotation.passage != nil 
      resultstr << @literary_quotation.passage
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Script: </b>"
    resultstr << "<br>"
    if @literary_quotation.script != nil 
      resultstr << @literary_quotation.script
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Language of translation: </b>"
    if @literary_quotation.language_of_translation != nil 
      resultstr << @literary_quotation.language_of_translation
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Passage pound: </b>"
    if @literary_quotation.passage_pound != nil 
      resultstr << @literary_quotation.passage_pound
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Passage number: </b>"
    if @literary_quotation.passage_number != nil 
      resultstr << @literary_quotation.passage_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Page side: </b>"
    if @literary_quotation.page_side != nil 
      resultstr << @literary_quotation.page_side
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Line number: </b>"
    if @literary_quotation.line_number != nil 
      resultstr << @literary_quotation.line_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Line ID: </b>"
    if @literary_quotation.line_id != nil 
      resultstr << @literary_quotation.line_id
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Url: </b>"
    resultstr << "<br>"
    if @literary_quotation.url != nil 
      resultstr << @literary_quotation.url
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Page image link: </b>"
    resultstr << "<br>"
    if @literary_quotation.page_image_link != nil 
      resultstr << @literary_quotation.page_image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Spelling: </b>"
    resultstr << "<br>"
    if @literary_quotation.spelling != nil 
      resultstr << @literary_quotation.spelling
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @literary_quotation.image != nil 
      resultstr << @literary_quotation.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    if @literary_quotation.image_caption != nil 
      resultstr << @literary_quotation.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @literary_quotation.image_photographer != nil 
      resultstr << @literary_quotation.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @literary_quotation.image_link != nil 
      resultstr << @literary_quotation.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    if @literary_quotation.image_description != nil 
      resultstr << @literary_quotation.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @literary_quotation.audio != nil 
      resultstr << @literary_quotation.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @literary_quotation.audio_id_number != nil 
      resultstr << @literary_quotation.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @literary_quotation.audio_speaker != nil 
      resultstr << @literary_quotation.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @literary_quotation.audio_date != nil 
      resultstr << @literary_quotation.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @literary_quotation.audio_place_of_recording != nil 
      resultstr << @literary_quotation.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @literary_quotation.audio_link != nil 
      resultstr << @literary_quotation.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<br>"
    if @literary_quotation.audio_description != nil 
      resultstr << @literary_quotation.audio_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @literary_quotation.video != nil 
      resultstr << @literary_quotation.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @literary_quotation.video_id_number != nil 
      resultstr << @literary_quotation.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @literary_quotation.video_speaker != nil 
      resultstr << @literary_quotation.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @literary_quotation.video_date != nil 
      resultstr << @literary_quotation.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @literary_quotation.video_place_of_recording != nil 
      resultstr << @literary_quotation.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @literary_quotation.video_link != nil 
      resultstr << @literary_quotation.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<br>"
    if @literary_quotation.video_description != nil 
      resultstr << @literary_quotation.video_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @literary_quotation.analytical_note != nil 
      resultstr << @literary_quotation.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_literary_quotation
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('source', { :align => "left" })
    resultstr << sort_header_tag('source_id', { :align => "left" })
    resultstr << sort_header_tag('title', { :align => "left" })
    resultstr << sort_header_tag('author', { :align => "left" })
    resultstr << sort_header_tag('western_date', { :align => "left" })
    resultstr << sort_header_tag('western_date_note', { :align => "left" })
    resultstr << sort_header_tag('tibetan_date', { :align => "left" })
    resultstr << sort_header_tag('tibetan_date_note', { :align => "left" })
    resultstr << sort_header_tag('edition', { :align => "left" })
    resultstr << sort_header_tag('literary_genre', { :align => "left" })
    resultstr << sort_header_tag('isbn', { :align => "left" })
    resultstr << sort_header_tag('publisher', { :align => "left" })
    resultstr << sort_header_tag('place_of_publication', { :align => "left" })
    resultstr << sort_header_tag('published_date', { :align => "left" })
    resultstr << sort_header_tag('volume_number', { :align => "left" })
    resultstr << sort_header_tag('literary_period', { :align => "left" })
    resultstr << sort_header_tag('literary_form', { :align => "left" })
    resultstr << sort_header_tag('passage', { :align => "left" })
    resultstr << sort_header_tag('script', { :align => "left" })
    resultstr << sort_header_tag('language_of_translation', { :align => "left" })
    resultstr << sort_header_tag('passage_pound', { :align => "left" })
    resultstr << sort_header_tag('passage_number', { :align => "left" })
    resultstr << sort_header_tag('page_side', { :align => "left" })
    resultstr << sort_header_tag('line_number', { :align => "left" })
    resultstr << sort_header_tag('url', { :align => "left" })
    resultstr << sort_header_tag('page_image_link', { :align => "left" })
    resultstr << sort_header_tag('spelling', { :align => "left" })
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
    for literary_quotation in @literary_quotations
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.source.to_s unless literary_quotation.source == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.source_id.to_s unless literary_quotation.source_id == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.title.to_s unless literary_quotation.title == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.author.to_s unless literary_quotation.author == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.western_date.to_s unless literary_quotation.western_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.western_date_note.to_s unless literary_quotation.western_date_note == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.tibetan_date.to_s unless literary_quotation.tibetan_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.tibetan_date_note.to_s unless literary_quotation.tibetan_date_note == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.edition.to_s unless literary_quotation.edition == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.literary_genre.to_s unless literary_quotation.literary_genre == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.isbn.to_s unless literary_quotation.isbn == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.publisher.to_s unless literary_quotation.publisher == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.place_of_publication.to_s unless literary_quotation.place_of_publication == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.published_date.to_s unless literary_quotation.published_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.volume_number.to_s unless literary_quotation.volume_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.literary_period.to_s unless literary_quotation.literary_period == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.literary_form.to_s unless literary_quotation.literary_form == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.passage.to_s unless literary_quotation.passage == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.script.to_s unless literary_quotation.script == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.language_of_translation.to_s unless literary_quotation.language_of_translation == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.passage_pound.to_s unless literary_quotation.passage_pound == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.passage_number.to_s unless literary_quotation.passage_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.page_side.to_s unless literary_quotation.page_side == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.line_number.to_s unless literary_quotation.line_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.url.to_s unless literary_quotation.url == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.page_image_link.to_s unless literary_quotation.page_image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.spelling.to_s unless literary_quotation.spelling == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.image.to_s unless literary_quotation.image == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.image_caption.to_s unless literary_quotation.image_caption == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.image_photographer.to_s unless literary_quotation.image_photographer == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.image_link.to_s unless literary_quotation.image_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.image_description.to_s unless literary_quotation.image_description == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.audio.to_s unless literary_quotation.audio == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.audio_id_number.to_s unless literary_quotation.audio_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.audio_speaker.to_s unless literary_quotation.audio_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.audio_date.to_s unless literary_quotation.audio_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.audio_place_of_recording.to_s unless literary_quotation.audio_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.audio_link.to_s unless literary_quotation.audio_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.video.to_s unless literary_quotation.video == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.video_id_number.to_s unless literary_quotation.video_id_number == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.video_speaker.to_s unless literary_quotation.video_speaker == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.video_date.to_s unless literary_quotation.video_date == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.video_place_of_recording.to_s unless literary_quotation.video_place_of_recording == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.video_link.to_s unless literary_quotation.video_link == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_quotation.analytical_note.to_s unless literary_quotation.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => literary_quotation.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => literary_quotation.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => literary_quotation.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_literary_quotation
    resultstr = ""
    resultstr << "<p><b>Source: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[source] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.source if @literary_quotation.source != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Source ID: </b><br>"
    resultstr << "<input size=32 name=literary_quotation[source_id] type=text value=\""
    resultstr << @literary_quotation.source_id if @literary_quotation.source_id != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Title: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[title] type=text value=\""
    resultstr << @literary_quotation.title if @literary_quotation.title != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Author: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[author] type=text value=\""
    resultstr << @literary_quotation.author if @literary_quotation.author != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Western date: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[western_date] type=text value=\""
    resultstr << @literary_quotation.western_date if @literary_quotation.western_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Western date note: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[western_date_note] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.western_date_note if @literary_quotation.western_date_note != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Tibetan date: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[tibetan_date] type=text value=\""
    resultstr << @literary_quotation.tibetan_date if @literary_quotation.tibetan_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Tibetan date note: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[tibetan_date_note] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.tibetan_date_note if @literary_quotation.tibetan_date_note != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Edition: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[edition] type=text value=\""
    resultstr << @literary_quotation.edition if @literary_quotation.edition != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[literary_genre] type=text value=\""
    resultstr << @literary_quotation.literary_genre if @literary_quotation.literary_genre != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>ISBN: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[isbn] type=text value=\""
    resultstr << @literary_quotation.isbn if @literary_quotation.isbn != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Publisher: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[publisher] type=text value=\""
    resultstr << @literary_quotation.publisher if @literary_quotation.publisher != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Place of publication: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[place_of_publication] type=text value=\""
    resultstr << @literary_quotation.place_of_publication if @literary_quotation.place_of_publication != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Published date: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[published_date] type=text value=\""
    resultstr << @literary_quotation.published_date if @literary_quotation.published_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Volume number: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[volume_number] type=text value=\""
    resultstr << @literary_quotation.volume_number if @literary_quotation.volume_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[literary_period] type=text value=\""
    resultstr << @literary_quotation.literary_period if @literary_quotation.literary_period != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[literary_form] type=text value=\""
    resultstr << @literary_quotation.literary_form if @literary_quotation.literary_form != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Passage: </b><br>"
    resultstr << "<input size=32 name=literary_quotation[passage] type=text value=\""
    resultstr << @literary_quotation.passage if @literary_quotation.passage != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Script: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[script] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.script if @literary_quotation.script != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Language of translation: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[language_of_translation] type=text value=\""
    resultstr << @literary_quotation.language_of_translation if @literary_quotation.language_of_translation != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Passage pound: </b><br>"
    resultstr << "<input size=32 name=literary_quotation[passage_pound] type=text value=\""
    resultstr << @literary_quotation.passage_pound if @literary_quotation.passage_pound != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Passage number: </b><br>"
    resultstr << "<input size=32 name=literary_quotation[passage_number] type=text value=\""
    resultstr << @literary_quotation.passage_number if @literary_quotation.passage_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Page side: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[page_side] type=text value=\""
    resultstr << @literary_quotation.page_side if @literary_quotation.page_side != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Line number: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[line_number] type=text value=\""
    resultstr << @literary_quotation.line_number if @literary_quotation.line_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Url: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[url] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.url if @literary_quotation.url != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Page image link: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[page_image_link] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.page_image_link if @literary_quotation.page_image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Spelling: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[spelling] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.spelling if @literary_quotation.spelling != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[image] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.image if @literary_quotation.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<input size=32 name=literary_quotation[image_caption] type=text value=\""
    resultstr << @literary_quotation.image_caption if @literary_quotation.image_caption != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[image_photographer] type=text value=\""
    resultstr << @literary_quotation.image_photographer if @literary_quotation.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[image_link] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.image_link if @literary_quotation.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<input size=32 name=literary_quotation[image_description] type=text value=\""
    resultstr << @literary_quotation.image_description if @literary_quotation.image_description != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[audio] type=text value=\""
    resultstr << @literary_quotation.audio if @literary_quotation.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[audio_id_number] type=text value=\""
    resultstr << @literary_quotation.audio_id_number if @literary_quotation.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[audio_speaker] type=text value=\""
    resultstr << @literary_quotation.audio_speaker if @literary_quotation.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[audio_date] type=text value=\""
    resultstr << @literary_quotation.audio_date if @literary_quotation.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[audio_place_of_recording] type=text value=\""
    resultstr << @literary_quotation.audio_place_of_recording if @literary_quotation.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[audio_link] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.audio_link if @literary_quotation.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[video] type=text value=\""
    resultstr << @literary_quotation.video if @literary_quotation.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[video_id_number] type=text value=\""
    resultstr << @literary_quotation.video_id_number if @literary_quotation.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[video_speaker] type=text value=\""
    resultstr << @literary_quotation.video_speaker if @literary_quotation.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[video_date] type=text value=\""
    resultstr << @literary_quotation.video_date if @literary_quotation.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=literary_quotation[video_place_of_recording] type=text value=\""
    resultstr << @literary_quotation.video_place_of_recording if @literary_quotation.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[video_link] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.video_link if @literary_quotation.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=literary_quotation[analytical_note] rows=3 wrap=virtual >"
    resultstr << @literary_quotation.analytical_note if @literary_quotation.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_literary_quotation
    resultstr = ""
    # resultstr << "<b>Source: </b>"
    # resultstr << "<input type=hidden name=literary_quotation[source] id=literary_quotation[source] value=\""+@literary_quotation.source.to_s+"\" >"
    # if @literary_quotation.source == nil or @literary_quotation.source == ''
    #   @literary_quotation.source = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :source, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[source]'}) +"<br>"
    resultstr << "<b>Source ID: </b>"
    resultstr << "<input type=hidden name=literary_quotation[source_id] id=literary_quotation[source_id] value=\""+@literary_quotation.source_id.to_s+"\" >"
    if @literary_quotation.source_id == nil or @literary_quotation.source_id == ''
      @literary_quotation.source_id = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :source_id, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[source_id]'}) +"<br>"
    resultstr << "<b>Title: </b>"
    resultstr << @literary_quotation.title if @literary_quotation.title != nil 
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[title] id=literary_quotation[title] value=\""+@literary_quotation.title.to_s+"\" >"
    # if @literary_quotation.title == nil or @literary_quotation.title == ''
    #   @literary_quotation.title = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :title, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[title]'}) +"<br>"
    resultstr << "<b>Author: </b>"
    resultstr << @literary_quotation.author if @literary_quotation.author != nil 
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[author] id=literary_quotation[author] value=\""+@literary_quotation.author.to_s+"\" >"
    # if @literary_quotation.author == nil or @literary_quotation.author == ''
    #   @literary_quotation.author = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :author, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[author]'}) +"<br>"
    resultstr << "<b>Passage: </b>"
    resultstr << "<input type=hidden name=literary_quotation[passage] id=literary_quotation[passage] value=\""+@literary_quotation.passage.to_s+"\" >"
    #if @literary_quotation.passage == nil or @literary_quotation.passage == ''
    #  @literary_quotation.passage = 'Click to modify'
    #end
    #resultstr << '<br>'+in_place_form_editor_field( :literary_quotation, :passage, {}, {:cols => 50, :rows => 3, :fieldname => 'literary_quotation[passage]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_passagediv" + "'>"
    edit_path = literary_quotation_passage_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.passage == nil or @literary_quotation.passage == ''
      t_passage = 'Click to modify'
    else
      t_passage = @literary_quotation.passage     
    end    
    resultstr << link_to_remote(t_passage, :url => edit_path, :update => "#{@literary_quotation.id}_passagediv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Spelling: </b>"
    resultstr << "<input type=hidden name=literary_quotation[spelling] id=literary_quotation[spelling] value=\""+@literary_quotation.spelling.to_s+"\" >"
    if @literary_quotation.spelling == nil or @literary_quotation.spelling == ''
      @literary_quotation.spelling = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :spelling, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[spelling]'}) +"<br>"
    resultstr << "<b>Script: </b>"
    resultstr << "<input type=hidden name=literary_quotation[script] id=literary_quotation[script] value=\""+@literary_quotation.script.to_s+"\" >"
    if @literary_quotation.script_type == nil
      title = 'Click to modify'
    else
      title = @literary_quotation.script_type.title
    end
    resultstr << "<span id=\"literary_quotation[script_type#{@literary_quotation.id}]_selector\">"
    resultstr << '['+@literary_quotation.script+']' if @literary_quotation.script != nil
    resultstr << link_to_remote( title,{:update => "literary_quotation[script_type#{@literary_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'literary_quotations', :action => 'display_category_selector', :id => @literary_quotation.id, :params => {'data_id' => 192, 'model_name' => 'literary_quotation', 'function_name' => "script_type", :update_id => "literary_quotation[script_type#{@literary_quotation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "<script type=\"text/javascript\" language=\"javascript\">Event.observe('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_form_editor_field( :literary_quotation, :script, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[script]'}) +"<br>"
    resultstr << "<b>Literary genre: </b>"
    resultstr << @literary_quotation.literary_genre unless @literary_quotation.literary_genre == nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[literary_genre] id=literary_quotation[literary_genre] value=\""+@literary_quotation.literary_genre.to_s+"\" >"
    # if @literary_quotation.literary_genre == nil or @literary_quotation.literary_genre == ''
    #   @literary_quotation.literary_genre = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :literary_quotation, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'literary_quotation[literary_genre]'})+"<br>"
    # resultstr << in_place_form_editor_field( :literary_quotation, :literary_genre, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[literary_genre]'}) +"<br>"
    resultstr << "<b>Literary period: </b>"
    resultstr << @literary_quotation.literary_period unless @literary_quotation.literary_period == nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[literary_period] id=literary_quotation[literary_period] value=\""+@literary_quotation.literary_period.to_s+"\" >"
    # if @literary_quotation.literary_period == nil or @literary_quotation.literary_period == ''
    #   @literary_quotation.literary_period = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :literary_period, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[literary_period]'}) +"<br>"
    resultstr << "<b>Literary form: </b>"
    resultstr << "<input type=hidden name=literary_quotation[literary_form] id=literary_quotation[literary_form] value=\""+@literary_quotation.literary_form.to_s+"\" >"
    if @literary_quotation.literary_form_type == nil
      title = 'Click to modify'
    else
      title = @literary_quotation.literary_form_type.title
    end
    resultstr << "<span id=\"literary_quotation[literary_form_type#{@literary_quotation.id}]_selector\">"
    resultstr << '['+@literary_quotation.literary_form+']' if @literary_quotation.literary_form != nil
    resultstr << link_to_remote( title,{:update => "literary_quotation[literary_form_type#{@literary_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'literary_quotations', :action => 'display_category_selector', :id => @literary_quotation.id, :params => {'data_id' => 186, 'model_name' => 'literary_quotation', 'function_name' => "literary_form_type", :update_id => "literary_quotation[literary_form_type#{@literary_quotation.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "<script type=\"text/javascript\" language=\"javascript\">Event.observe('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_form_editor_field( :literary_quotation, :literary_form, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[literary_form]'}) +"<br>"
    # resultstr << "<b>Language of translation: </b>"
    # resultstr << "<input type=hidden name=literary_quotation[language_of_translation] id=literary_quotation[language_of_translation] value=\""+@literary_quotation.language_of_translation.to_s+"\" >"
    # if @literary_quotation.language_of_translation == nil or @literary_quotation.language_of_translation == ''
    #   @literary_quotation.language_of_translation = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :literary_quotation, :language_of_translation, {}, {:select_options => @language, :fieldname => 'literary_quotation[language_of_translation]'})+"<br>"
    # resultstr << in_place_form_editor_field( :literary_quotation, :language_of_translation, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[language_of_translation]'}) +"<br>"
    resultstr << "<b>Western date of composition: </b>"
    resultstr << @literary_quotation.western_date if @literary_quotation.western_date != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[western_date] id=literary_quotation[western_date] value=\""+@literary_quotation.western_date.to_s+"\" >"
    # if @literary_quotation.western_date == nil or @literary_quotation.western_date == ''
    #   @literary_quotation.western_date = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :western_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[western_date]'}) +"<br>"
    resultstr << "<b>Western date note: </b>"
    resultstr << @literary_quotation.western_date_note if @literary_quotation.western_date_note != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[western_date_note] id=literary_quotation[western_date_note] value=\""+@literary_quotation.western_date_note.to_s+"\" >"
    # if @literary_quotation.western_date_note == nil or @literary_quotation.western_date_note == ''
    #   @literary_quotation.western_date_note = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :western_date_note, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[western_date_note]'}) +"<br>"
    resultstr << "<b>Tibetan date of composition: </b>"
    resultstr << @literary_quotation.tibetan_date if @literary_quotation.tibetan_date != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[tibetan_date] id=literary_quotation[tibetan_date] value=\""+@literary_quotation.tibetan_date.to_s+"\" >"
    # if @literary_quotation.tibetan_date == nil or @literary_quotation.tibetan_date == ''
    #   @literary_quotation.tibetan_date = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :tibetan_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[tibetan_date]'}) +"<br>"
    resultstr << "<b>Tibetan date note: </b>"
    resultstr << @literary_quotation.tibetan_date_note if @literary_quotation.tibetan_date_note != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[tibetan_date_note] id=literary_quotation[tibetan_date_note] value=\""+@literary_quotation.tibetan_date_note.to_s+"\" >"
    # if @literary_quotation.tibetan_date_note == nil or @literary_quotation.tibetan_date_note == ''
    #   @literary_quotation.tibetan_date_note = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :tibetan_date_note, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[tibetan_date_note]'}) +"<br>"
    resultstr << "<b>Edition: </b>"
    resultstr << @literary_quotation.edition if @literary_quotation.edition != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[edition] id=literary_quotation[edition] value=\""+@literary_quotation.edition.to_s+"\" >"
    # if @literary_quotation.edition == nil or @literary_quotation.edition == ''
    #   @literary_quotation.edition = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :edition, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[edition]'}) +"<br>"
    resultstr << "<b>Publisher: </b>"
    resultstr << @literary_quotation.publisher if @literary_quotation.publisher != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[publisher] id=literary_quotation[publisher] value=\""+@literary_quotation.publisher.to_s+"\" >"
    # if @literary_quotation.publisher == nil or @literary_quotation.publisher == ''
    #   @literary_quotation.publisher = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :publisher, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[publisher]'}) +"<br>"
    resultstr << "<b>Place of publication: </b>"
    resultstr << @literary_quotation.place_of_publication if @literary_quotation.place_of_publication != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[place_of_publication] id=literary_quotation[place_of_publication] value=\""+@literary_quotation.place_of_publication.to_s+"\" >"
    # if @literary_quotation.place_of_publication == nil or @literary_quotation.place_of_publication == ''
    #   @literary_quotation.place_of_publication = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :place_of_publication, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[place_of_publication]'}) +"<br>"
    resultstr << "<b>Date of publication: </b>"
    resultstr << @literary_quotation.published_date if @literary_quotation.published_date != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[published_date] id=literary_quotation[published_date] value=\""+@literary_quotation.published_date.to_s+"\" >"
    # if @literary_quotation.published_date == nil or @literary_quotation.published_date == ''
    #   @literary_quotation.published_date = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :published_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[published_date]'}) +"<br>"
    resultstr << "<b>ISBN: </b>"
    resultstr << @literary_quotation.isbn if @literary_quotation.isbn != nil
    # resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[isbn] id=literary_quotation[isbn] value=\""+@literary_quotation.isbn.to_s+"\" >"
    if @literary_quotation.isbn != nil and @literary_quotation.isbn != ''
      resultstr << @literary_quotation.isbn
    end
    resultstr << "<br>"
    # resultstr << in_place_form_editor_field( :literary_quotation, :isbn, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[isbn]'}) +"<br>"
    resultstr << "<b>Volume number: </b>"
    resultstr << "<input type=hidden name=literary_quotation[volume_number] id=literary_quotation[volume_number] value=\""+@literary_quotation.volume_number.to_s+"\" >"
    if @literary_quotation.volume_number == nil or @literary_quotation.volume_number == ''
      @literary_quotation.volume_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :volume_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[volume_number]'}) +"<br>"
    resultstr << "<b>Passage number: </b>"
    resultstr << "<input type=hidden name=literary_quotation[passage_pound] id=literary_quotation[passage_pound] value=\""+@literary_quotation.passage_pound.to_s+"\" >"
    if @literary_quotation.passage_pound == nil or @literary_quotation.passage_pound == ''
      @literary_quotation.passage_pound = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :passage_pound, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[passage_pound]'}) +"<br>"
    resultstr << "<b>Page number: </b>"
    resultstr << "<input type=hidden name=literary_quotation[passage_number] id=literary_quotation[passage_number] value=\""+@literary_quotation.passage_number.to_s+"\" >"
    if @literary_quotation.passage_number == nil or @literary_quotation.passage_number == ''
      @literary_quotation.passage_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :passage_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[passage_number]'}) +"<br>"
    resultstr << "<b>Page side: </b>"
    resultstr << "<input type=hidden name=literary_quotation[page_side] id=literary_quotation[page_side] value=\""+@literary_quotation.page_side.to_s+"\" >"
    if @literary_quotation.page_side == nil or @literary_quotation.page_side == ''
      @literary_quotation.page_side = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :page_side, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[page_side]'}) +"<br>"
    resultstr << "<b>Line number: </b>"
    resultstr << "<input type=hidden name=literary_quotation[line_number] id=literary_quotation[line_number] value=\""+@literary_quotation.line_number.to_s+"\" >"
    if @literary_quotation.line_number == nil or @literary_quotation.line_number == ''
      @literary_quotation.line_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :line_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[line_number]'}) +"<br>"
    # resultstr << "<b>Line ID: </b>"
    # resultstr << "<input type=hidden name=literary_quotation[line_id] id=literary_quotation[line_id] value=\""+@literary_quotation.line_id.to_s+"\" >"
    # if @literary_quotation.line_id == nil or @literary_quotation.line_id == ''
    #   @literary_quotation.line_id = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :line_id, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[line_id]'}) +"<br>"
    resultstr << "<b>Passage Url: </b>"
    resultstr << "<input type=hidden name=literary_quotation[url] id=literary_quotation[url] value=\""+@literary_quotation.url.to_s+"\" >"
    if @literary_quotation.url == nil or @literary_quotation.url == ''
      @literary_quotation.url = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :url, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[url]'}) +"<br>"
    # resultstr << "<b>Page image link: </b>"
    # resultstr << "<input type=hidden name=literary_quotation[page_image_link] id=literary_quotation[page_image_link] value=\""+@literary_quotation.page_image_link.to_s+"\" >"
    # if @literary_quotation.page_image_link == nil or @literary_quotation.page_image_link == ''
    #   @literary_quotation.page_image_link = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :page_image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[page_image_link]'}) +"<br>"
    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=literary_quotation[analytical_note] id=literary_quotation[analytical_note] value=\""+@literary_quotation.analytical_note.to_s+"\" >"
    #if @literary_quotation.analytical_note == nil or @literary_quotation.analytical_note == ''
    #  @literary_quotation.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :literary_quotation, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_anotediv" + "'>"
    edit_path = literary_quotation_analytical_note_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.analytical_note == nil or @literary_quotation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @literary_quotation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@literary_quotation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		resultstr <<	"<span id=\"show_av_literary_quotation"+@literary_quotation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.show('hide_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.show('av_literary_quotation_"+@literary_quotation.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_literary_quotation"+@literary_quotation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.show('show_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.hide('av_literary_quotation_"+@literary_quotation.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_literary_quotation_"+@literary_quotation.id.to_s+"\" style=\"display:none\"/><dl><dd>"

    resultstr << "<b>Image: </b>"
    resultstr << "<input type=hidden name=literary_quotation[image] id=literary_quotation[image] value=\""+@literary_quotation.image.to_s+"\" >"
    if @literary_quotation.image == nil or @literary_quotation.image == ''
      @literary_quotation.image = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=literary_quotation[image_caption] id=literary_quotation[image_caption] value=\""+@literary_quotation.image_caption.to_s+"\" >"
    if @literary_quotation.image_caption == nil or @literary_quotation.image_caption == ''
      @literary_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=literary_quotation[image_photographer] id=literary_quotation[image_photographer] value=\""+@literary_quotation.image_photographer.to_s+"\" >"
    if @literary_quotation.image_photographer == nil or @literary_quotation.image_photographer == ''
      @literary_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=literary_quotation[image_link] id=literary_quotation[image_link] value=\""+@literary_quotation.image_link.to_s+"\" >"
    if @literary_quotation.image_link == nil or @literary_quotation.image_link == ''
      @literary_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=literary_quotation[image_description] id=literary_quotation[image_description] value=\""+@literary_quotation.image_description.to_s+"\" >"
    #if @literary_quotation.image_description == nil or @literary_quotation.image_description == ''
    #  @literary_quotation.image_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :literary_quotation, :image_description, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_imagedescdiv" + "'>"
    edit_path = literary_quotation_image_description_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.image_description == nil or @literary_quotation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @literary_quotation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@literary_quotation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio] id=literary_quotation[audio] value=\""+@literary_quotation.audio.to_s+"\" >"
    if @literary_quotation.audio == nil or @literary_quotation.audio == ''
      @literary_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio_id_number] id=literary_quotation[audio_id_number] value=\""+@literary_quotation.audio_id_number.to_s+"\" >"
    if @literary_quotation.audio_id_number == nil or @literary_quotation.audio_id_number == ''
      @literary_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio_speaker] id=literary_quotation[audio_speaker] value=\""+@literary_quotation.audio_speaker.to_s+"\" >"
    if @literary_quotation.audio_speaker == nil or @literary_quotation.audio_speaker == ''
      @literary_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio_date] id=literary_quotation[audio_date] value=\""+@literary_quotation.audio_date.to_s+"\" >"
    if @literary_quotation.audio_date == nil or @literary_quotation.audio_date == ''
      @literary_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio_place_of_recording] id=literary_quotation[audio_place_of_recording] value=\""+@literary_quotation.audio_place_of_recording.to_s+"\" >"
    if @literary_quotation.audio_place_of_recording == nil or @literary_quotation.audio_place_of_recording == ''
      @literary_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio_link] id=literary_quotation[audio_link] value=\""+@literary_quotation.audio_link.to_s+"\" >"
    if @literary_quotation.audio_link == nil or @literary_quotation.audio_link == ''
      @literary_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=literary_quotation[audio_description] id=literary_quotation[audio_description] value=\""+@literary_quotation.audio_description.to_s+"\" >"
    #if @literary_quotation.audio_description == nil or @literary_quotation.audio_description == ''
    #  @literary_quotation.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :literary_quotation, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_audiodescdiv" + "'>"
    edit_path = literary_quotation_audio_description_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.audio_description == nil or @literary_quotation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @literary_quotation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@literary_quotation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video] id=literary_quotation[video] value=\""+@literary_quotation.video.to_s+"\" >"
    if @literary_quotation.video == nil or @literary_quotation.video == ''
      @literary_quotation.video = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video_id_number] id=literary_quotation[video_id_number] value=\""+@literary_quotation.video_id_number.to_s+"\" >"
    if @literary_quotation.video_id_number == nil or @literary_quotation.video_id_number == ''
      @literary_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video_speaker] id=literary_quotation[video_speaker] value=\""+@literary_quotation.video_speaker.to_s+"\" >"
    if @literary_quotation.video_speaker == nil or @literary_quotation.video_speaker == ''
      @literary_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video_date] id=literary_quotation[video_date] value=\""+@literary_quotation.video_date.to_s+"\" >"
    if @literary_quotation.video_date == nil or @literary_quotation.video_date == ''
      @literary_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video_place_of_recording] id=literary_quotation[video_place_of_recording] value=\""+@literary_quotation.video_place_of_recording.to_s+"\" >"
    if @literary_quotation.video_place_of_recording == nil or @literary_quotation.video_place_of_recording == ''
      @literary_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video_link] id=literary_quotation[video_link] value=\""+@literary_quotation.video_link.to_s+"\" >"
    if @literary_quotation.video_link == nil or @literary_quotation.video_link == ''
      @literary_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=literary_quotation[video_description] id=literary_quotation[video_description] value=\""+@literary_quotation.video_description.to_s+"\" >"
    #if @literary_quotation.video_description == nil or @literary_quotation.video_description == ''
    #  @literary_quotation.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :literary_quotation, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_videodescdiv" + "'>"
    edit_path = literary_quotation_video_description_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.video_description == nil or @literary_quotation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @literary_quotation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@literary_quotation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
  
    
    resultstr << "</dd></dl></span>"
  end


  def modal_edit_dynamic_literary_quotation
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[source_id] id=literary_quotation[source_id] value=\""+@literary_quotation.source_id.to_s+"\" >"
    if @literary_quotation.source_id == nil or @literary_quotation.source_id == ''
      @literary_quotation.source_id = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :source_id, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[source_id]'}) +"<br>"
    resultstr << "<b>Title: </b>"
    #resultstr << @literary_quotation.title if @literary_quotation.title != nil 
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[title] id=literary_quotation[title] value=\""+@literary_quotation.title.to_s+"\" >"
     if @literary_quotation.title == nil or @literary_quotation.title == ''
       @literary_quotation.title = 'Click to modify'
     end
    resultstr << in_place_editor_field( :literary_quotation, :title, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[title]'}) +"<br>"
    resultstr << "<b>Author: </b>"
    #resultstr << @literary_quotation.author if @literary_quotation.author != nil 
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[author] id=literary_quotation[author] value=\""+@literary_quotation.author.to_s+"\" >"
    if @literary_quotation.author == nil or @literary_quotation.author == ''
      @literary_quotation.author = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :author, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[author]'}) +"<br>"
    resultstr << "<b>Passage: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[passage] id=literary_quotation[passage] value=\""+@literary_quotation.passage.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_passagediv" + "'>"
    edit_path = literary_quotation_passage_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.passage == nil or @literary_quotation.passage == ''
      t_passage = 'Click to modify'
    else
      t_passage = @literary_quotation.passage     
    end    
    resultstr << link_to_remote(t_passage, :url => edit_path, :update => "#{@literary_quotation.id}_passagediv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    
    resultstr << "<b>Spelling: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[spelling] id=literary_quotation[spelling] value=\""+@literary_quotation.spelling.to_s+"\" >"
    if @literary_quotation.spelling == nil or @literary_quotation.spelling == ''
      @literary_quotation.spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :spelling, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[spelling]'}) +"<br>"
    resultstr << "<b>Script: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[script] id=literary_quotation[script] value=\""+@literary_quotation.script.to_s+"\" >"
    #if @literary_quotation.script_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @literary_quotation.script_type.title
    #end
    #resultstr << "<span id=\"literary_quotation[script_type#{@literary_quotation.id}]_selector\">"
    #resultstr << '['+@literary_quotation.script+']' if @literary_quotation.script != nil
    #resultstr << link_to_remote( title,{:update => "literary_quotation[script_type#{@literary_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'literary_quotations', :action => 'display_category_selector', :id => @literary_quotation.id, :params => {'data_id' => 192, 'model_name' => 'literary_quotation', 'function_name' => "script_type", :update_id => "literary_quotation[script_type#{@literary_quotation.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "<script type=\"text/javascript\" language=\"javascript\">Event.observe('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('literary_quotation[script_type"+@literary_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    ## resultstr << in_place_form_editor_field( :literary_quotation, :script, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[script]'}) +"<br>"
    @data = Category.find(192)
    resultstr << category_selector(@data, :literary_quotation, :script_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "<br>"
    
    
    resultstr << "<b>Literary genre: </b>"
    resultstr << @literary_quotation.literary_genre unless @literary_quotation.literary_genre == nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[literary_genre] id=literary_quotation[literary_genre] value=\""+@literary_quotation.literary_genre.to_s+"\" >"
    if @literary_quotation.literary_genre == nil or @literary_quotation.literary_genre == ''
      @literary_quotation.literary_genre = 'Click to modify'
    end
    # resultstr << in_place_select_editor_field( :literary_quotation, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'literary_quotation[literary_genre]'})+"<br>"
    resultstr << in_place_editor_field( :literary_quotation, :literary_genre, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[literary_genre]'}) +"<br>"
    resultstr << "<b>Literary period: </b>"
    resultstr << @literary_quotation.literary_period unless @literary_quotation.literary_period == nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[literary_period] id=literary_quotation[literary_period] value=\""+@literary_quotation.literary_period.to_s+"\" >"
    if @literary_quotation.literary_period == nil or @literary_quotation.literary_period == ''
      @literary_quotation.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :literary_period, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[literary_period]'}) +"<br>"
    resultstr << "<b>Literary form: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[literary_form] id=literary_quotation[literary_form] value=\""+@literary_quotation.literary_form.to_s+"\" >"
    #if @literary_quotation.literary_form_type == nil
    #  title = 'Click to modify'
    #else
    #  title = @literary_quotation.literary_form_type.title
    #end
    #resultstr << "<span id=\"literary_quotation[literary_form_type#{@literary_quotation.id}]_selector\">"
    #resultstr << '['+@literary_quotation.literary_form+']' if @literary_quotation.literary_form != nil
    #resultstr << link_to_remote( title,{:update => "literary_quotation[literary_form_type#{@literary_quotation.id}]_selector", :complete => "re_initialize();",:url => {:controller => 'literary_quotations', :action => 'display_category_selector', :id => @literary_quotation.id, :params => {'data_id' => 186, 'model_name' => 'literary_quotation', 'function_name' => "literary_form_type", :update_id => "literary_quotation[literary_form_type#{@literary_quotation.id}]_selector"}}}, :class => 'selector_link' )
    #resultstr << "</span><br>"
    #resultstr << "<script type=\"text/javascript\" language=\"javascript\">Event.observe('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('literary_quotation[literary_form_type"+@literary_quotation.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    @data = Category.find(186)
    resultstr << category_selector(@data, :literary_quotation, :literary_form_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "<br>"
    
    resultstr << "<b>Western date of composition: </b>"
    resultstr << @literary_quotation.western_date if @literary_quotation.western_date != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[western_date] id=literary_quotation[western_date] value=\""+@literary_quotation.western_date.to_s+"\" >"
    if @literary_quotation.western_date == nil or @literary_quotation.western_date == ''
      @literary_quotation.western_date = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_quotation, :western_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[western_date]'}) +"<br>"
  
    resultstr << "<b>Western date note: </b>"
    resultstr << @literary_quotation.western_date_note if @literary_quotation.western_date_note != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[western_date_note] id=literary_quotation[western_date_note] value=\""+@literary_quotation.western_date_note.to_s+"\" >"
    if @literary_quotation.western_date_note == nil or @literary_quotation.western_date_note == ''
      @literary_quotation.western_date_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :western_date_note, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[western_date_note]'}) +"<br>"
    resultstr << "<b>Tibetan date of composition: </b>"
    resultstr << @literary_quotation.tibetan_date if @literary_quotation.tibetan_date != nil
    resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[tibetan_date] id=literary_quotation[tibetan_date] value=\""+@literary_quotation.tibetan_date.to_s+"\" >"
    if @literary_quotation.tibetan_date == nil or @literary_quotation.tibetan_date == ''
      @literary_quotation.tibetan_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :tibetan_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[tibetan_date]'}) +"<br>"
    resultstr << "<b>Tibetan date note: </b>"
    resultstr << @literary_quotation.tibetan_date_note if @literary_quotation.tibetan_date_note != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[tibetan_date_note] id=literary_quotation[tibetan_date_note] value=\""+@literary_quotation.tibetan_date_note.to_s+"\" >"
    if @literary_quotation.tibetan_date_note == nil or @literary_quotation.tibetan_date_note == ''
      @literary_quotation.tibetan_date_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :tibetan_date_note, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[tibetan_date_note]'}) +"<br>"
    resultstr << "<b>Edition: </b>"
    resultstr << @literary_quotation.edition if @literary_quotation.edition != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[edition] id=literary_quotation[edition] value=\""+@literary_quotation.edition.to_s+"\" >"
    if @literary_quotation.edition == nil or @literary_quotation.edition == ''
      @literary_quotation.edition = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :edition, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[edition]'}) +"<br>"
    resultstr << "<b>Publisher: </b>"
    resultstr << @literary_quotation.publisher if @literary_quotation.publisher != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[publisher] id=literary_quotation[publisher] value=\""+@literary_quotation.publisher.to_s+"\" >"
    if @literary_quotation.publisher == nil or @literary_quotation.publisher == ''
      @literary_quotation.publisher = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :publisher, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[publisher]'}) +"<br>"
    resultstr << "<b>Place of publication: </b>"
    resultstr << @literary_quotation.place_of_publication if @literary_quotation.place_of_publication != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[place_of_publication] id=literary_quotation[place_of_publication] value=\""+@literary_quotation.place_of_publication.to_s+"\" >"
    if @literary_quotation.place_of_publication == nil or @literary_quotation.place_of_publication == ''
      @literary_quotation.place_of_publication = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :place_of_publication, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[place_of_publication]'}) +"<br>"
    resultstr << "<b>Date of publication: </b>"
    resultstr << @literary_quotation.published_date if @literary_quotation.published_date != nil
    #resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[published_date] id=literary_quotation[published_date] value=\""+@literary_quotation.published_date.to_s+"\" >"
    if @literary_quotation.published_date == nil or @literary_quotation.published_date == ''
      @literary_quotation.published_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :published_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[published_date]'}) +"<br>"
    resultstr << "<b>ISBN: </b>"
    resultstr << @literary_quotation.isbn if @literary_quotation.isbn != nil
    # resultstr << "<br>"
    # resultstr << "<input type=hidden name=literary_quotation[isbn] id=literary_quotation[isbn] value=\""+@literary_quotation.isbn.to_s+"\" >"
    if @literary_quotation.isbn != nil and @literary_quotation.isbn != ''
      resultstr << @literary_quotation.isbn
    end
    #resultstr << "<br>"
    resultstr << in_place_editor_field( :literary_quotation, :isbn, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[isbn]'}) +"<br>"
    resultstr << "<b>Volume number: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[volume_number] id=literary_quotation[volume_number] value=\""+@literary_quotation.volume_number.to_s+"\" >"
    if @literary_quotation.volume_number == nil or @literary_quotation.volume_number == ''
      @literary_quotation.volume_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :volume_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[volume_number]'}) +"<br>"
    resultstr << "<b>Passage number: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[passage_pound] id=literary_quotation[passage_pound] value=\""+@literary_quotation.passage_pound.to_s+"\" >"
    if @literary_quotation.passage_pound == nil or @literary_quotation.passage_pound == ''
      @literary_quotation.passage_pound = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :passage_pound, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[passage_pound]'}) +"<br>"
    resultstr << "<b>Page number: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[passage_number] id=literary_quotation[passage_number] value=\""+@literary_quotation.passage_number.to_s+"\" >"
    if @literary_quotation.passage_number == nil or @literary_quotation.passage_number == ''
      @literary_quotation.passage_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :passage_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[passage_number]'}) +"<br>"
    resultstr << "<b>Page side: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[page_side] id=literary_quotation[page_side] value=\""+@literary_quotation.page_side.to_s+"\" >"
    if @literary_quotation.page_side == nil or @literary_quotation.page_side == ''
      @literary_quotation.page_side = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :page_side, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[page_side]'}) +"<br>"
    resultstr << "<b>Line number: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[line_number] id=literary_quotation[line_number] value=\""+@literary_quotation.line_number.to_s+"\" >"
    if @literary_quotation.line_number == nil or @literary_quotation.line_number == ''
      @literary_quotation.line_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :line_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[line_number]'}) +"<br>"
    # resultstr << "<b>Line ID: </b>"
    # resultstr << "<input type=hidden name=literary_quotation[line_id] id=literary_quotation[line_id] value=\""+@literary_quotation.line_id.to_s+"\" >"
    # if @literary_quotation.line_id == nil or @literary_quotation.line_id == ''
    #   @literary_quotation.line_id = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :line_id, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[line_id]'}) +"<br>"
    resultstr << "<b>Passage Url: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[url] id=literary_quotation[url] value=\""+@literary_quotation.url.to_s+"\" >"
    if @literary_quotation.url == nil or @literary_quotation.url == ''
      @literary_quotation.url = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :url, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[url]'}) +"<br>"
    # resultstr << "<b>Page image link: </b>"
    # resultstr << "<input type=hidden name=literary_quotation[page_image_link] id=literary_quotation[page_image_link] value=\""+@literary_quotation.page_image_link.to_s+"\" >"
    # if @literary_quotation.page_image_link == nil or @literary_quotation.page_image_link == ''
    #   @literary_quotation.page_image_link = 'Click to modify'
    # end
    # resultstr << in_place_form_editor_field( :literary_quotation, :page_image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[page_image_link]'}) +"<br>"

    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=literary_quotation[analytical_note] id=literary_quotation[analytical_note] value=\""+@literary_quotation.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_anotediv" + "'>"
    edit_path = literary_quotation_analytical_note_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.analytical_note == nil or @literary_quotation.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @literary_quotation.analytical_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@literary_quotation.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"


		#resultstr <<	"<span id=\"show_av_literary_quotation"+@literary_quotation.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.show('hide_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.show('av_literary_quotation_"+@literary_quotation.id.to_s+"');", :title => 'Show')+"</span>"
		#resultstr <<	"<span id=\"hide_av_literary_quotation"+@literary_quotation.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.show('show_av_literary_quotation"+@literary_quotation.id.to_s+"');Element.hide('av_literary_quotation_"+@literary_quotation.id.to_s+"');", :title => 'Hide')+"</span>"
    #resultstr << "<span id=\"av_literary_quotation_"+@literary_quotation.id.to_s+"\" style=\"display:none\"/><dl><dd>"

    resultstr << "<b>Edit Multimedia Data: </b>"
    resultstr << "<input type='button' name='toggleh1' value='show/hide multimedia' id='toggleh1'><br>"
    resultstr << "<div class='showhide'>"

    resultstr << "<b>Image: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[image] id=literary_quotation[image] value=\""+@literary_quotation.image.to_s+"\" >"
    if @literary_quotation.image == nil or @literary_quotation.image == ''
      @literary_quotation.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[image_caption] id=literary_quotation[image_caption] value=\""+@literary_quotation.image_caption.to_s+"\" >"
    if @literary_quotation.image_caption == nil or @literary_quotation.image_caption == ''
      @literary_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_caption, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[image_photographer] id=literary_quotation[image_photographer] value=\""+@literary_quotation.image_photographer.to_s+"\" >"
    if @literary_quotation.image_photographer == nil or @literary_quotation.image_photographer == ''
      @literary_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[image_link] id=literary_quotation[image_link] value=\""+@literary_quotation.image_link.to_s+"\" >"
    if @literary_quotation.image_link == nil or @literary_quotation.image_link == ''
      @literary_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[image_description] id=literary_quotation[image_description] value=\""+@literary_quotation.image_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_imagedescdiv" + "'>"
    edit_path = literary_quotation_image_description_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.image_description == nil or @literary_quotation.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @literary_quotation.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@literary_quotation.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Audio: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio] id=literary_quotation[audio] value=\""+@literary_quotation.audio.to_s+"\" >"
    if @literary_quotation.audio == nil or @literary_quotation.audio == ''
      @literary_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio_id_number] id=literary_quotation[audio_id_number] value=\""+@literary_quotation.audio_id_number.to_s+"\" >"
    if @literary_quotation.audio_id_number == nil or @literary_quotation.audio_id_number == ''
      @literary_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio_speaker] id=literary_quotation[audio_speaker] value=\""+@literary_quotation.audio_speaker.to_s+"\" >"
    if @literary_quotation.audio_speaker == nil or @literary_quotation.audio_speaker == ''
      @literary_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio_date] id=literary_quotation[audio_date] value=\""+@literary_quotation.audio_date.to_s+"\" >"
    if @literary_quotation.audio_date == nil or @literary_quotation.audio_date == ''
      @literary_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio_place_of_recording] id=literary_quotation[audio_place_of_recording] value=\""+@literary_quotation.audio_place_of_recording.to_s+"\" >"
    if @literary_quotation.audio_place_of_recording == nil or @literary_quotation.audio_place_of_recording == ''
      @literary_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio_link] id=literary_quotation[audio_link] value=\""+@literary_quotation.audio_link.to_s+"\" >"
    if @literary_quotation.audio_link == nil or @literary_quotation.audio_link == ''
      @literary_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[audio_description] id=literary_quotation[audio_description] value=\""+@literary_quotation.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_audiodescdiv" + "'>"
    edit_path = literary_quotation_audio_description_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.audio_description == nil or @literary_quotation.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @literary_quotation.audio_description     
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@literary_quotation.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"

    resultstr << "<b>Video: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video] id=literary_quotation[video] value=\""+@literary_quotation.video.to_s+"\" >"
    if @literary_quotation.video == nil or @literary_quotation.video == ''
      @literary_quotation.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video_id_number] id=literary_quotation[video_id_number] value=\""+@literary_quotation.video_id_number.to_s+"\" >"
    if @literary_quotation.video_id_number == nil or @literary_quotation.video_id_number == ''
      @literary_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video_speaker] id=literary_quotation[video_speaker] value=\""+@literary_quotation.video_speaker.to_s+"\" >"
    if @literary_quotation.video_speaker == nil or @literary_quotation.video_speaker == ''
      @literary_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video_date] id=literary_quotation[video_date] value=\""+@literary_quotation.video_date.to_s+"\" >"
    if @literary_quotation.video_date == nil or @literary_quotation.video_date == ''
      @literary_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video_place_of_recording] id=literary_quotation[video_place_of_recording] value=\""+@literary_quotation.video_place_of_recording.to_s+"\" >"
    if @literary_quotation.video_place_of_recording == nil or @literary_quotation.video_place_of_recording == ''
      @literary_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_quotation[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video_link] id=literary_quotation[video_link] value=\""+@literary_quotation.video_link.to_s+"\" >"
    if @literary_quotation.video_link == nil or @literary_quotation.video_link == ''
      @literary_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[video_link]'}) +"<br>"
    resultstr << "<b>Video description: </b>"
    #resultstr << "<input type=hidden name=literary_quotation[video_description] id=literary_quotation[video_description] value=\""+@literary_quotation.video_description.to_s+"\" >"
    #if @literary_quotation.video_description == nil or @literary_quotation.video_description == ''
    #  @literary_quotation.video_description = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :literary_quotation, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'literary_quotation[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@literary_quotation.id}_videodescdiv" + "'>"
    edit_path = literary_quotation_video_description_edit_url(:id => @literary_quotation.id)
    if @literary_quotation.video_description == nil or @literary_quotation.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @literary_quotation.video_description     
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@literary_quotation.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    resultstr << "</div>" #showhide
    
    #resultstr << "</dd></dl></span>"
  end


  def show_edit_literary_quotation
    resultstr = ""
    resultstr << "<p><b>Source: </b><br>"
    if @literary_quotation.source == nil or @literary_quotation.source == ''
      @literary_quotation.source = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :source, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Source ID: </b><br>"
    if @literary_quotation.source_id == nil or @literary_quotation.source_id == ''
      @literary_quotation.source_id = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :source_id, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Title: </b><br>"
    if @literary_quotation.title == nil or @literary_quotation.title == ''
      @literary_quotation.title = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :title, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Author: </b><br>"
    if @literary_quotation.author == nil or @literary_quotation.author == ''
      @literary_quotation.author = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :author, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Western date: </b><br>"
    if @literary_quotation.western_date == nil or @literary_quotation.western_date == ''
      @literary_quotation.western_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :western_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Western date note: </b><br>"
    if @literary_quotation.western_date_note == nil or @literary_quotation.western_date_note == ''
      @literary_quotation.western_date_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :western_date_note, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Tibetan date: </b><br>"
    if @literary_quotation.tibetan_date == nil or @literary_quotation.tibetan_date == ''
      @literary_quotation.tibetan_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :tibetan_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Tibetan date note: </b><br>"
    if @literary_quotation.tibetan_date_note == nil or @literary_quotation.tibetan_date_note == ''
      @literary_quotation.tibetan_date_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :tibetan_date_note, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Edition: </b><br>"
    if @literary_quotation.edition == nil or @literary_quotation.edition == ''
      @literary_quotation.edition = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :edition, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary genre: </b><br>"
    if @literary_quotation.literary_genre == nil or @literary_quotation.literary_genre == ''
      @literary_quotation.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :literary_genre, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>ISBN: </b><br>"
    if @literary_quotation.isbn == nil or @literary_quotation.isbn == ''
      @literary_quotation.isbn = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :isbn, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Publisher: </b><br>"
    if @literary_quotation.publisher == nil or @literary_quotation.publisher == ''
      @literary_quotation.publisher = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :publisher, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Place of publication: </b><br>"
    if @literary_quotation.place_of_publication == nil or @literary_quotation.place_of_publication == ''
      @literary_quotation.place_of_publication = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :place_of_publication, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Published date: </b><br>"
    if @literary_quotation.published_date == nil or @literary_quotation.published_date == ''
      @literary_quotation.published_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :published_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Volume number: </b><br>"
    if @literary_quotation.volume_number == nil or @literary_quotation.volume_number == ''
      @literary_quotation.volume_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :volume_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary period: </b><br>"
    if @literary_quotation.literary_period == nil or @literary_quotation.literary_period == ''
      @literary_quotation.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :literary_period, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary form: </b><br>"
    if @literary_quotation.literary_form == nil or @literary_quotation.literary_form == ''
      @literary_quotation.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :literary_form, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Passage: </b><br>"
    if @literary_quotation.passage == nil or @literary_quotation.passage == ''
      @literary_quotation.passage = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :passage, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Script: </b><br>"
    if @literary_quotation.script == nil or @literary_quotation.script == ''
      @literary_quotation.script = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :script, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Language of translation: </b><br>"
    if @literary_quotation.language_of_translation == nil or @literary_quotation.language_of_translation == ''
      @literary_quotation.language_of_translation = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :language_of_translation, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Passage pound: </b><br>"
    if @literary_quotation.passage_pound == nil or @literary_quotation.passage_pound == ''
      @literary_quotation.passage_pound = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :passage_pound, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Passage number: </b><br>"
    if @literary_quotation.passage_number == nil or @literary_quotation.passage_number == ''
      @literary_quotation.passage_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :passage_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Page side: </b><br>"
    if @literary_quotation.page_side == nil or @literary_quotation.page_side == ''
      @literary_quotation.page_side = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :page_side, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Line number: </b><br>"
    if @literary_quotation.line_number == nil or @literary_quotation.line_number == ''
      @literary_quotation.line_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :line_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Url: </b><br>"
    if @literary_quotation.url == nil or @literary_quotation.url == ''
      @literary_quotation.url = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :url, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Page image link: </b><br>"
    if @literary_quotation.page_image_link == nil or @literary_quotation.page_image_link == ''
      @literary_quotation.page_image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :page_image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Spelling: </b><br>"
    if @literary_quotation.spelling == nil or @literary_quotation.spelling == ''
      @literary_quotation.spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :spelling, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @literary_quotation.image == nil or @literary_quotation.image == ''
      @literary_quotation.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @literary_quotation.image_caption == nil or @literary_quotation.image_caption == ''
      @literary_quotation.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_caption, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @literary_quotation.image_photographer == nil or @literary_quotation.image_photographer == ''
      @literary_quotation.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @literary_quotation.image_link == nil or @literary_quotation.image_link == ''
      @literary_quotation.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @literary_quotation.image_description == nil or @literary_quotation.image_description == ''
      @literary_quotation.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :image_description, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @literary_quotation.audio == nil or @literary_quotation.audio == ''
      @literary_quotation.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @literary_quotation.audio_id_number == nil or @literary_quotation.audio_id_number == ''
      @literary_quotation.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @literary_quotation.audio_speaker == nil or @literary_quotation.audio_speaker == ''
      @literary_quotation.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @literary_quotation.audio_date == nil or @literary_quotation.audio_date == ''
      @literary_quotation.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @literary_quotation.audio_place_of_recording == nil or @literary_quotation.audio_place_of_recording == ''
      @literary_quotation.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @literary_quotation.audio_link == nil or @literary_quotation.audio_link == ''
      @literary_quotation.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @literary_quotation.video == nil or @literary_quotation.video == ''
      @literary_quotation.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @literary_quotation.video_id_number == nil or @literary_quotation.video_id_number == ''
      @literary_quotation.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @literary_quotation.video_speaker == nil or @literary_quotation.video_speaker == ''
      @literary_quotation.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @literary_quotation.video_date == nil or @literary_quotation.video_date == ''
      @literary_quotation.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @literary_quotation.video_place_of_recording == nil or @literary_quotation.video_place_of_recording == ''
      @literary_quotation.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @literary_quotation.video_link == nil or @literary_quotation.video_link == ''
      @literary_quotation.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @literary_quotation.analytical_note == nil or @literary_quotation.analytical_note == ''
      @literary_quotation.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_quotation, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_literary_quotation
    resultstr = ""
    resultstr << "<tr><td><b>Source: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[source] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Source ID: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[source_id] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Title: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[title] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Author: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[author] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Western date of composition: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[western_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Western date note: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[western_date_note] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tibetan date of composition: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[tibetan_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tibetan date note: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[tibetan_date_note] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Edition: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[edition] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>ISBN: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[isbn] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Publisher: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[publisher] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Place of publication: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[place_of_publication] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Date of publication: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[published_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Volume number: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[volume_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Passage: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[passage] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Script: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[script] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language of translation: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[language_of_translation] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Passage pound: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[passage_pound] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Passage number: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[passage_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Page side: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[page_side] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Line number: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[line_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Line ID: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[line_id] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Url: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[url] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Page image link: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[page_image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Spelling: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[spelling] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=literary_quotation[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
