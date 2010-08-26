class BuildStaticPagesWorker < BackgrounDRb::MetaWorker
  set_worker_name :build_static_pages_worker
  def create(args = nil)
    # this method is called, when worker is loaded for the first time
  end
  
  def build_static_pages
    logger.info 'building static pages'
    
    alphabet = "ཀ	ཁ	ག	ང	ཅ	ཆ	ཇ	ཉ	ཏ	ཐ	ད	ན	པ	ཕ	བ	མ	ཙ	ཚ	ཛ	ཝ	ཞ	ཟ	འ	ཡ	ར	ལ	ཤ	ས	ཧ	ཨ".split("\t")
    # debugger
    page = 0
    alphabet.each do |letter|
      total = Definition.count(:all, :conditions => ["term like ? and level = 'head term'","#{letter}%"])
      logger.info total 
      count = 0
      @terms = []
      logger.info "page_#{page}.rhtml"
      file = File.open("/tmp/page_#{page}.rhtml", 'w')
      while count < total
        d = Definition.find( :first, :conditions => ["term like ? and level = 'head term'","#{letter}%"], :order => 'sort_order asc', :offset => count)

        #js = "new Ajax.Updater('group_#{count}', '/internal_definitions/alphabet_sub_list?letter=#{page}&offset=#{count}', {asynchronous:true, evalScripts:true, onLoading:function(request){Element.hide('p_#{d.id}');Element.hide('plus_term_#{d.id}');Element.show('minus_term_#{d.id}');Element.show('list_#{count}')}}); return false;"
        js = "$('#list_#{count}').show();jQuery.ajax({	success: function(request) {jQuery('#group_#{count}').html(request);tb_init('a.thickbox, area.thickbox, input.thickbox');$('#p_#{d.id}').hide();$('#plus_term_#{d.id}');$('#minus_term_#{d.id}').show();$('#list_#{count}').show();} ,type:'get' ,url:'/internal_definitions/alphabet_sub_list?letter=#{page}&offset=#{count}' }); return false;"
        
        #str = "<span style=\"display:none\" id=\"plus_term_#{d.id}\"><a onclick=\"Element.hide('plus_term_#{d.id}');Element.show('minus_term_#{d.id}');Element.show('list_#{count}');return false;\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\" border=0></a></span><span style=\"display:none\" id=\"minus_term_#{d.id}\"><a onclick=\"Element.show('plus_term_#{d.id}');Element.hide('minus_term_#{d.id}');Element.hide('list_#{count}');return false;\" href=\"#\"><img src=\"/images/btn-minus-sm.gif\" border=0></a></span> <a id=\"p_#{d.id}\" onclick=\"#{js}\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\"></a> <span class=\"bo\">#{d.term}</span> #{d.wylie} #{d.phonetic}<br><div id=\"list_#{count}\" style=\"display:none\"><dl><dd><div id=\"group_#{count}\"><img src=\"/images/loadingAnimation2.gif\"></div>
      	#	</dd>
      	#</dl>
      	#</div>"
      	
      	str = "<span style=\"display:none\" id=\"plus_term_#{d.id}\"><a onclick=\"$('#plus_term_#{d.id}').hide();$('#minus_term_#{d.id}').show();$('#list_#{count}').show();return false;\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\" border=0></a></span><span style=\"display:none\" id=\"minus_term_#{d.id}\"><a onclick=\"$('#plus_term_#{d.id}').show();$('#minus_term_#{d.id}').hide();$('#list_#{count}').hide();return false;\" href=\"#\"><img src=\"/images/btn-minus-sm.gif\" border=0></a></span> <a id=\"p_#{d.id}\" onclick=\"#{js}\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\"></a> <span class=\"bo\">#{d.term}</span> #{d.wylie} #{d.phonetic}<br><div id=\"list_#{count}\" style=\"display:none\"><dl><dd><div id=\"group_#{count}\"><img src=\"/images/loadingAnimation2.gif\"></div>
      		</dd>
      	</dl>
      	</div>"
        
        file.puts str
        count += 100
      end
      page += 1
      file.flush
      file.close
    end
    
  end
end

