module SpellingMajorDialectsHelper
  def show_spelling_major_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b>"
    if @spelling_major_dialect.name != nil 
      resultstr << @spelling_major_dialect.name
    end 
    resultstr << "</p>"
  end

  def list_spelling_major_dialect
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('name', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for spelling_major_dialect in @spelling_major_dialects
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	spelling_major_dialect.name.to_s unless spelling_major_dialect.name == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => spelling_major_dialect.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => spelling_major_dialect.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => spelling_major_dialect.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_spelling_major_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b><br>"
    resultstr << "<input size=80 name=spelling_major_dialect[name] type=text value=\""
    resultstr << @spelling_major_dialect.name if @spelling_major_dialect.name != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_spelling_major_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b>"
    resultstr << "<input type=hidden name=spelling_major_dialect[name] id=spelling_major_dialect[name] value=\""+@spelling_major_dialect.name.to_s+"\" >"
    if @spelling_major_dialect.name == nil or @spelling_major_dialect.name == ''
      @spelling_major_dialect.name = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :spelling_major_dialect, :name, {}, {:cols => 50, :rows => 1, :fieldname => 'spelling_major_dialect[name]'}) +"<br>"
  end

  def show_edit_spelling_major_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b><br>"
    if @spelling_major_dialect.name == nil or @spelling_major_dialect.name == ''
      @spelling_major_dialect.name = 'Click to modify'
    end
    resultstr << in_place_editor_field( :spelling_major_dialect, :name, {}, :rows => 1) +"<br>"
  end

  def search_spelling_major_dialect
    resultstr = ""
    resultstr << "<tr><td><b>Name: </b></td>"
    resultstr << "<td><input size=50 name=spelling_major_dialect[name] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
