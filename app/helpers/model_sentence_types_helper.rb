module ModelSentenceTypesHelper
  def show_model_sentence_type
    resultstr = ""
    resultstr << "<p><b>Sentence type: </b>"
    if @model_sentence_type.sentence_type != nil 
      resultstr << @model_sentence_type.sentence_type
    end 
    resultstr << "</p>"
  end

  def list_model_sentence_type
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('sentence_type', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for model_sentence_type in @model_sentence_types
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	model_sentence_type.sentence_type.to_s unless model_sentence_type.sentence_type == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => model_sentence_type.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => model_sentence_type.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => model_sentence_type.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_model_sentence_type
    resultstr = ""
    resultstr << "<p><b>Sentence type: </b><br>"
    resultstr << "<input size=80 name=model_sentence_type[sentence_type] type=text value=\""
    resultstr << @model_sentence_type.sentence_type if @model_sentence_type.sentence_type != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_model_sentence_type
    resultstr = ""
    resultstr << "<p><b>Sentence type: </b>"
    resultstr << "<input type=hidden name=model_sentence_type[sentence_type] id=model_sentence_type[sentence_type] value=\""+@model_sentence_type.sentence_type.to_s+"\" >"
    if @model_sentence_type.sentence_type == nil or @model_sentence_type.sentence_type == ''
      @model_sentence_type.sentence_type = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :model_sentence_type, :sentence_type, {}, {:cols => 50, :rows => 1, :fieldname => 'model_sentence_type[sentence_type]'}) +"<br>"
  end

  def show_edit_model_sentence_type
    resultstr = ""
    resultstr << "<p><b>Sentence type: </b><br>"
    if @model_sentence_type.sentence_type == nil or @model_sentence_type.sentence_type == ''
      @model_sentence_type.sentence_type = 'Click to modify'
    end
    resultstr << in_place_editor_field( :model_sentence_type, :sentence_type, {}, :rows => 1) +"<br>"
  end

  def search_model_sentence_type
    resultstr = ""
    resultstr << "<tr><td><b>Sentence type: </b></td>"
    resultstr << "<td><input size=50 name=model_sentence_type[sentence_type] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
