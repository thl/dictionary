# Use to generate helper files for all of the tables.
# It reads the helpers/field_name.txt file to retrieve the tables, fields, and preffered titles.

# loop through file retrieving table data
# @fields is a hash of all tables, each having an array pair of field names and preffered name
# the pair is used instead of a hash, because hashes don't maintain their order
@fields = {}
@used = {}
lines = IO.readlines("helpers/field_names.txt") 
lines.each { |line|             
  #print line+"\n"
	if @used[line] == nil
	  @used[line] = "yes"
		array = line.split(":")
		@fields[array[0]] = [] if @fields[array[0]] == nil
		@fields[array[0]].push(array[1])
		@fields[array[0]].push(array[2][0,array[2].length-1])                               
		#print @fields[array[0]]
	end
}
		
# Run as "erb structure.erb > structure.dot & neato structure.dot -Tpng -o structure.png"
 base_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
 require(File.join(base_path, "config/environment"))
 Dir[File.join(base_path, "app/models/*.rb")].each { |lib| require lib }


 visited_habtm = []

 # loop over classes and build and array of all available
 models = []
 ObjectSpace.each_object(Class) do |cls|
   next unless cls < ActiveRecord::Base
   name = cls.table_name.singularize
   next if name == "session"

   models << cls
 end

 

 # loop over models and build a hash of all model and their relative fields
 @table_names = {}
 for cls in models do
   name = cls.to_s.underscore  #cls.table_name.singularize

   columns = cls.column_names.sort_by do |column|
     [column == cls.primary_key ? 0 : 1, column]
   end
                                  
  	# generate list of fields for each table
	 	array = []
	 	cls.content_columns.each do |column|
	 		@table_names[name] = {} if @table_names[name] == nil
	 		@table_names[name][column.name] = column
	 	end
           
 end                            

