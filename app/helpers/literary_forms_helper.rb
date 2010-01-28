module LiteraryFormsHelper
  def show_literary_form
    resultstr = ""
    resultstr << "<p><b>Literary form: </b>"
    if @literary_form.literary_form != nil 
      resultstr << @literary_form.literary_form
    end 
    resultstr << "</p>"
  end

  def list_literary_form
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('literary_form', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for literary_form in @literary_forms
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_form.literary_form.to_s unless literary_form.literary_form == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => literary_form.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => literary_form.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => literary_form.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_literary_form
    resultstr = ""
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=literary_form[literary_form] type=text value=\""
    resultstr << @literary_form.literary_form if @literary_form.literary_form != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_literary_form
    resultstr = ""
    resultstr << "<p><b>Literary form: </b>"
    resultstr << "<input type=hidden name=literary_form[literary_form] id=literary_form[literary_form] value=\""+@literary_form.literary_form.to_s+"\" >"
    if @literary_form.literary_form == nil or @literary_form.literary_form == ''
      @literary_form.literary_form = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_form, :literary_form, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_form[literary_form]'}) +"<br>"
  end

  def show_edit_literary_form
    resultstr = ""
    resultstr << "<p><b>Literary form: </b><br>"
    if @literary_form.literary_form == nil or @literary_form.literary_form == ''
      @literary_form.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_form, :literary_form, {}, :rows => 1) +"<br>"
  end

  def search_literary_form
    resultstr = ""
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=literary_form[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
