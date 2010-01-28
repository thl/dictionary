module LiteraryGenresHelper
  def show_literary_genre
    resultstr = ""
    resultstr << "<p><b>Literary genre: </b>"
    if @literary_genre.literary_genre != nil 
      resultstr << @literary_genre.literary_genre
    end 
    resultstr << "</p>"
  end

  def list_literary_genre
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('literary_genre', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for literary_genre in @literary_genres
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	literary_genre.literary_genre.to_s unless literary_genre.literary_genre == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => literary_genre.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => literary_genre.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => literary_genre.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_literary_genre
    resultstr = ""
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=literary_genre[literary_genre] type=text value=\""
    resultstr << @literary_genre.literary_genre if @literary_genre.literary_genre != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_literary_genre
    resultstr = ""
    resultstr << "<p><b>Literary genre: </b>"
    resultstr << "<input type=hidden name=literary_genre[literary_genre] id=literary_genre[literary_genre] value=\""+@literary_genre.literary_genre.to_s+"\" >"
    if @literary_genre.literary_genre == nil or @literary_genre.literary_genre == ''
      @literary_genre.literary_genre = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :literary_genre, :literary_genre, {}, {:cols => 50, :rows => 1, :fieldname => 'literary_genre[literary_genre]'}) +"<br>"
  end

  def show_edit_literary_genre
    resultstr = ""
    resultstr << "<p><b>Literary genre: </b><br>"
    if @literary_genre.literary_genre == nil or @literary_genre.literary_genre == ''
      @literary_genre.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :literary_genre, :literary_genre, {}, :rows => 1) +"<br>"
  end

  def search_literary_genre
    resultstr = ""
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=literary_genre[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
