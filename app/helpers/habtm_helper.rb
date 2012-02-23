module HabtmHelper
	def build_checklist_group(collection,original=[])
		str="" 
		for tag in original
    	str << %{<input type="checkbox" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" 
    	str << %{/> #{tag.displayInfo} <br />}
		end
		for tag in collection
		  if !original.include?(tag)
    	str << %{<input type="checkbox" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" if original.include?(tag)
    	str << %{/> #{tag.displayInfo} <br />}
			end
		end
		str
	end

	def build_radiolist_group(collection,original="")
		str="" 
		for tag in collection
		  #if !original.include?(tag)
    	str << %{<input type="radio" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" if (original == tag.displayInfo)
    	str << %{/> #{tag.displayInfo} <br />}
			#end
		  end
		str
	end

	def build_form_radiolist_group(collection,original="")
		str="" 
		for tag in collection
		  #if !original.include?(tag)
	    str << "<span id=\"show_"+tag.id.to_s+"\">"
    	str << link_to_remote(image_tag('plus.gif', :border => 0, :size => "10x10"), :update => '' +tag.id.to_s+'' , :url => definition_public_show_list_path( tag.id, :list_view => 'true'), :method => 'get', :complete => "$('#show_"+tag.id.to_s+"').hide();$('#hide_"+tag.id.to_s+"').show();$('#"+tag.id.to_s+"').show();")
    	str << "</span>"
      str << "<span id=\"hide_"+tag.id.to_s+"\" style=\"display:none\">"
      str << link_to_function(image_tag('minus.gif', :border => 0, :size => "10x10"),"$('#hide_"+tag.id.to_s+"').hide();$('#show_"+tag.id.to_s+"').show();$('#"+tag.id.to_s+"').hide();")
  	  str << "</span>"
  	  str << "&nbsp"			
    	str << %{<input type="radio" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" if (original == tag.displayInfo)
    	str << %{ /><span style="font-size:120%;padding:3px;"> #{tag.displayInfo} </span>}
      str << "&nbsp;&nbsp;"
	    #str << "&nbsp;&nbsp;<span id=\"show_"+tag.id.to_s+"\">"+link_to_remote(image_tag('right.gif', :border => 0), :update => ''+tag.id.to_s+'', :url => {:controller => 'definitions', :action => :public_show_list, :id => tag.id, :params => {'list_view' => 'true'}}, :complete => "$('#show_"+tag.id.to_s+"').hide();$('#hide_"+tag.id.to_s+"').show();$('#"+tag.id.to_s+"').show();")+"</span>"
  
		                                                          #link_to_remote image_tag('right.gif', :border => 0), :update => "tag.id.to_s" , :url => edit_search_definition_definition_forms_path(params["id"], :level => params['level'], :relatedtype => "definition_to", :internal => params['internal']),  :method => 'get' %>
    
			#str << "&nbsp;&nbsp;<span id=\"show_"+tag.id.to_s+"\">"+link_to_remote(image_tag('right.gif', :border => 0), :update => ''+tag.id.to_s+'', :url => {:controller => 'definitions', :action => :public_show_list, :id => tag.id, :params => {'list_view' => 'true'}}, :complete => "Element.hide('show_"+tag.id.to_s+"');Element.show('hide_"+tag.id.to_s+"');Element.show('"+tag.id.to_s+"');")+"</span>"			
			
			#str << link_to_function(image_tag('down.gif', :border => 0),"Element.hide('hide_"+tag.id.to_s+"');Element.show('show_"+tag.id.to_s+"');Element.hide('"+tag.id.to_s+"')")
      ## str << link_to_remote(image_tag('down.gif', :border => 0), :update => ''+tag.id.to_s+'', :url => {:controller => 'definitions', :action => :public_show_list, :id => tag.id, :params => {'list_view' => 'true'}}, :complete => "Element.hide('hide_"+tag.id.to_s+"');Element.show('show_"+tag.id.to_s+"');new Effect.Fade('"+tag.id.to_s+"row')")

    	
    	str << "<br /><br />"
    	str << "<span id=\""+tag.id.to_s+"\"></span>"
			#end
		  end
		str
	end


	def build_sachens_group(collection)
		str="" 
		if collection.size > 10
			str << "<div id=\"scrollwindow\" style=\"width:600;height:200;background-color:e6e6e6;overflow:auto\">"
		end
		
		for tag in collection
    	str << %{<input type="checkbox" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" if @excerpt.sachens.include?(tag)
    	str << %{/> #{tag.displayInfo} <br />}
		end
		if collection.size > 10
			str << "</div>"
		end

		str
	end
	
	def build_literature_excerpts_group(collection)
		str="" 
		for tag in collection
    	str << %{<input type="checkbox" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" if @excerpt.literature_excerpts.include?(tag)
    	str << %{/> #{tag.displayInfo} <br />}
			end
		str
	end


end