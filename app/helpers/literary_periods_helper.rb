module LiteraryPeriodsHelper
  def show_literary_period
    resultstr = ""
    resultstr << "<p><b>Literary period: </b>"
    if @literary_period.literary_period != nil 
      resultstr << @literary_period.literary_period
    end 
    resultstr << "</p>"
  end

  def list_literary_period
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('literary_period', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for literary_period in @literary_periods
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_period.literary_period.to_s unless literary_period.literary_period == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => literary_period.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => literary_period.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => literary_period.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_literary_period
    resultstr = ""
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=literary_period[literary_period] type=text value=\""
    resultstr << @literary_period.literary_period if @literary_period.literary_period != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_literary_period
    resultstr = ""
    resultstr << "<p><b>Literary period: </b>"
    resultstr << "<input type=hidden name=literary_period[literary_period] id=literary_period[literary_period] value=\""+@literary_period.literary_period.to_s+"\" >"
    if @literary_period.literary_period == nil or @literary_period.literary_period == ''
      @literary_period.literary_period = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_period, :literary_period, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_period[literary_period]'}) +"<br>"
  end

  def show_edit_literary_period
    resultstr = ""
    resultstr << "<p><b>Literary period: </b><br>"
    if @literary_period.literary_period == nil or @literary_period.literary_period == ''
      @literary_period.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_period, :literary_period, {}, :rows => 1) +"<br>"
  end

  def search_literary_period
    resultstr = ""
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=literary_period[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
