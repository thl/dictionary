module LanguagesHelper
  def show_language
    resultstr = ""
    resultstr << "<p><b>Language: </b>"
    if @language.language != nil 
      resultstr << @language.language
    end 
    resultstr << "</p>"
  end

  def list_language
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('language', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for language in @languages
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	language.language.to_s unless language.language == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => language.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => language.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => language.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_language
    resultstr = ""
    resultstr << "<p><b>Language: </b><br>"
    resultstr << "<input size=80 name=language[language] type=text value=\""
    resultstr << @language.language if @language.language != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_language
    resultstr = ""
    resultstr << "<p><b>Language: </b>"
    resultstr << "<input type=hidden name=language[language] id=language[language] value=\""+@language.language.to_s+"\" >"
    if @language.language == nil or @language.language == ''
      @language.language = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :language, :language, {}, {:cols => 50, :rows => 1, :fieldname => 'language[language]'}) +"<br>"
  end

  def show_edit_language
    resultstr = ""
    resultstr << "<p><b>Language: </b><br>"
    if @language.language == nil or @language.language == ''
      @language.language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :language, :language, {}, :rows => 1) +"<br>"
  end

  def search_language
    resultstr = ""
    resultstr << "<tr><td><b>Language: </b></td>"
    resultstr << "<td><input size=50 name=language[language] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
