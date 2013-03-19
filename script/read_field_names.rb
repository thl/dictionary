# Run as "erb structure.erb > structure.dot & neato structure.dot -Tpng -o structure.png"
 base_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
 require(File.join(base_path, "config/environment"))
 Dir[File.join(base_path, "app/models/*.rb")].each { |lib| require lib }

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
	file = File.new("helpers/field_names.txt", "w")
   for cls in models do
     name = cls.to_s.underscore #cls.table_name.singularize

     columns = cls.column_names.sort_by do |column|
       [column == cls.primary_key ? 0 : 1, column]
     end
                                  
			# generate list of fields for each table
			array = []
			cls.content_columns.each do |column|
				array.push column.name
			end
			print array.to_s+"->\n"
			@fields[name] = array.reverse
			print array.to_s+"<-\n"

      # write field names
			
			
			array.each {|fld| file.puts name+":"+fld+":"+fld.humanize+"\n"}
           
    end 
 		file.close
