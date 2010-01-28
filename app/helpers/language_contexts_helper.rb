module LanguageContextsHelper
  def show_language_context
    resultstr = ""
    resultstr << "<p><b>Language context: </b>"
    if @language_context.language_context != nil 
      resultstr << @language_context.language_context
    end 
    resultstr << "</p>"
  end

  def list_language_context
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('language_context', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for language_context in @language_contexts
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	language_context.language_context.to_s unless language_context.language_context == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => language_context.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => language_context.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => language_context.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_language_context
    resultstr = ""
    resultstr << "<p><b>Language context: </b><br>"
    resultstr << "<input size=80 name=language_context[language_context] type=text value=\""
    resultstr << @language_context.language_context if @language_context.language_context != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_language_context
    resultstr = ""
    resultstr << "<p><b>Language context: </b>"
    resultstr << "<input type=hidden name=language_context[language_context] id=language_context[language_context] value=\""+@language_context.language_context.to_s+"\" >"
    if @language_context.language_context == nil or @language_context.language_context == ''
      @language_context.language_context = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :language_context, :language_context, {}, {:cols => 50, :rows => 1, :fieldname => 'language_context[language_context]'}) +"<br>"
  end

  def show_edit_language_context
    resultstr = ""
    resultstr << "<p><b>Language context: </b><br>"
    if @language_context.language_context == nil or @language_context.language_context == ''
      @language_context.language_context = 'Click to modify'
    end
    resultstr << in_place_editor_field( :language_context, :language_context, {}, :rows => 1) +"<br>"
  end

  def search_language_context
    resultstr = ""
    resultstr << "<tr><td><b>Language context: </b></td>"
    resultstr << "<td><input size=50 name=language_context[language_context] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
