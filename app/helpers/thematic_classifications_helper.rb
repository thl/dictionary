module ThematicClassificationsHelper
  def show_thematic_classification
    resultstr = ""
    resultstr << "<p><b>Level 1: </b>"
    if @thematic_classification.level1 != nil 
      resultstr << @thematic_classification.level1
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Level 2: </b>"
    if @thematic_classification.level2 != nil 
      resultstr << @thematic_classification.level2
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Level 3: </b>"
    if @thematic_classification.level3 != nil 
      resultstr << @thematic_classification.level3
    end 
    resultstr << "</p>"
  end

  def list_thematic_classification
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('level1', { :align => "left" })
    resultstr << sort_header_tag('level2', { :align => "left" })
    resultstr << sort_header_tag('level3', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for thematic_classification in @thematic_classifications
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	thematic_classification.level1.to_s unless thematic_classification.level1 == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	thematic_classification.level2.to_s unless thematic_classification.level2 == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	thematic_classification.level3.to_s unless thematic_classification.level3 == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => thematic_classification.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => thematic_classification.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => thematic_classification.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_thematic_classification
    resultstr = ""
    resultstr << "<p><b>Level 1: </b><br>"
    resultstr << "<input size=80 name=thematic_classification[level1] type=text value=\""
    resultstr << @thematic_classification.level1 if @thematic_classification.level1 != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Level 2: </b><br>"
    resultstr << "<input size=80 name=thematic_classification[level2] type=text value=\""
    resultstr << @thematic_classification.level2 if @thematic_classification.level2 != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Level 3: </b><br>"
    resultstr << "<input size=80 name=thematic_classification[level3] type=text value=\""
    resultstr << @thematic_classification.level3 if @thematic_classification.level3 != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_thematic_classification
    resultstr = ""
    resultstr << "<p><b>Level 1: </b>"
    resultstr << "<input type=hidden name=thematic_classification[level1] id=thematic_classification[level1] value=\""+@thematic_classification.level1.to_s+"\" >"
    if @thematic_classification.level1 == nil or @thematic_classification.level1 == ''
      @thematic_classification.level1 = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :thematic_classification, :level1, {}, {:cols => 50, :rows => 1, :fieldname => 'thematic_classification[level1]'}) +"<br>"
    resultstr << "<p><b>Level 2: </b>"
    resultstr << "<input type=hidden name=thematic_classification[level2] id=thematic_classification[level2] value=\""+@thematic_classification.level2.to_s+"\" >"
    if @thematic_classification.level2 == nil or @thematic_classification.level2 == ''
      @thematic_classification.level2 = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :thematic_classification, :level2, {}, {:cols => 50, :rows => 1, :fieldname => 'thematic_classification[level2]'}) +"<br>"
    resultstr << "<p><b>Level 3: </b>"
    resultstr << "<input type=hidden name=thematic_classification[level3] id=thematic_classification[level3] value=\""+@thematic_classification.level3.to_s+"\" >"
    if @thematic_classification.level3 == nil or @thematic_classification.level3 == ''
      @thematic_classification.level3 = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :thematic_classification, :level3, {}, {:cols => 50, :rows => 1, :fieldname => 'thematic_classification[level3]'}) +"<br>"
  end

  def show_edit_thematic_classification
    resultstr = ""
    resultstr << "<p><b>Level 1: </b><br>"
    if @thematic_classification.level1 == nil or @thematic_classification.level1 == ''
      @thematic_classification.level1 = 'Click to modify'
    end
    resultstr << in_place_editor_field( :thematic_classification, :level1, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Level 2: </b><br>"
    if @thematic_classification.level2 == nil or @thematic_classification.level2 == ''
      @thematic_classification.level2 = 'Click to modify'
    end
    resultstr << in_place_editor_field( :thematic_classification, :level2, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Level 3: </b><br>"
    if @thematic_classification.level3 == nil or @thematic_classification.level3 == ''
      @thematic_classification.level3 = 'Click to modify'
    end
    resultstr << in_place_editor_field( :thematic_classification, :level3, {}, :rows => 1) +"<br>"
  end

  def search_thematic_classification
    resultstr = ""
    resultstr << "<tr><td><b>Level 1: </b></td>"
    resultstr << "<td><input size=50 name=thematic_classification[level1] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Level 2: </b></td>"
    resultstr << "<td><input size=50 name=thematic_classification[level2] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Level 3: </b></td>"
    resultstr << "<td><input size=50 name=thematic_classification[level3] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
