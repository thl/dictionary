class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages, :options => 'ENGINE=MyISAM, CHARACTER SET=utf8 COLLATE=utf8_general_ci' do |t|
      t.string :title, :limit => 100, :null => false
      t.string :code, :limit => 3, :null => false
      t.string :locale, :limit => 6, :null => false
      t.integer :unicode_codepoint_start
      t.integer :unicode_codepoint_end
      t.boolean :use_for_interface, :null => false, :default => false 
    end
    ComplexScripts::Language.create :title => 'English', :code => 'eng', :locale => 'eng-US', :use_for_interface => true
    ComplexScripts::Language.create :title => 'Tibetan', :code => 'bod', :locale => 'bod-CN', :unicode_codepoint_start => 3840, :unicode_codepoint_end => 4095
    ComplexScripts::Language.create :title => 'Dzongkha', :code => 'dzo', :locale => 'dzo-BT'
    ComplexScripts::Language.create :title => 'Nepali', :code => 'nep', :locale => 'nep-NP', :unicode_codepoint_start => 2304, :unicode_codepoint_end => 2431
    ComplexScripts::Language.create :title => 'Jerung', :code => 'jee', :locale => 'jee-NP'
    ComplexScripts::Language.create :title => 'Wambule', :code => 'wme', :locale => 'wme-NP'
    ComplexScripts::Language.create :title => 'Thangmi', :code => 'thf', :locale => 'thf-NP'
    ComplexScripts::Language.create :title => 'Sanskrit', :code => 'san', :locale => 'san-IN'
  end

  def self.down
    drop_table :languages
  end
end