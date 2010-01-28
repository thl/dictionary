module PronunciationTypesHelper
  def show_pronunciation_type
    resultstr = ""
    resultstr << "<p><b>Pronunciation type: </b>"
    if @pronunciation_type.pronunciation_type != nil 
      resultstr << @pronunciation_type.pronunciation_type
    end 
    resultstr << "</p>"
  end

  def list_pronunciation_type
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('pronunciation_type', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for pronunciation_type in @pronunciation_types
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	pronunciation_type.pronunciation_type.to_s unless pronunciation_type.pronunciation_type == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => pronunciation_type.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => pronunciation_type.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => pronunciation_type.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_pronunciation_type
    resultstr = ""
    resultstr << "<p><b>Pronunciation type: </b><br>"
    resultstr << "<input size=80 name=pronunciation_type[pronunciation_type] type=text value=\""
    resultstr << @pronunciation_type.pronunciation_type if @pronunciation_type.pronunciation_type != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_pronunciation_type
    resultstr = ""
    resultstr << "<p><b>Pronunciation type: </b>"
    resultstr << "<input type=hidden name=pronunciation_type[pronunciation_type] id=pronunciation_type[pronunciation_type] value=\""+@pronunciation_type.pronunciation_type.to_s+"\" >"
    if @pronunciation_type.pronunciation_type == nil or @pronunciation_type.pronunciation_type == ''
      @pronunciation_type.pronunciation_type = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :pronunciation_type, :pronunciation_type, {}, {:cols => 50, :rows => 1, :fieldname => 'pronunciation_type[pronunciation_type]'}) +"<br>"
  end

  def show_edit_pronunciation_type
    resultstr = ""
    resultstr << "<p><b>Pronunciation type: </b><br>"
    if @pronunciation_type.pronunciation_type == nil or @pronunciation_type.pronunciation_type == ''
      @pronunciation_type.pronunciation_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :pronunciation_type, :pronunciation_type, {}, :rows => 1) +"<br>"
  end

  def search_pronunciation_type
    resultstr = ""
    resultstr << "<tr><td><b>Pronunciation type: </b></td>"
    resultstr << "<td><input size=50 name=pronunciation_type[pronunciation_type] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
