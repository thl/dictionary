module ProjectsHelper
  def show_project
    resultstr = ""
    resultstr << "<p><b>Project: </b>"
    if @project.project != nil 
      resultstr << @project.project
    end 
    resultstr << "</p>"
  end

  def list_project
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('project', { :align => "left" })
    resultstr << "<th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for project in @projects
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	project.project.to_s unless project.project == nil
    resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => project.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => project.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Delete', {:action => 'destroy', :id => project.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_project
    resultstr = ""
    resultstr << "<p><b>Project: </b><br>"
    resultstr << "<input size=80 name=project[project] type=text value=\""
    resultstr << @project.project if @project.project != nil
    resultstr << "\" /></p>"
  end

  def edit_dynamic_project
    resultstr = ""
    resultstr << "<p><b>Project: </b>"
    resultstr << "<input type=hidden name=project[project] id=project[project] value=\""+@project.project.to_s+"\" >"
    if @project.project == nil or @project.project == ''
      @project.project = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :project, :project, {}, {:cols => 50, :rows => 1, :fieldname => 'project[project]'}) +"<br>"
  end

  def show_edit_project
    resultstr = ""
    resultstr << "<p><b>Project: </b><br>"
    if @project.project == nil or @project.project == ''
      @project.project = 'Click to modify'
    end
    resultstr << in_place_editor_field( :project, :project, {}, :rows => 1) +"<br>"
  end

  def search_project
    resultstr = ""
    resultstr << "<tr><td><b>Project: </b></td>"
    resultstr << "<td><input size=50 name=project[project] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

end
