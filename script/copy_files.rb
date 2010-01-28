require 'rubygems'
require 'active_support/inflector'

#puts Inflector.singularize('inflections')
Dir.chdir('temp')
directories = Dir['*']
folders = []
directories.each {|d|
  folders << Inflector.pluralize(d)
}
x=0
directories.each {|d|
  views="mkdir ../../app/views/"+folders[x]+';/bin/cp '+d.to_s+"/*rhtml ../../app/views/"+folders[x]+"\n"
  controllers='/bin/cp '+d.to_s+"/*rb ../../app/controllers/\n"
  #print views+"\n"
  system(views)
  system(controllers)
  x+=1
}