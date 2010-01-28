module SpecificDialectsHelper
  def show_specific_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b>"
    if @specific_dialect.name != nil 
      resultstr << @specific_dialect.name
    end 
    resultstr << "</p>"
  end

  def list_specific_dialect
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('name', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for specific_dialect in @specific_dialects
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	specific_dialect.name.to_s unless specific_dialect.name == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => specific_dialect.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => specific_dialect.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => specific_dialect.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_specific_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b><br>"
    resultstr << "<input size=80 name=specific_dialect[name] type=text value=\""
    resultstr << @specific_dialect.name if @specific_dialect.name != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_specific_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b>"
    resultstr << "<input type=hidden name=specific_dialect[name] id=specific_dialect[name] value=\""+@specific_dialect.name.to_s+"\" >"
    if @specific_dialect.name == nil or @specific_dialect.name == ''
      @specific_dialect.name = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :specific_dialect, :name, {}, {:cols => 50, :rows => 1, :fieldname => 'specific_dialect[name]'}) +"<br>"
  end

  def show_edit_specific_dialect
    resultstr = ""
    resultstr << "<p><b>Name: </b><br>"
    if @specific_dialect.name == nil or @specific_dialect.name == ''
      @specific_dialect.name = 'Click to modify'
    end
    resultstr << in_place_editor_field( :specific_dialect, :name, {}, :rows => 1) +"<br>"
  end

  def search_specific_dialect
    resultstr = ""
    resultstr << "<tr><td><b>Name: </b></td>"
    resultstr << "<td><input size=50 name=specific_dialect[name] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
