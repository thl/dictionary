module ScriptsHelper
  def show_script
    resultstr = ""
    resultstr << "<p><b>Script: </b>"
    if @script.script != nil 
      resultstr << @script.script
    end 
    resultstr << "</p>"
  end

  def list_script
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('script', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for script in @scripts
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	script.script.to_s unless script.script == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => script.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => script.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => script.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_script
    resultstr = ""
    resultstr << "<p><b>Script: </b><br>"
    resultstr << "<input size=80 name=script[script] type=text value=\""
    resultstr << @script.script if @script.script != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_script
    resultstr = ""
    resultstr << "<p><b>Script: </b>"
    resultstr << "<input type=hidden name=script[script] id=script[script] value=\""+@script.script.to_s+"\" >"
    if @script.script == nil or @script.script == ''
      @script.script = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :script, :script, {}, {:cols => 50, :rows => 1, :fieldname => 'script[script]'}) +"<br>"
  end

  def show_edit_script
    resultstr = ""
    resultstr << "<p><b>Script: </b><br>"
    if @script.script == nil or @script.script == ''
      @script.script = 'Click to modify'
    end
    resultstr << in_place_editor_field( :script, :script, {}, :rows => 1) +"<br>"
  end

  def search_script
    resultstr = ""
    resultstr << "<tr><td><b>Script: </b></td>"
    resultstr << "<td><input size=50 name=script[script] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
