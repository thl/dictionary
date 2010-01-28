module LoanLanguagesHelper
  def show_loan_language
    resultstr = ""
    resultstr << "<p><b>Language: </b>"
    if @loan_language.language != nil 
      resultstr << @loan_language.language
    end 
    resultstr << "</p>"
  end

  def list_loan_language
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('language', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for loan_language in @loan_languages
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	loan_language.language.to_s unless loan_language.language == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => loan_language.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => loan_language.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => loan_language.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_loan_language
    resultstr = ""
    resultstr << "<p><b>Language: </b><br>"
    resultstr << "<input size=80 name=loan_language[language] type=text value=\""
    resultstr << @loan_language.language if @loan_language.language != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_loan_language
    resultstr = ""
    resultstr << "<p><b>Language: </b>"
    resultstr << "<input type=hidden name=loan_language[language] id=loan_language[language] value=\""+@loan_language.language.to_s+"\" >"
    if @loan_language.language == nil or @loan_language.language == ''
      @loan_language.language = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :loan_language, :language, {}, {:rows => 1, :fieldname => 'loan_language[language]'}) +"<br>"
  end

  def show_edit_loan_language
    resultstr = ""
    resultstr << "<p><b>Language: </b><br>"
    if @loan_language.language == nil or @loan_language.language == ''
      @loan_language.language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :loan_language, :language, {}, :rows => 1) +"<br>"
  end

  def search_loan_language
    resultstr = ""
    resultstr << "<tr><td><b>Language: </b></td>"
    resultstr << "<td><input size=50 name=loan_language[language] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
