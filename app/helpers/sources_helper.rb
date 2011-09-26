module SourcesHelper
  def edit_source
    resultstr = ""
    # resultstr << in_place_select_editor_field( :meta, :source_type, {}, {:select_options => @source_type, :fieldname => 'meta[source_type]'})+"<br>"
    resultstr << "<b>Title: </b>"
    # resultstr << @meta.title unless @meta.title == nil
    resultstr << "<br>"

    resultstr << "<b>Author: </b>"
    # resultstr << @meta.author unless @meta.author == nil
    resultstr << "<br>"

    resultstr << "<b>Date of publication: </b>"
    # resultstr << @meta.date_of_publication unless @meta.date_of_publication == nil
    resultstr << "<br>"

    resultstr << "<b>Publisher: </b>"
    # resultstr << @meta.publisher unless @meta.publisher == nil
    resultstr << "<br>"
    
    resultstr << "<b>Place of publication: </b>"
    # resultstr << @meta.place_of_publicatio unless @meta.place_of_publication == nil
    resultstr << "<br>"
    resultstr << "<b>Source ID: </b>"
    resultstr << "<input type=hidden name=source[source_id_value] id=source[source_id_value] value=\""+@source.source_id_value.to_s+"\" >"
    if @source.source_id_value == nil or @source.source_id_value == ''
      @source.source_id_value = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :source_id_value, {}, {:cols => 50, :rows => 1, :fieldname => 'source[source_id_value]'}) +"<br>"
    resultstr << "<b>Source type: </b>"
    resultstr << "<input type=hidden name=source[source_type] id=source[source_type] value=\""+@source.source_type.to_s+"\" >"
    if @source.source_type == nil or @source.source_type == ''
      @source.source_type = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :source, :source_type, {}, {:select_options => @source_type, :fieldname => 'source[source_type]'})+"<br>"

    resultstr << "<b>Start Page number: </b>"
    resultstr << "<input type=hidden name=source[page_number] id=source[page_number] value=\""+@source.page_number.to_s+"\" >"
    if @source.page_number == nil or @source.page_number == ''
      @source.page_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[page_number]'}) +"<br>"
    resultstr << "<b>Start Page side: </b>"
    resultstr << "<input type=hidden name=source[start_page_side] id=source[start_page_side] value=\""+@source.start_page_side.to_s+"\" >"
    if @source.start_page_side == nil or @source.start_page_side == ''
      @source.start_page_side = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :start_page_side, {}, {:cols => 50, :rows => 1, :fieldname => 'source[start_page_side]'}) +"<br>"
    resultstr << "<b>Start Line number: </b>"
    resultstr << "<input type=hidden name=source[start_line_number] id=source[start_line_number] value=\""+@source.start_line_number.to_s+"\" >"
    if @source.start_line_number == nil or @source.start_line_number == ''
      @source.start_line_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :start_line_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[start_line_number]'}) +"<br>"
    resultstr << "<b>End Page number: </b>"
    resultstr << "<input type=hidden name=source[end_page_number] id=source[end_page_number] value=\""+@source.end_page_number.to_s+"\" >"
    if @source.end_page_number == nil or @source.end_page_number == ''
      @source.end_page_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :end_page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[end_page_number]'}) +"<br>"
    resultstr << "<b>End Page side: </b>"
    resultstr << "<input type=hidden name=source[end_page_side] id=source[end_page_side] value=\""+@source.end_page_side.to_s+"\" >"
    if @source.end_page_side == nil or @source.end_page_side == ''
      @source.end_page_side = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :end_page_side, {}, {:cols => 50, :rows => 1, :fieldname => 'source[end_page_side]'}) +"<br>"
    resultstr << "<b>End Line number: </b>"
    resultstr << "<input type=hidden name=source[end_line_number] id=source[end_line_number] value=\""+@source.end_line_number.to_s+"\" >"
    if @source.end_line_number == nil or @source.end_line_number == ''
      @source.end_line_number = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :end_line_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[end_line_number]'}) +"<br>"
    resultstr << "<b>Spelling: </b>"
    resultstr << "<input type=hidden name=source[spelling] id=source[spelling] value=\""+@source.spelling.to_s+"\" >"
    if @source.spelling == nil or @source.spelling == ''
      @source.spelling = 'Click to modify'
    end
    resultstr << in_place_form_editor_field( :source, :spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'source[spelling]'}) +"<br>"
    resultstr << "<b>Source note: </b>"
    resultstr << "<input type=hidden name=source[source_note] id=source[source_note] value=\""+@source.source_note.to_s+"\" >"
    #if @source.source_note == nil or @source.source_note == ''
    #  @source.source_note = 'Click to modify'
    #end
    #resultstr << in_place_form_editor_field( :source, :source_note, {}, {:cols => 70, :rows => 4, :fieldname => 'source[source_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@source.id}_snotediv" + "'>"
    edit_path = source_source_note_edit_url(:id => @source.id)
    if @source.source_note == nil or @source.source_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @source.source_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@source.id}_snotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"    
  end

  def show_source
    resultstr = ""
    resultstr << "<b>Source ID: </b>"
    if @source.source_id_value != nil 
      resultstr << @source.source_id_value
    end 
    resultstr << "<br>"
    resultstr << "<b>Source type: </b>"
    if @source.source_type != nil 
      resultstr << @source.source_type
    end 
    resultstr << "<br>"
    resultstr << "<b>Page number: </b>"
    if @source.page_number != nil 
      resultstr << @source.page_number
    end 
    resultstr << "<br>"
    resultstr << "<b>Source note: </b>"
    if @source.source_note != nil 
      resultstr << @source.source_note
    end 
    resultstr << "<br>"
  end
  
  def modal_edit_dynamic_source
    resultstr = ""
    # resultstr << in_place_select_editor_field( :meta, :source_type, {}, {:select_options => @source_type, :fieldname => 'meta[source_type]'})+"<br>"
