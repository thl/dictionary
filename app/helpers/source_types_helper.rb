module SourceTypesHelper
  def show_source_type
    resultstr = ""
    resultstr << "<p><b>Source type: </b>"
    if @source_type.source_type != nil 
      resultstr << @source_type.source_type
    end 
    resultstr << "</p>"
  end

  def list_source_type
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('source_type', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for source_type in @source_types
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	source_type.source_type.to_s unless source_type.source_type == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => source_type.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => source_type.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => source_type.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_source_type
    resultstr = ""
    resultstr << "<p><b>Source type: </b><br>"
    resultstr << "<input size=80 name=source_type[source_type] type=text value=\""
    resultstr << @source_type.source_type if @source_type.source_type != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_source_type
    resultstr = ""
    resultstr << "<p><b>Source type: </b>"
    resultstr << "<input type=hidden name=source_type[source_type] id=source_type[source_type] value=\""+@source_type.source_type.to_s+"\" >"
    if @source_type.source_type == nil or @source_type.source_type == ''
      @source_type.source_type = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source_type, :source_type, {}, {:cols => 50, :rows => 1, :fieldname => 'source_type[source_type]'}) +"<br>"
  end

  def show_edit_source_type
    resultstr = ""
    resultstr << "<p><b>Source type: </b><br>"
    if @source_type.source_type == nil or @source_type.source_type == ''
      @source_type.source_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source_type, :source_type, {}, :rows => 1) +"<br>"
  end

  def search_source_type
    resultstr = ""
    resultstr << "<tr><td><b>Source type: </b></td>"
    resultstr << "<td><input size=50 name=source_type[source_type] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
