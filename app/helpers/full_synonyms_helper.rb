module FullSynonymsHelper
  def show_full_synonym
    resultstr = ""
    resultstr << "<p><b>Term: </b>"
    if @full_synonym.term != nil 
      resultstr << @full_synonym.term
    end 
    resultstr << "</p>"
  end

  def list_full_synonym
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('term', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for full_synonym in @full_synonyms
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	full_synonym.term.to_s unless full_synonym.term == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => full_synonym.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => full_synonym.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => full_synonym.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_full_synonym
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    resultstr << "<input size=80 name=full_synonym[term] type=text value=\""
    resultstr << @full_synonym.term if @full_synonym.term != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_full_synonym
    resultstr = ""
    resultstr << "<b>Term: </b>"
    resultstr << "<input type=hidden name=full_synonym[term] id=full_synonym[term] value=\""+@full_synonym.term.to_s+"\" >"
    if @full_synonym.term == nil or @full_synonym.term == ''
      @full_synonym.term = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :full_synonym, :term, {}, {:cols => 50, :rows => 1, :fieldname => 'full_synonym[term]'}) +"<br>"
  end

  def show_edit_full_synonym
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    if @full_synonym.term == nil or @full_synonym.term == ''
      @full_synonym.term = 'Click to modify'
    end
    resultstr << in_place_editor_field( :full_synonym, :term, {}, :rows => 1) +"<br>"
  end

  def search_full_synonym
    resultstr = ""
    resultstr << "<tr><td><b>Term: </b></td>"
    resultstr << "<td><input size=50 name=full_synonym[term] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
