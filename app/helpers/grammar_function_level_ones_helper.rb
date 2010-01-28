module GrammarFunctionLevelOnesHelper
  def show_grammar_function_level_one
    resultstr = ""
    resultstr << "<p><b>Grammar function: </b>"
    if @grammar_function_level_one.grammar_function != nil 
      resultstr << @grammar_function_level_one.grammar_function
    end 
    resultstr << "</p>"
  end

  def list_grammar_function_level_one
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('grammar_function', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for grammar_function_level_one in @grammar_function_level_ones
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	grammar_function_level_one.grammar_function.to_s unless grammar_function_level_one.grammar_function == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => grammar_function_level_one.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => grammar_function_level_one.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => grammar_function_level_one.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_grammar_function_level_one
    resultstr = ""
    resultstr << "<p><b>Grammar function: </b><br>"
    resultstr << "<input size=80 name=grammar_function_level_one[grammar_function] type=text value=\""
    resultstr << @grammar_function_level_one.grammar_function if @grammar_function_level_one.grammar_function != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_grammar_function_level_one
    resultstr = ""
    resultstr << "<p><b>Grammar function: </b>"
    resultstr << "<input type=hidden name=grammar_function_level_one[grammar_function] id=grammar_function_level_one[grammar_function] value=\""+@grammar_function_level_one.grammar_function.to_s+"\" >"
    if @grammar_function_level_one.grammar_function == nil or @grammar_function_level_one.grammar_function == ''
      @grammar_function_level_one.grammar_function = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :grammar_function_level_one, :grammar_function, {}, {:cols => 50, :rows => 1, :fieldname => 'grammar_function_level_one[grammar_function]'}) +"<br>"
  end

  def show_edit_grammar_function_level_one
    resultstr = ""
    resultstr << "<p><b>Grammar function: </b><br>"
    if @grammar_function_level_one.grammar_function == nil or @grammar_function_level_one.grammar_function == ''
      @grammar_function_level_one.grammar_function = 'Click to modify'
    end
    resultstr << in_place_editor_field( :grammar_function_level_one, :grammar_function, {}, :rows => 1) +"<br>"
  end

  def search_grammar_function_level_one
    resultstr = ""
    resultstr << "<tr><td><b>Grammar function: </b></td>"
    resultstr << "<td><input size=50 name=grammar_function_level_one[grammar_function] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