# iterate of all desired table and fields from file.
# write the show, edit, and search methods for each model.
@fields.each do |table, flds|      
	flds.each {|key| print "\n"+table+"->"+key.to_s}
	file = File.new("helpers/"+table.pluralize+"_helper.rb", "w")
	file.puts "module "+table.pluralize.camelize+"Helper\n"
	
	# write show method
	file.puts "  def show_"+table+"\n"
	file.puts "    resultstr = \"\""        
	#fldhash = Hash[* flds]
	flds.each_with_index do |key, i| #|field_name, display_name| 
		if (i % 2) > 0 
			next 
		end
		field_name = key
		display_name = flds[i+1]
		column = @table_names[table][field_name]
		print "\n->"+display_name+"\n"
		file.puts "    resultstr << \"<p><b>"+display_name+": </b>\"\n"
		file.puts "    resultstr << \"<br>\"" if column.type.to_s == "string" and column.limit > 128
		#file.puts "    resultstr << \"<br>\"" if column.type.to_s != "string"
		file.puts "    if @"+table+"."+field_name+" != nil \n"
    file.puts "      resultstr << @"+table+"."+field_name.to_s+"\n"
    file.puts "    end \n"
    file.puts "    resultstr << \"</p>\""
		#print field_name+"->"+display_name+","+column.type.to_s+", "+column.limit.to_s+"\n"
	end
	file.puts "  end\n\n"
	                   
  #write list method
  file.puts "  def list_"+table+"\n"
  file.puts "    resultstr = \"\"\n"
  file.puts "    resultstr << \"<table width=\\\"100%\\\" cellspacing=0 _unroll=true border=0 cellpadding=1 bgcolor=#eeeeee>\""
  file.puts "    resultstr << \"<tr bgcolor=#FFFFFF>\"\n"
	flds.each_with_index do |key, i|
	  if (i % 2) > 0 
			next 
		end
	  file.puts "    resultstr << sort_header_tag('"+key+"', { :align => \"left\" })\n"
	end
	file.puts "    resultstr << \"<th/><th/><th/>\"\n"
	file.puts "    resultstr << \"</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>\"\n"
	file.puts "    odd_or_even = 0\n"
	file.puts "    for "+table.singularize+" in @"+table.pluralize+"\n"
	file.puts "      odd_or_even = 1 - odd_or_even\n"
	file.puts "      resultstr << \"  <tr class=\\\"ListLine\"+odd_or_even.to_s+\"\\\">\"\n"
	flds.each_with_index do |key, i|
	  if (i % 2) > 0 
			next 
		end
	  file.puts "    resultstr << 	\"<td valign=top>\"\n"
	  file.puts "    resultstr << 	"+table.singularize+"."+key+".to_s unless "+table.singularize+"."+key+" == nil\n"
	  file.puts "    resultstr << 	\"</td>\"\n"
	end
  file.puts "    resultstr << \"    <td width=20 valign=top>\"\n"
  file.puts "    resultstr << link_to('Show', :action => 'show', :id => "+table.singularize+".id)+\"</td>\"\n"
  file.puts "    resultstr << \"    <td width=20 valign=top>\""
  file.puts "    if $allow_editing\n"
  file.puts "      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => "+table.singularize+".id)"
  file.puts "    end \n"
  file.puts "    resultstr << \"    </td><td width=20 valign=top>\""
  file.puts "    if $allow_editing\n"
  file.puts "      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => "+table.singularize+".id}, :confirm => \"Are you sure you want to delete this entry?\")\n"
  file.puts "    end\n"
  file.puts "      resultstr <<   \"</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>\"\n"
  file.puts "      resultstr << \"</tr>\"\n"
  file.puts "    end"
  #file.puts "    resultstr << end\n\"</table>\n\""
  file.puts "    resultstr << \"</table>\n\""
  file.puts "  end\n\n"
	  
	# write edit method
	file.puts	"  def edit_"+table+"\n"
	file.puts "    resultstr = \"\"\n"
	#fldhash = Hash[* flds]
	flds.each_with_index do |key, i| #|field_name, display_name| 
		if (i % 2) > 0 
			next 
		end
		field_name = key
		display_name = flds[i+1]
		column = @table_names[table][field_name]
		file.puts "    resultstr << \"<p><b>"+display_name+": </b><br>\"\n"
		if column.type.to_s == "string" and column.limit > 128
			file.puts "    resultstr << \"<textarea cols=65 name="+table+"["+field_name+"] rows=3 wrap=virtual >\"\n"
			file.puts "    resultstr << @"+table+"."+field_name+" if @"+table+"."+field_name+" != nil\n"
			file.puts "    resultstr << \"</textarea>\"\n"
		elsif
			column.type.to_s == "string" and column.limit > 32
			file.puts "    resultstr << \"<input size=80 name="+table+"["+field_name+"] type=text value=\\\"\""
			file.puts "    resultstr << @"+table+"."+field_name+" if @"+table+"."+field_name+" != nil\n"
			file.puts "    resultstr << \"\\\" /></p>\"\n"
		else
			file.puts "    resultstr << \"<input size=32 name="+table+"["+field_name+"] type=text value=\\\"\""
			file.puts "    resultstr << @"+table+"."+field_name+" if @"+table+"."+field_name+" != nil\n"
			file.puts "    resultstr << \"\\\" /></p>\"\n"
		end
	end
	file.puts "  end\n\n"

	# write edit method
	file.puts	"  def edit_dynamic_"+table+"\n"
	file.puts "    resultstr = \"\"\n"
	#fldhash = Hash[* flds]
	flds.each_with_index do |key, i| #|field_name, display_name| 
		if (i % 2) > 0 
			next 
		end
		field_name = key
		display_name = flds[i+1]
		column = @table_names[table][field_name]
		file.puts "    resultstr << \"<p><b>"+display_name+": </b>\"\n"
    file.puts "    resultstr << \"<input type=hidden name="+table+"["+field_name+"] id="+table+"["+field_name+"] value=\\\"\"+@"+table+"."+field_name+".to_s+\"\\\" >\"\n"
		if column.type.to_s == "string" and column.limit > 128
			file.puts "    if @"+table+"."+field_name+" == nil or @"+table+"."+field_name+" == ''\n"
			file.puts "      @"+table+"."+field_name+" = 'Click to modify'\n"
			file.puts "    end\n"
			file.puts "    resultstr << \"<br>\"+in_place_form_editor_field( :"+table+", :"+field_name+", {}, {:rows => 3, :fieldname => '"+table+"["+field_name+"]'}) +\"<br>\"\n"
		elsif
			column.type.to_s == "string" and column.limit > 32
			file.puts "    if @"+table+"."+field_name+" == nil or @"+table+"."+field_name+" == ''\n"
			file.puts "      @"+table+"."+field_name+" = 'Click to modify'\n"
			file.puts "    end\n"
			file.puts "    resultstr << in_place_form_editor_field( :"+table+", :"+field_name+", {}, {:rows => 1, :fieldname => '"+table+"["+field_name+"]'}) +\"<br>\"\n"
		else
			file.puts "    if @"+table+"."+field_name+" == nil or @"+table+"."+field_name+" == ''\n"
			file.puts "      @"+table+"."+field_name+" = 'Click to modify'\n"
			file.puts "    end\n"
			file.puts "    resultstr << in_place_form_editor_field( :"+table+", :"+field_name+", {}, {:rows => 1, :fieldname => '"+table+"["+field_name+"]'}) +\"<br>\"\n"
		end
	end
	file.puts "  end\n\n"


	# write edit method
	file.puts	"  def show_edit_"+table+"\n"
	file.puts "    resultstr = \"\"\n"
	#fldhash = Hash[* flds]
	flds.each_with_index do |key, i| #|field_name, display_name| 
		if (i % 2) > 0 
			next 
		end
		field_name = key
		display_name = flds[i+1]
		column = @table_names[table][field_name]
		file.puts "    resultstr << \"<p><b>"+display_name+": </b><br>\"\n"
		if column.type.to_s == "string" and column.limit > 128
			file.puts "    if @"+table+"."+field_name+" == nil or @"+table+"."+field_name+" == ''\n"
			file.puts "      @"+table+"."+field_name+" = 'Click to modify'\n"
			file.puts "    end\n"
			file.puts "    resultstr << in_place_editor_field( :"+table+", :"+field_name+", {}, :rows => 3) +\"<br>\"\n"
		elsif
			column.type.to_s == "string" and column.limit > 32
			file.puts "    if @"+table+"."+field_name+" == nil or @"+table+"."+field_name+" == ''\n"
			file.puts "      @"+table+"."+field_name+" = 'Click to modify'\n"
			file.puts "    end\n"
			file.puts "    resultstr << in_place_editor_field( :"+table+", :"+field_name+", {}, :rows => 1) +\"<br>\"\n"
		else
			file.puts "    if @"+table+"."+field_name+" == nil or @"+table+"."+field_name+" == ''\n"
			file.puts "      @"+table+"."+field_name+" = 'Click to modify'\n"
			file.puts "    end\n"
			file.puts "    resultstr << in_place_editor_field( :"+table+", :"+field_name+", {}, :rows => 1) +\"<br>\"\n"
		end
	end
	file.puts "  end\n\n"

	                   
	# write search method
	file.puts	"  def search_"+table+"\n"
	file.puts "    resultstr = \"\""
	#fldhash = Hash[* flds]
	print "\n"+table+"------>"+flds.size.to_s+"\n"
	print flds[1].to_s+"\n"
	flds.each_with_index do |key, i| #|field_name, display_name| 
		if (i % 2) > 0 
			next 
		end                   
		#x = i+1
		#print "\ni+1="+x.type.to_s+","+flds[1]
		field_name = key
		# strange errort when only 2 flds
		if flds.size > 2
			display_name = flds[i+1]
		else
			display_name = flds[1]
		end
		column = @table_names[table][field_name]                  
		file.puts "    resultstr << \"<tr><td><b>"+display_name+": </b></td>\"\n"
		file.puts "    resultstr << \"<td><input size=50 name="+table+"["+field_name+"] type=text value=\\\"\""
		file.puts "    resultstr << \"\\\" /></td></tr>\"\n"
	end
 	file.puts "  end\n\n"
	file.puts "end"
	file.close
end