#    resultstr << "<b>Title: </b>"
#    resultstr << @meta.title unless @meta.title == nil
#    resultstr << "<br>"
    #if @source.title == nil or @source.title == ''
    #  @source.title = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :source, :title, {}, {:cols => 50, :rows => 1, :fieldname => 'source[title]'}) +"<br>"

#    resultstr << "<b>Author: </b>"
#    resultstr << @meta.author unless @meta.author == nil
#    resultstr << "<br>"
    #if @source.author == nil or @source.author == ''
    #  @source.author = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :source, :author, {}, {:cols => 50, :rows => 1, :fieldname => 'source[author]'}) +"<br>"


#    resultstr << "<b>Date of publication: </b>"
#    resultstr << @meta.date_of_publication unless @meta.date_of_publication == nil
#    resultstr << "<br>"
    #if @source.date_of_publication == nil or @source.date_of_publication == ''
    #  @source.date_of_publication = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :source, :date_of_publication, {}, {:cols => 50, :rows => 1, :fieldname => 'source[date_of_publication]'}) +"<br>"
    

#    resultstr << "<b>Publisher: </b>"
#    resultstr << @meta.publisher unless @meta.publisher == nil
#    resultstr << "<br>"
    #if @source.publisher == nil or @source.publisher == ''
    #  @source.publisher = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :source, :publisher, {}, {:cols => 50, :rows => 1, :fieldname => 'source[publisher]'}) +"<br>"
    
    
