module TermsHelper
  def show_term
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    resultstr << "<span class='tib'>"
    if @term.term != nil 
      resultstr << @term.term
    end 
    resultstr << "</span>"
    resultstr << "</p>"
    resultstr << "<p><b>Wylie: </b><br>"
    if @term.wylie != nil 
      resultstr << @term.wylie
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Thematic classification: </b><br>"
    if @term.thematic_classification != nil 
      resultstr << @term.thematic_classification
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Encylopedia entry: </b><br>"
    if @term.encylopedia_entry != nil 
      resultstr << @term.encylopedia_entry
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b><br>"
    if @term.image != nil 
      resultstr << @term.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Caption: </b><br>"
    if @term.caption != nil 
      resultstr << @term.caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Photographer: </b><br>"
    if @term.photographer != nil 
      resultstr << @term.photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b><br>"
    if @term.image_link != nil 
      resultstr << @term.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b><br>"
    if @term.image_description != nil 
      resultstr << @term.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b><br>"
    if @term.audio != nil 
      resultstr << @term.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @term.audio_id_number != nil 
      resultstr << @term.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Speaker: </b><br>"
    if @term.speaker != nil 
      resultstr << @term.speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Date: </b><br>"
    if @term.date != nil 
      resultstr << @term.date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Place of recording: </b><br>"
    if @term.place_of_recording != nil 
      resultstr << @term.place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @term.audio_link != nil 
      resultstr << @term.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @term.analytical_note != nil 
      resultstr << @term.analytical_note
    end 
    resultstr << "</p>"
  end

  def edit_term
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    resultstr << "<span class='tib'>"
    resultstr << "<input size=80 name=term[term] type=text value=\""
    resultstr << @term.term if @term.term != nil
    resultstr << "\" /></span></p>"
    resultstr << "<p><b>Wylie: </b><br>"
    resultstr << "<input size=80 name=term[wylie] type=text value=\""
    resultstr << @term.wylie if @term.wylie != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Thematic classification: </b><br>"
    resultstr << "<input size=80 name=term[thematic_classification] type=text value=\""
    resultstr << @term.thematic_classification if @term.thematic_classification != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Encylopedia entry: </b><br>"
    resultstr << "<textarea cols=65 name=term[encylopedia_entry] rows=3 wrap=virtual >"
    resultstr << @term.encylopedia_entry if @term.encylopedia_entry != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=term[image] rows=3 wrap=virtual >"
    resultstr << @term.image if @term.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Caption: </b><br>"
    resultstr << "<textarea cols=65 name=term[caption] rows=3 wrap=virtual >"
    resultstr << @term.caption if @term.caption != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Photographer: </b><br>"
    resultstr << "<input size=80 name=term[photographer] type=text value=\""
    resultstr << @term.photographer if @term.photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=term[image_link] rows=3 wrap=virtual >"
    resultstr << @term.image_link if @term.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<textarea cols=65 name=term[image_description] rows=3 wrap=virtual >"
    resultstr << @term.image_description if @term.image_description != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=term[audio] type=text value=\""
    resultstr << @term.audio if @term.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=term[audio_id_number] type=text value=\""
    resultstr << @term.audio_id_number if @term.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Speaker: </b><br>"
    resultstr << "<input size=80 name=term[speaker] type=text value=\""
    resultstr << @term.speaker if @term.speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Date: </b><br>"
    resultstr << "<input size=80 name=term[date] type=text value=\""
    resultstr << @term.date if @term.date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Place of recording: </b><br>"
    resultstr << "<input size=80 name=term[place_of_recording] type=text value=\""
    resultstr << @term.place_of_recording if @term.place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=term[audio_link] rows=3 wrap=virtual >"
    resultstr << @term.audio_link if @term.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=term[analytical_note] rows=3 wrap=virtual >"
    resultstr << @term.analytical_note if @term.analytical_note != nil
    resultstr << "</textarea>"
  end

  def search_term
    resultstr = ""
    resultstr << "<tr><td><b>Term: </b></td>"
    resultstr << "<td><input size=50 name=term[term] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Wylie: </b></td>"
    resultstr << "<td><input size=50 name=term[wylie] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Thematic classification: </b></td>"
    resultstr << "<td><input size=50 name=term[thematic_classification] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Encylopedia entry: </b></td>"
    resultstr << "<td><input size=50 name=term[encylopedia_entry] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=term[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Caption: </b></td>"
    resultstr << "<td><input size=50 name=term[caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Photographer: </b></td>"
    resultstr << "<td><input size=50 name=term[photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=term[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=term[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=term[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=term[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Speaker: </b></td>"
    resultstr << "<td><input size=50 name=term[speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Date: </b></td>"
    resultstr << "<td><input size=50 name=term[date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Place of recording: </b></td>"
    resultstr << "<td><input size=50 name=term[place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=term[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=term[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
