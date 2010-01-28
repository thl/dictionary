module EtymologyTypesHelper
  def show_etymology_type
    resultstr = ""
    resultstr << "<p><b>Etymology type: </b>"
    if @etymology_type.etymology_type != nil 
      resultstr << @etymology_type.etymology_type
    end 
    resultstr << "</p>"
  end

  def list_etymology_type
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('etymology_type', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for etymology_type in @etymology_types
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	etymology_type.etymology_type.to_s unless etymology_type.etymology_type == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => etymology_type.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => etymology_type.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => etymology_type.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_etymology_type
    resultstr = ""
    resultstr << "<p><b>Etymology type: </b><br>"
    resultstr << "<input size=80 name=etymology_type[etymology_type] type=text value=\""
    resultstr << @etymology_type.etymology_type if @etymology_type.etymology_type != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_etymology_type
    resultstr = ""
    resultstr << "<p><b>Etymology type: </b>"
    resultstr << "<input type=hidden name=etymology_type[etymology_type] id=etymology_type[etymology_type] value=\""+@etymology_type.etymology_type.to_s+"\" >"
    if @etymology_type.etymology_type == nil or @etymology_type.etymology_type == ''
      @etymology_type.etymology_type = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :etymology_type, :etymology_type, {}, {:cols => 50, :rows => 1, :fieldname => 'etymology_type[etymology_type]'}) +"<br>"
  end

  def show_edit_etymology_type
    resultstr = ""
    resultstr << "<p><b>Etymology type: </b><br>"
    if @etymology_type.etymology_type == nil or @etymology_type.etymology_type == ''
      @etymology_type.etymology_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :etymology_type, :etymology_type, {}, :rows => 1) +"<br>"
  end

  def search_etymology_type
    resultstr = ""
    resultstr << "<tr><td><b>Etymology type: </b></td>"
    resultstr << "<td><input size=50 name=etymology_type[etymology_type] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
