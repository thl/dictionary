module GroupsHelper
  def show_group
    resultstr = ""
    resultstr << "<p><b>Group name: </b>"
    if @group.group_name != nil 
      resultstr << @group.group_name
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @group.analytical_note != nil 
      resultstr << @group.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_group
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('group_name', { :align => "left" })
    resultstr << sort_header_tag('analytical_note', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for group in @groups
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	group.group_name.to_s unless group.group_name == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	group.analytical_note.to_s unless group.analytical_note == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => group.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => group.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => group.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_group
    resultstr = ""
    resultstr << "<p><b>Group name: </b><br>"
    resultstr << "<input size=80 name=group[group_name] type=text value=\""
    resultstr << @group.group_name if @group.group_name != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=group[analytical_note] rows=3 wrap=virtual >"
    resultstr << @group.analytical_note if @group.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_group
    resultstr = ""
    resultstr << "<p><b>Group name: </b>"
    resultstr << "<input type=hidden name=group[group_name] id=group[group_name] value=\""+@group.group_name.to_s+"\" >"
    if @group.group_name == nil or @group.group_name == ''
      @group.group_name = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :group, :group_name, {}, {:cols => 50, :rows => 1, :fieldname => 'group[group_name]'}) +"<br>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<input type=hidden name=group[analytical_note] id=group[analytical_note] value=\""+@group.analytical_note.to_s+"\" >"
    if @group.analytical_note == nil or @group.analytical_note == ''
      @group.analytical_note = 'Click to modify'
    end
    resultstr << "<br>"+in_place_form_editor_field( :group, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'group[analytical_note]'}) +"<br>"
  end

  def show_edit_group
    resultstr = ""
    resultstr << "<p><b>Group name: </b><br>"
    if @group.group_name == nil or @group.group_name == ''
      @group.group_name = 'Click to modify'
    end
    resultstr << in_place_editor_field( :group, :group_name, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @group.analytical_note == nil or @group.analytical_note == ''
      @group.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :group, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_group
    resultstr = ""
    resultstr << "<tr><td><b>Group name: </b></td>"
    resultstr << "<td><input size=50 name=group[group_name] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=group[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
