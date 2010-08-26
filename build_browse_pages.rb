require 'rubygems'
require 'active_record' 
#ActiveRecord::Base.establish_connection( 
#:adapter => "postgresql", 
#:host => "trinity.village.virginia.edu", 
#:username => "postgres", 
#:password => "4database", 
#:database => "thdl_dictionary_08-21-07" 
#) 
ActiveRecord::Base.establish_connection( 
:adapter => "postgresql", 
:host => "localhost", 
:username => "rubyuser", 
:password => "rubydude", 
:database => "dictionary_producton" 
) 

class Definition < ActiveRecord::Base
end

range = "ka: 141 - 13785
kha: 13786 - 23658
ga: 23659 - 43563
nga: 43564 - 49933
ca: 49934 - 53292
cha: 53293 - 60497
ja: 60498 - 64332
nya: 64333 - 70729
ta: 70730 - 77957
tha: 77958 - 85062
da: 85063 - 102224
na: 102225 - 110438
pa: 110439 - 116164
pha: 116165 - 123759
ba: 123760 - 138014
ma: 138015 - 149345
tsa: 149346 - 153297
tsha: 153298 - 159176
dza: 159177 - 161463
wa: 161464 - 161637
zha: 161638 - 166641
za: 166642 - 171303
'a: 171304 - 172634
ya: 172635 - 179634
ra: 179635 - 187488
la: 187489 - 193163
sha: 193164 - 197725
sa: 197726 - 209068
ha: 209069 - 212247
a: 212248 - 213833"

new_range = []
r = range.gsub("\n",",")
a = r.split(',')
a.each do |o|
  new_range << o[o.index(": ")+2,o.size-1].split(' - ')
end
 
alphabet = "ཀ	ཁ	ག	ང	ཅ	ཆ	ཇ	ཉ	ཏ	ཐ	ད	ན	པ	ཕ	བ	མ	ཙ	ཚ	ཛ	ཝ	ཞ	ཟ	འ	ཡ	ར	ལ	ཤ	ས	ཧ	ཨ".split("\t")
# debugger
page = 0

new_range.each do |range|
  start = range[0].to_i
  stop = range[1].to_i
  total_defs = Definition.count(:all, :conditions => ["sort_order >= ? and sort_order <= ? and level = 'head term'","#{start}","#{stop}"])
  puts total_defs
  count = 0
  @terms = []
  puts "page_#{page}.rhtml"
  file = File.open("/tmp/page_#{page}.rhtml", 'w')
  while count < total_defs
    if start+count+99 < stop
      total = 99
    else
      total = start+count+99-stop
    end
    # puts "#{start+count} - #{start+count+total}"
    d = Definition.find( :first, :conditions => ["sort_order >= ? and sort_order <= ? and level = 'head term'","#{start+count}","#{start+count+total}"], :order => 'sort_order asc') #, :offset => count)
    
   
    js = "new Ajax.Updater('group_#{count}', '/internal_definitions/alphabet_sub_list?letter=#{page}&offset=#{count}&start=#{start.to_i+count}&total=#{total}', {asynchronous:true, evalScripts:true, onLoading:function(request){Element.hide('p_#{d.id}');Element.hide('plus_term_#{d.id}');Element.show('minus_term_#{d.id}');Element.show('list_#{count}')}}); return false;"
    str = "<span style=\"display:none\" id=\"plus_term_#{d.id}\"><a onclick=\"Element.hide('plus_term_#{d.id}');Element.show('minus_term_#{d.id}');Element.show('list_#{count}');return false;\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\" border=0></a></span><span style=\"display:none\" id=\"minus_term_#{d.id}\"><a onclick=\"Element.show('plus_term_#{d.id}');Element.hide('minus_term_#{d.id}');Element.hide('list_#{count}');return false;\" href=\"#\"><img src=\"/images/btn-minus-sm.gif\" border=0></a></span> <a id=\"p_#{d.id}\" onclick=\"#{js}\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\"></a> <span class=\"bo\">#{d.term}</span> #{d.wylie} #{d.phonetic}<br><div id=\"list_#{count}\" style=\"display:none\"><dl><dd><div id=\"group_#{count}\"><img src=\"/images/loadingAnimation2.gif\"></div>
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




# alphabet.each do |letter|
#   total = Definition.count(:all, :conditions => ["term like ? and level = 'head term'","#{letter}%"])
#   puts total 
#   count = 0
#   @terms = []
#   puts "page_#{page}.rhtml"
#   file = File.open("/tmp/page_#{page}.rhtml", 'w')
#   while count < total
#     d = Definition.find( :first, :conditions => ["term like ? and level = 'head term'","#{letter}%"], :order => 'sort_order asc', :offset => count)
#    
#     js = "new Ajax.Updater('group_#{count}', '/internal_definitions/alphabet_sub_list?letter=#{page}&offset=#{count}', {asynchronous:true, evalScripts:true, onLoading:function(request){Element.hide('p_#{d.id}');Element.hide('plus_term_#{d.id}');Element.show('minus_term_#{d.id}');Element.show('list_#{count}')}}); return false;"
#     str = "<span style=\"display:none\" id=\"plus_term_#{d.id}\"><a onclick=\"Element.hide('plus_term_#{d.id}');Element.show('minus_term_#{d.id}');Element.show('list_#{count}');return false;\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\" border=0></a></span><span style=\"display:none\" id=\"minus_term_#{d.id}\"><a onclick=\"Element.show('plus_term_#{d.id}');Element.hide('minus_term_#{d.id}');Element.hide('list_#{count}');return false;\" href=\"#\"><img src=\"/images/btn-minus-sm.gif\" border=0></a></span> <a id=\"p_#{d.id}\" onclick=\"#{js}\" href=\"#\"><img src=\"/images/btn-plus-sm.gif\"></a> <span class=\"bo\">#{d.term}</span> #{d.wylie} #{d.phonetic}<br><div id=\"list_#{count}\" style=\"display:none\"><dl><dd><div id=\"group_#{count}\"><img src=\"/images/loadingAnimation2.gif\"></div>
#       </dd>
#     </dl>
#     </div>"
#     file.puts str
#     count += 100
#   end
#   page += 1
#   file.flush
#   file.close
# end