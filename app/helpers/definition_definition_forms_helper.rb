module DefinitionDefinitionFormsHelper
  def show_definition_definition_form
    resultstr = ""
    resultstr << "<p><b>Role: </b>"
    if @definition_definition_form.role != nil 
      resultstr << @definition_definition_form.role
    end 
    resultstr << "</p>"
  end

  def list_definition_definition_form
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('role', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for definition_definition_form in @definition_definition_forms
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition_definition_form.role.to_s unless definition_definition_form.role == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => definition_definition_form.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => definition_definition_form.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => definition_definition_form.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_definition_definition_form
    resultstr = ""
    resultstr << "<p><b>Relationship: </b><br>"
    resultstr << "<input size=80 name=definition_definition_form[role] type=text value=\""
    resultstr << @definition_definition_form.role if @definition_definition_form.role != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_definition_definition_form
    resultstr = ""
    resultstr << "<p><b>Relationship: </b>"
    resultstr << "<br>"
    resultstr << @definition_definition_form.relationship_to
    resultstr << "<br>"
    resultstr << @definition_definition_form.relationship_from
    # resultstr << "<input type=hidden name=definition_definition_form[role] id=definition_definition_form[role] value=\""+@definition_definition_form.role.to_s+"\" >"
    # if @definition_definition_form.role == nil or @definition_definition_form.role == ''
    #   @definition_definition_form.role = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :definition_definition_form, :role, {}, {:select_options => @role, :fieldname => 'definition_definition_form[role]'})+"<br>"
    #resultstr << in_place_form_editor_field( :definition_definition_form, :role, {}, {:cols => 50, :rows => 1, :fieldname => 'definition_definition_form[role]'}) +"<br>"
  end

  def show_edit_definition_definition_form
    resultstr = ""
    resultstr << "<p><b>Role: </b><br>"
    if @definition_definition_form.role == nil or @definition_definition_form.role == ''
      @definition_definition_form.role = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition_definition_form, :role, {}, :rows => 1) +"<br>"
  end

  def search_definition_definition_form
    resultstr = ""
    resultstr << "<tr><td><b>Role: </b></td>"
    resultstr << "<td><input size=50 name=definition_definition_form[role] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
