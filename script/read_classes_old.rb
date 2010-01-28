 # Run as "erb structure.erb > structure.dot & neato structure.dot -Tpng -o structure.png"
  base_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
  require(File.join(base_path, "config/environment"))
  Dir[File.join(base_path, "app/models/*.rb")].each { |lib| print lib.to_s+"\n"; require lib }

  th_format = '<td bgcolor="%s" %s><font color="white" point-size="16">%s</font></td>'

  association_styles = {
    :belongs_to => 'arrowtail=odot,color="%s"',
    :has_and_belongs_to_many => 'dirType="both",color="%s",label="%s",constraint=false'
  }

  visited_habtm = []

  models = []
  ObjectSpace.each_object(Class) do |cls|
    next unless cls < ActiveRecord::Base
    name = cls.table_name.singularize
    next if name == "session"

    models << cls
  end

  


  @table_names = {}
	@hasmany = {}
	@fields = {}
	
    for cls in models do
      name = cls.table_name.singularize

      columns = cls.column_names.sort_by do |column|
        [column == cls.primary_key ? 0 : 1, column]
      end
                                   
			# generate list of fields for each table
			array = []
			cls.content_columns.each do |column|
				array.push column.name
			end
			@fields[name] = array.reverse

      associations = cls.reflect_on_all_associations || []
  
  			# do loop to generate method stubs to fillin

				# loop to get content
				a = {}
				
        for association in associations do
          style = association_styles[association.macro]

          if @table_names[name] == nil
          	@table_names[name] = {}
          end                                                   
					print name+"->"+association.name.to_s + " = "
					print a["belongs_to => "+name+"->"+association.name.to_s]
					print "\n"
          if a["belongs_to => "+name+"->"+association.name.to_s] == nil
            print "adding "+association.macro.to_s+" --->"+name+"->"+association.name.to_s+"\n"     
						
						# add cancel commands
          	if @table_names[name]["cancel"] == nil
          		@table_names[name]["cancel"] = {}
          	end
          	str = "    if @params['internal'] == '"+association.name.to_s+"'\n"
						str +="      render :partial => \""+association.name.to_s+"/edit_contents\", :locals => {'@"+association.name.to_s.singularize+"' => "+association.name.to_s.singularize.camelize+".find(@params['pk'])}\n"
						str +="    end\n"
          	@table_names[name]["cancel"][association.name] = str						
						
						# add related strings
          	if @table_names[name]["addrelated"] == nil
          		@table_names[name]["addrelated"] = {}
          	end
          	str = "    @"+association.name.to_s.singularize+" = "+association.name.to_s.singularize.camelize+".new\n"
          	@table_names[name]["addrelated"][association.name] = str

						if @table_names[name]["searchrelatedaction"] == nil
							 @table_names[name]["searchrelatedaction"] = {}
						end
						#file.puts "add to def edit_search_action ------->searchrelatedaction-------->\n"
						#str =  "     @"+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find(@params['"++association.name.to_s+"']['id'])\n"
						#str += "     query = \"\""
						str =  "     @"+association.name.to_s+" = nil\n"
						str += "     if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
						str += "       @array = []\n"
						str += "       @params['"+association.name.to_s.singularize+"'].each do |key, val| \n"
						str += "         if val != \"\"\n"
           	str += "           if query != \"\"\n"
          	str += "             query = query + \" and \"\n"
         		str += "           end\n"
         		str += "           query = query + key + \" ilike ?\"\n" 
						str += "           @array.push(\"%\"+val+\"%\")\n"
       			str += "         end\n"
     				str += "       end\n"
						str += "       query = [query]+@array\n"
            str += "       if query == [\"\"]\n"
       			str += "         @"+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find_all\n"
     				str += "       else\n"
     				str += "         @"+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find :all, :conditions => query\n"
     				str += "       end\n"
     				str += "     end\n"
						@table_names[name]["searchrelatedaction"][association.name] = str

						
            case association.macro
              when :has_one then
							
                source_name = name
                source_port = association.options[:foreign_key] || "#{association.name}_id"
                target_name = association.table_name
                target_port = "head"
								
								if @table_names[name]["addrelatedaction"] == nil
									@table_names[name]["addrelatedaction"] = {}
								end
								#file.puts "add to def edit_new ---------->addrelatedaction------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								str += "      o = "+association.name.to_s.singularize.camelize+".new\n"
								#str += "      o.attributes = @params['"+association.name.to_s.singularize+"']"+"\n"
								str += "      o.save\n"
								str += "      @"+name+"."+association.name.to_s.singularize+" = o\n"
								str += "      @"+name+".save\n"
								str += "      render_component :controller => \""+association.name.to_s+"\", :action => \"edit\", :id => o.id, :params => {'internal' => \""+name.pluralize+"\", 'pk' => @params['id'], 'relatedtype'=> '"+association.name.to_s.singularize+"', 'level' => @params['level']}\n"
								str += "    end"
								@table_names[name]["addrelatedaction"][association.name] = str
								
								
								
								if @table_names[name]["addtolist"] == nil
									@table_names[name]["addtolist"] = {}
								end
								#file.puts "add to def edit_add_to_list_action ----------->addtolist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['"+name.to_s.singularize+"']['id'])\n"
								str += "      if @params['tags'] != nil\n"
								str += "        @"+name+"."+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find(@params['tags'][0])\n"
								str += "        @"+name+".save\n"
								str += "      end\n"
								str += "    end\n"
								#file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								@table_names[name]["addtolist"][association.name] = str    
								
								if @table_names[name]["deleterelatedaction"] == nil
									@table_names[name]["deleterelatedaction"] = {}
								end
								#file.puts "add to def edit_delete_action ------------> deletelist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['id'])\n"
								str += "      @"+name+"."+association.name.to_s+" = nil if @params['tags'] == nil \n" #"+association.name.to_s.singularize.camelize+".find(@params['id']).nil?\n"
								str += "      @"+name+".save\n"
								str += "    end\n"
								#file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								@table_names[name]["deleterelatedaction"][association.name] = str    

								if @table_names[name]["searchaction"] == nil
 									@table_names[name]["searchaction"] = {}
								end
								str =  "    array = []\n"
								str += "    if @params['"+association.name.to_s+"'] != nil and @params['"+association.name.to_s+"'] != \"\"\n"
								str += "      flash['"+association.name.to_s+"'] = @params['"+association.name.to_s+"']\n"
								str += "      for o in @"+name.to_s.pluralize+"\n"
								str += "        if o."+association.name.to_s+" != nil\n"
								str += "          if string_contains o."+association.name.to_s+".displayInfo, @params['"+association.name.to_s+"']\n"
								str += "            array = array + [o]\n"
								str += "          end\n"
								str += "        end\n"
								str += "      end\n"
								str += "      @"+name.to_s.pluralize+" = array\n"
								str += "    end\n"
								@table_names[name]["searchaction"][association.name.to_s] = str
							
              when :belongs_to then
							
                source_name = name
                source_port = association.options[:foreign_key] || "#{association.name}_id"
                target_name = association.table_name
                target_port = "head"
								
								if @table_names[name]["addrelatedaction"] == nil
									@table_names[name]["addrelatedaction"] = {}
								end
								#file.puts "add to def edit_new ---------->addrelatedaction------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								str += "      o = "+association.name.to_s.singularize.camelize+".new\n"
								#str += "      o.attributes = @params['"+association.name.to_s.singularize+"']"+"\n"
								str += "      o.save\n"
								str += "      @"+name+"."+association.name.to_s.singularize+" = o\n"
								str += "      @"+name+".save\n"
								str += "      render_component :controller => \""+association.name.to_s+"\", :action => \"edit\", :id => o.id, :params => {'internal' => \""+name.pluralize+"\", 'pk' => @params['id'], 'relatedtype'=> '"+association.name.to_s.singularize+"', 'level' => @params['level']}\n"
								str += "    end"
								@table_names[name]["addrelatedaction"][association.name] = str
								
								
								
								if @table_names[name]["addtolist"] == nil
									@table_names[name]["addtolist"] = {}
								end
								#file.puts "add to def edit_add_to_list_action ----------->addtolist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['"+name.to_s.singularize+"']['id'])\n"
								str += "      if @params['tags'] != nil\n"
								str += "        @"+name+"."+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find(@params['tags'][0])\n"
								str += "        @"+name+".save\n"
								str += "      end\n"
								str += "    end\n"
								#file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								@table_names[name]["addtolist"][association.name] = str    
								
								if @table_names[name]["deleterelatedaction"] == nil
									@table_names[name]["deleterelatedaction"] = {}
								end
								#file.puts "add to def edit_delete_action ------------> deletelist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['id'])\n"
								str += "      @"+name+"."+association.name.to_s+" = nil if @params['tags'] == nil \n" #"+association.name.to_s.singularize.camelize+".find(@params['id']).nil?\n"
								str += "      @"+name+".save\n"
								str += "    end\n"
								#file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								@table_names[name]["deleterelatedaction"][association.name] = str    

								if @table_names[name]["searchaction"] == nil
 									@table_names[name]["searchaction"] = {}
								end
								str =  "    array = []\n"
								str += "    if @params['"+association.name.to_s+"'] != nil and @params['"+association.name.to_s+"'] != \"\"\n"
								str += "      flash['"+association.name.to_s+"'] = @params['"+association.name.to_s+"']\n"
								str += "      for o in @"+name.to_s.pluralize+"\n"
								str += "        if o."+association.name.to_s+" != nil\n"
								str += "          if string_contains o."+association.name.to_s+".displayInfo, @params['"+association.name.to_s+"']\n"
								str += "            array = array + [o]\n"
								str += "          end\n"
								str += "        end\n"
								str += "      end\n"
								str += "      @"+name.to_s.pluralize+" = array\n"
								str += "    end\n"
								@table_names[name]["searchaction"][association.name.to_s] = str
																
              when :has_and_belongs_to_many then
                source_name = name
                target_name = association.options[:class_name].constantize.table_name rescue association.name
                habtm = [source_name.to_s, target_name.to_s].sort
							  if a["many_to => "+name+"->"+association.name.to_s] == nil
	                print "many_to => "+name+"->"+association.name.to_s+"\n" 
									@hasmany[name+"->"+association.name.to_s] = "yes" 
	                if @table_names[name]["addrelatedaction"] == nil
									  @table_names[name]["addrelatedaction"] = {}
								  end
								  
									
									#file.puts "add to def edit_new ------------>addrelatedaction------->\n"
								  str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								  str += "      o = "+association.name.to_s.singularize.camelize+".new\n"
								  #str += "      o.attributes = @params['"+association.name.to_s.singularize+"']"+"\n"
								  str += "      o.save\n"
								  str += "      @"+name+"."+association.name.to_s+" << o\n"
									str += "      render_component :controller => \""+association.name.to_s+"\", :action => \"edit\", :id => o.id, :params => {'internal' => \""+name.pluralize+"\", 'pk' => @params['id'], 'relatedtype'=> '"+association.name.to_s.singularize+"', 'level' => @params['level']}\n"
								  str += "    end"
								  @table_names[name]["addrelatedaction"][association.name] = str       

								  if @table_names[name]["addtolist"] == nil
								  	@table_names[name]["addtolist"] = {}
								  end
								
								#file.puts "add to def edit_add_to_list_action ----------->addtolist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['"+name.to_s.singularize+"']['id'])\n"
								str += "      if @"+name+"."+association.name.to_s+" == nil \n"
								str += "        if @params['tags'] != nil \n"
								str += "          @"+name+"."+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find(@params['tags'])\n"
								str += "        end\n"
								str += "      else\n"
								str += "        if @params['tags'] != nil \n"
								str += "          @"+name+"."+association.name.to_s+".delete(@"+name+"."+association.name.to_s+" - "+association.name.to_s.singularize.camelize+".find(@params['tags']))\n"
								str += "          @"+name+"."+association.name.to_s+" << "+association.name.to_s.singularize.camelize+".find(@params['tags']) - @"+name+"."+association.name.to_s+" \n"
								str += "        end\n"
								str += "    	end\n"
								str += "    end\n"
								#file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								@table_names[name]["addtolist"][association.name] = str   
								                                                                         
									if @table_names[name]["deleterelatedaction"] == nil
								  	@table_names[name]["deleterelatedaction"] = {}
								  end
									#file.puts "add to def edit_delete_action ----------->addtolist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['"+name.to_s.singularize+"']['id'])\n"
								str += "      if @"+name+"."+association.name.to_s+" != nil \n"
								str += "        if @params['tags'] != nil \n"
								str += "          @"+name+"."+association.name.to_s+".delete(@"+name+"."+association.name.to_s+" - "+association.name.to_s.singularize.camelize+".find(@params['tags']))\n"
								str += "        else\n"
								str += "          @"+name+"."+association.name.to_s+".delete(@"+name+"."+association.name.to_s+")\n"
								str += "    	  end\n"
								str += "    	end\n"
								str += "    end\n"
								  #file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								  @table_names[name]["deleterelatedaction"][association.name] = str
								
								if @table_names[name]["searchaction"] == nil
 									@table_names[name]["searchaction"] = {}
								end
								str =  "    array = []\n"
								str += "    if @params['"+association.name.to_s+"'] != nil and @params['"+association.name.to_s+"'] != \"\"\n"
								str += "      flash['"+association.name.to_s+"'] = @params['"+association.name.to_s+"']\n"
								str += "      for o in @"+name.to_s.pluralize+"\n"
								str += "        found = 0\n"
								str += "        for obj in o."+association.name.to_s+"\n"
								str += "          if string_contains obj.displayInfo, @params['"+association.name.to_s+"']\n"
								str += "            found = 1\n"
								str += "          end\n"
								str += "        end\n"
								str += "        if found > 0\n"
								str += "          array = array + [o]\n"
								str += "        end\n"
								str += "      end\n"
								str += "      @"+name.to_s.pluralize+" = array\n"
								str += "    end\n"
								@table_names[name]["searchaction"][association.name.to_s] = str 
								
								  #a.store("many_to => "+name+"->"+association.name.to_s,"")
							  end
							  
						  when :has_many then
							  print "\n----------------------"+association.name.to_s
							  print "\n----------------------"+association.name.to_s.singularize
							  print "\n----------------------"+association.name.to_s
							  print "\n\n"
                source_name = name
							  if a["has_many => "+name+"->"+association.name.to_s] == nil
								  print "has_many => "+name+"->"+association.name.to_s+"\n"
									@hasmany[name+"->"+association.name.to_s] = "yes"

								  if @table_names[name]["addrelatedaction"] == nil
								    @table_names[name]["addrelatedaction"] = {}
								  end
									#file.puts "add to def edit_new ------------>addrelatedaction------->\n"
								  str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								  str += "      o = "+association.name.to_s.singularize.camelize+".new\n"
								  #str += "      o.attributes = @params['"+association.name.to_s.singularize+"']"+"\n"
								  str += "      o.save\n"
								  str += "      @"+name+"."+association.name.to_s+" << o\n"
									str += "      render_component :controller => \""+association.name.to_s+"\", :action => \"edit\", :id => o.id, :params => {'internal' => \""+name.pluralize+"\", 'pk' => @params['id'], 'relatedtype'=> '"+association.name.to_s.singularize+"', 'level' => @params['level']}\n"
								  str += "    end"
								  @table_names[name]["addrelatedaction"][association.name] = str       

								  if @table_names[name]["addtolist"] == nil
								  	@table_names[name]["addtolist"] = {}
								  end
								
								#file.puts "add to def edit_add_to_list_action ----------->addtolist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['"+name.to_s.singularize+"']['id'])\n"
								str += "      if @"+name+"."+association.name.to_s+" == nil \n"
								str += "        @"+name+"."+association.name.to_s+" = "+association.name.to_s.singularize.camelize+".find(@params['tags'])\n"
								str += "      else\n"
								str += "        @"+name+"."+association.name.to_s+".delete(@"+name+"."+association.name.to_s+" - "+association.name.to_s.singularize.camelize+".find(@params['tags']))\n"
								str += "        @"+name+"."+association.name.to_s+" << "+association.name.to_s.singularize.camelize+".find(@params['tags']) - @"+name+"."+association.name.to_s+" \n"
								str += "    	end\n"
								str += "    end\n"
								#file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								@table_names[name]["addtolist"][association.name] = str   
								                                                                         
									if @table_names[name]["deleterelatedaction"] == nil
								  	@table_names[name]["deleterelatedaction"] = {}
								  end
									#file.puts "add to def edit_delete_action ----------->addtolist-------->\n"
								str =  "    if @params[\"relatedtype\"] == \""+association.name.to_s.singularize+"\"\n"
								#str += "      @"+name.to_s+" = "+name.to_s.singularize.camelize+".find(@params['"+name.to_s.singularize+"']['id'])\n"
								str += "      if @"+name+"."+association.name.to_s+" != nil \n"
								str += "        if @params['tags'] != nil \n"
								str += "          @"+name+"."+association.name.to_s+".delete(@"+name+"."+association.name.to_s+" - "+association.name.to_s.singularize.camelize+".find(@params['tags']))\n"
								str += "        else\n"
								str += "          @"+name+"."+association.name.to_s+".delete(@"+name+"."+association.name.to_s+")\n"
								str += "    	  end\n"
								str += "    	end\n"
								str += "    end\n"

								  #file.puts "  redirect_to :action => 'edit', :id => @"+name+".id\n"
								  @table_names[name]["deleterelatedaction"][association.name] = str
								
								if @table_names[name]["searchaction"] == nil
 									@table_names[name]["searchaction"] = {}
								end
								str =  "    array = []\n"
								str += "    if @params['"+association.name.to_s+"'] != nil and @params['"+association.name.to_s+"'] != \"\"\n"
								str += "      flash['"+association.name.to_s+"'] = @params['"+association.name.to_s+"']\n"
								str += "      for o in @"+name.to_s.pluralize+"\n"
								str += "        found = 0\n"
								str += "        for obj in o."+association.name.to_s+"\n"
								str += "          if string_contains obj.displayInfo, @params['"+association.name.to_s+"']\n"
								str += "            found = 1\n"
								str += "          end\n"
								str += "        end\n"
								str += "        if found > 0\n"
								str += "          array = array + [o]\n"
								str += "        end\n"
								str += "      end\n"
								str += "      @"+name.to_s.pluralize+" = array\n"
								str += "    end\n"
								@table_names[name]["searchaction"][association.name.to_s] = str 
                
								  #a.store("has_many => "+name+"->"+association.name.to_s, "")
							  end
              else
                print "Ignored #{association.inspect}"
              next
            end

          	a.store("belongs_to => "+name+"->"+association.name.to_s,"")
          end

      
       end 
     end 
		 
		
		 #  write files 
     @table_names.each do |name, name_value|
			
			#print "\nclass "+name.camelize+"------------->"
			Dir.mkdir("temp/"+name)
			
			# write field names
			#file = File.new("temp/"+name+"/"+name+"_fields.txt", "w")
			
			#@fields[name].each {|fld| file.puts fld+":"+fld.humanize+"\n"}
			#file.close
			
			file = File.new("temp/"+name+"/"+name.pluralize+"_controller.rb", "w")
	
			file.puts "class "+name.camelize.pluralize+"Controller < ApplicationController\n"
			file.puts "  layout 'stgall'\n"
			file.puts "  helper :habtm\n"
			file.puts "  helper :sort\n"
			file.puts "  include SortHelper\n\n"

			name_value["deleterelatedaction"].each do |title, value|
				file.puts "  helper :"+title.to_s.pluralize+"\n"
			end
			
			file.puts "\n  def index\n"
			file.puts "    list\n"
			file.puts "    render :action => 'list'\n"
			file.puts "  end\n\n"
			
			file.puts "  def list\n"
			file.puts "    sort_init 'id'\n"
			file.puts "    sort_update\n"
			file.puts "    if @params['items_per_page'] != nil\n"
			file.puts "      items_per_page = @params['items_per_page'].to_i\n"
			file.puts "    else\n"
			file.puts "      items_per_page = 10\n"
			file.puts "    end\n"
			file.puts "    @"+name+"_pages, @"+name.pluralize+" = paginate :"+name+", :per_page => items_per_page, :order_by => sort_clause\n"
			file.puts "    if @"+name+"_pages.item_count != 0\n"
			file.puts "      @pages = (@"+name+"_pages.item_count.to_f / items_per_page.to_f).ceil\n"
			file.puts "      @current_page = (@"+name+"_pages.current.first_item.to_f / @"+name+"_pages.item_count.to_f * @pages).ceil\n"
   		file.puts "    else\n"
			file.puts "      @pages = 0\n"
			file.puts "      @current_page = 0\n"
			file.puts "    end\n"
			file.puts "  end\n\n"
			
			file.puts "  def show\n"
			file.puts "    @"+name+" = "+name.camelize+".find(params[:id])\n"
			file.puts "  end\n\n"
			
			file.puts "  def new\n"
			file.puts "    @"+name+" = "+name.camelize+".new\n"
			file.puts "    @"+name+".save\n"
			file.puts "    meta = Meta.new"
			file.puts "    meta.save"
			file.puts "    @"+name+".meta = meta"
			file.puts "    redirect_to :action => 'edit', :id => @"+name+".id, :params => {'new' => 'true'}\n"
			file.puts "  end\n\n"
			
			file.puts "  def create\n"
			file.puts "    if(@params['internal'] != nil)\n"
  		file.puts "      @divname = '"+name+"_internal'\n"
  		file.puts "    else\n"
			file.puts "    	@divname = '"+name+"'\n"
			file.puts "    end\n"
			file.puts "    if @params['level'] != nil\n"
      file.puts "      @params['level'] = (@params['level'].to_i + 1).to_s\n"
    	file.puts "    else\n"
    	file.puts "      @params['level'] = '1'\n"
    	file.puts "    end\n"
			file.puts "    @"+name+" = "+name.camelize+".new(params[:"+name+"])\n"
			file.puts "    if @"+name+".save\n"
			file.puts "      flash[:notice] = '"+name.camelize+" was succesfully created.'\n"
			file.puts "      redirect_to :action => 'list'\n"
			file.puts "    else\n"
			file.puts "      render :action => 'new'\n"
			file.puts "    end\n"
			file.puts "  end\n\n"

			file.puts "  def edit\n"
			file.puts "    if(@params['internal'] != nil)\n"
  		file.puts "      @divname = '"+name+"_internal'\n"
  		file.puts "    else\n"
			file.puts "    	@divname = '"+name+"'\n"
			file.puts "    end\n"
			file.puts "    if @params['level'] != nil\n"
      file.puts "      @params['level'] = (@params['level'].to_i + 1).to_s\n"
    	file.puts "    else\n"
    	file.puts "      @params['level'] = '1'\n"
    	file.puts "    end\n"
			file.puts "    @"+name+" = "+name.camelize+".find(params[:id])\n"
			file.puts "    render_without_layout if @params['internal'] != nil\n"
			file.puts "  end\n\n"
			
			file.puts "  def update\n"
			file.puts "    @"+name+" = "+name.camelize+".find(params[:id])\n"
			file.puts "    if @session[:user] != nil\n"
			file.puts "      @"+name+".last_modified_by = @session[:user].login\n"
			file.puts "    end\n"
			file.puts "    @"+name+".last_modified_date = Time.now\n"
			file.puts "    if @"+name+".history == nil\n"
			file.puts "      @"+name+".history = @session[:user].login + \" [\"+Time.now.to_s+\"]\n\"\n"
			file.puts "    else\n"
			file.puts "    	@"+name+".history += @session[:user].login + \" [\"+Time.now.to_s+\"]\n\"\n"
			file.puts "    end\n"
			file.puts "   @"+name+".meta.update_attributes(params[:meta])"

			file.puts "    if @"+name+".update_attributes(params[:"+name+"])"
			file.puts "      flash[:notice] = '"+name.camelize+" was succesfully created.'\n"
			file.puts "      if @params['internal'] != nil and @params['internal'] != ''\n"
			name_value["deleterelatedaction"].each do |title, value|
				file.puts "        if @params['internal'] == '"+title.to_s.pluralize+"'\n"
				file.puts "          render :partial => \""+title.to_s.pluralize+"/edit_contents\",:locals => {'@"+title.to_s.singularize+"' => "+title.to_s.singularize.camelize+".find(@params['pk'])}"
				file.puts "        end\n"
			end
			#file.puts "        redirect_to :controller => @params['internal'], :action => 'edit', :id => @params['pk']\n"
			file.puts "      else\n"
			file.puts "        redirect_to :action => 'show', :id => @"+name+"\n"
			file.puts "      end\n"
			file.puts "    else\n"
			file.puts "      render :action => 'edit'\n"
			file.puts "    end\n"
			file.puts "  end\n\n"

			file.puts "  def destroy\n"
			file.puts "    "+name.camelize+".find(params[:id]).destroy\n"
			file.puts "    if @session['return_to'].include?('/list') or @session['return_to'].include?('/searchaction')\n"
			file.puts "      redirect_to @session['return_to']  #:action => 'list'\n"
			file.puts "    else\n"
			file.puts "      redirect_to @session['previous_page']\n"
			file.puts "    end\n"
			file.puts "  end\n\n"



			file.puts "\n  def cancel\n"
			file.puts "    if(@params['internal'] != nil)\n"
			file.puts "      "+name.camelize+".find(@params['id']).destroy unless @params['id'] == nil\n"
			name_value["cancel"].each_value do |value|
				file.puts value
			end
			file.puts "     if @params['internal'] == '"+name.pluralize+"'\n"
      file.puts "       render :partial => '"+name.pluralize+"/edit_contents', :locals => {'@"+name+"' => "+name.camelize+".find(@params['pk'])}\n"
    	file.puts "     end\n"
			#file.puts "      render :partial => \""+name.singularize+"/edit_contents\", :locals => {'@"+name.singularize+"' => @"+name.singularize+"}"
			#file.puts "      redirect_to :controller => @params['internal'], :action => \"edit\", :id => @params['pk']\n"
			file.puts "    else\n"
			file.puts "      "+name.camelize+".find(@params['id']).destroy unless @params['new'] == nil\n"
			file.puts "      if @session['previous_page'] != 'invalid' and @session['previous_page'] != nil\n"
			file.puts "      	redirect_to @session['previous_page']\n"
			file.puts "      else\n"
			file.puts "        redirect_to $home_page\n"
			file.puts "      end\n"
			file.puts "    end\n"
			file.puts "  end\n"

			# addrelatedaction method
			file.puts "\n  def edit_new\n"  #addrelatedaction\n"
			file.puts "    if @params['internal'] != nil\n"
			file.puts "      internal = @params['internal']\n"
			file.puts "    else\n"
			file.puts "      internal = \""+name+"\"\n"
			file.puts "    end\n"
			file.puts "    if @params['level'] != nil\n"
			file.puts "      level = @params['level'].to_i + 1\n"
			file.puts "    else\n"
			file.puts "    	 level = '2'\n"
			file.puts "    end\n"
			file.puts "    @"+name+" = "+name.camelize+".find(@params['id'])\n"
			name_value["addrelatedaction"].each_value do |value|
				file.puts value
			end
			#file.puts "    redirect_to(:action => 'edit', :id => @params['"+name+"']['id'])\n"
			file.puts "  end\n"
      
			# deleteelated method
			file.puts "\n  def edit_delete\n"
			file.puts "    if @params['level'] != nil\n"
			file.puts "      @params['level'] = @params['level'].to_i + 1\n"
			file.puts "    else\n"
			file.puts "    	@params['level'] = '3'\n"
			file.puts "    end\n"			
			file.puts "    @"+name+" = "+name.camelize+".find(@params['id'])\n"
			file.puts "    render_without_layout\n"
			file.puts "  end\n"

			# deleterelatedaction method
			file.puts "\n  def edit_delete_action\n"
			file.puts "    @"+name+" = "+name.camelize+".find(@params['id'])\n"
			name_value["deleterelatedaction"].each_value do |value|
			 	file.puts value
			end
			file.puts "    render_partial \"edit_contents\"\n"
			#file.puts "    redirect_to(:action => 'edit', :id => @params['"+name+"']['id'])\n"
			file.puts "  end\n"
			      
			# searchrelated	method
			file.puts "\n  def edit_search\n"
			file.puts "    if @params['level'] != nil\n"
			file.puts "      @params['level'] = @params['level'].to_i + 1\n"
			file.puts "    else\n"
			file.puts "    	@params['level'] = '3'\n"
			file.puts "    end\n"			
			file.puts "      @"+name+" = "+name.camelize+".find(@params['id'])\n"
			file.puts "      render_without_layout\n"
			file.puts "  end\n"
	
			# searchrelatedaction method
			file.puts "\n  def edit_search_action\n"
			file.puts "    @"+name+" = "+name.camelize+".find(@params['"+name+"']['id'])\n"
			file.puts "    query = \"\""
			name_value["searchrelatedaction"].each_value do |value|
				file.puts value
			end
			file.puts "    render_without_layout\n"
			file.puts "  end\n"

			# addtolistaction method
			file.puts "\n  def edit_add_to_list_action\n"
			file.puts "    @"+name+" = "+name.camelize+".find(@params['id'])\n"
			name_value["addtolist"].each_value do |value|
				file.puts value
			end
			file.puts "    render_partial 'edit_contents'\n"
			#file.puts "    redirect_to(:action => 'edit', :id => @params['"+name+"']['id'])\n"
			file.puts "  end\n"
			                      
			# search method
			file.puts "\n  def search\n"
			file.puts "      @"+name+" = "+name.camelize+".new\n"
			file.puts "  end\n"
			               
			# searchaction method
			file.puts "\n  def searchaction\n"
			file.puts "      sort_init 'id'\n"
			file.puts "      sort_update\n"
			file.puts "      vals=\"\"\n"
			file.puts "      query=\"\"\n"
			file.puts "      if @params['query']\n"
			file.puts "        @query = buildquery(@params[\"query\"])\n"
			file.puts "        query = buildquery(@params[\"query\"])\n"
		  file.puts "        flash[\"query\"] = @params[\"query\"]\n"
	    file.puts "      else\n"
      file.puts "        if @params['"+name+"'] != nil\n"
			file.puts "          @array = []\n"
    	file.puts "          @params['"+name+"'].each do |key, val| \n"
      file.puts "            if val != \"\" and val != nil\n"
      file.puts "              if query != \"\"\n"
      file.puts "                query = query + \" and \"\n"
      file.puts "                vals = vals + \",\"\n"
      file.puts "              end\n"
      file.puts "              query = query + key + \" ilike ?\"\n" 
			file.puts "              @array.push(\"%\"+val+\"%\")\n"
      file.puts "              vals = vals + key + \":\" + val \n"
      file.puts "            end\n"
    	file.puts "          end\n"
			file.puts "          query = [query]+@array\n"
      file.puts "        end\n"
	    file.puts "      end\n"
			str = "if query == [\"\"]"
			name_value["searchaction"].each do |title,value|
				str += " and (@params['"+title+"'] == nil or @params['"+title+"'] == \"\")"
			end
			file.puts "      "+str+"\n"
			file.puts "        @"+name+"_pages, @"+name.pluralize+" = paginate :"+name.pluralize+", :order_by => sort_clause"
			file.puts "        render_action 'list'\n"
			file.puts "      else\n"
			file.puts "        if query == [\"\"\] or query = \"\""
			file.puts "          @"+name.pluralize+" = "+name.camelize+".find :all, :order => sort_clause\n"
			file.puts "        else"
			file.puts "          @"+name.pluralize+" = "+name.camelize+".find :all, :conditions => query, :order => sort_clause\n"
			file.puts "        end\n"
			name_value["searchaction"].each_value do |value|
				file.puts value
			end
			file.puts "           if vals == \"\"\n"
			file.puts "             vals = @params[\"query\"]\n"
      file.puts "           end\n"
			file.puts "           #  ---------  build custom paginator to handle extra queries -----------------\n"
			file.puts "           if @params['items_per_page'] != nil\n"
			file.puts "             items_per_page = @params['items_per_page'].to_i\n"
			file.puts "           else\n"
			file.puts "             items_per_page = 10\n"
			file.puts "           end\n"
      file.puts "           @"+name+"_pages = Paginator.new self, @"+name.pluralize+".length(), items_per_page, @params['page']\n"
			file.puts "           if @"+name+"_pages.item_count != 0\n"
			file.puts "             @pages = (@"+name+"_pages.item_count.to_f / items_per_page.to_f).ceil\n"
			file.puts "             @current_page = (@"+name+"_pages.current.first_item.to_f / @"+name+"_pages.item_count.to_f * @pages).ceil\n"
			file.puts "           else\n"
			file.puts "             @pages = 0\n"
			file.puts "             @current_page = 0\n"
			file.puts "           end\n"
      file.puts "           @offset = 0\n"
			file.puts "           if (@params['page'] != nil) \n"
			file.puts "             @offset = (@params['page'].to_i - 1) * 10\n"
			file.puts "           end\n"
			file.puts "           @"+name.pluralize+" = @"+name.pluralize+"[@offset,items_per_page] if @"+name.pluralize+"[@offset,items_per_page] != nil\n"
			file.puts "           # -----------------------------------------------------------------------------\n"
      file.puts "           flash[\"query\"] = vals\n"
			file.puts "           flash[\"existingquery\"] = @params[\"query\"]\n"
      file.puts "           render_action 'list'\n"
      file.puts "         end\n" 
			file.puts "  end\n"
			file.puts "end"
							
			file.close          
			
			# write addrelated file
			file = File.new("temp/"+name+"/addrelated.rhtml", "w") 
			file.puts "<h1>"+name.humanize+":</h1>\n"
			file.puts "<%= show_"+name+"() %>\n"
			file.puts "<hr />\n"
			file.puts "<%= form_tag({:action => 'addrelatedaction', :params => {:internal => @params['internal'], :pk => @params['pk']}}, :name => \"addrelated\") %>\n"
			file.puts "<%= link_to_function(image_tag(\"add_up.gif\", :size => \"87x19\", :border => 0, :alt => \"add\", :name => \"add1\"), \"document.addrelated.submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('add1','','/images/add_down.gif',1);\"}) %>"
			file.puts "<%= link_to image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back1\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back1','','/images/back_down.gif',1);\"%>"
			name_value["addrelatedaction"].each do |title, value|
				file.puts "<% if @params[\"relatedtype\"] == \""+title.to_s.singularize+"\" %>\n"
				file.puts "  <h3>Add "+title.to_s.humanize+":</h3>\n"
				file.puts "   <%= edit_"+title.to_s.singularize+" %><br><br>\n"
				file.puts "   <input type=hidden name=type value="+title.to_s.singularize+" />\n"
				file.puts "<% end %>\n"
				
			end
			file.puts "<input type=\"hidden\" name=\""+name+"[id]\" value=\"<%= @params[\"id\"] %>\"/> \n"
			#file.puts "<input type=\"submit\" value=\"Add\" />\n"
			file.puts "<%= link_to_function(image_tag(\"add_up.gif\", :size => \"87x19\", :border => 0, :alt => \"add\", :name => \"add\"), \"document.addrelated.submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('add','','/images/add_down.gif',1);\"}) %>"
			file.puts "<%= link_to image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back','','/images/back_down.gif',1);\"%>"
			#file.puts "<%= link_to image_tag(\"back\", :size => \"80x21\", :border => 0), :action => 'edit', :id => @"+name+".id %>\n"
			file.puts "<%= end_form_tag %>\n"

			file.close

			# write deleterelated file
			file = File.new("temp/"+name+"/edit_delete.rhtml", "w") 
			name_value["deleterelatedaction"].each do |title, value|
				file.puts "<% if @params[\"relatedtype\"] == \""+title.to_s.singularize+"\" %>\n"
				file.puts "  <div id=\""+name+"_"+title.to_s.pluralize+"\">\n"
				file.puts "  <%= form_remote_tag(:update => \""+name+"_"+title.to_s.pluralize+"\", :url => {:controller => \""+name.pluralize+"\", :action => 'edit_delete_action', :id => @params['id'], :params => {:internal => @params['internal'], :pk => @params['pk']}}, :name => \"deleterelated\") %>\n"
				file.puts "  <h3>Uncheck "+title.to_s.humanize+" to Remove:</h3>\n"
				file.puts "  <%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \""+name+"deleteupdate1\"), \"b = confirm('Are you sure?'); if (b) {if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit(); }}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"deleteupdate1','','/images/update_down.gif',1);\"}) %>"
			file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"querycancel\"+@params['level'].to_s), {:update => '"+name+"_"+title.to_s.pluralize+"',  :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :params => {:pk => @params[:id], 'internal' => '"+name.pluralize+"', 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"querycancel\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%><br>\n"
				if @hasmany[name+"->"+title.to_s] != nil
					file.puts "  <% if @"+name+"."+title.to_s.pluralize+".size > 10 %>\n"
				  file.puts "    <div id=\"scrollwindow\" style=\"width:600;height:200;background-color:e6e6e6;overflow:auto\">\n"
				  file.puts "  <% end %>\n"
					file.puts "   <% if @"+name+"."+title.to_s.pluralize+" != nil %>\n"
					file.puts "     <p><%= build_checklist_group(@"+name+"."+title.to_s.pluralize+",@"+name+"."+title.to_s.pluralize+") %></p>\n"
					file.puts "   <% else %>\n"
					file.puts "     <p><%= build_checklist_group(@"+name+"."+title.to_s.pluralize+") %></p>\n"
					file.puts "   <% end %>"
					file.puts "  <% if @"+name+"."+title.to_s.pluralize+".size > 10 %>\n"
				  file.puts "  </div>\n"
					file.puts "<% end %>\n"
				else
					file.puts "   <% if @"+name+"."+title.to_s+" != nil %>\n"
					#file.puts "     a = [@"+name+"."+title.to_s+"]\n"
					file.puts "     <p><%= build_checklist_group([@"+name+"."+title.to_s+"],[@"+name+"."+title.to_s+"]) %></p>\n"	
					file.puts "   <% else %>\n"			
					#file.puts "     <p><%= build_checklist_group([@"+name+"."+title.to_s+"]) %></p>\n"	
					file.puts "   <% end %>\n"			
				end
				file.puts "   <input type=hidden name=relatedtype value="+title.to_s.singularize+" />\n"
				file.puts "  <%= end_form_tag %>\n"
				#file.puts "<% end %>\n"
			#end
			#file.puts "<% if @params['internal'] == nil %>\n"
 			file.puts "  <%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \""+name+"deleteupdate2\"), \"b = confirm('Are you sure?'); if (b) {if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit(); }}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"deleteupdate2','','/images/update_down.gif',1);\"}) %>"
			#file.puts "  <%= link_to image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back','','/images/cancel_down.gif',1);\"%>"
			file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"querycancel0\"+@params['level'].to_s), {:update => '"+name+"_"+title.to_s.pluralize+"',  :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :params => {:pk => @params[:id], 'internal' => '"+name.pluralize+"', 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"querycancel0\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%><br>\n"

			#file.puts "<% else %>\n"
			#file.puts "  <%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \"deleteupdate2\"), \"b = confirm('Are you sure?'); if (b) {if(document.forms[\"+@params['level']+\"].onsubmit()) { document.forms[\"+@params['level']+\"].submit(); }}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('deleteupdate2','','/images/update_down.gif',1);\"}) %>"
			#file.puts "<% end %>\n"
			#file.puts "<%= link_to image_tag(\"back\", :size => \"80x21\", :border => 0), :action => 'edit', :id => @"+name+".id %>\n"
			file.puts "  </div>\n"
			file.puts "<% end %>"
			end
			file.close

			# write edit file
			file = File.new("temp/"+name+"/edit.rhtml", "w") 
			file.puts "<SCRIPT language=\"javascript\">document.header.mode=\"edit\";</SCRIPT>\n"
			#file.puts "<% if @params['internal'] != nil %>\n"
			#file.puts "<div class=\"internal\">\n"
			#file.puts "<% end %>\n"
			#file.puts "<div id=\"complete_"+name+"\">\n"
			file.puts "<%= tag \"div\", {:id => @divname } %>\n"
			#file.puts "<div id=\""+name+"\">\n"
			file.puts "<h1>Editing "+name.humanize+"</h1>\n"
			file.puts "<%= error_messages_for '"+name+"' %>\n"
			file.puts "<% if @params['internal'] == nil or @params['internal'] == ''%>\n"
			file.puts "  <%= form_tag({:controller => \""+name.pluralize+"\", :action => \"update\"}, :name => \"edit"+name+"\")  %>\n"
			file.puts "<% else %>\n"
			file.puts "  <%= form_remote_tag(:update => @divname, :complete => \"new Effect.Fade('\"+@divname+\"search_"+name+"');new Effect.Fade('\"+@divname+\"update_"+name+"');\", :url => {:controller => '"+name.pluralize+"', :action => 'update', :id => @params[:id], :params => {:internal => @params['internal'], :pk => @params['pk'], 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}})  %>\n"
			file.puts "<% end %>\n"
			file.puts "<%= image_submit_tag \"update_up.gif\", :size => \"87x19\", :border => 0 %>\n"
			#file.puts "<%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \""+name+"update1\"+@params['level'].to_s), \"document.forms[\"+@params['level'].to_s+\"].submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"update1\"+@params['level'].to_s+\"','','/images/update_down.gif',1);\"}) %>"
						file.puts "<% if @params['internal'] != nil %>\n"
			file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"cancel0\"+@params['level'].to_s), {:update => @divname, :complete => \"new Effect.Fade('\"+@divname+\"search_"+name+"');new Effect.Fade('\"+@divname+\"update_"+name+"');\", :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :id => @params[:id], :params => {:internal => @params['internal'], :pk => @params['pk'], 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"cancel0\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%>"
			file.puts "<% else %>\n"
			file.puts "  <%= link_to image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"Cancel\", :name => \"cancelz\"), {:controller => '"+name.pluralize+"', :action => 'cancel', :id => @params[:id], :params => {'new' => @params['new']}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('cancelz','','/images/cancel_down.gif',1);\", :confirm => \"Abandon any changes?\"%>\n"
			file.puts "<% end %>\n"

			
			#file.puts "<%= link_to image_tag(\"show_up.gif\", :size => \"87x19\", :border => 0, :alt => \"show\", :name => \"show1\"), {:action => 'show', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('show1','','/images/show_down.gif',1);\"%>"

			str = "@params[\"query\"] != nil"
			name_value['addrelated'].each_key do |key|
				str += " or @params['"+key.to_s+"'] != nil"
			end
			file.puts "<% if "+str+" %>\n"
			str = " :query => @params['query']"
			name_value['addrelated'].each_key do |key|
			 str += ", :"+key.to_s+" => @params['"+key.to_s+"'] "
			end
			file.puts "<%= link_to image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back1\"), {:action => 'searchaction', :params => {"+str+"}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back1','','/images/back_down.gif',1);\"%>"
			file.puts "<% end %>"
			
			
			file.puts "<%= edit_"+name+" %>\n"
			file.puts "<input type=\"hidden\" name=\"id\" value=\"<%= @params[\"id\"] %>\"/>\n"
			file.puts "<input type=\"hidden\" name=\"internal\" value=\"<%= @params['internal'] %>\">\n"
			file.puts "<input type=\"hidden\" name=\"pk\" value=\"<%= @params['pk'] %>\">\n"
			
			file.puts "<p><%= image_submit_tag \"update_up.gif\", :size => \"87x19\", :border => 0 %>\n"
			
			#file.puts "<%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \""+name+"update2\"+@params['level'].to_s), \"document.forms[\"+@params['level'].to_s+\"].submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"update2\"+@params['level'].to_s+\"','','/images/update_down.gif',1);\"}) %>"
			file.puts "<% if @params['internal'] != nil %>\n"
			file.puts "<%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"cancel2\"+@params['level'].to_s), {:update => @divname, :complete => \"new Effect.Fade('\"+@divname+\"search_"+name+"');new Effect.Fade('\"+@divname+\"update_"+name+"');\", :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :id => @params[:id], :params => {:internal => @params['internal'], :pk => @params['pk'], 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"cancel2\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%>"
			file.puts "<% else %>\n"
			file.puts "  <%= link_to image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"Cancel\", :name => \"cancelzw\"), {:controller => '"+name.pluralize+"', :action => 'cancel', :id => @params[:id], :params => {'new' => @params['new']}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('cancelzw','','/images/cancel_down.gif',1);\", :confirm => \"Abandon any changes?\"%>\n"
			file.puts "<% end %>\n<p>\n"

			str = "@params[\"query\"] != nil"
			name_value['addrelated'].each_key do |key|
				str += " or @params['"+key.to_s+"'] != nil"
			end
			file.puts "<% if "+str+" %>\n"
			str = " :query => @params['query']"
			name_value['addrelated'].each_key do |key|
			 str += ", :"+key.to_s+" => @params['"+key.to_s+"'] "
			end
			file.puts "<%= link_to image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back\"), {:action => 'searchaction', :params => {"+str+"}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back','','/images/back_down.gif',1);\"%>"
	 		#file.puts "  <%= link_to image_tag(\"back\", :size => \"80x21\", :border => 0), { :action => \"searchaction\", :params => {"+str+"}} %>\n"
			file.puts "<% end %>\n"
			
			file.puts "<%= end_form_tag %>\n"
			file.puts "</div>\n"
			file.puts "<%= tag \"div\", {:id => @divname+\"search_"+name+"\" } %>\n"
			#file.puts "<div id=\"search_"+name+"\">"
			name_value['addrelated'].each_key do |key|
				file.puts "<% if @params['internal'] == nil  or @params['internal'] != \""+key.to_s.pluralize+"\" %>\n"
				file.puts "<p><b>"+key.to_s.humanize+": </label></b>\n"
        file.puts "<%= link_to_remote image_tag(\"magnify.gif\", :size => \"16x16\", :border => 0), :update => \""+name+"_"+key.to_s.pluralize+"\", :url => {:controller => \""+name.pluralize+"\", :action => \"edit_search\", :id => @params[\"id\"], :params => {:level => @params['level'], :relatedtype => \""+key.to_s.singularize+"\", :internal => @params['internal']}} %>\n"
				file.puts "<% if @params['internal'] == nil %>\n"
				file.puts "  <% if @params['internal'] != \""+key.to_s.pluralize+"\" %>\n"
        file.puts "    <%= link_to_remote image_tag(\"plus.gif\", :size => \"16x16\", :border => 0), :update => \""+name+"_"+key.to_s.pluralize+"\", :url => {:controller => \""+name.pluralize+"\", :action => \"edit_new\", :id => @params[\"id\"], :params => {:level => @params['level'], :relatedtype => \""+key.to_s.singularize+"\", :internal => @params['internal']}} %>\n"
        file.puts "  <% end %>\n"
				file.puts "<% end %>\n"
				file.puts "<%= link_to_remote image_tag(\"minus.gif\", :size => \"16x16\", :border => 0), :update => \""+name+"_"+key.to_s.pluralize+"\", :url => {:controller => \""+name.pluralize+"\", :action => \"edit_delete\", :id => @params[\"id\"], :params => {:level => @params['level'], :relatedtype => \""+key.to_s.singularize+"\", :internal => @params['internal']}} %>\n"
				file.puts "<br />\n"
				file.puts "<div id=\""+name+"_"+key.to_s.pluralize+"\" class=\"internal\">\n"
				# ------------ check #hasmany for loop, nil doesn't work for belongs to -------------
				# @hasmany[name+"->"+key.to_s]            
				if @hasmany[name+"->"+key.to_s] != nil
					file.puts "<% if @"+name+"."+key.to_s+" != nil %>\n"
					file.puts "  <% for o in @"+name+"."+key.to_s+" %>\n"
					file.puts "    <%= o.displayInfo %><br>\n"
					file.puts "  <% end %>\n"
					file.puts "<% end %>\n"
				else
					file.puts "<% if !@"+name+"."+key.to_s+".nil? %>\n"
					file.puts "  <%= @"+name+"."+key.to_s+".displayInfo %>\n"
					file.puts "<% end %>\n"
				end
				file.puts "</div>\n"
				file.puts "<% end %>\n"
				file.puts "</p>\n"
			end
			file.puts "</div>"
			file.close
			
			# write search file
			file = File.new("temp/"+name+"/search.rhtml", "w") 
			file.puts "<h1>Search "+name.humanize+"</h1>\n"   
			file.puts "<%= form_tag({:action => \"searchaction\"}, :name => \"searchform\")  %>\n"   
			#file.puts "  <input type=\"submit\" value=\"Search\" />\n" 
			file.puts "<%= link_to_function(image_tag(\"search_up.gif\", :size => \"87x19\", :border => 0, :alt => \"search\", :name => \"search1\"), \"document.searchform.submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('search1','','/images/search_down.gif',1);\"}) %>"
			file.puts "  <table>"
			file.puts "  <%= search_"+name+" %>\n"
			name_value["searchrelatedaction"].each_key do |key| 
				file.puts "  <tr><td><b><label>"+key.to_s.humanize+":</label></b></td>\n"
				file.puts "  <td><input name=\""+key.to_s+"\" size=50 type=text value=\"\" /></td></tr>\n"
			end
			file.puts "  </table>"
			file.puts "  <input type=\"hidden\" name=\""+name+"[id]\" value=\"<%= @params[\"id\"] %>\"/> \n"
 			#file.puts "  <input type=\"submit\" value=\"Search\" />\n"
			file.puts "<%= link_to_function(image_tag(\"search_up.gif\", :size => \"87x19\", :border => 0, :alt => \"search\", :name => \"search2\"), \"document.searchform.submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('search2','','/images/search_down.gif',1);\"}) %>"   
			file.puts "<%= end_form_tag %>\n"  
			#file.puts "</div>\n"  
			file.close
			
			# write searchrelated file
			file = File.new("temp/"+name+"/edit_search.rhtml", "w") 
			#file.puts "<center>\n"
			name_value["searchrelatedaction"].each_key do |key| 
				file.puts "<% if @params['relatedtype'] == \""+key.to_s.singularize+"\" %>\n"
				file.puts "  <div id=\""+name+"_"+key.to_s.pluralize+"\">\n"
				file.puts "  <%= form_remote_tag(:update => \""+name+"_"+key.to_s.pluralize+"\", :url => {:controller => \""+name.pluralize+"\", :action => \"edit_search_action\", :id => @params['id'], :params => {:level => @params['level'], :internal => @params['internal'], :pk => @params['pk']}}, :name => \"searchrelated\")  %>\n"   
				file.puts "    <h3>Find "+key.to_s.humanize+":</h3>\n"
				#file.puts "<% if @params['internal'] == nil %>\n"
				file.puts "  <%= link_to_function(image_tag(\"search_up.gif\", :size => \"87x19\", :border => 0, :alt => \"search\", :name => \""+name+"search1\"+@params['level'].to_s), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();} \", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"search1\"+@params['level'].to_s+\"','','/images/search_down.gif',1);\"}) %>"
				#file.puts "<%= link_to image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back1\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back1','','/images/cancel_down.gif',1);\"%><br>"  
				file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"querycancel0\"+@params['level'].to_s), {:update => '"+name+"_"+key.to_s.pluralize+"',  :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :params => {:pk => @params[:id], 'internal' => '"+name.pluralize+"', 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"querycancel0\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%><br>\n"
				#file.puts "<% else %>\n"
				#file.puts "  <%= link_to_function(image_tag(\"search_up.gif\", :size => \"87x19\", :border => 0, :alt => \"search\", :name => \"search1\"), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();} \", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('search1','','/images/search_down.gif',1);\"}) %>"
				#file.puts "<% end %>\n"
				file.puts "    <table>\n"
				file.puts "    <%= search_"+key.to_s.singularize+" %>\n"
				file.puts "    </table>\n"
				file.puts "  <input type=\"hidden\" name=\"relatedtype\" value=\"<%= @params['relatedtype'] %>\" />\n"
				file.puts "  <input type=\"hidden\" name=\""+name+"[id]\" value=\"<%= @params['id'] %>\" />\n"
				file.puts "  <%= end_form_tag %>"
				
				#file.puts "<% end %>\n"
			#end
			#file.puts "<% if @params['internal'] == nil %>\n"
			file.puts "  <%= link_to_function(image_tag(\"search_up.gif\", :size => \"87x19\", :border => 0, :alt => \"search\", :name => \""+name+"search2\"+@params['level'].to_s), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"search2\"+@params['level'].to_s+\"','','/images/search_down.gif',1);\"}) %>"   #file.puts "<input type=\"submit\" value=\"Search\" />\n"
			#file.puts "<% else %>\n"
			#file.puts "  <%= link_to_function(image_tag(\"search_up.gif\", :size => \"87x19\", :border => 0, :alt => \"search\", :name => \"search2\"), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();} \", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('search2','','/images/search_down.gif',1);\"}) %>"
			#file.puts "<% end %>\n"
			#file.puts "<% if @params['internal'] == nil %>\n"
			#file.puts "<%= link_to image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back2\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back2','','/images/cancel_down.gif',1);\"%>" 
			file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"querycancel\"+@params['level'].to_s), {:update => '"+name+"_"+key.to_s.pluralize+"',  :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :params => {:pk => @params[:id], 'internal' => '"+name.pluralize+"', 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"querycancel\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%><br>\n"
			#file.puts "<% end %>\n"
			#file.puts "<%= link_to image_tag(\"back\", :size => \"80x21\", :border => 0), :action => 'edit', :id => @"+name+".id %>\n"
			#file.puts "</center>\n"			
			file.puts "  </div>\n"
			file.puts "<% end %>\n"
			end
			file.close

			# write show file
			file = File.new("temp/"+name+"/show.rhtml", "w") 
			file.puts "  <% if $allow_editing %>\n"
			#file.puts "    <%= link_to image_tag(\"edit\", :size => \"80x21\", :border => 0), :action => \"edit\", :id => @"+name+".id %>"
			file.puts "<%= link_to image_tag(\"edit_up.gif\", :size => \"87x19\", :border => 0, :alt => \"edit\", :name => \"edit1\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('edit1','','/images/edit_down.gif',1);\"%>" 
			file.puts "<% end %>\n"
			file.puts "<%= link_to_function image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back1\"), \"history.go(-1)\", :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back1','','/images/back_down.gif',1);\" %>\n"

			file.puts "<h1>"+name.humanize+"</h1>\n"
			file.puts "<%= show_"+name+" %>\n"
			name_value['addrelated'].each_key do |key|
				file.puts "<p><b>"+key.to_s.humanize+": </label></b>\n"
				file.puts "<br />\n"
				if @hasmany[name+"->"+key.to_s] != nil
					file.puts "<% if @"+name+"."+key.to_s+".size > 5 %>\n"
					file.puts "<div id=\"scroll"+key.to_s+"\" style=\"width:400;height:70;background-color:e6e6e6;border:1px solid;overflow:auto;\">\n"
					file.puts "<% end %>\n"
					file.puts "<% for o in @"+name+"."+key.to_s+" %>\n"
					file.puts "  <%= link_to o.displayInfo, :controller=> \""+key.to_s+"\", :action => \"show\", :id => o.id %><br>\n"
					file.puts "<% end %>\n"
					file.puts "<% if @"+name+"."+key.to_s+".size > 5 %>\n"
					file.puts "</div>\n"
					file.puts "<% end %>\n"
				else
					file.puts "<% if !@"+name+"."+key.to_s+".nil? %>\n"
					file.puts "  <%= link_to @"+name+"."+key.to_s+".displayInfo, :controller => \""+key.to_s.pluralize+"\", :action => \"show\",  :id => @"+name+"."+key.to_s+".id  %>\n"
					file.puts "<% end %>\n"
				end     
				file.puts "</p>\n"
			end
			file.puts "  <% if $allow_editing %>\n"
			#file.puts "    <%= link_to image_tag(\"edit\", :size => \"80x21\", :border => 0), :action => \"edit\", :id => @"+name+".id %>"
			file.puts "<%= link_to image_tag(\"edit_up.gif\", :size => \"87x19\", :border => 0, :alt => \"edit\", :name => \"edit\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('edit','','/images/edit_down.gif',1);\"%>" 
			file.puts "<% end %>\n"
			file.puts "<%= link_to_function image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back2\"), \"history.go(-1)\", :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back2','','/images/back_down.gif',1);\" %>\n"

			file.close

			# write listrelated file
			file = File.new("temp/"+name+"/edit_search_action.rhtml", "w") 
			name_value["deleterelatedaction"].each do |title, value|
				file.puts "<% if @params['relatedtype'] == \""+title.to_s.singularize+"\" %>\n"
				file.puts "<div id=\""+name+"_"+title.to_s.pluralize+"\">\n"
				file.puts "<%= form_remote_tag(:update => \""+name+"_"+title.to_s.pluralize+"\", :url => {:controller => \""+name.pluralize+"\", :action => 'edit_add_to_list_action', :id => @params['id']}, :name => \"listrelated\") %>\n"
				file.puts "  <h3>Check "+title.to_s.singularize.humanize+" to Add:</h3>\n"
				file.puts "<br><%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \""+name+"listupdate4\"+@params['level'].to_s), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"listupdate4\"+@params['level'].to_s+\"','','/images/update_down.gif',1);\"}) %>"
			file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"querycancel0\"+@params['level'].to_s), {:update => '"+name+"_"+title.to_s.pluralize+"',  :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :params => {:pk => @params[:id], 'internal' => '"+name.pluralize+"', 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"querycancel0\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%><br>\n"
				if @hasmany[name+"->"+title.to_s] != nil
				file.puts "<% if !@"+title.to_s.pluralize+".nil? %>\n"
				file.puts "<% if @"+title.to_s.pluralize+".size > 10 %>\n"
				  file.puts "<div id=\"scrollwindow\" style=\"width:600;height:200;background-color:e6e6e6;overflow:auto\">\n"
				file.puts "<% end %>\n"
				file.puts "   <% if @"+name+"."+title.to_s.pluralize+" != nil %>\n"
				file.puts "     <%= build_checklist_group(@"+title.to_s.pluralize+",@"+name+"."+title.to_s.pluralize+") %>\n"
				file.puts "   <% else %>\n"
				file.puts "     <p><%= build_checklist_group(@"+name+"."+title.to_s.pluralize+") %></p>\n"
				file.puts "   <% end %>"
				file.puts "<% if @"+title.to_s.pluralize+".size > 10 %>\n"
				  file.puts "</div>\n"
				file.puts "<% end %> \n"
				file.puts "<% end %>\n"
				else
					file.puts "   <% if @"+name+"."+title.to_s+" != nil %>\n"
					#file.puts "     a = [@"+name+"."+title.to_s+"]\n"
					file.puts "     <p><%= build_radiolist_group(@"+title.to_s.pluralize+",@"+name+"."+title.to_s+".displayInfo) %></p>\n"	
					file.puts "   <% else %>\n"			
					file.puts "     <p><%= build_radiolist_group(@"+title.to_s.pluralize+") %></p>\n"	
					file.puts "   <% end %>\n"			
				end
				file.puts "   <input type=hidden name=relatedtype value="+title.to_s.singularize+" />\n"
				file.puts "<%= end_form_tag %>\n"          
				#file.puts "<% end %>"
			#end
			file.puts "<input type=\"hidden\" name=\""+name+"[id]\" value=\"<%= @"+name+".id %>\"/> \n"
			#file.puts "<% if @params['internal'] == nil %>\n"
			file.puts "<br><%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \""+name+"listupdate3\"+@params['level'].to_s), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"listupdate3\"+@params['level'].to_s+\"','','/images/update_down.gif',1);\"}) %>"
			#file.puts "<%= link_to image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"listback\"), {:action => 'edit', :id => @"+name+".id}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('listback','','/images/cancel_down.gif',1);\"%>"
			file.puts "  <%= link_to_remote image_tag(\"cancel_up.gif\", :size => \"87x19\", :border => 0, :alt => \"cancel\", :name => \""+name+"querycancel\"+@params['level'].to_s), {:update => '"+name+"_"+title.to_s.pluralize+"',  :url => {:controller => '"+name.pluralize+"', :action => 'cancel', :params => {:pk => @params[:id], 'internal' => '"+name.pluralize+"', 'relatedtype'=> @params['relatedtype'], 'level' => @params['level']}}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('"+name+"querycancel\"+@params['level'].to_s+\"','','/images/cancel_down.gif',1);\"%><br>\n"
			#file.puts "<% else %>\n"
			#file.puts "<br><%= link_to_function(image_tag(\"update_up.gif\", :size => \"87x19\", :border => 0, :alt => \"update\", :name => \"listupdate3\"), \"if(document.forms[\"+@params['level'].to_s+\"].onsubmit()) { document.forms[\"+@params['level'].to_s+\"].submit();}\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('listupdate3','','/images/update_down.gif',1);\"}) %>"
			#file.puts "<% end %>\n"
			#file.puts "<input type=\"submit\" value=\"Update\" />\n"   
			#file.puts "<%= link_to image_tag(\"back\", :size => \"80x21\", :border => 0), :action => 'edit', :id => @"+name+".id %>\n"   
			#if name_value['deleterelatedaction'].size > 10
				#file.puts "</div>\n"
      #end
      file.puts "</div>\n"
			file.puts "<% end %>\n"
			end
			file.close        
			
			# write new file
			file = File.new("temp/"+name+"/new.rhtml", "w") 
			file.puts "<h1>New "+name.humanize+"</h1>\n"
			#file.puts "<%= error_messages_for '"+name+"' %>\n"
			file.puts "<%= form_tag({:action => \"create\"}, :name => \"edit\")  %>\n"
			file.puts "<%= link_to_function(image_tag(\"add_up.gif\", :size => \"87x19\", :border => 0, :alt => \"add\", :name => \"add1\"), \"document.edit.submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('add1','','/images/add_down.gif',1);\"}) %><br>" 
			file.puts "<%= edit_"+name+" %>\n"
			file.puts "<input type=\"hidden\" name=\"id\" value=\"<%= @params[\"id\"] %>\"/><br /><br />\n"
			#file.puts "<input type=\"image\" value=\"submit\" src=\"/images/update.png\" />\n"
			file.puts "<%= link_to_function(image_tag(\"add_up.gif\", :size => \"87x19\", :border => 0, :alt => \"add\", :name => \"add2\"), \"document.edit.submit()\", {:onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('add2','','/images/add_down.gif',1);\"}) %>"
			
			#file.puts "<%= link_to image_tag(\"show\", :size => \"80x21\", :border => 0), :action => 'show', :id => @"+name+".id %>\n"
			str = "@params[\"query\"] != nil"
			name_value['addrelated'].each_key do |key|
				str += " or @params['"+key.to_s+"'] != nil"
			end
			file.puts "<% if "+str+" %>\n"
			str = " :query => @params['query']"
			name_value['addrelated'].each_key do |key|
			 str += ", :"+key.to_s+" => @params['"+key.to_s+"'] "
			end
			file.puts "<%= link_to image_tag(\"back_up.gif\", :size => \"87x19\", :border => 0, :alt => \"back\", :name => \"back\"), {:action => 'searchaction', :params => {"+str+"}}, :onMouseOut => \"MM_swapImgRestore();\", :onMouseOver => \"MM_swapImage('back','','/images/back_down.gif',1);\"%>"
	 		#file.puts "  <%= link_to image_tag(\"back\", :size => \"80x21\", :border => 0), { :action => \"searchaction\", :params => {"+str+"}} %>\n"
			file.puts "<% end %>\n"
			file.puts "<%= end_form_tag %>\n"
			file.close

			# write _edit_contents file
			file = File.new("temp/"+name+"/_edit_contents.rhtml", "w") 
			name_value['addrelated'].each_key do |key|
				file.puts "<% if @params['relatedtype'] == \""+key.to_s.singularize+"\" %>\n"
				if @hasmany[name+"->"+key.to_s] != nil
				file.puts "  <% if @"+name+"."+key.to_s.pluralize+" != nil %>\n"
				file.puts "    <% for "+key.to_s.singularize+" in @"+name+"."+key.to_s.pluralize+" %>\n"
				file.puts "      <%= "+key.to_s.singularize+".displayInfo %><br>\n"
				file.puts "    <% end %>\n"
				file.puts "  <% end %>\n"
				else
				file.puts "  <% if @"+name+"."+key.to_s+" != nil %>\n"
				file.puts "     <%= @"+name+"."+key.to_s.singularize+".displayInfo %><br>\n"
				file.puts "  <% end %>\n"
					
				end
				file.puts "<% end %>\n"
			end
			file.close


    end

	 
	
	