#    resultstr << "<b>Place of publication: </b>"
#    resultstr << @meta.place_of_publication unless @meta.place_of_publication == nil
#    resultstr << "<br>"
    #if @source.place_of_publicatio == nil or @source.place_of_publicatio == ''
    #  @source.place_of_publicatio = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :source, :place_of_publication, {}, {:cols => 50, :rows => 1, :fieldname => 'source[place_of_publication]'}) +"<br>"
    
    
    resultstr << "<b>Source ID: </b>"
    #resultstr << "<input type=hidden name=source[source_id_value] id=source[source_id_value] value=\""+@source.source_id_value.to_s+"\" >"
    if @source.source_id_value == nil or @source.source_id_value == ''
      @source.source_id_value = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :source_id_value, {}, {:cols => 50, :rows => 1, :fieldname => 'source[source_id_value]'}) 
    resultstr << "<br>"
    resultstr << "<b>Source type: </b>"
    #resultstr << "<input type=hidden name=source[source_type] id=source[source_type] value=\""+@source.source_type.to_s+"\" >"
    if @source.source_type == nil or @source.source_type == ''
      @source.source_type = 'Click to modify'
    end
    #resultstr << in_place_select_editor_field( :source, :source_type, {}, {:select_options => @source_type, :fieldname => 'source[source_type]'})+"<br>"resultstr << select(:source, :source_type, @source_type) + "<br>"
    resultstr << select(:source, :source_type, @source_type) 
    resultstr << "<br>"

    resultstr << "<b>Start Page number: </b>"
    #resultstr << "<input type=hidden name=source[page_number] id=source[page_number] value=\""+@source.page_number.to_s+"\" >"
    if @source.page_number == nil or @source.page_number == ''
      @source.page_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[page_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>Start Page side: </b>"
    #resultstr << "<input type=hidden name=source[start_page_side] id=source[start_page_side] value=\""+@source.start_page_side.to_s+"\" >"
    if @source.start_page_side == nil or @source.start_page_side == ''
      @source.start_page_side = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :start_page_side, {}, {:cols => 50, :rows => 1, :fieldname => 'source[start_page_side]'}) 
    resultstr << "<br>"
    resultstr << "<b>Start Line number: </b>"
    #resultstr << "<input type=hidden name=source[start_line_number] id=source[start_line_number] value=\""+@source.start_line_number.to_s+"\" >"
    if @source.start_line_number == nil or @source.start_line_number == ''
      @source.start_line_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :start_line_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[start_line_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>End Page number: </b>"
    #resultstr << "<input type=hidden name=source[end_page_number] id=source[end_page_number] value=\""+@source.end_page_number.to_s+"\" >"
    if @source.end_page_number == nil or @source.end_page_number == ''
      @source.end_page_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :end_page_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[end_page_number]'})
    resultstr << "<br>"
    resultstr << "<b>End Page side: </b>"
    #resultstr << "<input type=hidden name=source[end_page_side] id=source[end_page_side] value=\""+@source.end_page_side.to_s+"\" >"
    if @source.end_page_side == nil or @source.end_page_side == ''
      @source.end_page_side = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :end_page_side, {}, {:cols => 50, :rows => 1, :fieldname => 'source[end_page_side]'}) 
    resultstr << "<br>"
    resultstr << "<b>End Line number: </b>"
    #resultstr << "<input type=hidden name=source[end_line_number] id=source[end_line_number] value=\""+@source.end_line_number.to_s+"\" >"
    if @source.end_line_number == nil or @source.end_line_number == ''
      @source.end_line_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :end_line_number, {}, {:cols => 50, :rows => 1, :fieldname => 'source[end_line_number]'}) 
    resultstr << "<br>"
    resultstr << "<b>Spelling: </b>"
    #resultstr << "<input type=hidden name=source[spelling] id=source[spelling] value=\""+@source.spelling.to_s+"\" >"
    if @source.spelling == nil or @source.spelling == ''
      @source.spelling = 'Click to modify'
    end
    resultstr << in_place_editor_field( :source, :spelling, {}, {:cols => 50, :rows => 1, :fieldname => 'source[spelling]'}) 
    resultstr << "<br>"
    resultstr << "<b>Source note: </b>"
    #resultstr << "<input type=hidden name=source[source_note] id=source[source_note] value=\""+@source.source_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@source.id}_snotediv" + "'>"
    edit_path = source_source_note_edit_url(:id => @source.id)
    if @source.source_note == nil or @source.source_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @source.source_note      
    end    
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@source.id}_snotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"    
  end
  
end
