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
    	str << %{<input type="radio" name="tags[]" id="tag_#{tag.id}" value="#{tag.id}" }
			str <<  " checked='checked'" if (original == tag.displayInfo)
    	str << %{/> #{tag.displayInfo} }

			str << "&nbsp;&nbsp;<span id=\"show_"+tag.id.to_s+"\">"+link_to_remote(image_tag('right.gif', :border => 0), :update => ''+tag.id.to_s+'', :url => {:controller => 'definitions', :action => :public_show_list, :id => tag.id, :params => {'list_view' => 'true'}}, :complete => "Element.hide('show_"+tag.id.to_s+"');Element.show('hide_"+tag.id.to_s+"');Element.show('"+tag.id.to_s+"');")+"</span>"
			str << "<span id=\"hide_"+tag.id.to_s+"\" style=\"display:none\">"
			str << link_to_function(image_tag('down.gif', :border => 0),"Element.hide('hide_"+tag.id.to_s+"');Element.show('show_"+tag.id.to_s+"');Element.hide('"+tag.id.to_s+"')")
      # str << link_to_remote(image_tag('down.gif', :border => 0), :update => ''+tag.id.to_s+'', :url => {:controller => 'definitions', :action => :public_show_list, :id => tag.id, :params => {'list_view' => 'true'}}, :complete => "Element.hide('hide_"+tag.id.to_s+"');Element.show('show_"+tag.id.to_s+"');new Effect.Fade('"+tag.id.to_s+"row')")
			str << "</span>"
    	
    	str << "<br />"
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