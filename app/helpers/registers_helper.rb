module RegistersHelper
  def show_register
    resultstr = ""
    resultstr << "<p><b>Register: </b>"
    if @register.register != nil 
      resultstr << @register.register
    end 
    resultstr << "</p>"
  end

  def list_register
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('register', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for register in @registers
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	register.register.to_s unless register.register == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => register.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => register.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => register.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_register
    resultstr = ""
    resultstr << "<p><b>Register: </b><br>"
    resultstr << "<input size=80 name=register[register] type=text value=\""
    resultstr << @register.register if @register.register != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_register
    resultstr = ""
    resultstr << "<p><b>Register: </b>"
    resultstr << "<input type=hidden name=register[register] id=register[register] value=\""+@register.register.to_s+"\" >"
    if @register.register == nil or @register.register == ''
      @register.register = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :register, :register, {}, {:cols => 50, :rows => 1, :fieldname => 'register[register]'}) +"<br>"
  end

  def show_edit_register
    resultstr = ""
    resultstr << "<p><b>Register: </b><br>"
    if @register.register == nil or @register.register == ''
      @register.register = 'Click to modify'
    end
    resultstr << in_place_editor_field( :register, :register, {}, :rows => 1) +"<br>"
  end

  def search_register
    resultstr = ""
    resultstr << "<tr><td><b>Register: </b></td>"
    resultstr << "<td><input size=50 name=register[register] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
