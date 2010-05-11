module DefinitionsHelper
  def javascripts
    [super, include_tiny_mce_if_needed].join("\n")
  end
  def get_themes
    theme_ones = ThemeLevelOne.find(:all)
    theme_array = ""
    internal_theme_array = ""
    for md in theme_ones
      theme_array += ",\n" unless theme_array == ""
      md.theme = '-' if md.theme == nil
      theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','definition[thematic_classification'+definition_id+']','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
      internal_theme_array += ",\n" unless internal_theme_array == ""
      internal_theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
      if md.theme_level_twos.size > 0
        theme_array += ",\n"
        internal_theme_array += ",\n"
      else
        theme_array += ",null,\n"
        internal_theme_array += ",null,\n"
      end
      theme_two_array = ""
      internal_theme_two_array = ""
      for sd in md.theme_level_twos
        theme_two_array += ",\n" unless theme_two_array == ""
        sd.theme = '-' if sd.theme == nil
        theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','definition[thematic_classification'+definition_id+']','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
        internal_theme_two_array += ",\n" unless internal_theme_two_array == ""
        internal_theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
        if sd.theme_level_threes.size > 0
          theme_two_array += ",\n"
          internal_theme_two_array += ",\n"
        else
          theme_two_array += ",null,\n"
          internal_theme_two_array += ",null,\n"
        end
        theme_three_array = ""
        internal_theme_three_array = ""
        for td in sd.theme_level_threes
          theme_three_array += ",\n" unless theme_three_array == ""
          td.theme = '-' if td.theme == nil
          theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','definition[thematic_classification'+definition_id+']','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
          internal_theme_three_array += ",\n" unless internal_theme_three_array == ""
          internal_theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
        end
        theme_two_array += theme_three_array+"\n]"
        internal_theme_two_array += internal_theme_three_array+"\n]"
      end
      theme_array += theme_two_array+"\n]"
      internal_theme_array += internal_theme_two_array+"\n]"
    end
    return theme_array = "[\n['Choose Theme',null,null,\n"+theme_array+"],['Cancel',null,null] ]"
    # puts '================'
    # puts theme_array
    # internal_theme_array = "[\n['Choose Theme',null,null,\n"+@theme_array+"],['Cancel',null,null] ]"

  end
  
  def get_grammar(internal='no')
        @grammar_function_level_ones = GrammarFunctionLevelOne.find(:all)
    @grammar_function_array = ""
    @internal_grammar_function_array = ""
    for md in @grammar_function_level_ones
      @grammar_function_array += ",\n" unless @grammar_function_array == ""
      md.grammar_function = "-" if md.grammar_function == nil
      # puts md.grammar_function
      # puts md.grammar_function == 'Verb'
      if md.grammar_function == 'Verb'
        # puts '--------show--------'
        @grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\",null" #unless md.grammar_function != nil
      else
        @grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\",null" #unless md.grammar_function != nil
      end
      @internal_grammar_function_array += ",\n" unless @internal_grammar_function_array == ""
      if md.grammar_function == 'Verb'
        @internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:Element.show('tense'+definition_id);set_field('"+md.grammar_function+"','internal_definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\",null"
      else
        @internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:Element.hide('tense'+definition_id);set_field('"+md.grammar_function+"','internal_definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\",null"
      end
      if md.grammar_function_level_twos.size > 0
        @grammar_function_array += ",\n"
        @internal_grammar_function_array += ",\n"
      else
        @grammar_function_array += ",null,\n"
        @internal_grammar_function_array += ",null,\n"
      end
      grammar_function_two_array = ""
      internal_grammar_function_two_array = ""
      for sd in md.grammar_function_level_twos
        grammar_function_two_array += ",\n" unless grammar_function_two_array == ""
        sd.grammar_function = "-" if sd.grammar_function == nil
        grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\",null" unless sd.grammar_function == nil or md.grammar_function == nil
        internal_grammar_function_two_array += ",\n" unless internal_grammar_function_two_array == ""
        internal_grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','internal_definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\",null" unless sd.grammar_function == nil or md.grammar_function == nil
        if sd.grammar_function_level_threes.size > 0
          grammar_function_two_array += ",\n"
          internal_grammar_function_two_array += ",\n"
        else
          grammar_function_two_array += ",null,\n"
          internal_grammar_function_two_array += ",null,\n"
        end
        grammar_function_three_array = ""
        internal_grammar_function_three_array = ""
        for td in sd.grammar_function_level_threes
          grammar_function_three_array += ",\n" unless grammar_function_three_array == ""
          td.grammar_function = "-" if td.grammar_function == nil
          grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\"]\n"
          internal_grammar_function_three_array += ",\n" unless internal_grammar_function_three_array == ""
          internal_grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','internal_definition[grammatical_function'+definition_id+']','"+url_for(:action => 'set_grammatical_function')+"/'+definition_id);\"]\n"
        end
        grammar_function_two_array += grammar_function_three_array+"\n]"
        internal_grammar_function_two_array += internal_grammar_function_three_array+"\n]"
      end
      @grammar_function_array += grammar_function_two_array+"\n]"
      @internal_grammar_function_array += internal_grammar_function_two_array+"\n]"
    end
    @grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@grammar_function_array+"],['Cancel',null,null]	]"
    @internal_grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@internal_grammar_function_array+"],['Cancel',null,null]	]"
    if internal != 'internal' 
      return @grammar_function_array
    else
      return @internal_grammar_function_array
    end
  end
  
  def get_dialect()
    @major_dialects = MajorDialect.find(:all)
    @dialect_array = ""
    @internal_dialect_array = ""
    for md in @major_dialects
      @dialect_array += ",\n" unless @dialect_array == ""
      md.name = '-' if md.name == nil
      @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','definition[major_dialect_family'+definition_id+']','"+url_for(:action => 'set_major_dialect_family')+"/'+definition_id);\",null"
      @internal_dialect_array += ",\n" unless @internal_dialect_array == ""
      @internal_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','internal_definition[major_dialect_family'+definition_id+']','"+url_for(:action => 'set_major_dialect_family')+"/'+definition_id);\",null"
      if md.specific_dialects.size > 0
        @dialect_array += ",\n"
        @internal_dialect_array += ",\n"
      else
        @dialect_array += ",null,\n"
        @internal_dialect_array += ",null,\n"
      end
      specific_dialect_array = ""
      internal_specific_dialect_array = ""
      for sd in md.specific_dialects
        specific_dialect_array += ",\n" unless specific_dialect_array == ""
        sd.name = '-' if sd.name == nil
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','definition[major_dialect_family'+definition_id+']','"+url_for(:action => 'set_major_dialect_family')+"/'+definition_id);\"]\n"
        internal_specific_dialect_array += ",\n" unless internal_specific_dialect_array == ""
        internal_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','internal_definition[major_dialect_family'+definition_id+']','"+url_for(:action => 'set_major_dialect_family')+"/'+definition_id);\"]\n"
      end
      @dialect_array += specific_dialect_array+"\n]"
      @internal_dialect_array += internal_specific_dialect_array+"\n]"
    end
    @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null]	]"
    @internal_dialect_array = "[\n['Choose Dialect',null,null,\n"+@internal_dialect_array+"],['Cancel',null,null]	]"
    return @dialect_array
  end
  
  def build_definition_menu()
    # delete_url = 'kkkl' #
    # puts '---------------------'
    # delete_url = link_to(image_tag('trash.gif',:border=>0), {:action => 'public_destroy', :id => id, :params => {:parent_id => parent_id, :head_id => head_id}}, :confirm => "Are you sure you want to delete this entry?").gsub(/"/,'')
    str = "[
	['Edit Relationships', null, null,
	  ['Add Sub Definition',\"javascript:add_def_popup('definitions',definition_id,parent_id);\",null],		  
		['Add Related Term', null, null,
  		['full synonym', \"javascript:search_term('definitions','full_synonym',definition_id);\"],
		  ['partial synonym',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'partial synonym','partial synonym');\"],
		  ['antonym',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'antonym','antonym');\"],
		  ['literary correlate',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'literary correlate','colloquial correlate');\"],
		  ['colloquial correlate',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'colloquial correlate','literary correlate');\"],
		  ['dialectical correlate',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'dialectical correlate','dialectical correlate');\"],
		  ['paired term',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'paired term','paired term');\"],
		  ['register', null, null,
		    ['double honorific form',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'double honorific form','non-honorific form');\"],
		    ['high honorific form',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'high honorific form','non-honorific form');\"],
		    ['honorific form',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'honorific form','non-honorific form');\"],
		    ['humilific form',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'humilific form','non-honorific form');\"]
		  ],
		  ['conjugated form', null, null,
    	  ['past tense',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'past tense','present tense');\"],
    	  ['future tense',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'future form','present tense');\"],
    	  ['imperative form',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'imperative form','present tense');\"]
	    ],
		  ['division',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'division','division of');\"],
		  ['division of',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'division of','division');\"],
		  ['containing compound',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'compound','part of compound');\"],
		  ['part of compound',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'part of compound','compound');\"],
		  ['abbreviation',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'abbreviation','non-abbreviated form');\"],
		  ['non-abbreviated form',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'non-abbreviated form','abbreviation');\"],
		  ['containing phrase',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'phrase','part of phrase');\"],
		  ['part of phrase',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'part of phrase','phrase');\"],
		  ['poetic correlate',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'poetical correlate','non-poetical correlate');\"],
		  ['non-poetic correlate',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'non-poetical correlate','poetical correlate');\"],
		  ['gloss',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'gloss','gloss term');\"],
		  ['glossed term',\"javascript:add_new_relationship('definitions','definition_definition_form_from',definition_id,'gloss term','gloss');\"],
		],
		['Add Pronunciation', \"javascript:add_new_content('definitions','pronunciation',definition_id);\"],
		['Translation', null, null,
		  ['Find Translation',\"javascript:search_popup('definitions','translation',definition_id);\"],
		  ['New Translation',\"javascript:add_new_content('definitions','translation',definition_id);\"]
		],
		['Add Etymology', \"javascript:add_new_content('definitions','etymology',definition_id);\"],
		['Add Spelling', \"javascript:add_new_content('definitions','spelling',definition_id);\"],
		['Literary Quotation', null, null,
		  ['Find Literary Quotation',\"javascript:search_popup('definitions','literary_quotation',definition_id);\"],
		  ['New Literary Quotation',\"javascript:add_new_content('definitions','literary_quotation',definition_id);\"]
		],
		['Oral Quotation', null, null,
		  ['Find Oral Quotation',\"javascript:search_popup('definitions','oral_quotation',definition_id);\"],
		  ['New Oral Quotation',\"javascript:add_new_content('definitions','oral_quotation',definition_id);\"]
		],
		['Add Translation Equivalent', \"javascript:add_new_content('definitions','translation_equivalent',definition_id);\"],
		['Model Sentence', null, null,
		  ['Find Model Sentence',\"javascript:search_popup('definitions','model_sentence',definition_id);\"],
		  ['New Model Sentence',\"javascript:add_new_content('definitions','model_sentence',definition_id);\"]
		],
	  ['Add Metadata',\"javascript:add_new_popup('definitions','meta',definition_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_translation_menu()
    str = "[
	['Edit Relationships', null, null,
		  ['New Meta',\"javascript:add_new_popup('translations','meta',translation_id);\"]
	],
	['Cancel',null,null]
];"
  end
  def build_old_translation_menu()
    str = "[
	['Edit Relationships', null, null,
		['Etymology', null, null,
		  ['Find Etymology',\"javascript:search_popup('translations','etymology',translation_id);\"],
		  ['New Etymology',\"javascript:add_new_popup('translations','etymology',translation_id);\"]
		],
		['Literary Quotation', null, null,
		  ['Find Literary Quotation',\"javascript:search_popup('translations','literary_quotation',translation_id);\"],
		  ['New Literary Quotation',\"javascript:add_new_popup('translations','literary_quotation',translation_id);\"]
		],
		['Oral Quotation', null, null,
		  ['Find Oral Quotation',\"javascript:search_popup('translations','oral_quotation',translation_id);\"],
		  ['New Oral Quotation',\"javascript:add_new_popup('translations','oral_quotation',translation_id);\"]
		],
		['Model Sentence', null, null,
		  ['Find Model Sentence',\"javascript:search_popup('translations','model_sentence',translation_id);\"],
		  ['New Model Sentence',\"javascript:add_new_popup('translations','model_sentence',translation_id);\"]
		],
	  ['New Meta',\"javascript:add_new_popup('translations','meta',translation_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_related_term_menu()
    str = "[
	['Edit Relationships', null, null,
	  ['New Meta',\"javascript:add_new_popup('definition_definition_forms','meta',definition_definition_form_id);\"]
	],
	['Cancel',null,null]
];"
  end


  def build_pronunciation_menu()
    str = "[
	['Edit Relationships', null, null,
	  ['New Meta',\"javascript:add_new_popup('pronunciations','meta',pronunciation_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_spelling_menu()
    str = "[
	['Edit Relationships', null, null,
	  ['New Meta',\"javascript:add_new_popup('spellings','meta',spelling_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_etymology_menu()
    str = "[
	['Edit Relationships', null, null,
		['Translation', null, null,
		  ['Find Translation',\"javascript:search_popup('etymologies','translation',etymology_id);\"],
		  ['New Translation',\"javascript:add_new_popup('etymologies','translation',etymology_id);\"]
		],
	  ['New Meta',\"javascript:add_new_popup('etymologies','meta',etymology_id);\"]
	],
	['Cancel',null,null]
];"
  end
  
  def build_translation_equiv_menu()
    str = "[
	['Edit Relationships', null, null,
	  ['New Meta',\"javascript:add_new_popup('translation_equivalents','meta',translation_equivalent_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_model_sentence_menu()
    str = "[
	['Edit Relationships', null, null,
		['Translation', null, null,
		  ['Find Translation',\"javascript:search_popup('model_sentences','translation',model_sentence_id);\"],
		  ['New Translation',\"javascript:add_new_popup('model_sentences','translation',model_sentence_id);\"]
		],
		  ['New Meta',\"javascript:add_new_popup('model_sentences','meta',model_sentence_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_oral_quotation_menu()
    str = "[
	['Edit Relationships', null, null,
		['Translation', null, null,
		  ['Find Translation',\"javascript:search_popup('oral_quotations','translation',oral_quotation_id);\"],
		  ['New Translation',\"javascript:add_new_popup('oral_quotations','translation',oral_quotation_id);\"]
		],
		  ['New Meta',\"javascript:add_new_popup('oral_quotations','meta',oral_quotation_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_literary_quotation_menu()
    str = "[
	['Edit Relationships', null, null,
		['Translation', null, null,
		  ['Find Translation',\"javascript:search_popup('literary_quotations','translation',literary_quotation_id);\"],
		  ['New Translation',\"javascript:add_new_popup('literary_quotations','translation',literary_quotation_id);\"]
		],
		  ['New Meta',\"javascript:add_new_popup('literary_quotations','meta',literary_quotation_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_synonym_menu()
    str = "[
	['Edit Relationships', null, null,
		  ['New Meta',\"javascript:add_new_popup('full_synonyms','meta',full_synonym_id);\"]
	],
	['Cancel',null,null]
];"
  end
  def build_meta_menu()
    str = "[
	['Edit Relationships', null, null,
		  ['New Source',\"javascript:add_new_content('metas','source',meta_id);\"]
	],
	['Cancel',null,null]
];"
  end

  def build_genre_menu(table,id)
    @genre = LiteraryGenre.find(:all, :conditions => 'parent_id is null')
    @genre_array = ""
    for md in @genre
      @genre_array += ",\n" unless @genre_array == ""
      md.literary_genre = '-' if md.literary_genre == nil
      @genre_array += "['"+md.literary_genre+"', \"javascript:set_field('"+md.literary_genre+"','"+table+"[literary_genre'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_literary_genre')+"/'+dialect_id);\",null"
      if md.children.size > 0
        @genre_array += ",\n"
      else
        @genre_array += ",null,\n"
      end
      genre_array2 = ""
      for sd in md.children
        genre_array2 += ",\n" unless genre_array2 == ""
        sd.literary_genre = '-' if sd.literary_genre == nil
        genre_array2 += "  ['"+sd.literary_genre+"', \"javascript:set_field('"+md.literary_genre+" > "+sd.literary_genre+"','"+table+"[literary_genre'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_literary_genre')+"/'+dialect_id);\",null"
        
        if sd.children.size > 0
          genre_array2 += ",\n"
        else
          genre_array2 += ",null,\n"
        end
        genre_array3 = ""
        for td in sd.children
          genre_array3 += ",\n" unless genre_array3 == ""
          td.literary_genre = '-' if td.literary_genre == nil
          genre_array3 += "  ['"+td.literary_genre+"', \"javascript:set_field('"+md.literary_genre+" > "+sd.literary_genre+" > "+td.literary_genre+"','"+table+"[literary_genre'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_literary_genre')+"/'+dialect_id);\"]\n"
        end
        genre_array2 += genre_array3+"\n]"
        
      end
      @genre_array += genre_array2+"\n]"
    end
    @dialect_array = "[\n['Choose Literary Genre',null,null,\n"+@genre_array+"],['Cancel',null,null]	]"
  end

  def build_dialect_menu(table,id)
    @major_dialects = MajorDialect.find(:all)
    @dialect_array = ""
    for md in @major_dialects
      @dialect_array += ",\n" unless @dialect_array == ""
      md.name = '-' if md.name == nil
      @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','"+table+"[major_dialect_family'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_major_dialect_family')+"/'+dialect_id);\",null"
      if md.specific_dialects.size > 0
        @dialect_array += ",\n"
      else
        @dialect_array += ",null,\n"
      end
      specific_dialect_array = ""
      for sd in md.specific_dialects
        specific_dialect_array += ",\n" unless specific_dialect_array == ""
        sd.name = '-' if sd.name == nil
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','"+table+"[major_dialect_family'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_major_dialect_family')+"/'+dialect_id);\"]\n"
      end
      @dialect_array += specific_dialect_array+"\n]"
    end
    @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null]	]"
  end

  def build_oral_dialect_menu(table,id)
    @major_dialects = MajorDialect.find(:all)
    @dialect_array = ""
    for md in @major_dialects
      @dialect_array += ",\n" unless @dialect_array == ""
      md.name = '-' if md.name == nil
      @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','"+table+"[source_speaker_dialect'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_source_speaker_dialect')+"/'+dialect_id);\",null"
      if md.specific_dialects.size > 0
        @dialect_array += ",\n"
      else
        @dialect_array += ",null,\n"
      end
      specific_dialect_array = ""
      for sd in md.specific_dialects
        specific_dialect_array += ",\n" unless specific_dialect_array == ""
        sd.name = '-' if sd.name == nil
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','"+table+"[source_speaker_dialect'+dialect_id+']','"+url_for(:controller => table.pluralize, :action => 'set_source_speaker_dialect')+"/'+dialect_id);\"]\n"
      end
      @dialect_array += specific_dialect_array+"\n]"
    end
    @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null]	]"
  end

  def show_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b>"
    if @definition.term != nil 
      resultstr << @definition.term
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Level: </b>"
    if @definition.level != nil 
      resultstr << @definition.level
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Definition: </b>"
    resultstr << "<br>"
    if @definition.definition != nil 
      resultstr << @definition.definition
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Language: </b>"
    if @definition.language != nil 
      resultstr << @definition.language
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Thematic classification: </b>"
    if @definition.thematic_classification != nil 
      resultstr << @definition.thematic_classification
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Tense: </b>"
    if @definition.tense != nil 
      resultstr << @definition.tense
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Encyclopedia entry: </b>"
    resultstr << "<br>"
    if @definition.encyclopedia_entry != nil 
      resultstr << @definition.encyclopedia_entry
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Grammatical function: </b>"
    if @definition.grammatical_function != nil 
      resultstr << @definition.grammatical_function
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Register: </b>"
    if @definition.register != nil 
      resultstr << @definition.register
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Language context: </b>"
    resultstr << "<br>"
    if @definition.language_context != nil 
      resultstr << @definition.language_context
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Numerology: </b>"
    if @definition.numerology != nil 
      resultstr << @definition.numerology
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Major dialect family: </b>"
    if @definition.major_dialect_family != nil 
      resultstr << @definition.major_dialect_family
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Specific dialect: </b>"
    if @definition.specific_dialect != nil 
      resultstr << @definition.specific_dialect
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary genre: </b>"
    if @definition.literary_genre != nil 
      resultstr << @definition.literary_genre
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary period: </b>"
    if @definition.literary_period != nil 
      resultstr << @definition.literary_period
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Literary form: </b>"
    if @definition.literary_form != nil 
      resultstr << @definition.literary_form
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<br>"
    if @definition.image != nil 
      resultstr << @definition.image
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image caption: </b>"
    resultstr << "<br>"
    if @definition.image_caption != nil 
      resultstr << @definition.image_caption
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image photographer: </b>"
    if @definition.image_photographer != nil 
      resultstr << @definition.image_photographer
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<br>"
    if @definition.image_link != nil 
      resultstr << @definition.image_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Image description: </b>"
    resultstr << "<br>"
    if @definition.image_description != nil 
      resultstr << @definition.image_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio: </b>"
    if @definition.audio != nil 
      resultstr << @definition.audio
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio id number: </b>"
    if @definition.audio_id_number != nil 
      resultstr << @definition.audio_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio speaker: </b>"
    if @definition.audio_speaker != nil 
      resultstr << @definition.audio_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio date: </b>"
    if @definition.audio_date != nil 
      resultstr << @definition.audio_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio place of recording: </b>"
    if @definition.audio_place_of_recording != nil 
      resultstr << @definition.audio_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<br>"
    if @definition.audio_link != nil 
      resultstr << @definition.audio_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<br>"
    if @definition.audio_description != nil 
      resultstr << @definition.audio_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video: </b>"
    if @definition.video != nil 
      resultstr << @definition.video
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video id number: </b>"
    if @definition.video_id_number != nil 
      resultstr << @definition.video_id_number
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video speaker: </b>"
    if @definition.video_speaker != nil 
      resultstr << @definition.video_speaker
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video date: </b>"
    if @definition.video_date != nil 
      resultstr << @definition.video_date
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video place of recording: </b>"
    if @definition.video_place_of_recording != nil 
      resultstr << @definition.video_place_of_recording
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<br>"
    if @definition.video_link != nil 
      resultstr << @definition.video_link
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<br>"
    if @definition.video_description != nil 
      resultstr << @definition.video_description
    end 
    resultstr << "</p>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<br>"
    if @definition.analytical_note != nil 
      resultstr << @definition.analytical_note
    end 
    resultstr << "</p>"
  end

  def list_definition
    resultstr = ""
    resultstr << "<table width=\"100%\" cellspacing=0 border=0 cellpadding=1 bgcolor=#eeeeee>"
    resultstr << "<tr bgcolor=#FFFFFF>"
    resultstr << sort_header_tag('term', { :align => "left" })
    resultstr << sort_header_tag('level', { :align => "left" })
    resultstr << sort_header_tag('definition', { :align => "left" })
    resultstr << sort_header_tag('language', { :align => "left" })
    resultstr << sort_header_tag('thematic_classification', { :align => "left" })
    # resultstr << sort_header_tag('tense', { :align => "left" })
    # resultstr << sort_header_tag('encyclopedia_entry', { :align => "left" })
    resultstr << sort_header_tag('grammatical_function', { :align => "left" })
    # resultstr << sort_header_tag('register', { :align => "left" })
    # resultstr << sort_header_tag('language_context', { :align => "left" })
    # resultstr << sort_header_tag('numerology', { :align => "left" })
    # resultstr << sort_header_tag('major_dialect_family', { :align => "left" })
    # resultstr << sort_header_tag('specific_dialect', { :align => "left" })
    # resultstr << sort_header_tag('literary_genre', { :align => "left" })
    # resultstr << sort_header_tag('literary_period', { :align => "left" })
    # resultstr << sort_header_tag('literary_form', { :align => "left" })
    # resultstr << sort_header_tag('image', { :align => "left" })
    # resultstr << sort_header_tag('image_caption', { :align => "left" })
    # resultstr << sort_header_tag('image_photographer', { :align => "left" })
    # resultstr << sort_header_tag('image_link', { :align => "left" })
    # resultstr << sort_header_tag('image_description', { :align => "left" })
    # resultstr << sort_header_tag('audio', { :align => "left" })
    # resultstr << sort_header_tag('audio_id_number', { :align => "left" })
    # resultstr << sort_header_tag('audio_speaker', { :align => "left" })
    # resultstr << sort_header_tag('audio_date', { :align => "left" })
    # resultstr << sort_header_tag('audio_place_of_recording', { :align => "left" })
    # resultstr << sort_header_tag('audio_link', { :align => "left" })
    # resultstr << sort_header_tag('video', { :align => "left" })
    # resultstr << sort_header_tag('video_id_number', { :align => "left" })
    # resultstr << sort_header_tag('video_speaker', { :align => "left" })
    # resultstr << sort_header_tag('video_date', { :align => "left" })
    # resultstr << sort_header_tag('video_place_of_recording', { :align => "left" })
    # resultstr << sort_header_tag('video_link', { :align => "left" })
    # resultstr << sort_header_tag('analytical_note', { :align => "left" })
    resultstr << "<th/><th/><th/><th/>"
    resultstr << "</tr><TR HEIGHT=2><TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1></TD></TR>"
    odd_or_even = 0
    for definition in @definitions
      odd_or_even = 1 - odd_or_even
      resultstr << "  <tr class=\"ListLine"+odd_or_even.to_s+"\">"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition.term.to_s unless definition.term == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition.level.to_s unless definition.level == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition.definition.to_s unless definition.definition == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition.language.to_s unless definition.language == nil
    resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition.thematic_classification.to_s unless definition.thematic_classification == nil
    resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.tense.to_s unless definition.tense == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.encyclopedia_entry.to_s unless definition.encyclopedia_entry == nil
    # resultstr << 	"</td>"
    resultstr << 	"<td valign=top>"
    resultstr << 	definition.grammatical_function.to_s unless definition.grammatical_function == nil
    resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.register.to_s unless definition.register == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.language_context.to_s unless definition.language_context == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.numerology.to_s unless definition.numerology == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.major_dialect_family.to_s unless definition.major_dialect_family == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.specific_dialect.to_s unless definition.specific_dialect == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.literary_genre.to_s unless definition.literary_genre == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.literary_period.to_s unless definition.literary_period == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.literary_form.to_s unless definition.literary_form == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.image.to_s unless definition.image == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.image_caption.to_s unless definition.image_caption == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.image_photographer.to_s unless definition.image_photographer == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.image_link.to_s unless definition.image_link == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.image_description.to_s unless definition.image_description == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.audio.to_s unless definition.audio == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.audio_id_number.to_s unless definition.audio_id_number == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.audio_speaker.to_s unless definition.audio_speaker == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.audio_date.to_s unless definition.audio_date == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.audio_place_of_recording.to_s unless definition.audio_place_of_recording == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.audio_link.to_s unless definition.audio_link == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.video.to_s unless definition.video == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.video_id_number.to_s unless definition.video_id_number == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.video_speaker.to_s unless definition.video_speaker == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.video_date.to_s unless definition.video_date == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.video_place_of_recording.to_s unless definition.video_place_of_recording == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.video_link.to_s unless definition.video_link == nil
    # resultstr << 	"</td>"
    # resultstr << 	"<td valign=top>"
    # resultstr << 	definition.analytical_note.to_s unless definition.analytical_note == nil
    # resultstr << 	"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Public Show', :action => 'public_show', :id => definition.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    resultstr << link_to('Show', :action => 'show', :id => definition.id)+"</td>"
    resultstr << "    <td width=20 valign=top>"
    if $allow_editing
      resultstr <<    link_to('Edit', :action => 'edit_dynamic', :id => definition.id)
    end 
    resultstr << "    </td><td width=20 valign=top>"
    if $allow_editing
      resultstr <<   link_to('Destroy', {:action => 'destroy', :id => definition.id}, :confirm => "Are you sure you want to delete this entry?")
    end
      resultstr <<   "</td></tr><TR HEIGHT=2>  <TD COLSPAN=50 BGCOLOR=#ffffff><IMG BORDER=0 HEIGHT=2 WIDTH=1>"
      resultstr << "</tr>"
    end
    resultstr << "</table>
"
  end

  def edit_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    resultstr << "<input size=80 name=definition[term] type=text value=\""
    resultstr << @definition.term if @definition.term != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Level: </b><br>"
    resultstr << "<input size=80 name=definition[level] type=text value=\""
    resultstr << @definition.level if @definition.level != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Definition: </b><br>"
    resultstr << "<textarea cols=65 name=definition[definition] rows=3 wrap=virtual >"
    resultstr << @definition.definition if @definition.definition != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Language: </b><br>"
    resultstr << "<input size=80 name=definition[language] type=text value=\""
    resultstr << @definition.language if @definition.language != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Thematic classification: </b><br>"
    resultstr << "<input size=80 name=definition[thematic_classification] type=text value=\""
    resultstr << @definition.thematic_classification if @definition.thematic_classification != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Tense: </b><br>"
    resultstr << "<input size=80 name=definition[tense] type=text value=\""
    resultstr << @definition.tense if @definition.tense != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Encyclopedia entry: </b><br>"
    resultstr << "<textarea cols=65 name=definition[encyclopedia_entry] rows=3 wrap=virtual >"
    resultstr << @definition.encyclopedia_entry if @definition.encyclopedia_entry != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Grammatical function: </b><br>"
    resultstr << "<input size=80 name=definition[grammatical_function] type=text value=\""
    resultstr << @definition.grammatical_function if @definition.grammatical_function != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Register: </b><br>"
    resultstr << "<input size=80 name=definition[register] type=text value=\""
    resultstr << @definition.register if @definition.register != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Language context: </b><br>"
    resultstr << "<textarea cols=65 name=definition[language_context] rows=3 wrap=virtual >"
    resultstr << @definition.language_context if @definition.language_context != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Numerology: </b><br>"
    resultstr << "<input size=32 name=definition[numerology] type=text value=\""
    resultstr << @definition.numerology if @definition.numerology != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    resultstr << "<input size=80 name=definition[major_dialect_family] type=text value=\""
    resultstr << @definition.major_dialect_family if @definition.major_dialect_family != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    resultstr << "<input size=80 name=definition[specific_dialect] type=text value=\""
    resultstr << @definition.specific_dialect if @definition.specific_dialect != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary genre: </b><br>"
    resultstr << "<input size=80 name=definition[literary_genre] type=text value=\""
    resultstr << @definition.literary_genre if @definition.literary_genre != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary period: </b><br>"
    resultstr << "<input size=80 name=definition[literary_period] type=text value=\""
    resultstr << @definition.literary_period if @definition.literary_period != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Literary form: </b><br>"
    resultstr << "<input size=80 name=definition[literary_form] type=text value=\""
    resultstr << @definition.literary_form if @definition.literary_form != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image: </b><br>"
    resultstr << "<textarea cols=65 name=definition[image] rows=3 wrap=virtual >"
    resultstr << @definition.image if @definition.image != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image caption: </b><br>"
    resultstr << "<textarea cols=65 name=definition[image_caption] rows=3 wrap=virtual >"
    resultstr << @definition.image_caption if @definition.image_caption != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image photographer: </b><br>"
    resultstr << "<input size=80 name=definition[image_photographer] type=text value=\""
    resultstr << @definition.image_photographer if @definition.image_photographer != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Image link: </b><br>"
    resultstr << "<textarea cols=65 name=definition[image_link] rows=3 wrap=virtual >"
    resultstr << @definition.image_link if @definition.image_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Image description: </b><br>"
    resultstr << "<textarea cols=65 name=definition[image_description] rows=3 wrap=virtual >"
    resultstr << @definition.image_description if @definition.image_description != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Audio: </b><br>"
    resultstr << "<input size=80 name=definition[audio] type=text value=\""
    resultstr << @definition.audio if @definition.audio != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio id number: </b><br>"
    resultstr << "<input size=80 name=definition[audio_id_number] type=text value=\""
    resultstr << @definition.audio_id_number if @definition.audio_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    resultstr << "<input size=80 name=definition[audio_speaker] type=text value=\""
    resultstr << @definition.audio_speaker if @definition.audio_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio date: </b><br>"
    resultstr << "<input size=80 name=definition[audio_date] type=text value=\""
    resultstr << @definition.audio_date if @definition.audio_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    resultstr << "<input size=80 name=definition[audio_place_of_recording] type=text value=\""
    resultstr << @definition.audio_place_of_recording if @definition.audio_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Audio link: </b><br>"
    resultstr << "<textarea cols=65 name=definition[audio_link] rows=3 wrap=virtual >"
    resultstr << @definition.audio_link if @definition.audio_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Video: </b><br>"
    resultstr << "<input size=80 name=definition[video] type=text value=\""
    resultstr << @definition.video if @definition.video != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video id number: </b><br>"
    resultstr << "<input size=80 name=definition[video_id_number] type=text value=\""
    resultstr << @definition.video_id_number if @definition.video_id_number != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video speaker: </b><br>"
    resultstr << "<input size=80 name=definition[video_speaker] type=text value=\""
    resultstr << @definition.video_speaker if @definition.video_speaker != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video date: </b><br>"
    resultstr << "<input size=80 name=definition[video_date] type=text value=\""
    resultstr << @definition.video_date if @definition.video_date != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    resultstr << "<input size=80 name=definition[video_place_of_recording] type=text value=\""
    resultstr << @definition.video_place_of_recording if @definition.video_place_of_recording != nil
    resultstr << "\" /></p>"
    resultstr << "<p><b>Video link: </b><br>"
    resultstr << "<textarea cols=65 name=definition[video_link] rows=3 wrap=virtual >"
    resultstr << @definition.video_link if @definition.video_link != nil
    resultstr << "</textarea>"
    resultstr << "<p><b>Analytical note: </b><br>"
    resultstr << "<textarea cols=65 name=definition[analytical_note] rows=3 wrap=virtual >"
    resultstr << @definition.analytical_note if @definition.analytical_note != nil
    resultstr << "</textarea>"
  end

  def edit_dynamic_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b>"
    resultstr << "<input type=hidden name=definition[term] id=definition[term] value=\""+@definition.term.to_s+"\" >"
    if @definition.term == nil or @definition.term == ''
      @definition.term = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :term, {}, {:cols => 50, :rows => 1, :cols => 50, :fieldname => 'definition[term]'}) +"<br>"
    resultstr << "<p><b>Level: </b>"
    resultstr << "<input type=hidden name=definition[level] id=definition[level] value=\""+@definition.level.to_s+"\" >"
    if @definition.level == nil or @definition.level == ''
      @definition.level = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :definition, :level, {}, {:select_options => @level, :fieldname => 'definition[level]'})+"<br>"
    #resultstr << in_place_editor_field( :definition, :level, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[level]'}) +"<br>"
    resultstr << "<p><b>Definition: </b>"
    resultstr << "<input type=hidden name=definition[definition] id=definition[definition] value=\""+@definition.definition.to_s.gsub('"','&quot;')+"\" >"
    if @definition.definition == nil or @definition.definition == ''
      @definition.definition = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :definition, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[definition]'}) +"<br>"
    resultstr << "<p><b>Language of definition: </b>"
    resultstr << "<input type=hidden name=definition[language] id=definition[language] value=\""+@definition.language.to_s+"\" >"
    if @definition.language == nil or @definition.language == ''
      @definition.language = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :definition, :language, {}, {:select_options => @language, :fieldname => 'definition[language]'})+"<br>"
    resultstr << "<p><b>Thematic classification: </b>"
    resultstr << "<input type=hidden name=definition[thematic_classification] id=definition[thematic_classification] value=\""+@definition.thematic_classification.to_s+"\" >"
    if @definition.thematic_classification == nil or @definition.thematic_classification == ''
      @definition.thematic_classification = 'Click to modify'
    end

    resultstr << 	"<span id=definition[thematic_classification]_selector class=menuvalue onclick=show_menu(theme,getCoord(arguments[0]));>"+@definition.thematic_classification+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('definition[thematic_classification]_value', 'mouseover', function(e){ e=document.getElementById('definition[thematic_classification]_value');e.style.backgroundColor='#FFFF99'; });Event.observe('definition[thematic_classification]_value', 'mouseout', function(e){ new Effect.Highlight('definition[thematic_classification]_value',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"

#    resultstr << in_place_editor_field( :definition, :thematic_classification, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[thematic_classification]'}) +"<br>"
    resultstr << "<p><b>Encyclopedia entry: </b>"
    resultstr << "<input type=hidden name=definition[encyclopedia_entry] id=definition[encyclopedia_entry] value=\""+@definition.encyclopedia_entry.to_s+"\" >"
    if @definition.encyclopedia_entry == nil or @definition.encyclopedia_entry == ''
      @definition.encyclopedia_entry = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :encyclopedia_entry, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[encyclopedia_entry]'}) +"<br>"
    resultstr << "<p><b>Grammatical function: </b>"
    resultstr << "<input type=hidden name=definition[grammatical_function] id=definition[grammatical_function] value=\""+@definition.grammatical_function.to_s+"\" >"
    if @definition.grammatical_function == nil or @definition.grammatical_function == ''
      @definition.grammatical_function = 'Click to modify'
    end
    resultstr << 	"<span id=definition[grammatical_function]_value class=menuvalue onclick=show_menu(grammar,getCoord(arguments[0]));>"+@definition.grammatical_function+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('definition[grammatical_function]_value', 'mouseover', function(e){ e=document.getElementById('definition[grammatical_function]_value');e.style.backgroundColor='#FFFF99'; });Event.observe('definition[grammatical_function]_value', 'mouseout', function(e){ new Effect.Highlight('definition[grammatical_function]_value',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_editor_field( :definition, :grammatical_function, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[grammatical_function]'}) +"<br>"
    resultstr << "<p><b>Tense: </b>"
    resultstr << "<input type=hidden name=definition[tense] id=definition[tense] value=\""+@definition.tense.to_s+"\" >"
    if @definition.tense == nil or @definition.tense == ''
      @definition.tense = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :definition, :tense, {}, {:select_options => @tense, :fieldname => 'definition[tense]'})+"<br>"
    resultstr << "<p><b>Register: </b>"
    resultstr << "<input type=hidden name=definition[register] id=definition[register] value=\""+@definition.register.to_s+"\" >"
    if @definition.register == nil or @definition.register == ''
      @definition.register = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :definition, :register, {}, {:select_options => @register, :fieldname => 'definition[register]'})+"<br>"
    resultstr << "<p><b>Language context: </b>"
    resultstr << "<input type=hidden name=definition[language_context] id=definition[language_context] value=\""+@definition.language_context.to_s+"\" >"
    if @definition.language_context == nil or @definition.language_context == ''
      @definition.language_context = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :definition, :language_context, {}, {:select_options => @language_context, :fieldname => 'definition[language_context]'})+"<br>"
    resultstr << "<p><b>Numerology: </b>"
    resultstr << "<input type=hidden name=definition[numerology] id=definition[numerology] value=\""+@definition.numerology.to_s+"\" >"
    if @definition.numerology == nil or @definition.numerology == ''
      @definition.numerology = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :numerology, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[numerology]'}) +"<br>"
    resultstr << "<p><b>Tibetan Dialect: </b>"
    resultstr << "<input type=hidden name=definition[major_dialect_family] id=definition[major_dialect_family] value=\""+@definition.major_dialect_family.to_s+"\" >"
    if @definition.major_dialect_family == nil or @definition.major_dialect_family == ''
      @definition.major_dialect_family = 'Click to modify'
    end
    #resultstr << in_place_editor_field( :definition, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[major_dialect_family]'}) +"<br>"

    resultstr << 	"<span id=definition[major_dialect_family"+@definition.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@definition.id.to_s+";show_menu(dialect_menu,getCoord(arguments[0]));>"+@definition.major_dialect_family+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('definition[major_dialect_family"+@definition.id.to_s+"]_value', 'mouseover', function(e){ e=document.getElementById('definition[major_dialect_family"+@definition.id.to_s+"]_value');e.style.backgroundColor='#FFFF99'; });Event.observe('definition[major_dialect_family"+@definition.id.to_s+"]_value', 'mouseout', function(e){ new Effect.Highlight('definition[major_dialect_family"+@definition.id.to_s+"]_value',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"

    # resultstr << "<p><b>Specific dialect: </b>"
    # resultstr << "<input type=hidden name=definition[specific_dialect] id=definition[specific_dialect] value=\""+@definition.specific_dialect.to_s+"\" >"
    # if @definition.specific_dialect == nil or @definition.specific_dialect == ''
    #   @definition.specific_dialect = 'Click to modify'
    # end
    # resultstr << in_place_editor_field( :definition, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[specific_dialect]'}) +"<br>"
    resultstr << "<p><b>Literary genre: </b>"
    resultstr << "<input type=hidden name=definition[literary_genre] id=definition[literary_genre] value=\""+@definition.literary_genre.to_s+"\" >"
    if @definition.literary_genre == nil or @definition.literary_genre == ''
      @definition.literary_genre = 'Click to modify'
    end
    # resultstr << in_place_select_editor_field( :definition, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'definition[literary_genre]'})+"<br>"
    resultstr << 	"<span id=definition[literary_genre"+@definition.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@definition.id.to_s+";show_menu(genre_menu,getCoord(arguments[0]));>"+@definition.literary_genre+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('definition[literary_genre"+@definition.id.to_s+"]_value', 'mouseover', function(e){ e=document.getElementById('definition[literary_genre"+@definition.id.to_s+"]_value');e.style.backgroundColor='#FFFF99'; });Event.observe('definition[literary_genre"+@definition.id.to_s+"]_value', 'mouseout', function(e){ new Effect.Highlight('definition[literary_genre"+@definition.id.to_s+"]_value',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"


    resultstr << "<p><b>Literary period: </b>"
    resultstr << "<input type=hidden name=definition[literary_period] id=definition[literary_period] value=\""+@definition.literary_period.to_s+"\" >"
    if @definition.literary_period == nil or @definition.literary_period == ''
      @definition.literary_period = 'Click to modify'
    end
    resultstr << in_place_select_editor_field( :definition, :literary_period, {}, {:select_options => @literary_period, :fieldname => 'definition[literary_period]'})+"<br>"
    # resultstr << "<p><b>Literary form: </b>"
    # resultstr << "<input type=hidden name=definition[literary_form] id=definition[literary_form] value=\""+@definition.literary_form.to_s+"\" >"
    # if @definition.literary_form == nil or @definition.literary_form == ''
    #   @definition.literary_form = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :definition, :literary_form, {}, {:select_options => @literary_form, :fieldname => 'definition[literary_form]'})+"<br>"
    resultstr << "<p><b>Image: </b>"
    resultstr << "<input type=hidden name=definition[image] id=definition[image] value=\""+@definition.image.to_s+"\" >"
    if @definition.image == nil or @definition.image == ''
      @definition.image = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[image]'}) +"<br>"
    resultstr << "<p><b>Image caption: </b>"
    resultstr << "<input type=hidden name=definition[image_caption] id=definition[image_caption] value=\""+@definition.image_caption.to_s+"\" >"
    if @definition.image_caption == nil or @definition.image_caption == ''
      @definition.image_caption = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[image_caption]'}) +"<br>"
    resultstr << "<p><b>Image photographer: </b>"
    resultstr << "<input type=hidden name=definition[image_photographer] id=definition[image_photographer] value=\""+@definition.image_photographer.to_s+"\" >"
    if @definition.image_photographer == nil or @definition.image_photographer == ''
      @definition.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[image_photographer]'}) +"<br>"
    resultstr << "<p><b>Image link: </b>"
    resultstr << "<input type=hidden name=definition[image_link] id=definition[image_link] value=\""+@definition.image_link.to_s+"\" >"
    if @definition.image_link == nil or @definition.image_link == ''
      @definition.image_link = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[image_link]'}) +"<br>"
    resultstr << "<p><b>Image description: </b>"
    resultstr << "<input type=hidden name=definition[image_description] id=definition[image_description] value=\""+@definition.image_description.to_s+"\" >"
    if @definition.image_description == nil or @definition.image_description == ''
      @definition.image_description = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :image_description, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[image_description]'}) +"<br>"
    resultstr << "<p><b>Audio: </b>"
    resultstr << "<input type=hidden name=definition[audio] id=definition[audio] value=\""+@definition.audio.to_s+"\" >"
    if @definition.audio == nil or @definition.audio == ''
      @definition.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[audio]'}) +"<br>"
    resultstr << "<p><b>Audio id number: </b>"
    resultstr << "<input type=hidden name=definition[audio_id_number] id=definition[audio_id_number] value=\""+@definition.audio_id_number.to_s+"\" >"
    if @definition.audio_id_number == nil or @definition.audio_id_number == ''
      @definition.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[audio_id_number]'}) +"<br>"
    resultstr << "<p><b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=definition[audio_speaker] id=definition[audio_speaker] value=\""+@definition.audio_speaker.to_s+"\" >"
    if @definition.audio_speaker == nil or @definition.audio_speaker == ''
      @definition.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[audio_speaker]'}) +"<br>"
    resultstr << "<p><b>Audio date: </b>"
    resultstr << "<input type=hidden name=definition[audio_date] id=definition[audio_date] value=\""+@definition.audio_date.to_s+"\" >"
    if @definition.audio_date == nil or @definition.audio_date == ''
      @definition.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[audio_date]'}) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=definition[audio_place_of_recording] id=definition[audio_place_of_recording] value=\""+@definition.audio_place_of_recording.to_s+"\" >"
    if @definition.audio_place_of_recording == nil or @definition.audio_place_of_recording == ''
      @definition.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[audio_place_of_recording]'}) +"<br>"
    resultstr << "<p><b>Audio link: </b>"
    resultstr << "<input type=hidden name=definition[audio_link] id=definition[audio_link] value=\""+@definition.audio_link.to_s+"\" >"
    if @definition.audio_link == nil or @definition.audio_link == ''
      @definition.audio_link = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[audio_link]'}) +"<br>"
    resultstr << "<p><b>Audio description: </b>"
    resultstr << "<input type=hidden name=definition[audio_description] id=definition[audio_description] value=\""+@definition.audio_description.to_s+"\" >"
    if @definition.audio_description == nil or @definition.audio_description == ''
      @definition.audio_description = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[audio_description]'}) +"<br>"
    resultstr << "<p><b>Video: </b>"
    resultstr << "<input type=hidden name=definition[video] id=definition[video] value=\""+@definition.video.to_s+"\" >"
    if @definition.video == nil or @definition.video == ''
      @definition.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[video]'}) +"<br>"
    resultstr << "<p><b>Video id number: </b>"
    resultstr << "<input type=hidden name=definition[video_id_number] id=definition[video_id_number] value=\""+@definition.video_id_number.to_s+"\" >"
    if @definition.video_id_number == nil or @definition.video_id_number == ''
      @definition.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[video_id_number]'}) +"<br>"
    resultstr << "<p><b>Video speaker: </b>"
    resultstr << "<input type=hidden name=definition[video_speaker] id=definition[video_speaker] value=\""+@definition.video_speaker.to_s+"\" >"
    if @definition.video_speaker == nil or @definition.video_speaker == ''
      @definition.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[video_speaker]'}) +"<br>"
    resultstr << "<p><b>Video date: </b>"
    resultstr << "<input type=hidden name=definition[video_date] id=definition[video_date] value=\""+@definition.video_date.to_s+"\" >"
    if @definition.video_date == nil or @definition.video_date == ''
      @definition.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[video_date]'}) +"<br>"
    resultstr << "<p><b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=definition[video_place_of_recording] id=definition[video_place_of_recording] value=\""+@definition.video_place_of_recording.to_s+"\" >"
    if @definition.video_place_of_recording == nil or @definition.video_place_of_recording == ''
      @definition.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'definition[video_place_of_recording]'}) +"<br>"
    resultstr << "<p><b>Video link: </b>"
    resultstr << "<input type=hidden name=definition[video_link] id=definition[video_link] value=\""+@definition.video_link.to_s+"\" >"
    if @definition.video_link == nil or @definition.video_link == ''
      @definition.video_link = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[video_link]'}) +"<br>"
    resultstr << "<p><b>Video description: </b>"
    resultstr << "<input type=hidden name=definition[video_description] id=definition[video_description] value=\""+@definition.audio_description.to_s+"\" >"
    if @definition.video_description == nil or @definition.video_description == ''
      @definition.video_description = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[video_description]'}) +"<br>"
    resultstr << "<p><b>Analytical note: </b>"
    resultstr << "<input type=hidden name=definition[analytical_note] id=definition[analytical_note] value=\""+@definition.analytical_note.to_s+"\" >"
    if @definition.analytical_note == nil or @definition.analytical_note == ''
      @definition.analytical_note = 'Click to modify'
    end
    resultstr << "<br>"+in_place_editor_field( :definition, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'definition[analytical_note]'}) +"<br>"
  end

  def show_edit_definition
    resultstr = ""
    resultstr << "<p><b>Term: </b><br>"
    if @definition.term == nil or @definition.term == ''
      @definition.term = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :term, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Level: </b><br>"
    if @definition.level == nil or @definition.level == ''
      @definition.level = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :level, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Definition: </b><br>"
    if @definition.definition == nil or @definition.definition == ''
      @definition.definition = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :definition, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Language: </b><br>"
    if @definition.language == nil or @definition.language == ''
      @definition.language = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :language, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Thematic classification: </b><br>"
    if @definition.thematic_classification == nil or @definition.thematic_classification == ''
      @definition.thematic_classification = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :thematic_classification, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Tense: </b><br>"
    if @definition.tense == nil or @definition.tense == ''
      @definition.tense = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :tense, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Encyclopedia entry: </b><br>"
    if @definition.encyclopedia_entry == nil or @definition.encyclopedia_entry == ''
      @definition.encyclopedia_entry = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :encyclopedia_entry, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Grammatical function: </b><br>"
    if @definition.grammatical_function == nil or @definition.grammatical_function == ''
      @definition.grammatical_function = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :grammatical_function, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Register: </b><br>"
    if @definition.register == nil or @definition.register == ''
      @definition.register = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :register, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Language context: </b><br>"
    if @definition.language_context == nil or @definition.language_context == ''
      @definition.language_context = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :language_context, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Numerology: </b><br>"
    if @definition.numerology == nil or @definition.numerology == ''
      @definition.numerology = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :numerology, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Major dialect family: </b><br>"
    if @definition.major_dialect_family == nil or @definition.major_dialect_family == ''
      @definition.major_dialect_family = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :major_dialect_family, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Specific dialect: </b><br>"
    if @definition.specific_dialect == nil or @definition.specific_dialect == ''
      @definition.specific_dialect = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :specific_dialect, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary genre: </b><br>"
    if @definition.literary_genre == nil or @definition.literary_genre == ''
      @definition.literary_genre = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :literary_genre, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary period: </b><br>"
    if @definition.literary_period == nil or @definition.literary_period == ''
      @definition.literary_period = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :literary_period, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Literary form: </b><br>"
    if @definition.literary_form == nil or @definition.literary_form == ''
      @definition.literary_form = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :literary_form, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image: </b><br>"
    if @definition.image == nil or @definition.image == ''
      @definition.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image caption: </b><br>"
    if @definition.image_caption == nil or @definition.image_caption == ''
      @definition.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_caption, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image photographer: </b><br>"
    if @definition.image_photographer == nil or @definition.image_photographer == ''
      @definition.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_photographer, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Image link: </b><br>"
    if @definition.image_link == nil or @definition.image_link == ''
      @definition.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Image description: </b><br>"
    if @definition.image_description == nil or @definition.image_description == ''
      @definition.image_description = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_description, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Audio: </b><br>"
    if @definition.audio == nil or @definition.audio == ''
      @definition.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio id number: </b><br>"
    if @definition.audio_id_number == nil or @definition.audio_id_number == ''
      @definition.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio speaker: </b><br>"
    if @definition.audio_speaker == nil or @definition.audio_speaker == ''
      @definition.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio date: </b><br>"
    if @definition.audio_date == nil or @definition.audio_date == ''
      @definition.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio place of recording: </b><br>"
    if @definition.audio_place_of_recording == nil or @definition.audio_place_of_recording == ''
      @definition.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Audio link: </b><br>"
    if @definition.audio_link == nil or @definition.audio_link == ''
      @definition.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Video: </b><br>"
    if @definition.video == nil or @definition.video == ''
      @definition.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video id number: </b><br>"
    if @definition.video_id_number == nil or @definition.video_id_number == ''
      @definition.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_id_number, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video speaker: </b><br>"
    if @definition.video_speaker == nil or @definition.video_speaker == ''
      @definition.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_speaker, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video date: </b><br>"
    if @definition.video_date == nil or @definition.video_date == ''
      @definition.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_date, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video place of recording: </b><br>"
    if @definition.video_place_of_recording == nil or @definition.video_place_of_recording == ''
      @definition.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_place_of_recording, {}, :rows => 1) +"<br>"
    resultstr << "<p><b>Video link: </b><br>"
    if @definition.video_link == nil or @definition.video_link == ''
      @definition.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_link, {}, :rows => 3) +"<br>"
    resultstr << "<p><b>Analytical note: </b><br>"
    if @definition.analytical_note == nil or @definition.analytical_note == ''
      @definition.analytical_note = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :analytical_note, {}, :rows => 3) +"<br>"
  end

  def search_definition
    @level = ["","head term","not head"]
    resultstr = ""
    resultstr << "<tr><td><b>Term: </b></td>"
    resultstr << "<td><input size=50 name=definition[term] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Level: </b></td>"
    resultstr << "<td>"+select('definition','level',@level)+"</td></tr>"
    # resultstr << "<td><input size=50 name=definition[level] type=text value=\""
    # resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Definition: </b></td>"
    resultstr << "<td><input size=50 name=definition[definition] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language: </b></td>"
    resultstr << "<td><input size=50 name=definition[language] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Thematic classification: </b></td>"
    resultstr << "<td><input size=50 name=definition[thematic_classification] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tense: </b></td>"
    resultstr << "<td><input size=50 name=definition[tense] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Encyclopedia entry: </b></td>"
    resultstr << "<td><input size=50 name=definition[encyclopedia_entry] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Grammatical function: </b></td>"
    resultstr << "<td><input size=50 name=definition[grammatical_function] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Register: </b></td>"
    resultstr << "<td><input size=50 name=definition[register] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language context: </b></td>"
    resultstr << "<td><input size=50 name=definition[language_context] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Numerology: </b></td>"
    resultstr << "<td><input size=50 name=definition[numerology] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Major dialect family: </b></td>"
    resultstr << "<td><input size=50 name=definition[major_dialect_family] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Specific dialect: </b></td>"
    resultstr << "<td><input size=50 name=definition[specific_dialect] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=definition[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=definition[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=definition[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=definition[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=definition[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=definition[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=definition[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=definition[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=definition[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=definition[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=definition[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=definition[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=definition[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=definition[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=definition[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=definition[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=definition[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=definition[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=definition[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=definition[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=definition[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end

  def internal_search_term
    resultstr = ""
    resultstr << "<tr><td><b>Term: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[term] type=text value=\""
    resultstr << "\" /></td></tr>"
  end
  
  def internal_search_definition
    resultstr = ""
    resultstr << "<tr><td><b>Term: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[term] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Level: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[level] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Definition: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[definition] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language of definition: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[language] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Thematic classification: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[thematic_classification] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Tense: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[tense] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Encyclopedia entry: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[encyclopedia_entry] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Grammatical function: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[grammatical_function] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Register: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[register] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Language context: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[language_context] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Numerology: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[numerology] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Major dialect family: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[major_dialect_family] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Specific dialect: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[specific_dialect] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary genre: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[literary_genre] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary period: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[literary_period] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Literary form: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[literary_form] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[image] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image caption: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[image_caption] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image photographer: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[image_photographer] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image link: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[image_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Image description: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[image_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio id number: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio speaker: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio date: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio place of recording: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio link: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Audio description: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[audio_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video id number: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video_id_number] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video speaker: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video_speaker] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video date: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video_date] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video place of recording: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video_place_of_recording] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video link: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video_link] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Video description: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[video_description] type=text value=\""
    resultstr << "\" /></td></tr>"
    resultstr << "<tr><td><b>Analytical note: </b></td>"
    resultstr << "<td><input size=50 name=internal_definition[analytical_note] type=text value=\""
    resultstr << "\" /></td></tr>"
  end
  
  def internal_edit_dynamic_definition
    resultstr = ""
    #resultstr << in_place_editor_field(:definition, :term)
    resultstr << "<b>Term: </b>"
    resultstr << "<input type=hidden name=internal_definition[term] id=internal_definition[term] value=\""+@definition.term.to_s+"\" >"
    if @definition.term == nil or @definition.term == ''
      @definition.term = 'Click to modify new term'
    end
    
    
    resultstr << in_place_editor_field( :definition, :term, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[term]'}) +"<br>"
    resultstr << "<b>Level: </b>"
    resultstr << "<input type=hidden name=internal_definition[level] id=internal_definition[level] value=\""+@definition.level.to_s+"\" >"
    if @definition.level == nil or @definition.level == ''
      @definition.level = 'Click to modify'
    end
    
    # resultstr << in_place_select_editor_field( :definition, :level, {}, {:select_options => @level, :fieldname => 'internal_definition[level]'})+"<br>"
    #resultstr << in_place_editor_select_field( :definition, :level, {}, {:collection => @level})+"<br>"
    resultstr << "<b>Definition: </b>"
    resultstr << "<input type=hidden name=internal_definition[definition] id=internal_definition[definition] value=\""+@definition.definition.to_s+"\" >"
    #if @definition.definition == nil or @definition.definition == ''
    #  @definition.definition = 'Click to modify definition'
    #end
    #resultstr << in_place_editor_field( :definition, :definition, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[definition]'}) +"<br>"
    resultstr << "<span class='definitions_show'>"
    resultstr << "<div id='" + "#{@definition.id}_defdiv" + "'>"
    edit_path = definition_edit_url(:id => @definition.id)
    if @definition.definition == nil or @definition.definition == ''
      t_definition = 'Click to modify definition'
    else
      t_definition = @definition.definition      
    end    
    resultstr << link_to_remote(t_definition, :url => edit_path, :update => "#{@definition.id}_defdiv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
    resultstr << "<b>Language of definition: </b>"
    #resultstr << "<span id=123lang_selector>"
    #resultstr << " category_selector(@data, 'definition', 'language_type, false, @definition.id, '123lang_selector' ) "
    #resultstr << "</span><br>"
    resultstr << "<input type=hidden name=internal_definition[language] id=internal_definition[language] value=\""+@definition.language.to_s+"\" >"
    if @definition.language_type == nil or @definition.language_type == ''
      title = 'Click to modify'
    else
      title = @definition.language_type.title
    end
    resultstr << "<span id=\"internal_definition[language_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.language+']' if @definition.language != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[language_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 184, 'model_name' => 'definition', 'function_name' => "language_type", :update_id => "internal_definition[language_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[language_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[language_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[language_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[language_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    # resultstr << in_place_select_editor_field( :definition, :language, {}, {:select_options => @language, :fieldname => 'internal_definition[language]'})+"<br>"
    resultstr << "<b>Tibetan Dialect: </b>"
    resultstr << "<input type=hidden name=definition[major_dialect_family] id=definition[major_dialect_family"+@definition.id.to_s+"] value=\""+@definition.major_dialect_family.to_s+"\" >"

    if @definition.major_dialect_family_type == nil or @definition.major_dialect_family_type == ''
      title = 'Click to modify'
    else
      title = @definition.major_dialect_family_type.title
    end
    resultstr << "<span id=\"internal_definition[major_dialect_family_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.major_dialect_family+']' if @definition.major_dialect_family != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[major_dialect_family_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 638, 'model_name' => 'definition', 'function_name' => "major_dialect_family_type", :update_id => "internal_definition[major_dialect_family_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"

    if @definition.major_dialect_family == nil or @definition.major_dialect_family == ''
      @definition.major_dialect_family = 'Click to modify'
    end
    # resultstr <<  "<span id=definition[major_dialect_family"+@definition.id.to_s+"]_value class=menuvalue onclick1=dialect_id="+@definition.id.to_s+";show_menu(dialect_menu,getCoord(arguments[0]));>"+@definition.major_dialect_family+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    resultstr << "<b>Grammatical function: </b>"
    # resultstr << <%= render(:partial => 'display_category_selector_link', :locals => {:function_name => 'grammatical_function_type', :title => (d.grammatical_function_type != nil ? d.grammatical_function_type.title : 'Select A Value'), :id => d.id, :data_id => 286})
    #     
        
    resultstr << "<input type=hidden name=internal_definition[grammatical_function] id=internal_definition[grammatical_function"+@definition.id.to_s+"] value=\""+@definition.grammatical_function.to_s+"\" >"
    # if @definition.grammatical_function == nil or @definition.grammatical_function == ''
    #   @definition.grammatical_function = 'Click to modify'
    # end
    resultstr << 	"<span id=internal_definition[grammatical_function"+@definition.id.to_s+"]_value class=menuvalue onclick1=show_menu(internal_grammar_menu,getCoord(arguments[0]));>"
    # resultstr << @definition.grammatical_function

    resultstr << "<span id=internal_definition[grammatical_function_type#{@definition.id}]_selector>"
    resultstr << '['+@definition.grammatical_function+']' if @definition.grammatical_function != nil
    resultstr << link_to_remote( (@definition.grammatical_function_type != nil ? @definition.grammatical_function_type.title : 'Select A Value'),{:update => "internal_definition[grammatical_function_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 286, 'model_name' => 'definition', 'function_name' => "grammatical_function_type", :update_id => "internal_definition[grammatical_function_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr <<"</span>"

    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << '<input type="hidden" name="test_value" value="test1 & test2">'
#    resultstr << in_place_editor_field( :definition, :grammatical_function, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[grammatical_function]'}) +"<br>"
    resultstr << "<div id=tense"+@definition.id.to_s
    resultstr << " style=\"display:none;\""  unless @definition.grammatical_function == 'Verb'
    resultstr << ">"
    resultstr << "<b>Tense: </b>"
    resultstr << "<input type=hidden name=internal_definition[tense] id=internal_definition[tense] value=\""+@definition.tense.to_s+"\" >"
    if @definition.tense == nil or @definition.tense == ''
      @definition.tense = 'Click to modify'
    end
    #resultstr << in_place_select_editor_field( :definition, :tense, {}, {:select_options => @tense, :fieldname => 'internal_definition[tense]'})+"<br>"
    resultstr << "</div>"

    # resultstr << observe_field('internal_definition[grammatical_function"+@definition.id.to_s+"]', :frequency => 0.1, :update => "tense"+@definition.id.to_s, :url => {  :action => 'tense' ,:id => params[:id]}, :with=>'value', :loaded => "new Effect.Highlight('strata_types');") 

    resultstr << "<b>Register: </b>"
    resultstr << "<input type=hidden name=internal_definition[register] id=internal_definition[register] value=\""+@definition.register.to_s+"\" >"

    if @definition.register_type == nil or @definition.register_type == ''
      title = 'Click to modify'
    else
      title = @definition.register_type.title
    end
    resultstr << "<span id=\"internal_definition[register_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.register+']' if @definition.register != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[register_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 190, 'model_name' => 'definition', 'function_name' => "register_type", :update_id => "internal_definition[register_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[register_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[register_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[register_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[register_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"

    # 
    # if @definition.register == nil or @definition.register == ''
    #   @definition.register = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :definition, :register, {}, {:select_options => @register, :fieldname => 'internal_definition[register]'})+"<br>"
    resultstr << "<b>Language context: </b>"
    resultstr << "<input type=hidden name=internal_definition[language_context] id=internal_definition[language_context] value=\""+@definition.language_context.to_s+"\" >"

    if @definition.language_context_type == nil or @definition.language_context_type == ''
      title = 'Click to modify'
    else
      title = @definition.language_context_type.title
    end
    resultstr << "<span id=\"internal_definition[language_context_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.language_context+']' if @definition.language_context != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[language_context_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 185, 'model_name' => 'definition', 'function_name' => "language_context_type", :update_id => "internal_definition[language_context_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[language_context_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[language_context_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[language_context_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[language_context_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"

    # if @definition.language_context == nil or @definition.language_context == ''
    #   @definition.language_context = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :definition, :language_context, {}, {:select_options => @language_context, :fieldname => 'internal_definition[language_context]'})+"<br>"
    resultstr << "<b>Literary genre: </b>"
    resultstr << "<input type=hidden name=internal_definition[literary_genre] id=internal_definition[literary_genre"+@definition.id.to_s+"] value=\""+@definition.literary_genre.to_s+"\" >"

    if @definition.literary_genre_type == nil or @definition.literary_genre_type == ''
      title = 'Click to modify'
    else
      title = @definition.literary_genre_type.title
    end
    resultstr << "<span id=\"internal_definition[literary_genre_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.literary_genre+']' if @definition.literary_genre != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[literary_genre_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 119, 'model_name' => 'definition', 'function_name' => "literary_genre_type", :update_id => "internal_definition[literary_genre_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"

    # if @definition.literary_genre == nil or @definition.literary_genre == ''
    #   @definition.literary_genre = 'Click to modify'
    # end
    # # resultstr << in_place_select_editor_field( :definition, :literary_genre, {}, {:select_options => @literary_genre, :fieldname => 'internal_definition[literary_genre]'})+"<br>"
    # resultstr <<  "<span id=internal_definition[literary_genre"+@definition.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@definition.id.to_s+";show_menu(genre_menu,getCoord(arguments[0]));>"+@definition.literary_genre+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    resultstr << "<b>Literary period: </b>"
    resultstr << "<input type=hidden name=internal_definition[literary_period] id=internal_definition[literary_period] value=\""+@definition.literary_period.to_s+"\" >"

    if @definition.literary_period_type == nil
      title = 'Click to modify'
    else
      title = @definition.literary_period_type.title
    end
    resultstr << "<span id=\"internal_definition[literary_period_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.literary_period+']' if @definition.literary_period != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[literary_period_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 187, 'model_name' => 'definition', 'function_name' => "literary_period_type", :update_id => "internal_definition[literary_period_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # if @definition.literary_period == nil or @definition.literary_period == ''
    #   @definition.literary_period = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :definition, :literary_period, {}, {:select_options => @literary_period, :fieldname => 'internal_definition[literary_period]'})+"<br>"
    # resultstr << "<b>Literary form: </b>"
    # resultstr << "<input type=hidden name=internal_definition[literary_form] id=internal_definition[literary_form] value=\""+@definition.literary_form.to_s+"\" >"
    # if @definition.literary_form == nil or @definition.literary_form == ''
    #   @definition.literary_form = 'Click to modify'
    # end
    # resultstr << in_place_select_editor_field( :definition, :literary_form, {}, {:select_options => @literary_form, :fieldname => 'internal_definition[literary_form]'})+"<br>"
    resultstr << "<b>Thematic classification: </b>"
    resultstr << "<input type=hidden name=internal_definition[thematic_classification] id=internal_definition[thematic_classification] value=\""+@definition.thematic_classification.to_s+"\" >"

    if @definition.thematic_classification_type == nil
      title = 'Click to modify'
    else
      title = @definition.thematic_classification_type.title
    end
    resultstr << "<span id=\"internal_definition[thematic_classification_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.thematic_classification+']' if @definition.thematic_classification != nil
    resultstr << link_to_remote( title,{:update => "internal_definition[thematic_classification_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 272, 'model_name' => 'definition', 'function_name' => "thematic_classification_type", :update_id => "internal_definition[thematic_classification_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    resultstr << "</span><br>"

    if @definition.thematic_classification == nil or @definition.thematic_classification == ''
      @definition.thematic_classification = 'Click to modify'
    end
    # resultstr <<  "<span id=internal_definition[thematic_classification]_value class=menuvalue onclick1=show_menu(theme_internal,getCoord(arguments[0]));>"+@definition.thematic_classification+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
#    resultstr << in_place_editor_field( :definition, :thematic_classification, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[thematic_classification]'}) +"<br>"
    resultstr << "<b>Numerology: </b>"
    resultstr << "<input type=hidden name=internal_definition[numerology] id=internal_definition[numerology] value=\""+@definition.numerology.to_s+"\" >"
    if @definition.numerology == nil or @definition.numerology == ''
      @definition.numerology = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :numerology, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[numerology]'}) +"<br>"
    resultstr << "<b>Encyclopedia entry: </b>"
    resultstr << "<input type=hidden name=internal_definition[encyclopedia_entry] id=internal_definition[encyclopedia_entry] value=\""+@definition.encyclopedia_entry.to_s+"\" >"
    if @definition.encyclopedia_entry == nil or @definition.encyclopedia_entry == ''
      @definition.encyclopedia_entry = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :encyclopedia_entry, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[encyclopedia_entry]'}) +"<br>"

    # resultstr << "<b>Major dialect family: </b>"
    # resultstr << "<input type=hidden name=internal_definition[major_dialect_family] id=internal_definition[major_dialect_family] value=\""+@definition.major_dialect_family.to_s+"\" >"
    # if @definition.major_dialect_family == nil or @definition.major_dialect_family == ''
    #   @definition.major_dialect_family = 'Click to modify'
    # end
    # resultstr << in_place_editor_field( :definition, :major_dialect_family, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[major_dialect_family]'}) +"<br>"
    # resultstr << "<b>Specific dialect: </b>"
    # resultstr << "<input type=hidden name=internal_definition[specific_dialect] id=internal_definition[specific_dialect] value=\""+@definition.specific_dialect.to_s+"\" >"
    # if @definition.specific_dialect == nil or @definition.specific_dialect == ''
    #   @definition.specific_dialect = 'Click to modify'
    # end
    # resultstr << in_place_editor_field( :definition, :specific_dialect, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[specific_dialect]'}) +"<br>"

    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=internal_definition[analytical_note] id=internal_definition[analytical_note] value=\""+@definition.analytical_note.to_s+"\" >"
    #if @definition.analytical_note == nil or @definition.analytical_note == ''
    #  @definition.analytical_note = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :definition, :analytical_note, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[analytical_note]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_anotediv" + "'>"
    edit_path = analytical_note_edit_url(:id => @definition.id)
    if @definition.analytical_note == nil or @definition.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @definition.analytical_note
    end  
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@definition.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
		resultstr <<	"<span id=\"show_av_"+@definition.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_"+@definition.id.to_s+"');Element.show('hide_av_"+@definition.id.to_s+"');Element.show('av_definition_"+@definition.id.to_s+"');", :title => 'Show')+"</span>"
		resultstr <<	"<span id=\"hide_av_"+@definition.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_"+@definition.id.to_s+"');Element.show('show_av_"+@definition.id.to_s+"');Element.hide('av_definition_"+@definition.id.to_s+"');", :title => 'Hide')+"</span>"
    
    resultstr << "<span id=\"av_definition_"+@definition.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    
    resultstr << "<br><b>Image: </b>"
    resultstr << "<input type=hidden name=internal_definition[image] id=internal_definition[image] value=\""+@definition.image.to_s+"\" >"
    if @definition.image == nil or @definition.image == ''
      @definition.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_caption] id=internal_definition[image_caption] value=\""+@definition.image_caption.to_s+"\" >"
    if @definition.image_caption == nil or @definition.image_caption == ''
      @definition.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_photographer] id=internal_definition[image_photographer] value=\""+@definition.image_photographer.to_s+"\" >"
    if @definition.image_photographer == nil or @definition.image_photographer == ''
      @definition.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_link] id=internal_definition[image_link] value=\""+@definition.image_link.to_s+"\" >"
    if @definition.image_link == nil or @definition.image_link == ''
      @definition.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_description] id=internal_definition[image_description] value=\""+@definition.image_description.to_s+"\" >"
    #if @definition.image_description == nil or @definition.image_description == ''
    #  @definition.image_description = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :definition, :image_description, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_imagedescdiv" + "'>"
    edit_path = image_description_edit_url(:id => @definition.id)
    if @definition.image_description == nil or @definition.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @definition.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@definition.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio] id=internal_definition[audio] value=\""+@definition.audio.to_s+"\" >"
    if @definition.audio == nil or @definition.audio == ''
      @definition.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_id_number] id=internal_definition[audio_id_number] value=\""+@definition.audio_id_number.to_s+"\" >"
    if @definition.audio_id_number == nil or @definition.audio_id_number == ''
      @definition.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_speaker] id=internal_definition[audio_speaker] value=\""+@definition.audio_speaker.to_s+"\" >"
    if @definition.audio_speaker == nil or @definition.audio_speaker == ''
      @definition.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_date] id=internal_definition[audio_date] value=\""+@definition.audio_date.to_s+"\" >"
    if @definition.audio_date == nil or @definition.audio_date == ''
      @definition.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_place_of_recording] id=internal_definition[audio_place_of_recording] value=\""+@definition.audio_place_of_recording.to_s+"\" >"
    if @definition.audio_place_of_recording == nil or @definition.audio_place_of_recording == ''
      @definition.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_link] id=internal_definition[audio_link] value=\""+@definition.audio_link.to_s+"\" >"
    if @definition.audio_link == nil or @definition.audio_link == ''
      @definition.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_description] id=internal_definition[audio_description] value=\""+@definition.audio_description.to_s+"\" >"
    #if @definition.audio_description == nil or @definition.audio_description == ''
    #  @definition.audio_description = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :definition, :audio_description, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[audio_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_audiodescdiv" + "'>"
    edit_path = audio_description_edit_url(:id => @definition.id)
    if @definition.audio_description == nil or @definition.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @definition.audio_description  
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@definition.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>" 
    resultstr << "</span>"
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=internal_definition[video] id=internal_definition[video] value=\""+@definition.video.to_s+"\" >"
    if @definition.video == nil or @definition.video == ''
      @definition.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_id_number] id=internal_definition[video_id_number] value=\""+@definition.video_id_number.to_s+"\" >"
    if @definition.video_id_number == nil or @definition.video_id_number == ''
      @definition.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_speaker] id=internal_definition[video_speaker] value=\""+@definition.video_speaker.to_s+"\" >"
    if @definition.video_speaker == nil or @definition.video_speaker == ''
      @definition.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_date] id=internal_definition[video_date] value=\""+@definition.video_date.to_s+"\" >"
    if @definition.video_date == nil or @definition.video_date == ''
      @definition.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_place_of_recording] id=internal_definition[video_place_of_recording] value=\""+@definition.video_place_of_recording.to_s+"\" >"
    if @definition.video_place_of_recording == nil or @definition.video_place_of_recording == ''
      @definition.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_link] id=internal_definition[video_link] value=\""+@definition.video_link.to_s+"\" >"
    if @definition.video_link == nil or @definition.video_link == ''
      @definition.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[video_link]'}) +"<br>"
    
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_description] id=internal_definition[video_description] value=\""+@definition.audio_description.to_s+"\" >"
    #if @definition.video_description == nil or @definition.video_description == ''
    #  @definition.video_description = 'Click to modify'
    #end
    #resultstr << in_place_editor_field( :definition, :video_description, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[video_description]'}) +"<br>"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_videodescdiv" + "'>"
    edit_path = video_description_edit_url(:id => @definition.id)
    if @definition.video_description == nil or @definition.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @definition.video_description
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@definition.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>" 
    resultstr << "</span>"
    
    resultstr << "</dd></dl></span>"
  end
  
  
  def modal_internal_edit_dynamic_definition
    resultstr = ""
    resultstr << "<b>Term: </b>"
    resultstr << "<input type=hidden name=internal_definition[term] id=internal_definition[term] value=\""+@definition.term.to_s+"\" >"
    if @definition.term == nil or @definition.term == ''
      @definition.term = 'Click to modify new term'
    end
    resultstr << in_place_editor_field( :definition, :term, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[term]'}) +"<br>"
 
    resultstr << "<b>Level: </b>"
    resultstr << "<input type=hidden name=internal_definition[level] id=internal_definition[level] value=\""+@definition.level.to_s+"\" >"
    if @definition.level == nil or @definition.level == ''
      @definition.level = 'Click to modify'
    end  
    # resultstr << in_place_select_editor_field( :definition, :level, {}, {:select_options => @level, :fieldname => 'internal_definition[level]'})+"<br>"
    #resultstr << in_place_editor_select_field( :definition, :level, {}, {:collection => @level})+"<br>"
    #debugger
    #@level = ['one','two','three']
    #resultstr << in_place_editor_field( :definition, :level, {}, {:field_type => 'select', :select_options => @level, :fieldname => 'internal_definition[level]'}) + "<br>"
     resultstr << in_place_editor_field( :definition, :level, {}, {:field_type => 'select', :select_options => @level})
    resultstr << select(:definition, :level, @level) + "<br>"
    
    resultstr << "<b>Definition: </b>"
    #resultstr << "<input type=hidden name=internal_definition[definition] id=internal_definition[definition] value=\""+@definition.definition.to_s+"\" >"
    resultstr << "<span class='definitions_thickbox_show'>"
    resultstr << "<div id='" + "#{@definition.id}_defdiv" + "'>"
    edit_path = definition_edit_url(:id => @definition.id)
    if @definition.definition == nil or @definition.definition == ''
      t_definition = 'Click to modify definition'
    else
      t_definition = @definition.definition      
    end    
    resultstr << link_to_remote(t_definition, :url => edit_path, :update => "#{@definition.id}_defdiv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
    resultstr << "<b>Language of definition: </b>"
    #resultstr << "<input type=hidden name=internal_definition[language] id=internal_definition[language] value=\""+@definition.language.to_s+"\" >"
    #if @definition.language_type == nil or @definition.language_type == ''
    #  title = 'Click to modify'
    #else
    #  title = @definition.language_type.title
    #end
    #resultstr << "<span id=\"internal_definition[language_type#{@definition.id}]_selector\">"
    #resultstr << '['+@definition.language+']' if @definition.language != nil
    @data = Category.find(184)
    resultstr << category_selector(@data, :definition, :language_type, true, :hasTree => 'true', :singleSelectionTree => 'true')
    resultstr << "<br>"
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[language_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[language_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[language_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[language_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    
    resultstr << "<b>Tibetan Dialect: </b>"
    #resultstr << "<input type=hidden name=definition[major_dialect_family] id=definition[major_dialect_family"+@definition.id.to_s+"] value=\""+@definition.major_dialect_family.to_s+"\" >"
    #if @definition.major_dialect_family_type == nil or @definition.major_dialect_family_type == ''
    #  title = 'Click to modify'
    #else
    #  title = @definition.major_dialect_family_type.title
    #end
    #resultstr << "<span id=\"internal_definition[major_dialect_family_type#{@definition.id}]_selector\">"
    #resultstr << '['+@definition.major_dialect_family+']' if @definition.major_dialect_family != nil
    ##resultstr << link_to_remote( title,{:update => "internal_definition[major_dialect_family_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 638, 'model_name' => 'definition', 'function_name' => "major_dialect_family_type", :update_id => "internal_definition[major_dialect_family_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(638)
    resultstr << category_selector(@data, :definition, :major_dialect_family_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "<br>"
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[major_dialect_family_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    
    resultstr << "<b>Grammatical function: </b>" 
    #resultstr << "<input type=hidden name=internal_definition[grammatical_function] id=internal_definition[grammatical_function"+@definition.id.to_s+"] value=\""+@definition.grammatical_function.to_s+"\" >"
    # if @definition.grammatical_function == nil or @definition.grammatical_function == ''
    #   @definition.grammatical_function = 'Click to modify'
    # end
    #resultstr << 	"<span id=internal_definition[grammatical_function"+@definition.id.to_s+"]_value class=menuvalue onclick1=show_menu(internal_grammar_menu,getCoord(arguments[0]));>"
    #resultstr << "<span id=internal_definition[grammatical_function_type#{@definition.id}]_selector>"
    #resultstr << '['+@definition.grammatical_function+']' if @definition.grammatical_function != nil
    #resultstr << link_to_remote( (@definition.grammatical_function_type != nil ? @definition.grammatical_function_type.title : 'Select A Value'),{:update => "internal_definition[grammatical_function_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 286, 'model_name' => 'definition', 'function_name' => "grammatical_function_type", :update_id => "internal_definition[grammatical_function_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(286)
    resultstr << category_selector(@data, :definition, :grammatical_function_type, false, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "<br>"
    #resultstr <<"</span>"
    #resultstr << "</span><br>"
    #resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[grammatical_function_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
  
  
    resultstr << "<div id=tense"+@definition.id.to_s
    resultstr << " style=\"display:none;\""  unless @definition.grammatical_function == 'Verb'
    resultstr << ">"
    resultstr << "<b>Tense: </b>"
    resultstr << "<input type=hidden name=internal_definition[tense] id=internal_definition[tense] value=\""+@definition.tense.to_s+"\" >"
    if @definition.tense == nil or @definition.tense == ''
      @definition.tense = 'Click to modify'
    end
    #resultstr << in_place_select_editor_field( :definition, :tense, {}, {:select_options => @tense, :fieldname => 'internal_definition[tense]'})+"<br>"
    resultstr << "</div>"

    # resultstr << observe_field('internal_definition[grammatical_function"+@definition.id.to_s+"]', :frequency => 0.1, :update => "tense"+@definition.id.to_s, :url => {  :action => 'tense' ,:id => params[:id]}, :with=>'value', :loaded => "new Effect.Highlight('strata_types');") 


    resultstr << "<b>Register: </b>"
    resultstr << "<input type=hidden name=internal_definition[register] id=internal_definition[register] value=\""+@definition.register.to_s+"\" >"
    if @definition.register_type == nil or @definition.register_type == ''
      title = 'Click to modify'
    else
      title = @definition.register_type.title
    end
    resultstr << "<span id=\"internal_definition[register_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.register+']' if @definition.register != nil
    #resultstr << link_to_remote( title,{:update => "internal_definition[register_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 190, 'model_name' => 'definition', 'function_name' => "register_type", :update_id => "internal_definition[register_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(190)
    resultstr << category_selector(@data, :definition, :register_type, true, :hasTree => 'true', :singleSelectionTree => 'true')    
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[register_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[register_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[register_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[register_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_select_editor_field( :definition, :register, {}, {:select_options => @register, :fieldname => 'internal_definition[register]'})+"<br>"


    resultstr << "<b>Language context: </b>"
    resultstr << "<input type=hidden name=internal_definition[language_context] id=internal_definition[language_context] value=\""+@definition.language_context.to_s+"\" >"
    if @definition.language_context_type == nil or @definition.language_context_type == ''
      title = 'Click to modify'
    else
      title = @definition.language_context_type.title
    end
    resultstr << "<span id=\"internal_definition[language_context_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.language_context+']' if @definition.language_context != nil
    #resultstr << link_to_remote( title,{:update => "internal_definition[language_context_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 185, 'model_name' => 'definition', 'function_name' => "language_context_type", :update_id => "internal_definition[language_context_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(185)
    resultstr << category_selector(@data, :definition, :language_context_type, true, :hasTree => 'true', :singleSelectionTree => 'true')        
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[language_context_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[language_context_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[language_context_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[language_context_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    # resultstr << in_place_select_editor_field( :definition, :language_context, {}, {:select_options => @language_context, :fieldname => 'internal_definition[language_context]'})+"<br>"

    resultstr << "<b>Literary genre: </b>"
    resultstr << "<input type=hidden name=internal_definition[literary_genre] id=internal_definition[literary_genre"+@definition.id.to_s+"] value=\""+@definition.literary_genre.to_s+"\" >"
    if @definition.literary_genre_type == nil or @definition.literary_genre_type == ''
      title = 'Click to modify'
    else
      title = @definition.literary_genre_type.title
    end
    resultstr << "<span id=\"internal_definition[literary_genre_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.literary_genre+']' if @definition.literary_genre != nil
    #resultstr << link_to_remote( title,{:update => "internal_definition[literary_genre_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 119, 'model_name' => 'definition', 'function_name' => "literary_genre_type", :update_id => "internal_definition[literary_genre_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(119)
    resultstr << category_selector(@data, :definition, :literary_genre_type, true, :hasTree => 'true', :singleSelectionTree => 'true')            
    resultstr << "</span><br>"
    # resultstr <<  "<span id=internal_definition[literary_genre"+@definition.id.to_s+"]_value class=menuvalue onclick=dialect_id="+@definition.id.to_s+";show_menu(genre_menu,getCoord(arguments[0]));>"+@definition.literary_genre+"</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[literary_genre_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    
    resultstr << "<b>Literary period: </b>"
    resultstr << "<input type=hidden name=internal_definition[literary_period] id=internal_definition[literary_period] value=\""+@definition.literary_period.to_s+"\" >"
    if @definition.literary_period_type == nil
      title = 'Click to modify'
    else
      title = @definition.literary_period_type.title
    end
    resultstr << "<span id=\"internal_definition[literary_period_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.literary_period+']' if @definition.literary_period != nil
    #resultstr << link_to_remote( title,{:update => "internal_definition[literary_period_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 187, 'model_name' => 'definition', 'function_name' => "literary_period_type", :update_id => "internal_definition[literary_period_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(187)
    resultstr << category_selector(@data, :definition, :literary_period_type, true, :hasTree => 'true', :singleSelectionTree => 'true')            
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[literary_period_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"


    resultstr << "<b>Thematic classification: </b>"
    resultstr << "<input type=hidden name=internal_definition[thematic_classification] id=internal_definition[thematic_classification] value=\""+@definition.thematic_classification.to_s+"\" >"
    if @definition.thematic_classification_type == nil
      title = 'Click to modify'
    else
      title = @definition.thematic_classification_type.title
    end
    resultstr << "<span id=\"internal_definition[thematic_classification_type#{@definition.id}]_selector\">"
    resultstr << '['+@definition.thematic_classification+']' if @definition.thematic_classification != nil
    #resultstr << link_to_remote( title,{:update => "internal_definition[thematic_classification_type#{@definition.id}]_selector", :complete => "re_initialize();",:url => {:action => 'display_category_selector', :id => @definition.id, :params => {'data_id' => 272, 'model_name' => 'definition', 'function_name' => "thematic_classification_type", :update_id => "internal_definition[thematic_classification_type#{@definition.id}]_selector"}}}, :class => 'selector_link' )
    @data = Category.find(272)
    resultstr << category_selector(@data, :definition, :thematic_classification_type, true, :hasTree => 'true', :singleSelectionTree => 'true')            
    resultstr << "</span><br>"
    resultstr << "  <script type=\"text/javascript\" language=\"javascript\">Event.observe('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector', 'mouseover', function(e){ e=document.getElementById('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector');e.style.backgroundColor='#FFFF99'; });Event.observe('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector', 'mouseout', function(e){ new Effect.Highlight('internal_definition[thematic_classification_type"+@definition.id.to_s+"]_selector',{ startcolor: '#FFFF99', endcolor: '#FFFFFF', restorecolor: '#FFFFFF'})});</script>"
    
    resultstr << "<b>Numerology: </b>"
    resultstr << "<input type=hidden name=internal_definition[numerology] id=internal_definition[numerology] value=\""+@definition.numerology.to_s+"\" >"
    if @definition.numerology == nil or @definition.numerology == ''
      @definition.numerology = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :numerology, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[numerology]'}) +"<br>"
    resultstr << "<b>Encyclopedia entry: </b>"
    resultstr << "<input type=hidden name=internal_definition[encyclopedia_entry] id=internal_definition[encyclopedia_entry] value=\""+@definition.encyclopedia_entry.to_s+"\" >"
    if @definition.encyclopedia_entry == nil or @definition.encyclopedia_entry == ''
      @definition.encyclopedia_entry = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :encyclopedia_entry, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[encyclopedia_entry]'}) +"<br>"


    resultstr << "<b>Analytical note: </b>"
    resultstr << "<input type=hidden name=internal_definition[analytical_note] id=internal_definition[analytical_note] value=\""+@definition.analytical_note.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_anotediv" + "'>"
    edit_path = analytical_note_edit_url(:id => @definition.id)
    if @definition.analytical_note == nil or @definition.analytical_note == ''
      t_analytical = 'Click to modify'
    else
      t_analytical = @definition.analytical_note
    end  
    resultstr << link_to_remote(t_analytical, :url => edit_path, :update => "#{@definition.id}_anotediv", :method => :get ) 
    resultstr << "</div>"
    resultstr << "</span>"
    
    #Multimedia collapsable data
    #resultstr << "<div class='showhide'>"
    #resultstr << "something to show and hide"
    #resultstr << "</div>" #showhide
    #resultstr << "<input type='submit' name='hideh1' value='hide multimedia' id='hideh1'"
    #resultstr << "<input type='submit' name='showh1' value='show multimedia' id='showh1'"
    #resultstr << "<input type='submit' name='toggleh1' value='toggle multimedia' id='toggleh1'"
    resultstr << "<b>Edit Multimedia Data: </b>"
    resultstr << "<input type='button' name='toggleh1' value='show/hide multimedia' id='toggleh1'><br>"
    
		#resultstr <<	"<span id=\"show_av_"+@definition.id.to_s+"\"><b>Edit Multimedia Data</b> "+link_to_function(image_tag('right.gif', :border => 0), "Element.hide('show_av_"+@definition.id.to_s+"');Element.show('hide_av_"+@definition.id.to_s+"');Element.show('av_definition_"+@definition.id.to_s+"');", :title => 'Show')+"</span>"
	  
		#resultstr <<	"<span id=\"hide_av_"+@definition.id.to_s+"\" style=\"display:none\"><b>Hide Multimedia Data</b> "+link_to_function(image_tag('up.gif', :border => 0),  "Element.hide('hide_av_"+@definition.id.to_s+"');Element.show('show_av_"+@definition.id.to_s+"');Element.hide('av_definition_"+@definition.id.to_s+"');", :title => 'Hide')+"</span>"
    
    #resultstr << "<span id=\"av_definition_"+@definition.id.to_s+"\" style=\"display:none\"/><dl><dd>"
    resultstr << "<div class='showhide'>"
    resultstr << "<br><b>Image: </b>"
    resultstr << "<input type=hidden name=internal_definition[image] id=internal_definition[image] value=\""+@definition.image.to_s+"\" >"
    if @definition.image == nil or @definition.image == ''
      @definition.image = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image]'}) +"<br>"
    resultstr << "<b>Image caption: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_caption] id=internal_definition[image_caption] value=\""+@definition.image_caption.to_s+"\" >"
    if @definition.image_caption == nil or @definition.image_caption == ''
      @definition.image_caption = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_caption, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image_caption]'}) +"<br>"
    resultstr << "<b>Image photographer: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_photographer] id=internal_definition[image_photographer] value=\""+@definition.image_photographer.to_s+"\" >"
    if @definition.image_photographer == nil or @definition.image_photographer == ''
      @definition.image_photographer = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_photographer, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[image_photographer]'}) +"<br>"
    resultstr << "<b>Image link: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_link] id=internal_definition[image_link] value=\""+@definition.image_link.to_s+"\" >"
    if @definition.image_link == nil or @definition.image_link == ''
      @definition.image_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :image_link, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[image_link]'}) +"<br>"
    resultstr << "<b>Image description: </b>"
    resultstr << "<input type=hidden name=internal_definition[image_description] id=internal_definition[image_description] value=\""+@definition.image_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_imagedescdiv" + "'>"
    edit_path = image_description_edit_url(:id => @definition.id)
    if @definition.image_description == nil or @definition.image_description == ''
      t_imagedescription = 'Click to modify'
    else
      t_imagedescription = @definition.image_description     
    end    
    resultstr << link_to_remote(t_imagedescription, :url => edit_path, :update => "#{@definition.id}_imagedescdiv", :method => :get ) 
    resultstr << "</div>"  
    resultstr << "</span>"
    resultstr << "<b>Audio: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio] id=internal_definition[audio] value=\""+@definition.audio.to_s+"\" >"
    if @definition.audio == nil or @definition.audio == ''
      @definition.audio = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio]'}) +"<br>"
    resultstr << "<b>Audio id number: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_id_number] id=internal_definition[audio_id_number] value=\""+@definition.audio_id_number.to_s+"\" >"
    if @definition.audio_id_number == nil or @definition.audio_id_number == ''
      @definition.audio_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_id_number]'}) +"<br>"
    resultstr << "<b>Audio speaker: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_speaker] id=internal_definition[audio_speaker] value=\""+@definition.audio_speaker.to_s+"\" >"
    if @definition.audio_speaker == nil or @definition.audio_speaker == ''
      @definition.audio_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_speaker]'}) +"<br>"
    resultstr << "<b>Audio date: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_date] id=internal_definition[audio_date] value=\""+@definition.audio_date.to_s+"\" >"
    if @definition.audio_date == nil or @definition.audio_date == ''
      @definition.audio_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_date, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_date]'}) +"<br>"
    resultstr << "<b>Audio place of recording: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_place_of_recording] id=internal_definition[audio_place_of_recording] value=\""+@definition.audio_place_of_recording.to_s+"\" >"
    if @definition.audio_place_of_recording == nil or @definition.audio_place_of_recording == ''
      @definition.audio_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[audio_place_of_recording]'}) +"<br>"
    resultstr << "<b>Audio link: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_link] id=internal_definition[audio_link] value=\""+@definition.audio_link.to_s+"\" >"
    if @definition.audio_link == nil or @definition.audio_link == ''
      @definition.audio_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :audio_link, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[audio_link]'}) +"<br>"
    resultstr << "<b>Audio description: </b>"
    resultstr << "<input type=hidden name=internal_definition[audio_description] id=internal_definition[audio_description] value=\""+@definition.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_audiodescdiv" + "'>"
    edit_path = audio_description_edit_url(:id => @definition.id)
    if @definition.audio_description == nil or @definition.audio_description == ''
      t_audiodescription = 'Click to modify'
    else
      t_audiodescription = @definition.audio_description  
    end    
    resultstr << link_to_remote(t_audiodescription, :url => edit_path, :update => "#{@definition.id}_audiodescdiv", :method => :get ) 
    resultstr << "</div>" 
    resultstr << "</span>"
    resultstr << "<b>Video: </b>"
    resultstr << "<input type=hidden name=internal_definition[video] id=internal_definition[video] value=\""+@definition.video.to_s+"\" >"
    if @definition.video == nil or @definition.video == ''
      @definition.video = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video]'}) +"<br>"
    resultstr << "<b>Video id number: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_id_number] id=internal_definition[video_id_number] value=\""+@definition.video_id_number.to_s+"\" >"
    if @definition.video_id_number == nil or @definition.video_id_number == ''
      @definition.video_id_number = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_id_number, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_id_number]'}) +"<br>"
    resultstr << "<b>Video speaker: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_speaker] id=internal_definition[video_speaker] value=\""+@definition.video_speaker.to_s+"\" >"
    if @definition.video_speaker == nil or @definition.video_speaker == ''
      @definition.video_speaker = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_speaker, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_speaker]'}) +"<br>"
    resultstr << "<b>Video date: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_date] id=internal_definition[video_date] value=\""+@definition.video_date.to_s+"\" >"
    if @definition.video_date == nil or @definition.video_date == ''
      @definition.video_date = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_date, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_date]'}) +"<br>"
    resultstr << "<b>Video place of recording: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_place_of_recording] id=internal_definition[video_place_of_recording] value=\""+@definition.video_place_of_recording.to_s+"\" >"
    if @definition.video_place_of_recording == nil or @definition.video_place_of_recording == ''
      @definition.video_place_of_recording = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_place_of_recording, {}, {:cols => 50, :rows => 1, :fieldname => 'internal_definition[video_place_of_recording]'}) +"<br>"
    resultstr << "<b>Video link: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_link] id=internal_definition[video_link] value=\""+@definition.video_link.to_s+"\" >"
    if @definition.video_link == nil or @definition.video_link == ''
      @definition.video_link = 'Click to modify'
    end
    resultstr << in_place_editor_field( :definition, :video_link, {}, {:cols => 80, :rows => 10, :fieldname => 'internal_definition[video_link]'}) +"<br>"
    
    resultstr << "<b>Video description: </b>"
    resultstr << "<input type=hidden name=internal_definition[video_description] id=internal_definition[video_description] value=\""+@definition.audio_description.to_s+"\" >"
    resultstr << "<span class='tinyfied_show'>"
    resultstr << "<div id='" + "#{@definition.id}_videodescdiv" + "'>"
    edit_path = video_description_edit_url(:id => @definition.id)
    if @definition.video_description == nil or @definition.video_description == ''
      t_videodescription = 'Click to modify'
    else
      t_videodescription = @definition.video_description
    end    
    resultstr << link_to_remote(t_videodescription, :url => edit_path, :update => "#{@definition.id}_videodescdiv", :method => :get ) 
    resultstr << "</div>" 
    #resultstr << "</span>"
    resultstr << "</div>" #showhide
    #resultstr << "</dd></dl></span>"
  end
  
end
