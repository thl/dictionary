module ThemeLevelThreesHelper
  def show_theme_level_three
    resultstr = ""
    resultstr << "<p><b>Theme: </b>"
    if @theme_level_three.theme != nil 
      resultstr << @theme_level_three.theme
    end 
    resultstr << "</p>"
  end

  def list_theme_level_three
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('theme', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for theme_level_three in @theme_level_threes
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	theme_level_three.theme.to_s unless theme_level_three.theme == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => theme_level_three.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => theme_level_three.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => theme_level_three.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_theme_level_three
    resultstr = ""
    resultstr << "<p><b>Theme: </b><br>"
    resultstr << "<input size=80 name=theme_level_three[theme] type=text value=\""
    resultstr << @theme_level_three.theme if @theme_level_three.theme != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_theme_level_three
    resultstr = ""
    resultstr << "<p><b>Theme: </b>"
    resultstr << "<input type=hidden name=theme_level_three[theme] id=theme_level_three[theme] value=\""+@theme_level_three.theme.to_s+"\" >"
    if @theme_level_three.theme == nil or @theme_level_three.theme == ''
      @theme_level_three.theme = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :theme_level_three, :theme, {}, {:cols => 50, :rows => 1, :fieldname => 'theme_level_three[theme]'}) +"<br>"
  end

  def show_edit_theme_level_three
    resultstr = ""
    resultstr << "<p><b>Theme: </b><br>"
    if @theme_level_three.theme == nil or @theme_level_three.theme == ''
      @theme_level_three.theme = 'Click to modify'
    end
    resultstr << in_place_editor_field( :theme_level_three, :theme, {}, :rows => 1) +"<br>"
  end

  def search_theme_level_three
    resultstr = ""
    resultstr << "<tr><td><b>Theme: </b></td>"
    resultstr << "<td><input size=50 name=theme_level_three[theme] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
