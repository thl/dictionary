module DerivationsHelper
  def show_derivation
    resultstr = ""
    resultstr << "<p><b>Derivation: </b>"
    if @derivation.derivation != nil 
      resultstr << @derivation.derivation
    end 
    resultstr << "</p>"
  end

  def list_derivation
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('derivation', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for derivation in @derivations
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	derivation.derivation.to_s unless derivation.derivation == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => derivation.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => derivation.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => derivation.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_derivation
    resultstr = ""
    resultstr << "<p><b>Derivation: </b><br>"
    resultstr << "<input size=80 name=derivation[derivation] type=text value=\""
    resultstr << @derivation.derivation if @derivation.derivation != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_derivation
    resultstr = ""
    resultstr << "<p><b>Derivation: </b>"
    resultstr << "<input type=hidden name=derivation[derivation] id=derivation[derivation] value=\""+@derivation.derivation.to_s+"\" >"
    if @derivation.derivation == nil or @derivation.derivation == ''
      @derivation.derivation = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :derivation, :derivation, {}, {:cols => 50, :rows => 1, :fieldname => 'derivation[derivation]'}) +"<br>"
  end

  def show_edit_derivation
    resultstr = ""
    resultstr << "<p><b>Derivation: </b><br>"
    if @derivation.derivation == nil or @derivation.derivation == ''
      @derivation.derivation = 'Click to modify'
    end
    resultstr << in_place_editor_field( :derivation, :derivation, {}, :rows => 1) +"<br>"
  end

  def search_derivation
    resultstr = ""
    resultstr << "<tr><td><b>Derivation: </b></td>"
    resultstr << "<td><input size=50 name=derivation[derivation] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
