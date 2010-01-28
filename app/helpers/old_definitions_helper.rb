module OldDefinitionsHelper
  def show_old_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b>"
    resultstr << "<br>"
    if @old_definition.term != nil 
      resultstr << @old_definition.term
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Definition: </b>"
    if @old_definition.definition != nil 
      resultstr << @old_definition.definition
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Dictionary: </b>"
    resultstr << "<br>"
    if @old_definition.dictionary != nil 
      resultstr << @old_definition.dictionary
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Url: </b>"
    resultstr << "<br>"
    if @old_definition.url != nil 
      resultstr << @old_definition.url
    end 
    resultstr << "</p>"
    resultstr << "<p><b>notes: </b>"
    if @old_definition.notes != nil 
      resultstr << @old_definition.notes
    end 
    resultstr << "</p>"
  end

  def list_old_definition
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('term', { :align => "left" })
    resultstr << sort_header_tag('definition', { :align => "left" })
    resultstr << sort_header_tag('library', { :align => "left" })
    resultstr << sort_header_tag('url', { :align => "left" })
    resultstr << sort_header_tag('notes', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for old_definition in @old_definitions
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	old_definition.term.to_s unless old_definition.term == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	old_definition.definition.to_s unless old_definition.definition == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	old_definition.dictionary.to_s unless old_definition.dictionary == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	old_definition.url.to_s unless old_definition.url == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	old_definition.notes.to_s unless old_definition.notes == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => old_definition.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => old_definition.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => old_definition.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_old_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    resultstr << "<textarea cols=65 name=old_definition[term] rows=3 wrap=virtual >"
    resultstr << @old_definition.term if @old_definition.term != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Definition: </b><br>"
    resultstr << "<input size=32 name=old_definition[definition] type=text value=\""
    resultstr << @old_definition.definition if @old_definition.definition != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Dictionary: </b><br>"
    resultstr << "<textarea cols=65 name=old_definition[library] rows=3 wrap=virtual >"
    resultstr << @old_definition.dictionary if @old_definition.dictionary != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Url: </b><br>"
    resultstr << "<textarea cols=65 name=old_definition[url] rows=3 wrap=virtual >"
    resultstr << @old_definition.url if @old_definition.url != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>notes: </b><br>"
    resultstr << "<input size=32 name=old_definition[notes] type=text value=\""
    resultstr << @old_definition.notes if @old_definition.notes != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_old_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b>"
    resultstr << "<input type=hidden name=old_definition[term] id=old_definition[term] value=\""+@old_definition.term.to_s+"\" >"
    if @old_definition.term == nil or @old_definition.term == ''
      @old_definition.term = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :old_definition, :term, {}, {:rows => 3, :fieldname => 'old_definition[term]'}) +"<br>"
    resultstr << "<p><b>Definition: </b>"
    resultstr << "<input type=hidden name=old_definition[definition] id=old_definition[definition] value=\""+@old_definition.definition.to_s+"\" >"
    if @old_definition.definition == nil or @old_definition.definition == ''
      @old_definition.definition = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :old_definition, :definition, {}, {:rows => 1, :fieldname => 'old_definition[definition]'}) +"<br>"
    resultstr << "<p><b>Dictionary: </b>"
    resultstr << "<input type=hidden name=old_definition[library] id=old_definition[library] value=\""+@old_definition.dictionary.to_s+"\" >"
    if @old_definition.dictionary == nil or @old_definition.dictionary == ''
      @old_definition.dictionary = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :old_definition, :dictionary, {}, {:rows => 3, :fieldname => 'old_definition[library]'}) +"<br>"
    resultstr << "<p><b>Url: </b>"
    resultstr << "<input type=hidden name=old_definition[url] id=old_definition[url] value=\""+@old_definition.url.to_s+"\" >"
    if @old_definition.url == nil or @old_definition.url == ''
      @old_definition.url = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :old_definition, :url, {}, {:rows => 3, :fieldname => 'old_definition[url]'}) +"<br>"
    resultstr << "<p><b>notes: </b>"
    resultstr << "<input type=hidden name=old_definition[notes] id=old_definition[notes] value=\""+@old_definition.notes.to_s+"\" >"
    if @old_definition.notes == nil or @old_definition.notes == ''
      @old_definition.notes = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :old_definition, :notes, {}, {:rows => 1, :fieldname => 'old_definition[notes]'}) +"<br>"
  end

  def show_edit_old_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    if @old_definition.term == nil or @old_definition.term == ''
      @old_definition.term = 'Click to modify'
    end
    resultstr << in_place_editor_field( :old_definition, :term, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Definition: </b><br>"
    if @old_definition.definition == nil or @old_definition.definition == ''
      @old_definition.definition = 'Click to modify'
    end
    resultstr << in_place_editor_field( :old_definition, :definition, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Dictionary: </b><br>"
    if @old_definition.dictionary == nil or @old_definition.dictionary == ''
      @old_definition.dictionary = 'Click to modify'
    end
    resultstr << in_place_editor_field( :old_definition, :dictionary, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Url: </b><br>"
    if @old_definition.url == nil or @old_definition.url == ''
      @old_definition.url = 'Click to modify'
    end
    resultstr << in_place_editor_field( :old_definition, :url, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>notes: </b><br>"
    if @old_definition.notes == nil or @old_definition.notes == ''
      @old_definition.notes = 'Click to modify'
    end
    resultstr << in_place_editor_field( :old_definition, :notes, {}, :rows => 1) +"<br>"
  end

  def search_old_definition
    resultstr = ""
    resultstr << "<tr><td><b>Term: </b></td>"
    resultstr << "<td><input size=50 name=old_definition[term] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Definition: </b></td>"
    resultstr << "<td><input size=50 name=old_definition[definition] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Dictionary: </b></td>"
    resultstr << "<td><input size=50 name=old_definition[library] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Url: </b></td>"
    resultstr << "<td><input size=50 name=old_definition[url] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>notes: </b></td>"
    resultstr << "<td><input size=50 name=old_definition[notes] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
