# == Schema Information
# Schema version: 86
#
# Table name: languages
#
#  id                      :integer(11)   not null, primary key
#  title                   :string(100)   default(), not null
#  code                    :string(3)     default(), not null
#  locale                  :string(6)     default(), not null
#  use_for_interface       :boolean(1)    not null
#  unicode_codepoint_start :integer(11)   
#  unicode_codepoint_end   :integer(11)   
#

class Language < ActiveRecord::Base
  validates_presence_of :title

  # {'en' => {:locale => 'eng-US', :title => 'English', :unicode_range => [0, 255]}}
  def self.languages_hash
    languages_hash = Hash.new
    for language in Language.find(:all)
      language_hash = {:locale => language.locale, :title => language.title}
      language_hash[:unicode_range] = [language.unicode_codepoint_start, language.unicode_codepoint_end] if !language[:unicode_codepoint_start].nil? && !language[:unicode_codepoint_end].nil?
      languages_hash[language.code[0..1]] = language_hash
    end
    languages_hash.freeze    
  end  
end
