class DefinitionsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :full_synonyms
  helper :definitions
  helper :literary_quotations
  helper :translation_equivalents
  helper :etymologies
  #helper :definitions_definitions
  helper :oral_quotations
  helper :metas
  helper :spellings
  helper :model_sentences
  helper :definition_definition_forms
  helper :translations
  helper :pronunciations

  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
    # in_place_edit_for :definition, column.name
  end
  FullSynonym.content_columns.each do |column|
    in_place_edit_for :full_synonym, column.name
  end
  LiteraryQuotation.content_columns.each do |column|
    in_place_edit_for :literary_quotation, column.name
  end
  TranslationEquivalent.content_columns.each do |column|
    in_place_edit_for :translation_equivalent, column.name
  end
  Etymology.content_columns.each do |column|
    in_place_edit_for :etymology, column.name
  end
  # Definition.content_columns.each do |column|
  #   in_place_edit_for :related_definition, column.name
  # end
  OralQuotation.content_columns.each do |column|
    in_place_edit_for :oral_quotation, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end
  Spelling.content_columns.each do |column|
    in_place_edit_for :spelling, column.name
  end
  ModelSentence.content_columns.each do |column|
    in_place_edit_for :model_sentence, column.name
  end
  DefinitionDefinitionForm.content_columns.each do |column|
    in_place_edit_for :definition_definition_form, column.name
  end
  Translation.content_columns.each do |column|
    in_place_edit_for :translation, column.name
  end
  Pronunciation.content_columns.each do |column|
    in_place_edit_for :pronunciation, column.name
  end
  
  def set_grammatical_function_type_id
    # debugger
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.grammatical_function_type_id = params[:value].to_i
      d.grammatical_function = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    update_id = params[:update_id]
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'grammatical_function_type', :title => d.grammatical_function_type.title, :id => d.id, :data_id => 286, :update_id => update_id })  
  end

  def set_language_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.language_type_id = params[:value].to_i
      d.language = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'language_type', :title => d.language_type.title, :id => d.id, :data_id => 184, :update_id => params[:update_id]})  
  end

  def set_major_dialect_family_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.major_dialect_family_type_id = params[:value].to_i
      d.major_dialect_family = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'major_dialect_family_type', :title => d.major_dialect_family_type.title, :id => d.id, :data_id => 638, :update_id => params[:update_id]})  
  end

  def set_thematic_classification_type_id
    # debugger
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.thematic_classification_type_id = params[:value].to_i
      d.thematic_classification = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'thematic_classification_type', :title => d.thematic_classification_type.title, :id => d.id, :data_id => 272, :update_id => params[:update_id]})  
  end

  def set_register_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.register_type_id = params[:value].to_i
      d.register = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'register_type', :title => d.register_type.title, :id => d.id, :data_id => 190, :update_id => params[:update_id]})  
  end

  def set_language_context_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.language_context_type_id = params[:value].to_i
      d.language_context = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'language_context_type', :title => d.language_context_type.title, :id => d.id, :data_id => 185, :update_id => params[:update_id]})  
  end
  
  def set_literary_genre_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.literary_genre_type_id = params[:value].to_i
      d.literary_genre = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_genre_type', :title => d.literary_genre_type.title, :id => d.id, :data_id => 119, :update_id => params[:update_id]})  
  end

  def set_literary_period_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.literary_period_type_id = params[:value].to_i
      d.literary_period = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_period_type', :title => d.literary_period_type.title, :id => d.id, :data_id => 187, :update_id => params[:update_id]})  
  end

  def set_literary_form_type_id
    d = Definition.find(params[:id])
    if d != nil and params[:value] != nil
      d.literary_form_type_id = params[:value].to_i
      d.literary_form = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_form_type', :title => d.literary_form_type.title, :id => d.id, :data_id => 186, :update_id => params[:update_id]})  
  end

  def set_literary_quotation_source_id
    d = LiteraryQuotation.find(params[:id])
    d.update_attribute('source_id',params['value'])
    d.updated_by = session[:user].login
    d.updated_at = Time.now
    if d.update_history == nil
      d.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    d.save
    render :text => params['value']
  end

  def display_category_selector
    debugger
    @data = Category.find(params['data_id'])
    @definition = Definition.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    # debugger
    render :partial => 'display_category_selector' #:layout => false
  end
  
  # def test
  #   debugger
  #   render :text => 'worked'
  #   #  @literary_genre = []
  #   # LiteraryGenre.find(:all).each do |l|
  #   #   @literary_genre += [l.literary_genre]
  #   # end
  #   # render :layout => 'staging'
  # end
  
  @@register = nil
  @@language_context = nil
  @@theme_array = nil
  @@internal_theme_array = nil
  @@grammar_function_array = nil
  @@internal_grammar_function_array = nil
  @@dialect_array = nil
  @@internal_dialect_array = nil
  @@pronunciation_dialect_array = nil
  @@spelling_dialect_array = nil
  @@etymology_dialect_array = nil
  
  def build_url_for
    '/'
  end

  def terms_with_grammar
    @terms = Definition.find :all, :conditions => "grammatical_function is not null and grammatical_function != ''"
    
  end

  def terms_tabbed
    @terms = Definition.find :all
    render :layout => false
  end
  
  def display_vocab
    render :layout => 'staging'
  end

  def alphabet
    @alphabet = "ཀ	ཁ	ག	ང	ཅ	ཆ	ཇ	ཉ	ཏ	ཐ	ད	ན	པ	ཕ	བ	མ	ཙ	ཚ	ཛ	ཝ	ཞ	ཟ	འ	ཡ	ར	ལ	ཤ	ས	ཧ	ཨ".split("\t")
    expire_page(:controller => :browse, :action => :index)
    
    render :layout => 'staging_new'
  end

  def browse
    @alphabet = "ཀ	ཁ	ག	ང	ཅ	ཆ	ཇ	ཉ	ཏ	ཐ	ད	ན	པ	ཕ	བ	མ	ཙ	ཚ	ཛ	ཝ	ཞ	ཟ	འ	ཡ	ར	ལ	ཤ	ས	ཧ	ཨ".split("\t")
    expire_page(:controller => :browse, :action => :index)
    
    render :layout => 'staging_new'
  end

  def alphabet_list
    alphabet = "ཀ	ཁ	ག	ང	ཅ	ཆ	ཇ	ཉ	ཏ	ཐ	ད	ན	པ	ཕ	བ	མ	ཙ	ཚ	ཛ	ཝ	ཞ	ཟ	འ	ཡ	ར	ལ	ཤ	ས	ཧ	ཨ".split("\t")
    # debugger
    total = Definition.count(:all, :conditions => ["term like ? and level = 'head term'","#{params[:letter]}%"])
    puts total 
    count = 0
    @terms = []
    while count < total
      d = Definition.find( :first, :conditions => ["term like ? and level = 'head term'","#{params[:letter]}%"], :order => 'sort_order asc', :offset => count)
      @terms << {:term => d.term, :letter => params[:letter], :offset => count, :id => d.id}
      count += 100
    end
    render :layout => false #'staging_new'
  end

  def alphabet_sub_list
    @alphabet = "ཀ	ཁ	ག	ང	ཅ	ཆ	ཇ	ཉ	ཏ	ཐ	ད	ན	པ	ཕ	བ	མ	ཙ	ཚ	ཛ	ཝ	ཞ	ཟ	འ	ཡ	ར	ལ	ཤ	ས	ཧ	ཨ".split("\t")
    @terms = []
    # @definitions = Definition.find( :all, :conditions => ["term like ? and level = 'head term'","#{@alphabet[params[:letter].to_i]}%"], :order => 'sort_order asc', :offset => params[:offset], :limit => 100)
    @definitions = Definition.find(:all, :conditions => ["sort_order >= ? and sort_order <= ? and level = 'head term'", "#{params['start']}","#{params['start'].to_i+params['total'].to_i}"], :order => 'sort_order asc')
    @definitions.each do |d|
      @terms << {:term => "#{d.term.span} #{d.wylie} #{d.phonetic}", :id => d.id}
    end
    render :layout => false
  end

	def display_history
	  @history = params[:history]
	  @history = ''
	  hash = {}
	  c = eval(params[:history_class])
	  o = c.find params[:history_id]
	  h = o.update_history #params[:history]
	  debugger
	  a = h.split("\n")
    a.each {|k| hash[k.split(' ')[0]] = k}
    # breakpoint
    hash.each do |k,v|
      k = 'none' if k == nil
      user = User.find(:first,:conditions=>"login='"+k+"'")
      # puts hash[k].gsub(k,user.full_name)
      @history += hash[k].gsub(k,user.full_name) unless user == nil
      @history += "\n"
    end
	  render :partial => 'partial/display_history'
	end

  def admin_search
    @users = User.find :all
    render :layout => 'staging'
  end
  
  def delete_old_definition
    OldDefinitions.find(params[:other_id]).destroy
    redirect_to :action => 'public_edit', :id => params[:id]
  end
  
  def admin_search_action
    
    if session[:user] != nil
      @logged_in = true
    else
      @logged_in = false
    end
    if params['mode'] != nil 
       @page_class = params['mode']
    else
       @page_class = 'edit'
    end

    if params['user'] != nil
      user = params['user']['login']
      params['login'] = user
    else
      user = params['login']
    end
    flash['query'] = 'user_search'
    # breakpoint
    datatype = params['datatype']
    @definitions = []
    @etymologies = []
    @literary_quotations = []
    @oral_quotations = []
    @model_sentences = []
    # breakpoint
    # case datatype
    # when 'definition'
      @definitions = Definition.find(:all, :conditions => "update_history ilike '%#{user}%'") #"updated_by = '#{user}'", :order => 'updated_at desc', :limit => 20)
    # when 'etymology'
      etymologies = Etymology.find(:all, :conditions => "update_history ilike '%#{user}%'") #"updated_by = '#{user}'", :order => 'updated_at desc', :limit => 20)
      etymologies.each do |e|
        if e.definition != nil
          @definitions += [e.definition]
        end
      end
    # when 'literary_quotation'
      literary_quotations =  LiteraryQuotation.find(:all, :conditions => "update_history ilike '%#{user}%'") #"updated_by = '#{user}'", :order => 'updated_at desc', :limit => 20)
      literary_quotations.each do |o|
        if o.definitions.size > 0
          o.definitions.each do |d|
            @definitions += [d]
          end
        end
      end
    # when 'oral_quotation'
      oral_quotations = OralQuotation.find(:all, :conditions => "update_history ilike '%#{user}%'") #"updated_by = '#{user}'", :order => 'updated_at desc', :limit => 20)
      oral_quotations.each do |o|
        if o.definitions.size > 0
          o.definitions.each do |d|
            @definitions += [d]
          end
        end
      end
    # when 'model_sentence'
      model_sentences = ModelSentence.find(:all, :conditions => "update_history ilike '%#{user}%'") #"updated_by = '#{user}'", :order => 'updated_at desc', :limit => 20)
      model_sentences.each do |o|
        if o.definitions.size > 0
          o.definitions.each do |d|
            @definitions += [d]
          end
        end
      end
    # end
    @definitions = @definitions.uniq.sort!{|a,b| a.updated_at <=> b.updated_at }
    @definitions = @definitions.reverse
    # if @definitions.size > 20
    #   @definitions = @definitions[0..19]
    # end
    
    sort_init 'id'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @definition_pages = Paginator.new self, @definitions.length(), items_per_page, params['page']
    if @definition_pages.item_count != 0
      @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
    @offset = 0
    if (params['page'] != nil) 
      @offset = (params['page'].to_i - 1) * 10
    end
    @definitions = @definitions[@offset,items_per_page] if @definitions[@offset,items_per_page] != nil
    
    render :action => 'find_head_terms', :layout => 'staging_new'
  end

	def display_public_history
	  @history = ''
	  hash = {}
	  if params[:history] == nil
  	  c = eval(params[:history_class])
  	  o = c.find params[:history_id]
  	  h = o.update_history 
  	else
  	  h = params[:history]
  	end
	  h = '' if h == nil
	  a = h.split("\n")
    a.each {|k| hash[k.split(' ')[0]] = k}
    # breakpoint
    hash.each do |k,v|
      k = 'none' if k == nil
      user = User.find(:first,:conditions=>"login='"+k+"'")
      # puts hash[k].gsub(k,user.full_name)
      @history += hash[k].gsub(k,user.full_name) unless user == nil
      @history += "\n"
    end
    # puts @history
	  render :partial => 'partial/display_history'
	end
  
  def initialize_variables
    puts ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]'
    @@level = ["","head term","not head"]
    @@language = []
    Language.find(:all).each do |l|
      @@language += [l.language]
    end
    @tense = "imperative, past, present, future".split(', ')
    @@register = []
    Register.find(:all).each do |l|
      @@register += [l.register]
    end
    @@language_context = []
    LanguageContext.find(:all).each do |l|
      @@language_context += [l.language_context]
    end
    @@literary_genre = []
    LiteraryGenre.find(:all).each do |l|
      @@literary_genre += [l.literary_genre]
    end
    @@literary_period = []
    LiteraryPeriod.find(:all).each do |l|
      @@literary_period += [l.literary_period]
    end
    @@literary_form = []
    LiteraryForm.find(:all).each do |l|
      @@literary_form += [l.literary_form]
    end
    @@theme_ones = ThemeLevelOne.find(:all)
    @@theme_array = ""
    @@internal_theme_array = ""
    for md in @@theme_ones
      @@theme_array += ",\n" unless @@theme_array == ""
      md.theme = '-' if md.theme == nil
      @@theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'definition_id);\",null"
      @@internal_theme_array += ",\n" unless @@internal_theme_array == ""
      @@internal_theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
      if md.theme_level_twos.size > 0
        @@theme_array += ",\n"
        @@internal_theme_array += ",\n"
      else
        @@theme_array += ",null,\n"
        @@internal_theme_array += ",null,\n"
      end
      theme_two_array = ""
      internal_theme_two_array = ""
      for sd in md.theme_level_twos
        theme_two_array += ",\n" unless theme_two_array == ""
        sd.theme = '-' if sd.theme == nil
        theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'definition_id);\",null"
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
          theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
          internal_theme_three_array += ",\n" unless internal_theme_three_array == ""
          internal_theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
        end
        theme_two_array += theme_three_array+"\n]"
        internal_theme_two_array += internal_theme_three_array+"\n]"
      end
      @@theme_array += theme_two_array+"\n]"
      @@internal_theme_array += internal_theme_two_array+"\n]"
    end
    @@theme_array = "[\n['Choose Theme',null,null,\n"+@@theme_array+"],['Cancel',null,null]	]"
    # puts '================'
    # puts @@theme_array
    @@internal_theme_array = "[\n['Choose Theme',null,null,\n"+@@internal_theme_array+"],['Cancel',null,null]	]"

    @@grammar_function_level_ones = GrammarFunctionLevelOne.find(:all)
    @@grammar_function_array = ""
    @@internal_grammar_function_array = ""
    for md in @@grammar_function_level_ones
      @@grammar_function_array += ",\n" unless @@grammar_function_array == ""
      md.grammar_function = "-" if md.grammar_function == nil
      @@grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" #unless md.grammar_function != nil
      @@internal_grammar_function_array += ",\n" unless @@internal_grammar_function_array == ""
      @@internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:set_field('"+md.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null"
      if md.grammar_function_level_twos.size > 0
        @@grammar_function_array += ",\n"
        @@internal_grammar_function_array += ",\n"
      else
        @@grammar_function_array += ",null,\n"
        @@internal_grammar_function_array += ",null,\n"
      end
      grammar_function_two_array = ""
      internal_grammar_function_two_array = ""
      for sd in md.grammar_function_level_twos
        grammar_function_two_array += ",\n" unless grammar_function_two_array == ""
        sd.grammar_function = "-" if sd.grammar_function == nil
        grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
        internal_grammar_function_two_array += ",\n" unless internal_grammar_function_two_array == ""
        internal_grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
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
          grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
          internal_grammar_function_three_array += ",\n" unless internal_grammar_function_three_array == ""
          internal_grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
        end
        grammar_function_two_array += grammar_function_three_array+"\n]"
        internal_grammar_function_two_array += internal_grammar_function_three_array+"\n]"
      end
      @@grammar_function_array += grammar_function_two_array+"\n]"
      @@internal_grammar_function_array += internal_grammar_function_two_array+"\n]"
    end
    @@grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@@grammar_function_array+"],['Cancel',null,null]	]"
    @@internal_grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@@internal_grammar_function_array+"],['Cancel',null,null]	]"
    
    @@major_dialects = MajorDialect.find(:all)
    @@dialect_array = ""
    @@internal_dialect_array = ""
    @@pronunciation_dialect_array = ""
    @@etymology_dialect_array = ""
    @@spelling_dialect_array = ""
    for md in @@major_dialects
      @@dialect_array += ",\n" unless @@dialect_array == ""
      md.name = '-' if md.name == nil
      @@dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @@internal_dialect_array += ",\n" unless @@internal_dialect_array == ""
      @@internal_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @@pronunciation_dialect_array += ",\n" unless @@pronunciation_dialect_array == ""
      @@pronunciation_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','pronunciation[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @@etymology_dialect_array += ",\n" unless @@etymology_dialect_array == ""
      @@etymology_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','etymology[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @@spelling_dialect_array += ",\n" unless @@spelling_dialect_array == ""
      @@spelling_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','spelling[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      if md.specific_dialects.size > 0
        @@dialect_array += ",\n"
        @@internal_dialect_array += ",\n"
        @@pronunciation_dialect_array += ",\n"
        @@etymology_dialect_array += ",\n"
        @@spelling_dialect_array += ",\n"
      else
        @@dialect_array += ",null,\n"
        @@internal_dialect_array += ",null,\n"
        @@pronunciation_dialect_array += ",null,\n"
        @@etymology_dialect_array += ",null,\n"
        @@spelling_dialect_array += ",null,\n"
      end
      specific_dialect_array = ""
      internal_specific_dialect_array = ""
      pronunciation_specific_dialect_array = ""
      etymology_specific_dialect_array = ""
      spelling_specific_dialect_array = ""
      for sd in md.specific_dialects
        specific_dialect_array += ",\n" unless specific_dialect_array == ""
        sd.name = '-' if sd.name == nil
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        internal_specific_dialect_array += ",\n" unless internal_specific_dialect_array == ""
        internal_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        pronunciation_specific_dialect_array += ",\n" unless pronunciation_specific_dialect_array == ""
        pronunciation_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','pronunciation[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        etymology_specific_dialect_array += ",\n" unless etymology_specific_dialect_array == ""
        etymology_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','etymology[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        spelling_specific_dialect_array += ",\n" unless spelling_specific_dialect_array == ""
        spelling_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','spelling[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
      end
      @@dialect_array += specific_dialect_array+"\n]"
      @@internal_dialect_array += internal_specific_dialect_array+"\n]"
      @@pronunciation_dialect_array += pronunciation_specific_dialect_array+"\n]"
      @@etymology_dialect_array += etymology_specific_dialect_array+"\n]"
      @@spelling_dialect_array += spelling_specific_dialect_array+"\n]"
    end
    @@dialect_array = "[\n['Choose Dialect',null,null,\n"+@@dialect_array+"],['Cancel',null,null]	]"
    @@internal_dialect_array = "[\n['Choose Dialect',null,null,\n"+@@internal_dialect_array+"],['Cancel',null,null]	]"
    @@pronunciation_dialect_array = "[\n['Choose Dialect',null,null,\n"+@@pronunciation_dialect_array+"],['Cancel',null,null]	]"
    @@etymology_dialect_array = "[\n['Choose Dialect',null,null,\n"+@@etymology_dialect_array+"],['Cancel',null,null]	]"
    @@spelling_dialect_array = "[\n['Choose Dialect',null,null,\n"+@@spelling_dialect_array+"],['Cancel',null,null]	]"
  end

  def related_etymologies
    # puts ']]]]]]]]]]]]]]]]]]'
    # puts params[:id]
    # puts params['parent_id']
    params['relatedtype'] = 'etymology'
    params['level'] = 0
    @definition = Definition.find(params[:id])
    parent_def = Definition.find(params['parent_id'])
    @etymology = []
    for e in parent_def.etymologies
      @etymology << e
    end
    for sd in parent_def.super_definitions
      if sd.sub_definition != nil
        for e in sd.sub_definition.etymologies
          @etymology << e
        end
        for sdd in sd.sub_definition.super_definitions
          if sdd.sub_definition != nil
            for e in sdd.sub_definition.etymologies
              @etymology << e
            end
          end
          for sdd in sd.sub_definition.super_definitions
            if sdd.sub_definition != nil
              for e in sdd.sub_definition.etymologies
                @etymology << e
              end
            end
          end
        end
      end
    end
    puts @etymology
    render :action => 'edit_search_action', :layout => false
  end

  def related_pronunciations
    # puts ']]]]]]]]]]]]]]]]]]'
    # puts params[:id]
    # puts params['parent_id']
    params['relatedtype'] = 'pronunciation'
    params['level'] = 0
    @definition = Definition.find(params[:id])
    parent_def = Definition.find(params['parent_id'])
    @pronunciations = []
    for e in parent_def.pronunciations
      @pronunciations << e
    end
    for sd in parent_def.super_definitions
      if sd.sub_definition != nil
        for e in sd.sub_definition.pronunciations
          @pronunciations << e
        end
        for sdd in sd.sub_definition.super_definitions
          if sdd.sub_definition != nil
            for e in sdd.sub_definition.pronunciations
              @pronunciations << e
            end
          end
          for sdd in sd.sub_definition.super_definitions
            if sdd.sub_definition != nil
              for e in sdd.sub_definition.pronunciations
                @pronunciations << e
              end
            end
          end
        end
      end
    end
    # puts @pronunciations
    render :action => 'edit_search_action', :layout => false
  end

    def set_literary_genre
      puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
      puts params['def_id']
      # breakpoint
      @definition = Definition.find(params['id'])
      @definition.update_attribute('literary_genre',params['value'])
      @definition.updated_by = session[:user].login
      @definition.updated_at = Time.now
      if @definition.update_history == nil
        @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      @definition.save
      render :text => params['value']
    end

  def set_thematic_classification
    puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
    puts params['def_id']
    @definition = Definition.find(params['id'])
    @definition.update_attribute('thematic_classification',params['value'])
    @definition.updated_by = session[:user].login
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @definition.save
    render :text => params['value']
  end

  def set_grammatical_function
    puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
    puts params['def_id']
    @definition = Definition.find(params['id'])
    @definition.update_attribute('grammatical_function',params['value'])
    @definition.updated_by = session[:user].login
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @definition.save
    render :text => params['value']
  end

  def set_major_dialect_family
    puts "dialect ->\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
    puts params['def_id']
    @definition = Definition.find(params['id'])
    print @definition.update_attribute('major_dialect_family',params['value'])
    @definition.updated_by = session[:user].login
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @definition.save
    render :text => params['value']
  end
  
  def index
    # list
    # render :action => 'list'
    @users = User.find :all, :conditions => 'full_name is not null'
    @page_class = 'search'
    render :layout => 'staging_new' #'thdl_home'
  end

  def index_edit
    # list
    # render :action => 'list'
    @users = User.find :all, :conditions => 'full_name is not null'
    @page_class = 'edit'
    render :layout => 'staging_new' #'staging' #'thdl_home'
  end

  def public_add
    head = Definition.find(params[:id]) #'parent_id'])
    definition = Definition.new
    definition.term = head.term
    definition.level = 'not head'
    definition.save
    dd = DefinitionDefinition.new
    dd.def1_id = params[:id]
    dd.def2_id = definition.id
    dd.save
puts 'id------------------'
puts params['parent_id']
    #redirect_to :action => 'edit_dynamic', :id => definition.id, :params => {'internal' => 'edit_box','public'=>'yes','definition_id'=> params['parent_id']} #head_id']}
    redirect_to :action => 'edit_dynamic_definition', :id => definition.id, :params => {'internal' => 'edit_box','public'=>'yes','definition_id'=> params['parent_id']} #head_id']}
  end
  
def browse_old
  if session[:user] != nil
    @logged_in = true
  else
    @logged_in = false
  end
   @page_class = 'browse'
   sort_init 'term'
   sort_update
    if params['items_per_page'] != nil
       items_per_page = params['items_per_page'].to_i
    else
       items_per_page = 10
    end
    @definition_pages, @definitions = paginate :definitions, :conditions => "level = 'head term'", :order_by => sort_clause, :per_page => items_per_page
    if @definition_pages.item_count != 0
      @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
    flash['query'] = 'browse'
    params['mode'] = 'browse'
    render :action => 'find_head_terms', :layout => 'staging_new'
end  
  
def find_head_terms

  if session[:user] != nil
    @logged_in = true
  else
    @logged_in = false
  end
  # breakpoint
   if params['mode'] != nil 
      @page_class = params['mode']
   else
      @page_class = 'edit'
   end
   sort_init 'sort_order'
   sort_update
   if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
   else
      items_per_page = 50
   end
   puts "---------ipg = #{params['items_per_page']}"
   vals=""
   query=""
   @array = []
   term_value = 'empty'
   @q = params['query']
   # breakpoint
   if params['query']
      @query = buildquery(params["query"])
      query = buildquery(params["query"])
      flash["query"] = params["query"]
      # breakpoint
      # if session['query'] != nil and params['paged'] != nil
      #   query = session['query']
      if session['search_type'] != nil
        session['search_type'] = 'term'
      end
   else
      if params['term'] != nil and params['term'] != ''
         val = params['term']
         # key = 'term'
         if params[:search_field] == 'tibetan'
           key = 'term'
         elsif params[:search_field] == 'wylie'
            key = 'wylie'
        else
            key = 'phonetic'
        end
        session['search_type'] = key
         if query != ""
            query = query + " and "
            vals = vals + ","
         end
         term_value = val
         space = Unicode::U0F0B
         space2 = Unicode::U0F0C
         line = Unicode::U0F0D
         nb_space = Unicode::U00A0
         
         val = val.gsub("#{nb_space}",' ')  #remove non-breaking space before tsheg
         
         val = val.gsub(line,'')
         val = val.gsub(space2,space)
         val = val.gsub(space,'_space_')
         a = val.split('_space_')
         word = ''
         a.each {|w|
            word += space if word != ''
            word += w
         }
         val = word
  
         # if params['search_type'] != 'exact'
         #    val = val.gsub(space,' ')
         #    a = val.split(' ')
         #    word = ''
         #    a.each {|w|
         #       word += space if word != ''
         #       word += w
         #    }
         #    val = word
         # else
         #    val = val.gsub(space,'_space_')
         #    a = val.split('_space_')
         #    word = ''
         #    a.each {|w|
         #       word += space if word != ''
         #       word += w
         #    }
         #    val = word
         # end

         if params['search_type'] == 'anywhere'
            query = query + key + " ilike ?"
            @array.push("%"+val.gsub('/','').strip+"%")
            vals += 'anywhere:'
         elsif params['search_type'] == 'exact'
            query = query +'('+ key + " = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? )"
            @array.push(val.gsub('/','').strip)
            @array.push(val.gsub('/','').strip+line)
            @array.push(val.gsub('/','').strip+space+line)
            @array.push(val.gsub('/','').strip+space)
            @array.push(val.gsub('/','').strip+space2+line)
            @array.push(val.gsub('/','').strip+space2)
            @array.push(val.gsub('/','').strip+' ')
            @array.push(val.gsub('/','').strip+'/')
            @array.push(val.gsub('/','').strip+' /')
            @array.push(val.gsub('/','').strip+"#{nb_space}")
            @array.push(val.gsub('/','').strip+"#{nb_space}/")
            
            vals += 'exact:'
         else params['search_type'] == 'beginning'
            query = query + key + " ilike ?"
            @array.push(val+"%")
            vals += 'beginning:'
         end
         puts '-------extent = '
         puts params
         if params['search_extent'] == nil
            query += ' and ' if query != nil
            query = query + "level = ?"
            @array.push("head term")
            vals += ',' if vals != ''
            vals += 'level:head term'
         end
         
         # debugger
         
         # if query != ''
         #   query += ' or wylie ilike ?'
         #   @array.push("%#{val}%")
         # end
         
         vals += ',' if vals != ''
         vals = vals + key + ":" + val

      end
      # end
      # end
      query = [query]+@array
      # debugger
      # end
      session['query'] = query
   end
   puts 'query----------------------------'
   puts query

   if query == [""] and (params['sub_definitions'] == nil or params['sub_definitions'] == "") and (params['full_synonyms'] == nil or params['full_synonyms'] == "") and (params['oral_quotations'] == nil or params['oral_quotations'] == "") and (params['etymologies'] == nil or params['etymologies'] == "") and (params['literary_quotations'] == nil or params['literary_quotations'] == "") and (params['model_sentences'] == nil or params['model_sentences'] == "") and (params['related_definitions'] == nil or params['related_definitions'] == "") and (params['meta'] == nil or params['meta'] == "") and (params['translations'] == nil or params['translations'] == "") and (params['super_definitions'] == nil or params['super_definitions'] == "") and (params['definition_definition_form_froms'] == nil or params['definition_definition_form_froms'] == "") and (params['definition_definition_form_tos'] == nil or params['definition_definition_form_tos'] == "") and (params['spellings'] == nil or params['spellings'] == "") and (params['full_synonyms_froms'] == nil or params['full_synonyms_froms'] == "") and (params['pronunciations'] == nil or params['pronunciations'] == "") and (params['translation_equivalents'] == nil or params['translation_equivalents'] == "")
      @definition_pages, @definitions = paginate :definitions, :conditions => "level = 'head term'", :per_page => items_per_page, :order_by => sort_clause
      if @definition_pages.item_count != 0
         @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
         @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
      else
         @pages = 0
         @current_page = 0
      end
      # @page_class = 'search'
      flash['query'] = '' #query
      puts "-------------------list #{@definitions.size }"
      render  :layout => 'staging_new'#'staging'
   else
      # puts '------->starting '+Time.now.to_s
      # if query == [""]  or query == ""
      #    @definitions = AllTerm.find :all, :order => sort_clause
      # else
      #    @definitions = AllTerm.find :all, :conditions => query, :order => sort_clause
      # end
      # puts '------->stoping '+Time.now.to_s
      if vals == ""
         vals = params["query"]
      end
      #  ---------  build custom paginator to handle extra queries -----------------
      if params['items_per_page'] != nil
         items_per_page = params['items_per_page'].to_i
      else
         items_per_page = 50
      end
      @q = query
      # debugger
      @definition_pages = Paginator.new self, Definition.count(:conditions => query), items_per_page, params['page']
      @definitions = Definition.find :all, :order => sort_clause, :conditions => query, :limit => @definition_pages.items_per_page, :offset => @definition_pages.current.offset
      if @definition_pages.item_count != 0
         @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
         @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
      else
         @pages = 0
         @current_page = 0
      end

      # if @definition_pages.item_count != 0
      #    @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
      #    @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
      # else
      #    @pages = 0
      #    @current_page = 0
      # end
      # @offset = 0
      # if (params['page'] != nil)
      #    @offset = (params['page'].to_i - 1) * items_per_page
      # end
      # # breakpoint
      # @definitions = @definitions[@offset,items_per_page] if @definitions[@offset,items_per_page] != nil
      # -----------------------------------------------------------------------------
      flash["query"] = vals
      flash["existingquery"] = params["query"]

      puts items_per_page
      puts @definitions.length
      # if @definitions.length == 0
      #    # 
      #    # val = term_value
      #    # space = Unicode::U0F0B
      #    # line = Unicode::U0F0D
      #    # val = val.gsub(line,'')
      #    # val = val.gsub(space,'_space_')
      #    # a = val.split('_space_')
      #    # word = ''
      #    # a.each {|w|
      #    #    word += space if word != ''
      #    #    word += w
      #    # }
      #    # val = word
      #    # 
      #    # if params['search_type'] == 'exact'
      #    #    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangujung Yeshe Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    #    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"')")
      #    # elsif params['search_type'] == 'anywhere'
      #    #    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and (term ilike '%"+val+"%')")
      #    #    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and (term ilike '%"+val+"%')")
      #    #    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and (term ilike '%"+val+"%')")
      #    #    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and (term ilike '%"+val+"%')")
      #    #    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and (term ilike '%"+val+"%')")
      #    #    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangujung Yeshe Dictionary' and (term ilike '%"+val+"%')")
      #    #    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and (term ilike '%"+val+"%')")
      #    #    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and (term ilike '%"+val+"%')")
      #    # else
      #    #    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and (term ilike '"+val+"%')")
      #    #    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and (term ilike '"+val+"%')")
      #    #    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and (term ilike '"+val+"%')")
      #    #    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and (term ilike '"+val+"%')")
      #    #    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and (term ilike '"+val+"%')")
      #    #    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangujung Yeshe Dictionary' and (term ilike '"+val+"%')")
      #    #    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and (term ilike '"+val+"%')")
      #    #    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and (term ilike '"+val+"%')")
      #    # end
      #    # # @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and term = '"+term_value+"'")
      #    # # @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and term = '"+term_value+"'")
      #    # # @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and term = '"+term_value+"'")
      #    # # @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and term = '"+term_value+"'")
      #    # # @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and term = '"+term_value+"'")
      #    # # @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangjung Yeshe Dictionary' and term = '"+term_value+"'")
      #    # # @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and term = '"+term_value+"'")
      #    # # @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and term = '"+term_value+"'")
      #    @term_value = term_value
      #    render :template => 'definitions/no_matches',:layout => 'staging'
      # else
         # render_action 'list'
         @term_value = term_value
         render :layout => 'staging_new'#'staging'
      # end
   end

end

  def test_staging
    render :layout => 'staging'
  end
  
  def list
    sort_init 'id'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @definition_pages, @definitions = paginate :definition, :conditions => "level = 'head term'", :per_page => items_per_page, :order_by => sort_clause
    if @definition_pages.item_count != 0
      @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
    render :layout => 'staging'
  end

  def show
    @definition = Definition.find(params[:id])
  end

  def edit_show
    @definition = Definition.find(params[:id])
    render :template => '/definitions/edit_show2'
  end

  def public_edit
    @grammatical_function_type = Category.find(286)
    @page_class = "edit"
    @tibetan_space = Unicode::U0F0B
    @tibetan_space_fix = Unicode::U0F0B + Unicode::U200B
    # initialize_variables
    # puts '////////////'
    
    @level = '[["",""],["head term","head term"],["not head","not head"]]'
    # @language = []
    # Language.find(:all, :order => 'language asc').each do |l|
    #   @language += [l.language]
    # end
    # @tense = "imperative, past, present, future".split(', ')
    # @register = []
    # Register.find(:all).each do |l|
    #   @register += [l.register]
    # end
    # @language_context = []
    # LanguageContext.find(:all).each do |l|
    #   @language_context += [l.language_context]
    # end
    # @literary_genre = []
    # LiteraryGenre.find(:all).each do |l|
    #   @literary_genre += [l.literary_genre]
    # end
    # @literary_period = []
    # LiteraryPeriod.find(:all).each do |l|
    #   @literary_period += [l.literary_period]
    # end
    # @literary_form = []
    # LiteraryForm.find(:all).each do |l|
    #   @literary_form += [l.literary_form]
    # end
    # 
    # @theme_ones = ThemeLevelOne.find(:all)
    # @theme_array = ""
    # @internal_theme_array = ""
    # for md in @theme_ones
    #   @theme_array += ",\n" unless @theme_array == ""
    #   md.theme = '-' if md.theme == nil
    #   @theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'definition_id);\",null"
    #   @internal_theme_array += ",\n" unless @internal_theme_array == ""
    #   @internal_theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
    #   if md.theme_level_twos.size > 0
    #     @theme_array += ",\n"
    #     @internal_theme_array += ",\n"
    #   else
    #     @theme_array += ",null,\n"
    #     @internal_theme_array += ",null,\n"
    #   end
    #   theme_two_array = ""
    #   internal_theme_two_array = ""
    #   for sd in md.theme_level_twos
    #     theme_two_array += ",\n" unless theme_two_array == ""
    #     sd.theme = '-' if sd.theme == nil
    #     theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'definition_id);\",null"
    #     internal_theme_two_array += ",\n" unless internal_theme_two_array == ""
    #     internal_theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
    #     if sd.theme_level_threes.size > 0
    #       theme_two_array += ",\n"
    #       internal_theme_two_array += ",\n"
    #     else
    #       theme_two_array += ",null,\n"
    #       internal_theme_two_array += ",null,\n"
    #     end
    #     theme_three_array = ""
    #     internal_theme_three_array = ""
    #     for td in sd.theme_level_threes
    #       theme_three_array += ",\n" unless theme_three_array == ""
    #       td.theme = '-' if td.theme == nil
    #       theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
    #       internal_theme_three_array += ",\n" unless internal_theme_three_array == ""
    #       internal_theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
    #     end
    #     theme_two_array += theme_three_array+"\n]"
    #     internal_theme_two_array += internal_theme_three_array+"\n]"
    #   end
    #   @theme_array += theme_two_array+"\n]"
    #   @internal_theme_array += internal_theme_two_array+"\n]"
    # end
    # @theme_array = "[\n['Choose Theme',null,null,\n"+@theme_array+"],['Cancel',null,null] ]"
    # # puts '================'
    # # puts @theme_array
    # @internal_theme_array = "[\n['Choose Theme',null,null,\n"+@internal_theme_array+"],['Cancel',null,null] ]"
    # 
    # @grammar_function_level_ones = GrammarFunctionLevelOne.find(:all)
    # @grammar_function_array = ""
    # @internal_grammar_function_array = ""
    # for md in @grammar_function_level_ones
    #   @grammar_function_array += ",\n" unless @grammar_function_array == ""
    #   md.grammar_function = "-" if md.grammar_function == nil
    #   @grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" #unless md.grammar_function != nil
    #   @internal_grammar_function_array += ",\n" unless @internal_grammar_function_array == ""
    #   @internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:set_field('"+md.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null"
    #   if md.grammar_function_level_twos.size > 0
    #     @grammar_function_array += ",\n"
    #     @internal_grammar_function_array += ",\n"
    #   else
    #     @grammar_function_array += ",null,\n"
    #     @internal_grammar_function_array += ",null,\n"
    #   end
    #   grammar_function_two_array = ""
    #   internal_grammar_function_two_array = ""
    #   for sd in md.grammar_function_level_twos
    #     grammar_function_two_array += ",\n" unless grammar_function_two_array == ""
    #     sd.grammar_function = "-" if sd.grammar_function == nil
    #     grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
    #     internal_grammar_function_two_array += ",\n" unless internal_grammar_function_two_array == ""
    #     internal_grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
    #     if sd.grammar_function_level_threes.size > 0
    #       grammar_function_two_array += ",\n"
    #       internal_grammar_function_two_array += ",\n"
    #     else
    #       grammar_function_two_array += ",null,\n"
    #       internal_grammar_function_two_array += ",null,\n"
    #     end
    #     grammar_function_three_array = ""
    #     internal_grammar_function_three_array = ""
    #     for td in sd.grammar_function_level_threes
    #       grammar_function_three_array += ",\n" unless grammar_function_three_array == ""
    #       td.grammar_function = "-" if td.grammar_function == nil
    #       grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
    #       internal_grammar_function_three_array += ",\n" unless internal_grammar_function_three_array == ""
    #       internal_grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
    #     end
    #     grammar_function_two_array += grammar_function_three_array+"\n]"
    #     internal_grammar_function_two_array += internal_grammar_function_three_array+"\n]"
    #   end
    #   @grammar_function_array += grammar_function_two_array+"\n]"
    #   @internal_grammar_function_array += internal_grammar_function_two_array+"\n]"
    # end
    # @grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@grammar_function_array+"],['Cancel',null,null]  ]"
    # @internal_grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@internal_grammar_function_array+"],['Cancel',null,null]  ]"
    # 
    # @major_dialects = MajorDialect.find(:all)
    # @dialect_array = ""
    # @internal_dialect_array = ""
    # @pronunciation_dialect_array = ""
    # @etymology_dialect_array = ""
    # @spelling_dialect_array = ""
    # for md in @major_dialects
    #   @dialect_array += ",\n" unless @dialect_array == ""
    #   md.name = '-' if md.name == nil
    #   @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
    #   @internal_dialect_array += ",\n" unless @internal_dialect_array == ""
    #   @internal_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
    #   @pronunciation_dialect_array += ",\n" unless @pronunciation_dialect_array == ""
    #   @pronunciation_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','pronunciation[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
    #   @etymology_dialect_array += ",\n" unless @etymology_dialect_array == ""
    #   @etymology_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','etymology[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
    #   @spelling_dialect_array += ",\n" unless @spelling_dialect_array == ""
    #   @spelling_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','spelling[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
    #   if md.specific_dialects.size > 0
    #     @dialect_array += ",\n"
    #     @internal_dialect_array += ",\n"
    #     @pronunciation_dialect_array += ",\n"
    #     @etymology_dialect_array += ",\n"
    #     @spelling_dialect_array += ",\n"
    #   else
    #     @dialect_array += ",null,\n"
    #     @internal_dialect_array += ",null,\n"
    #     @pronunciation_dialect_array += ",null,\n"
    #     @etymology_dialect_array += ",null,\n"
    #     @spelling_dialect_array += ",null,\n"
    #   end
    #   specific_dialect_array = ""
    #   internal_specific_dialect_array = ""
    #   pronunciation_specific_dialect_array = ""
    #   etymology_specific_dialect_array = ""
    #   spelling_specific_dialect_array = ""
    #   for sd in md.specific_dialects
    #     specific_dialect_array += ",\n" unless specific_dialect_array == ""
    #     sd.name = '-' if sd.name == nil
    #     specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
    #     internal_specific_dialect_array += ",\n" unless internal_specific_dialect_array == ""
    #     internal_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
    #     pronunciation_specific_dialect_array += ",\n" unless pronunciation_specific_dialect_array == ""
    #     pronunciation_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','pronunciation[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
    #     etymology_specific_dialect_array += ",\n" unless etymology_specific_dialect_array == ""
    #     etymology_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','etymology[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
    #     spelling_specific_dialect_array += ",\n" unless spelling_specific_dialect_array == ""
    #     spelling_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','spelling[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
    #   end
    #   @dialect_array += specific_dialect_array+"\n]"
    #   @internal_dialect_array += internal_specific_dialect_array+"\n]"
    #   @pronunciation_dialect_array += pronunciation_specific_dialect_array+"\n]"
    #   @etymology_dialect_array += etymology_specific_dialect_array+"\n]"
    #   @spelling_dialect_array += spelling_specific_dialect_array+"\n]"
    # end
    # @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null] ]"
    # @internal_dialect_array = "[\n['Choose Dialect',null,null,\n"+@internal_dialect_array+"],['Cancel',null,null] ]"
    # @pronunciation_dialect_array = "[\n['Choose Dialect',null,null,\n"+@pronunciation_dialect_array+"],['Cancel',null,null] ]"
    # @etymology_dialect_array = "[\n['Choose Dialect',null,null,\n"+@etymology_dialect_array+"],['Cancel',null,null] ]"
    # @spelling_dialect_array = "[\n['Choose Dialect',null,null,\n"+@spelling_dialect_array+"],['Cancel',null,null] ]"
    
    @non_head_id = 0
    @definition = Definition.find(params[:id])
    if @definition.level != 'head term'
      id = @definition.find_head_term
      if id != nil
        @non_head_id = params[:id]
        @definition = Definition.find(id)
      end
    end
    @definition.updated_by = session[:user].login
    
    @head_id = @definition.id

# puts '--------------'
# puts @head_id
# puts @theme_array
# puts '--------------'
# puts get_themes

    @definition.term = 'Click to modify new term' if @definition.term == nil or @definition.term == ''
    @definition.definition = 'Click to modify definition'  if @definition.definition == nil or @definition.definition == ''
    
    val = @definition.term
     space = Unicode::U0F0B
     space2 = Unicode::U0F0C
     line = Unicode::U0F0D
     nb_space = Unicode::U00A0
     val = val.strip
     # val = val.gsub("#{nb_space}",' ')  #remove non-breaking space before tsheg
     
     val = val.gsub(line,'')
     val = val.gsub(space2,space)
      val = val.gsub(space,'_space_')
      a = val.split('_space_')
      word = ''
      a.each {|w| 
        word += space if word != ''
        word += w 
      }
      val = word                  
      val = word.gsub("'","''")

    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangujung Yeshe Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
        # 
        # # @old_definitions = OldDefinition.find(:all, :conditions => "term ilike '%"+@definition.term+"%'")
        # @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and term = '"+@definition.term+"'")
        # @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and term = '"+@definition.term+"'")
        # @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and term = '"+@definition.term+"'")
        # @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and term = '"+@definition.term+"'")
        # @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and term = '"+@definition.term+"'")
        # @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangjung Yeshe Dictionary' and term = '"+@definition.term+"'")
        # @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and term = '"+@definition.term+"'")
        # @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and term = '"+@definition.term+"'")
        
    # render :template => '/definitions/edit_show'
    render :layout => 'staging_new' #'staging_edit'
  end
  
  def public_content_only
    debugger
    # initialize_variables
    
    # @register = @@register
    # @language_context = @@language_context
    # @theme_array = @@theme_array
    # @internal_theme_array = @@internal_theme_array
    # @grammar_function_array = @@grammar_function_array
    # @internal_grammar_function_array = @@internal_grammar_function_array
    # @dialect_array = @@dialect_array
    # @internal_dialect_array = @@internal_dialect_array
    # @pronunciation_dialect_array = @@pronunciation_dialect_array
    # @spelling_dialect_array = @@spelling_dialect_array
    # @etymology_dialect_array = @@etymology_dialect_array

    @tibetan_space = Unicode::U0F0B
    @tibetan_space_fix = Unicode::U0F0B + Unicode::U200B
    
    # @level = ["","head term","not head"]
    @level = '[["",""],["head term","head term"],["not head","not head"]]'
    @language = []
    Language.find(:all).each do |l|
      @language += [l.language]
    end
    @tense = "imperative, past, present, future".split(', ')
    @register = []
    Register.find(:all).each do |l|
      @register += [l.register]
    end
    @language_context = []
    LanguageContext.find(:all).each do |l|
      @language_context += [l.language_context]
    end
    @literary_genre = []
    LiteraryGenre.find(:all).each do |l|
      @literary_genre += [l.literary_genre]
    end
    @literary_period = []
    LiteraryPeriod.find(:all).each do |l|
      @literary_period += [l.literary_period]
    end
    @literary_form = []
    LiteraryForm.find(:all).each do |l|
      @literary_form += [l.literary_form]
    end

    @theme_ones = ThemeLevelOne.find(:all)
    @theme_array = ""
    @internal_theme_array = ""
    for md in @theme_ones
      @theme_array += ",\n" unless @theme_array == ""
      md.theme = '-' if md.theme == nil
      @theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'definition_id);\",null"
      @internal_theme_array += ",\n" unless @internal_theme_array == ""
      @internal_theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\",null"
      if md.theme_level_twos.size > 0
        @theme_array += ",\n"
        @internal_theme_array += ",\n"
      else
        @theme_array += ",null,\n"
        @internal_theme_array += ",null,\n"
      end
      theme_two_array = ""
      internal_theme_two_array = ""
      for sd in md.theme_level_twos
        theme_two_array += ",\n" unless theme_two_array == ""
        sd.theme = '-' if sd.theme == nil
        theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'definition_id);\",null"
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
          theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
          internal_theme_three_array += ",\n" unless internal_theme_three_array == ""
          internal_theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification')+"/'+definition_id);\"]\n"
        end
        theme_two_array += theme_three_array+"\n]"
        internal_theme_two_array += internal_theme_three_array+"\n]"
      end
      @theme_array += theme_two_array+"\n]"
      @internal_theme_array += internal_theme_two_array+"\n]"
    end
    @theme_array = "[\n['Choose Theme',null,null,\n"+@theme_array+"],['Cancel',null,null]	]"
    # puts '================'
    # puts @theme_array
    @internal_theme_array = "[\n['Choose Theme',null,null,\n"+@internal_theme_array+"],['Cancel',null,null]	]"

    @grammar_function_level_ones = GrammarFunctionLevelOne.find(:all)
    @grammar_function_array = ""
    @internal_grammar_function_array = ""
    for md in @grammar_function_level_ones
      @grammar_function_array += ",\n" unless @grammar_function_array == ""
      md.grammar_function = "-" if md.grammar_function == nil
      @grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" #unless md.grammar_function != nil
      @internal_grammar_function_array += ",\n" unless @internal_grammar_function_array == ""
      @internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:set_field('"+md.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null"
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
        grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
        internal_grammar_function_two_array += ",\n" unless internal_grammar_function_two_array == ""
        internal_grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
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
          grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
          internal_grammar_function_three_array += ",\n" unless internal_grammar_function_three_array == ""
          internal_grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
        end
        grammar_function_two_array += grammar_function_three_array+"\n]"
        internal_grammar_function_two_array += internal_grammar_function_three_array+"\n]"
      end
      @grammar_function_array += grammar_function_two_array+"\n]"
      @internal_grammar_function_array += internal_grammar_function_two_array+"\n]"
    end
    @grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@grammar_function_array+"],['Cancel',null,null]	]"
    @internal_grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@internal_grammar_function_array+"],['Cancel',null,null]	]"
    
    @major_dialects = MajorDialect.find(:all)
    @dialect_array = ""
    @internal_dialect_array = ""
    @pronunciation_dialect_array = ""
    @etymology_dialect_array = ""
    @spelling_dialect_array = ""
    for md in @major_dialects
      @dialect_array += ",\n" unless @dialect_array == ""
      md.name = '-' if md.name == nil
      @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @internal_dialect_array += ",\n" unless @internal_dialect_array == ""
      @internal_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @pronunciation_dialect_array += ",\n" unless @pronunciation_dialect_array == ""
      @pronunciation_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','pronunciation[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @etymology_dialect_array += ",\n" unless @etymology_dialect_array == ""
      @etymology_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','etymology[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @spelling_dialect_array += ",\n" unless @spelling_dialect_array == ""
      @spelling_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','spelling[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      if md.specific_dialects.size > 0
        @dialect_array += ",\n"
        @internal_dialect_array += ",\n"
        @pronunciation_dialect_array += ",\n"
        @etymology_dialect_array += ",\n"
        @spelling_dialect_array += ",\n"
      else
        @dialect_array += ",null,\n"
        @internal_dialect_array += ",null,\n"
        @pronunciation_dialect_array += ",null,\n"
        @etymology_dialect_array += ",null,\n"
        @spelling_dialect_array += ",null,\n"
      end
      specific_dialect_array = ""
      internal_specific_dialect_array = ""
      pronunciation_specific_dialect_array = ""
      etymology_specific_dialect_array = ""
      spelling_specific_dialect_array = ""
      for sd in md.specific_dialects
        specific_dialect_array += ",\n" unless specific_dialect_array == ""
        sd.name = '-' if sd.name == nil
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        internal_specific_dialect_array += ",\n" unless internal_specific_dialect_array == ""
        internal_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        pronunciation_specific_dialect_array += ",\n" unless pronunciation_specific_dialect_array == ""
        pronunciation_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','pronunciation[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        etymology_specific_dialect_array += ",\n" unless etymology_specific_dialect_array == ""
        etymology_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','etymology[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        spelling_specific_dialect_array += ",\n" unless spelling_specific_dialect_array == ""
        spelling_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','spelling[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
      end
      @dialect_array += specific_dialect_array+"\n]"
      @internal_dialect_array += internal_specific_dialect_array+"\n]"
      @pronunciation_dialect_array += pronunciation_specific_dialect_array+"\n]"
      @etymology_dialect_array += etymology_specific_dialect_array+"\n]"
      @spelling_dialect_array += spelling_specific_dialect_array+"\n]"
    end
    @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null]	]"
    @internal_dialect_array = "[\n['Choose Dialect',null,null,\n"+@internal_dialect_array+"],['Cancel',null,null]	]"
    @pronunciation_dialect_array = "[\n['Choose Dialect',null,null,\n"+@pronunciation_dialect_array+"],['Cancel',null,null]	]"
    @etymology_dialect_array = "[\n['Choose Dialect',null,null,\n"+@etymology_dialect_array+"],['Cancel',null,null]	]"
    @spelling_dialect_array = "[\n['Choose Dialect',null,null,\n"+@spelling_dialect_array+"],['Cancel',null,null]	]"
    
    
    @definition = Definition.find(params[:id])
    @head_id = @definition.id
    @definition.term = 'Click to modify' if @definition.term == nil or @definition.term == ''
    @definition.definition = 'Click to modify'  if @definition.definition == nil or @definition.definition == ''
    # render :template => '/definitions/edit_show'
    
    #render :layout => false
    render :layout => 'staging_new'
  end
    
  def public_other_term
    @definition = OldDefinition.find params[:id]
    render :layout => 'staging'
  end
  
  def public_term
    if params['mode'] == 'search'
      @page_class = 'search'
    elsif params['mode'] == 'edit'
      @page_class = 'edit'
    else
      @page_class = 'browse'
    end
    # breakpoint
    @tibetan_space = Unicode::U0F0B
    @tibetan_space_fix = Unicode::U0F0B + Unicode::U200B
    
    puts '--------'
    puts 'head ?'+params[:id].to_s
    @non_head_id = 0
    @definition = Definition.find(params[:id])
    if @definition.level != 'head term'
      id = @definition.find_head_term
      if id != nil
        puts id
        @non_head_id = params[:id]
        @definition = Definition.find(id)
      end
    end
    
    #     related_terms = []
    #     # tense
    #     to = @definition.definition_definition_form_tos.find(:all,:conditions => "relationship_from ilike '%tense' or relationship_from ilike 'impera%'" )
    #     to.map {|t| related_terms << [t.displayToInfoPublic, t.definition_from, t.update_history, t.meta]}
    #     from = @definition.definition_definition_form_froms.find(:all,:conditions => "relationship_to ilike '%tense' or relationship_to ilike 'impera%'" )
    #     from.map {|t| related_terms << [t.displayFromInfoPublic, t.definition_to, t.update_history, t.meta]}
    #     @tenses = related_terms
    #     
    #     related_terms = []
    #     # honorific
    #     to = @definition.definition_definition_form_tos.find(:all,:conditions => "relationship_from ilike '%rific%'" )
    #     to.map {|t| related_terms << [t.displayToInfoPublic, t.definition_from, t.update_history, t.meta]}
    #     from = @definition.definition_definition_form_froms.find(:all,:conditions => "relationship_to ilike '%rific%'" )
    #     from.map {|t| related_terms << [t.displayFromInfoPublic, t.definition_to, t.update_history, t.meta]}
    #     @honorifics = related_terms
    #     
    #     related_terms = []
    #     # tense
    #     to = @definition.definition_definition_form_tos.find(:all,:conditions => "relationship_from not ilike '%tense' and relationship_from not ilike 'impera%' and relationship_from not ilike '%rific%'" )
    #     to.map {|t| 
    #   if t.definition_from != nil
    #     term = t.definition_from.term
    #     def_id = t.definition_from.id
    #   else
    #     def_id = nil
    #   end
    #   if t.meta != nil
    #     meta_id = t.meta.id
    #   else
    #     meta_id = nil
    #   end
    #   related_terms << [t.displayToInfoPublic, term, def_id, t.update_history, meta_id]
    # }
    #     from = @definition.definition_definition_form_froms.find(:all,:conditions => "relationship_from not ilike '%tense' and relationship_from not ilike 'impera%' and relationship_from not ilike '%rific%'" )
    #     from.map {|t| 
    #   if t.definition_from != nil
    #     term = t.definition_from.term
    #     def_id = t.definition_from.id
    #   else
    #     def_id = nil
    #   end
    #   if t.meta != nil
    #     meta_id = t.meta.id
    #   else
    #     meta_id = nil
    #   end
    #   related_terms << [t.displayToInfoPublic, term, def_id, t.update_history, meta_id]
    # }
    #     @related_terms = related_terms
    #     breakpoint

    # breakpoint

    @definition.term = '' if @definition.term == nil
    
    val = @definition.term
     space = Unicode::U0F0B
     space2 = Unicode::U0F0C
     line = Unicode::U0F0D
     nb_space = Unicode::U00A0
     
     # val = val.gsub("#{nb_space}",' ')  #remove non-breaking space before tsheg
     
     val = val.strip
     
     val = val.gsub(line,'')
     val = val.gsub(space2,space)
      val = val.gsub(space,'_space_')
      a = val.split('_space_')
      word = ''
      a.each {|w| 
        word += space if word != ''
        word += w 
      }
      # breakpoint
      val = word.gsub("'","''")

      # debugger

    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangujung Yeshe Dictionary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and (term = '"+val+"' or term = '"+val+space+"' or term = '"+val+line+"' or term = '"+val+space+line+"' or term = '"+val+space2+"' or term = '"+val+space2+line+"')")
    if params['list_view'] == "true"
      render :layout => false 
    else
      render :layout => 'staging_new'
    end
    # render :template => '/definitions/edit_show'
  end

  def debug_me
    d = Definition.find(params[:id])
    breakpoint
    render :text => 'done'
  end
  
  def public_show
    if params['mode'] == 'search'
      @page_class = 'search'
    else
      @page_class = 'browse'
    end
    @tibetan_space = Unicode::U0F0B
    @tibetan_space_fix = Unicode::U0F0B + Unicode::U200B
    
    @definition = Definition.find(params[:id])
    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and term = '"+@definition.term+"'")
    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and term = '"+@definition.term+"'")
    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and term = '"+@definition.term+"'")
    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and term = '"+@definition.term+"'")
    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and term = '"+@definition.term+"'")
    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangjung Yeshe Dictionary' and term = '"+@definition.term+"'")
    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and term = '"+@definition.term+"'")
    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and term = '"+@definition.term+"'")
    render :layout => false if params['list_view'] == "true"
    render :layout => 'staging'
    # render :template => '/definitions/edit_show'
  end

  def public_show_list
    @definition = Definition.find(params[:id])
    @dan_martin_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Dan Martin Dictionary' and term = '"+@definition.term+"'")
    @ives_waldo_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Ives Waldo Dictionary' and term = '"+@definition.term+"'")
    @jeffrey_hopkins_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jeffrey Hopkins Dictionary' and term = '"+@definition.term+"'")
    @jim_valby_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Jim Valby Dictionary' and term = '"+@definition.term+"'")
    @richard_baron_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Richard Baron Dictionary' and term = '"+@definition.term+"'")
    @rangjung_yeshe_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Rangjung Yeshe Dictionary' and term = '"+@definition.term+"'")
    @yogacara_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'Yogācāra Glossary' and term = '"+@definition.term+"'")
    @tshig_definitions = OldDefinition.find(:all, :conditions => "dictionary = 'bod rgya tshig mdzod chen mo' and term = '"+@definition.term+"'")
    render :layout => false
    # render :text => 'done'
    # render :template => '/definitions/edit_show'
  end
  
  def test2
    render :text => 'test'
  end

  def new
    @grammatical_function_type = Category.find(286)
    @definition = Definition.new
    @definition.created_by = session[:user].login
    @definition.created_at = Time.now
    @definition.level = 'head term'
    @definition.save

    redirect_to :action => 'public_edit', :id => @definition.id, :params => {'new' => 'true'}
  end

  def create
    @grammatical_function_type = Category.find(286)
    if(params['internal'] != nil)
      @divname = 'definition_internal'
    else
    	@divname = 'definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition = Definition.new(params[:definition])
    if @definition.save
      flash[:notice] = 'Definition was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'definition_internal'
    else
    	@divname = 'definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition = Definition.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def test_jrails_edit
    
  end
  
  def set_definition_term
    
  end
  
  def edit_dynamic
    
    @data = Category.find(184)
    # @level = ["","head term","not head"]
    @level = '[["",""],["head term","head term"],["not head","not head"]]'
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    @tense = "imperative, past, present, future".split(', ')
    @register = []
    Register.find(:all).each do |l|
      @register += [l.register]
    end
    @language_context = []
    LanguageContext.find(:all).each do |l|
      @language_context += [l.language_context]
    end
    @literary_genre = []
    LiteraryGenre.find(:all).each do |l|
      @literary_genre += [l.literary_genre]
    end
    @literary_period = []
    LiteraryPeriod.find(:all).each do |l|
      @literary_period += [l.literary_period]
    end
    @literary_form = []
    LiteraryForm.find(:all).each do |l|
      @literary_form += [l.literary_form]
    end

    @theme_ones = ThemeLevelOne.find(:all)
    @theme_array = ""
    @internal_theme_array = ""
    for md in @theme_ones
      @theme_array += ",\n" unless @theme_array == ""
      md.theme = '-' if md.theme == nil
      @theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
      @internal_theme_array += ",\n" unless @internal_theme_array == ""
      @internal_theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
      if md.theme_level_twos.size > 0
        @theme_array += ",\n"
        @internal_theme_array += ",\n"
      else
        @theme_array += ",null,\n"
        @internal_theme_array += ",null,\n"
      end
      theme_two_array = ""
      internal_theme_two_array = ""
      for sd in md.theme_level_twos
        theme_two_array += ",\n" unless theme_two_array == ""
        sd.theme = '-' if sd.theme == nil
        theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
        internal_theme_two_array += ",\n" unless internal_theme_two_array == ""
        internal_theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
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
          theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\"]\n"
          internal_theme_three_array += ",\n" unless internal_theme_three_array == ""
          internal_theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\"]\n"
        end
        theme_two_array += theme_three_array+"\n]"
        internal_theme_two_array += internal_theme_three_array+"\n]"
      end
      @theme_array += theme_two_array+"\n]"
      @internal_theme_array += internal_theme_two_array+"\n]"
    end
    @theme_array = "[\n['Choose Theme',null,null,\n"+@theme_array+"],['Cancel',null,null]	]"
    @internal_theme_array = "[\n['Choose Theme',null,null,\n"+@internal_theme_array+"],['Cancel',null,null]	]"

    @grammar_function_level_ones = GrammarFunctionLevelOne.find(:all)
    @grammar_function_array = ""
    @internal_grammar_function_array = ""
    for md in @grammar_function_level_ones
      @grammar_function_array += ",\n" unless @grammar_function_array == ""
      md.grammar_function = "-" if md.grammar_function == nil
      @grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" #unless md.grammar_function != nil
      @internal_grammar_function_array += ",\n" unless @internal_grammar_function_array == ""
      @internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:set_field('"+md.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null"
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
        grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
        internal_grammar_function_two_array += ",\n" unless internal_grammar_function_two_array == ""
        internal_grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
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
          grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
          internal_grammar_function_three_array += ",\n" unless internal_grammar_function_three_array == ""
          internal_grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
        end
        grammar_function_two_array += grammar_function_three_array+"\n]"
        internal_grammar_function_two_array += internal_grammar_function_three_array+"\n]"
      end
      @grammar_function_array += grammar_function_two_array+"\n]"
      @internal_grammar_function_array += internal_grammar_function_two_array+"\n]"
    end
    @grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@grammar_function_array+"],['Cancel',null,null]	]"
    @internal_grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@internal_grammar_function_array+"],['Cancel',null,null]	]"
    
    @major_dialects = MajorDialect.find(:all)
    @dialect_array = ""
    @internal_dialect_array = ""
    for md in @major_dialects
      @dialect_array += ",\n" unless @dialect_array == ""
      md.name = '-' if md.name == nil
      @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @internal_dialect_array += ",\n" unless @internal_dialect_array == ""
      @internal_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
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
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        internal_specific_dialect_array += ",\n" unless internal_specific_dialect_array == ""
        internal_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
      end
      @dialect_array += specific_dialect_array+"\n]"
      @internal_dialect_array += internal_specific_dialect_array+"\n]"
    end
    @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null]	]"
    @internal_dialect_array = "[\n['Choose Dialect',null,null,\n"+@internal_dialect_array+"],['Cancel',null,null]	]"


    if(params['internal'] != nil)
      @divname = 'definition_internal'
    else
    	@divname = 'definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition = Definition.find(params[:id])
    print "-----------------"+@definition.sub_definitions.size.to_s
    print "\nno layout\n" if params['internal'] != nil or params['public'] != nil
    #render :layout => false if params['internal'] != nil or params['public'] != nil
    #render :layout => 'staging_new'
    render :layout => 'staging_popup'
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'definition_internal'
    else
    	@divname = 'definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @definition = Definition.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    print "-------------"
    print params
    print "\n"
    @definition = Definition.find(params[:id])
    if @definition.created_by == nil or @definition.created_by == ""
      @definition.created_by = session[:user].login
      @definition.created_at = Time.now
    end
    if session[:user] != nil
      @definition.updated_by = session[:user].login
    end
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    #breakpoint
    if params['internal'] != nil and params['internal'] != ""
      result = @definition.update_attributes(params[:internal_definition])
    else
      result = @definition.update_attributes(params[:definition])
    end
    if result
      flash[:notice] = 'Definition was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'super_definitions'
          render :partial => "super_definitions/edit_contents",:locals => {'@super_definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'literary_quotations'
          render :partial => "literary_quotations/edit_contents",:locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
        end
        if params['internal'] == 'full_synonyms'
          render :partial => "full_synonyms/edit_contents",:locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
        end
        if params['internal'] == 'translation_equivalents'
          render :partial => "translation_equivalents/edit_contents",:locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
        end
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'etymologies'
          # print "================= rendering partial"
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'related_definitions'
          render :partial => "related_definitions/edit_contents",:locals => {'@related_definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'oral_quotations'
          render :partial => "oral_quotations/edit_contents",:locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'spellings'
          render :partial => "spellings/edit_contents",:locals => {'@spelling' => Spelling.find(params['pk'])}
        end
        if params['internal'] == 'model_sentences'
          render :partial => "model_sentences/edit_contents",:locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
        end
        if params['internal'] == 'definition_definitions'
          render :partial => "definition_definitions/edit_contents",:locals => {'@definition_definition' => DefinitionDefinition.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
        if params['internal'] == 'pronunciations'
          render :partial => "pronunciations/edit_contents",:locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
        end
        if params['internal'] == 'definition_definition_forms'
          render :partial => "definition_definition_forms/edit_contents",:locals => {'@definition_definition_form' => DefinitionDefinitionForm.find(params['pk'])}
        end
        if params['internal'] == 'edit_box'
          # render :text => 'done', :layout => false
          redirect_to :action => 'public_content_only', :id => params['head_id']
        end
      else
        redirect_to :action => 'show', :id => @definition
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'full_synonyms_froms'
          render :partial => "full_synonyms_froms/edit_contents",:locals => {'@full_synonyms_from' => FullSynonym.find(params['pk'])}
        end
        if params['internal'] == 'super_definitions'
          render :partial => "super_definitions/edit_contents",:locals => {'@super_definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'literary_quotations'
          render :partial => "literary_quotations/edit_contents",:locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
        end
        if params['internal'] == 'full_synonyms'
          render :partial => "full_synonyms/edit_contents",:locals => {'@full_synonyms' => FullSynonym.find(params['pk'])}
        end
        if params['internal'] == 'translation_equivalents'
          render :partial => "translation_equivalents/edit_contents",:locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
        end
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'etymology'
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'related_definitions'
          render :partial => "related_definitions/edit_contents",:locals => {'@related_definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'oral_quotations'
          render :partial => "oral_quotations/edit_contents",:locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'spellings'
          render :partial => "spellings/edit_contents",:locals => {'@spelling' => Spelling.find(params['pk'])}
        end
        if params['internal'] == 'model_sentences'
          render :partial => "model_sentences/edit_contents",:locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
        end
        if params['internal'] == 'definition_definition_forms'
          render :partial => "definition_definition_form/edit_contents",:locals => {'@definition_definition_form' => DefinitionDefinitionForm.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
        if params['internal'] == 'pronunciations'
          render :partial => "pronunciations/edit_contents",:locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
        end
        if params['internal'] == 'definition_definition_forms'
          render :partial => "definition_definition_forms/edit_contents",:locals => {'@definition_definition_form' => DefinitionDefinitionForm.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @definition
      end
  end

  def edit_dynamic_definition
    @data = Category.find(184)
    @level = ["","head term","not head"]
    #@level = '[["",""],["head term","head term"],["not head","not head"]]'
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    @tense = "imperative, past, present, future".split(', ')
    @register = []
    Register.find(:all).each do |l|
      @register += [l.register]
    end
    @language_context = []
    LanguageContext.find(:all).each do |l|
      @language_context += [l.language_context]
    end
    @literary_genre = []
    LiteraryGenre.find(:all).each do |l|
      @literary_genre += [l.literary_genre]
    end
    @literary_period = []
    LiteraryPeriod.find(:all).each do |l|
      @literary_period += [l.literary_period]
    end
    @literary_form = []
    LiteraryForm.find(:all).each do |l|
      @literary_form += [l.literary_form]
    end

    @theme_ones = ThemeLevelOne.find(:all)
    @theme_array = ""
    @internal_theme_array = ""
    for md in @theme_ones
      @theme_array += ",\n" unless @theme_array == ""
      md.theme = '-' if md.theme == nil
      @theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
      @internal_theme_array += ",\n" unless @internal_theme_array == ""
      @internal_theme_array += "['"+md.theme+"', \"javascript:set_field('"+md.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
      if md.theme_level_twos.size > 0
        @theme_array += ",\n"
        @internal_theme_array += ",\n"
      else
        @theme_array += ",null,\n"
        @internal_theme_array += ",null,\n"
      end
      theme_two_array = ""
      internal_theme_two_array = ""
      for sd in md.theme_level_twos
        theme_two_array += ",\n" unless theme_two_array == ""
        sd.theme = '-' if sd.theme == nil
        theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
        internal_theme_two_array += ",\n" unless internal_theme_two_array == ""
        internal_theme_two_array += "  ['"+sd.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\",null"
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
          theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\"]\n"
          internal_theme_three_array += ",\n" unless internal_theme_three_array == ""
          internal_theme_three_array += "    ['"+td.theme+"', \"javascript:set_field('"+md.theme+" > "+sd.theme+" > "+td.theme+"','internal_definition[thematic_classification]','"+url_for(:action => 'set_thematic_classification',:id => params[:id].to_s)+"');\"]\n"
        end
        theme_two_array += theme_three_array+"\n]"
        internal_theme_two_array += internal_theme_three_array+"\n]"
      end
      @theme_array += theme_two_array+"\n]"
      @internal_theme_array += internal_theme_two_array+"\n]"
    end
    @theme_array = "[\n['Choose Theme',null,null,\n"+@theme_array+"],['Cancel',null,null]	]"
    @internal_theme_array = "[\n['Choose Theme',null,null,\n"+@internal_theme_array+"],['Cancel',null,null]	]"

    @grammar_function_level_ones = GrammarFunctionLevelOne.find(:all)
    @grammar_function_array = ""
    @internal_grammar_function_array = ""
    for md in @grammar_function_level_ones
      @grammar_function_array += ",\n" unless @grammar_function_array == ""
      md.grammar_function = "-" if md.grammar_function == nil
      @grammar_function_array += "['"+md.grammar_function.to_s+"', \"javascript:set_field('"+md.grammar_function.to_s+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" #unless md.grammar_function != nil
      @internal_grammar_function_array += ",\n" unless @internal_grammar_function_array == ""
      @internal_grammar_function_array += "['"+md.grammar_function+"', \"javascript:set_field('"+md.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null"
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
        grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
        internal_grammar_function_two_array += ",\n" unless internal_grammar_function_two_array == ""
        internal_grammar_function_two_array += "  ['"+sd.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\",null" unless sd.grammar_function == nil or md.grammar_function == nil
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
          grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
          internal_grammar_function_three_array += ",\n" unless internal_grammar_function_three_array == ""
          internal_grammar_function_three_array += "    ['"+td.grammar_function+"', \"javascript:set_field('"+md.grammar_function+" > "+sd.grammar_function+" > "+td.grammar_function+"','internal_definition[grammatical_function]','"+url_for(:action => 'set_grammatical_function',:id => params[:id].to_s)+"');\"]\n"
        end
        grammar_function_two_array += grammar_function_three_array+"\n]"
        internal_grammar_function_two_array += internal_grammar_function_three_array+"\n]"
      end
      @grammar_function_array += grammar_function_two_array+"\n]"
      @internal_grammar_function_array += internal_grammar_function_two_array+"\n]"
    end
    @grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@grammar_function_array+"],['Cancel',null,null]	]"
    @internal_grammar_function_array = "[\n['Choose Grammatical Function',null,null,\n"+@internal_grammar_function_array+"],['Cancel',null,null]	]"
    
    @major_dialects = MajorDialect.find(:all)
    @dialect_array = ""
    @internal_dialect_array = ""
    for md in @major_dialects
      @dialect_array += ",\n" unless @dialect_array == ""
      md.name = '-' if md.name == nil
      @dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
      @internal_dialect_array += ",\n" unless @internal_dialect_array == ""
      @internal_dialect_array += "['"+md.name+"', \"javascript:set_field('"+md.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\",null"
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
        specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
        internal_specific_dialect_array += ",\n" unless internal_specific_dialect_array == ""
        internal_specific_dialect_array += "  ['"+sd.name+"', \"javascript:set_field('"+md.name+" > "+sd.name+"','internal_definition[major_dialect_family]','"+url_for(:action => 'set_major_dialect_family',:id => params[:id].to_s)+"');\"]\n"
      end
      @dialect_array += specific_dialect_array+"\n]"
      @internal_dialect_array += internal_specific_dialect_array+"\n]"
    end
    @dialect_array = "[\n['Choose Dialect',null,null,\n"+@dialect_array+"],['Cancel',null,null]	]"
    @internal_dialect_array = "[\n['Choose Dialect',null,null,\n"+@internal_dialect_array+"],['Cancel',null,null]	]"


    if(params['internal'] != nil)
      @divname = 'definition_internal'
    else
    	@divname = 'definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition = Definition.find(params[:id])
    print "-----------------"+@definition.sub_definitions.size.to_s
    print "\nno layout\n" if params['internal'] != nil or params['public'] != nil
    #render :layout => false if params['internal'] != nil or params['public'] != nil
    #render :layout => 'staging_new'
    render :layout => 'staging_popup'
  end

  def update_definition
    @definition = Definition.find(params[:definition][:id])
    if @definition.created_by == nil or @definition.created_by == ""
      @definition.created_by = session[:user].login
      @definition.created_at = Time.now
    end
    if session[:user] != nil
      @definition.updated_by = session[:user].login
    end
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]"
    end   
    respond_to do |format|
      if @definition.update_attributes(params[:definition])
        format.html do
          render :partial => 'definition_show', :locals => {:d => @definition}
        end
        #flash[:notice] = 'Definition was successfully updated.'
        #redirect_to :action => 'index_edit'
        #redirect_to :action => 'public_edit', :id => @definition
      else
        #redirect_to :action => 'index_edit'
        #redirect_to :action => 'public_edit', :id => @definition
      end
    end
  end
  
  def definition_show
    @definition = Definition.find(params[:id])
    render :partial => "definition_show", :locals => {:d => @definition}
  end
  
  def definition_edit
    @definition = Definition.find(params[:id])
    render :partial => "definition_edit", :locals => {:d => @definition}
  end

  def update_analytical_note
     @definition = Definition.find(params[:definition][:id])
     if @definition.created_by == nil or @definition.created_by == ""
       @definition.created_by = session[:user].login
       @definition.created_at = Time.now
     end
     if session[:user] != nil
       @definition.updated_by = session[:user].login
     end
     @definition.updated_at = Time.now
     if @definition.update_history == nil
       @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]"
     else
     	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]"
     end   
     respond_to do |format|
       if @definition.update_attributes(params[:definition])
         format.html do
           render :partial => 'analytical_note_show', :locals => {:d => @definition}
         end
       else
         #redirect_to :action => 'index_edit'
         #redirect_to :action => 'public_edit', :id => @definition
       end
     end
   end
  
  def analytical_note_show
    @definition = Definition.find(params[:id])
    render :partial => "analytical_note_show", :locals => {:d => @definition}
  end
  
  def analytical_note_edit
    @definition = Definition.find(params[:id])
    render :partial => "analytical_note_edit", :locals => {:d => @definition}
  end
  
   def update_image_description
     @definition = Definition.find(params[:definition][:id])
     if @definition.created_by == nil or @definition.created_by == ""
       @definition.created_by = session[:user].login
       @definition.created_at = Time.now
     end
     if session[:user] != nil
       @definition.updated_by = session[:user].login
     end
     @definition.updated_at = Time.now
     if @definition.update_history == nil
       @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]"
     else
     	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]"
     end   
     respond_to do |format|
       if @definition.update_attributes(params[:definition])
         format.html do
           render :partial => 'image_description_show', :locals => {:d => @definition}
         end
       else
         #redirect_to :action => 'index_edit'
         #redirect_to :action => 'public_edit', :id => @definition
       end
     end
   end

  def image_description_show
     @definition = Definition.find(params[:id])
     render :partial => "image_description_show", :locals => {:d => @definition}
  end

  def image_description_edit
     @definition = Definition.find(params[:id])
     render :partial => "image_description_edit", :locals => {:d => @definition}
  end 

   def update_audio_description
     @definition = Definition.find(params[:definition][:id])
     if @definition.created_by == nil or @definition.created_by == ""
       @definition.created_by = session[:user].login
       @definition.created_at = Time.now
     end
     if session[:user] != nil
       @definition.updated_by = session[:user].login
     end
     @definition.updated_at = Time.now
     if @definition.update_history == nil
       @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]"
     else
     	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]"
     end   
     respond_to do |format|
       if @definition.update_attributes(params[:definition])
         format.html do
           render :partial => 'audio_description_show', :locals => {:d => @definition}
         end
       else
         #redirect_to :action => 'index_edit'
         #redirect_to :action => 'public_edit', :id => @definition
       end
     end
   end

  def audio_description_show
     @definition = Definition.find(params[:id])
     render :partial => "audio_description_show", :locals => {:d => @definition}
  end

  def audio_description_edit
     @definition = Definition.find(params[:id])
     render :partial => "audio_description_edit", :locals => {:d => @definition}
  end 

   def update_video_description
     @definition = Definition.find(params[:definition][:id])
     if @definition.created_by == nil or @definition.created_by == ""
       @definition.created_by = session[:user].login
       @definition.created_at = Time.now
     end
     if session[:user] != nil
       @definition.updated_by = session[:user].login
     end
     @definition.updated_at = Time.now
     if @definition.update_history == nil
       @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]"
     else
     	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]"
     end   
     respond_to do |format|
       if @definition.update_attributes(params[:definition])
         format.html do
           render :partial => 'video_description_show', :locals => {:d => @definition}
         end
       else
         #redirect_to :action => 'index_edit'
         #redirect_to :action => 'public_edit', :id => @definition
       end
     end
   end

  def video_description_show
     @definition = Definition.find(params[:id])
     render :partial => "video_description_show", :locals => {:d => @definition}
  end

  def video_description_edit
     @definition = Definition.find(params[:id])
     render :partial => "video_description_edit", :locals => {:d => @definition}
  end
        
  def update_dynamic_definition
    @definition = Definition.find(params[:id])
    if @definition.created_by == nil or @definition.created_by == ""
      @definition.created_by = session[:user].login
      @definition.created_at = Time.now
    end
    if session[:user] != nil
      @definition.updated_by = session[:user].login
    end
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]"
    end   
    #respond_to do |format|
      if @definition.update_attributes(params[:definition])
        #format.html do
        #  render :partial => 'definition_show', :locals => {:d => @definition}
        #end
        render :nothing => true
        #flash[:notice] = 'Definition was successfully updated.'
        #redirect_to :action => 'index_edit'
        #redirect_to :action => 'public_edit', :id => @definition
      else
        #redirect_to :action => 'index_edit'
        #redirect_to :action => 'public_edit', :id => @definition
      end
    #end
  end
        
        
  def tinymce_text_area
    @definition = Definition.find(params[:id])
    
    render :layout => 'staging_new' #'definitions' #'staging_new'
  end
  
  def public_destroy
    dd = DefinitionDefinition.find(:first, :conditions => 'def2_id = '+params[:id]+' and def1_id = '+params['parent_id'])
    dd.destroy unless dd == nil
    d = Definition.find(params[:id])
    d.destroy unless d == nil
    if params[:id] != params['head_id']
      #redirect_to :action => 'public_content_only', :id => params['head_id']
      redirect_to :action => 'public_edit', :id => params['head_id']
    else
      puts '--------------removed'
      # render :text => 'Term Removed'  #'index'
      debugger
      redirect_to :action => 'index_edit'
    end
  end

  def public_remove_definition
    d = Definition.find(params[:id])
    d.definition = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_grammatical_function
    d = Definition.find(params[:id])
    d.grammatical_function = nil
    d.grammatical_function_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_thematic_classification
    d = Definition.find(params[:id])
    d.thematic_classification = nil
    d.thematic_classification_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_dialect
    d = Definition.find(params[:id])
    d.major_dialect_family = nil
    d.major_dialect_family_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_register
    d = Definition.find(params[:id])
    d.register = nil
    d.register_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_language_context
    d = Definition.find(params[:id])
    d.language_context = nil
    d.language_context_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end
  
  def public_remove_numerology
    d = Definition.find(params[:id])
    d.numerology = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end
  
  def public_remove_literary_form
    d = Definition.find(params[:id])
    d.literary_form = nil
    d.literary_form_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_literary_genre
    d = Definition.find(params[:id])
    d.literary_genre = nil
    d.literary_genre_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_literary_period
    d = Definition.find(params[:id])
    d.literary_period = nil
    d.literary_period_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_pronunciation
    d = Definition.find(params[:id])
    p = Pronunciation.find(params['pronunciation'])
    d.pronunciations.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_literary_quotation
    d = Definition.find(params[:id])
    p = LiteraryQuotation.find(params['literary_quotation'])
    d.literary_quotations.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_oral_quotation
    d = Definition.find(params[:id])
    p = OralQuotation.find(params['oral_quotation'])
    d.oral_quotations.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_translation
    d = Definition.find(params[:id])
    p = Translation.find(params['translation'])
    d.translations.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_etymology_translation
    e = Etymology.find(params[:id])
    p = Translation.find(params['translation'])
    e.translations.delete(p) unless e == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_model_sentence_translation
    m = ModelSentence.find(params[:id])
    t = Translation.find(params['translation'])
    m.translations.delete(t) unless m == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_literary_quotation_translation
    l = LiteraryQuotation.find(params[:id])
    t = Translation.find(params['translation'])
    l.translations.delete(t) unless l == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end
 
  def public_remove_oral_quotation_translation
    o = OralQuotation.find(params[:id])
    t = Translation.find(params['translation'])
    o.translations.delete(t) unless o == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end
        
  def public_remove_model_sentence
    d = Definition.find(params[:id])
    p = ModelSentence.find(params['model_sentence'])
    d.model_sentences.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_spelling
    d = Definition.find(params[:id])
    p = Spelling.find(params['spelling'])
    d.spellings.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_meta
    # d = Definition.find(params[:id])
    p = Meta.destroy(params['meta'])
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_source
    # d = Definition.find(params[:id])
    p = Source.destroy(params['source'])
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_etymology
    d = Definition.find(params[:id])
    p = Etymology.find(params['etymology'])
    d.etymologies.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_translation_equivalent
    d = Definition.find(params[:id])
    p = TranslationEquivalent.find(params['translation_equivalent'])
    d.translation_equivalents.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_form_to
    d = Definition.find(params[:id])
    p = DefinitionDefinitionForm.find(params['form_to'])
    d.definition_definition_form_tos.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_form_from
    d = Definition.find(params[:id])
    p = DefinitionDefinitionForm.find(params['form_from'])
    d.definition_definition_form_froms.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def public_remove_full_synonym
    d = Definition.find(params[:id])
    p = FullSynonym.find(params['full_synonym'])
    d.full_synonyms.delete(p) unless d == nil
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end

  def destroy
    d = Definition.find(params[:id])
    d.destroy unless d == nil
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Definition.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'full_synonyms_froms'
      render :partial => "full_synonyms/edit_contents", :locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
    end
    if params['internal'] == 'super_definitions'
      render :partial => "super_definitions/edit_contents", :locals => {'@super_definition' => Definition.find(params['pk'])}
    end
    if params['internal'] == 'literary_quotations'
      render :partial => "literary_quotations/edit_contents", :locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
    end
    if params['internal'] == 'full_synonyms'
      render :partial => "full_synonyms/edit_contents", :locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
    end
    if params['internal'] == 'translation_equivalents'
      render :partial => "translation_equivalents/edit_contents", :locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
    end
    if params['internal'] == 'sub_definitions'
      render :partial => "sub_definitions/edit_contents", :locals => {'@sub_definition' => Definition.find(params['pk'])}
    end
    if params['internal'] == 'etymology'
      render :partial => "etymologies/edit_contents", :locals => {'@etymology' => Etymology.find(params['pk'])}
    end
    if params['internal'] == 'related_definitions'
      render :partial => "related_definitions/edit_contents", :locals => {'@related_definition' => Definition.find(params['pk'])}
    end
    if params['internal'] == 'oral_quotations'
      render :partial => "oral_quotations/edit_contents", :locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
    end
    if params['internal'] == 'metas'
      render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    end
    if params['internal'] == 'spellings'
      render :partial => "spellings/edit_contents", :locals => {'@spelling' => Spelling.find(params['pk'])}
    end
    if params['internal'] == 'model_sentences'
      render :partial => "model_sentences/edit_contents", :locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
    end
    if params['internal'] == 'definition_definition_forms'
      render :partial => "definition_definition_forms/edit_contents", :locals => {'@definition_definition_form' => DefinitionDefinitionForm.find(params['pk'])}
    end
    if params['internal'] == 'translations'
      render :partial => "translations/edit_contents", :locals => {'@translation' => Translation.find(params['pk'])}
    end
    if params['internal'] == 'pronunciations'
      render :partial => "pronunciations/edit_contents", :locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
    end
     if params['internal'] == 'definition_definitions'
       render :partial => 'definition_definitions/edit_contents', :locals => {'@definition_definition' => DefinitionDefinition.find(params['pk'])}
     end
     if params['internal'] == 'definitions'
       render :partial => 'definitions/edit_contents', :locals => {'@definition' => Definition.find(params['pk'])}
     end
    else
      Definition.find(params['id']).destroy unless params['new'] == nil
      if session['previous_page'] != 'invalid' and session['previous_page'] != nil
      	redirect_to session['previous_page']
      else
        redirect_to $home_page
      end
    end
  end

  def edit_new
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "definitions"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @definition = Definition.find(params['id'])
    @definition.updated_by = session[:user].login
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @definition.save
    
    if params["relatedtype"] == "full_synonym"
      o = FullSynonym.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.save
      @definition.full_synonyms << o
      render_component :controller => "full_synonyms", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'full_synonym', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      
    end
    if params["relatedtype"] == "super_definition"
      o = DefinitionDefinition.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.super_definitions << o
      render_component :controller => "definition_definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'super_definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "literary_quotation"
      o = LiteraryQuotation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.literary_quotations << o
      #render_component :controller => "literary_quotations", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'literary_quotation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_literary_quotation_url(o.id) 
    end
    if params["relatedtype"] == "full_synonyms_to"
      o = FullSynonym.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.full_synonyms_tos << o
      render_component :controller => "full_synonyms", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'full_synonyms_to', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "translation_equivalent"
      o = TranslationEquivalent.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.translation_equivalents << o
      #render_component :controller => "translation_equivalents", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'translation_equivalent', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_translation_equivalent_url(o.id)
    end
    if params["relatedtype"] == "sub_definition"
      o = DefinitionDefinition.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.sub_definitions << o
      render_component :controller => "definition_definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'sub_definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "etymology"
      o = Etymology.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.etymologies << o
      #render_component :controller => "etymologies", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'etymology', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_etymology_url(o.id)
    end
    if params["relatedtype"] == "related_definition"
      o = Definition.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.related_definitions << o
      render_component :controller => "definitions", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'related_definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "oral_quotation"
      o = OralQuotation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.oral_quotations << o
      #render_component :controller => "oral_quotations", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'oral_quotation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_oral_quotation_url(o.id)
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.meta = o
      @definition.save
      #render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to meta_metadata_edit_dynamic_meta_url(o.id)
    end
    if params["relatedtype"] == "spelling"
      o = Spelling.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.spellings << o
      #render_component :controller => "spellings", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'spelling', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_spelling_url(o.id)
    end
    if params["relatedtype"] == "model_sentence"
      o = ModelSentence.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.model_sentences << o
      #render_component :controller => "model_sentences", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'model_sentence', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_model_sentence_url(o.id)
    end
    if params["relatedtype"] == "definition_definition_form_to"
      o = DefinitionDefinitionForm.new
      o.relationship_to = params['role_to']
      o.relationship_from = params['role_from']
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.definition_definition_form_tos << o
      render_component :controller => "definition_definition_forms", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'definition_definition_form_to', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "translation"
      o = Translation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.translations << o
      #render_component :controller => "translations", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'translation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_translation_url(o.id)
    end
    if params["relatedtype"] == "pronunciation"
      o = Pronunciation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.pronunciations << o
      #render_component :controller => "pronunciations", :action => "public_edit", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'pronunciation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_pronunciation_url(o.id)
    end
    if params["relatedtype"] == "definition_definition_form_from"
      o = DefinitionDefinitionForm.new
      o.relationship_to = params['role_to']
      o.relationship_from = params['role_from']
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition.definition_definition_form_froms << o
      #render_component :controller => "definition_definition_forms", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'definition_definition_form_from', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_definition_definition_forms_url(o.id, :internal => internal, :pk => params['id'], :relatedtype => 'definition_definition_form_from', :level => params['level'], :new => 'yes', :definition_id => params['definition_id'] )  
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @definition = Definition.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @definition = Definition.find(params['id'])
    if params["relatedtype"] == "full_synonym"
      if @definition.full_synonyms != nil 
        if params['tags'] != nil 
          @definition.full_synonyms.delete(@definition.full_synonyms - FullSynonym.find(params['tags']))
        else
          @definition.full_synonyms.delete(@definition.full_synonyms)
    	  end
    	end
    end
    if params["relatedtype"] == "super_definition"
      print "-------------------------------super\n"
      print @definition.super_definitions.class.to_s+"\n" unless @definition.super_definitions == nil
      print @definition.sub_definitions.size.to_s+"\n" unless @definition.sub_definitions == nil
      if @definition.super_definitions != nil 
        if params['tags'] != nil 
          defs = []
          (@definition.super_definitions - DefinitionDefinition.find(params['tags'])).each do |d|
            defs += [d.id]
          end
          @definition.super_definitions.delete(@definition.super_definitions - DefinitionDefinition.find(params['tags']))
          for d in defs
            DefinitionDefinition.delete(d)
          end
        else
          defs = []
          @definition.super_definitions.each do |d|
            defs += [d.id]
          end
          @definition.super_definitions.delete(@definition.super_definitions)
          for d in defs
            DefinitionDefinition.delete(d)
          end
    	  end
    	end
    end
    if params["relatedtype"] == "literary_quotation"
      if @definition.literary_quotations != nil 
        if params['tags'] != nil 
          @definition.literary_quotations.delete(@definition.literary_quotations - LiteraryQuotation.find(params['tags']))
        else
          @definition.literary_quotations.delete(@definition.literary_quotations)
    	  end
    	end
    end
    if params["relatedtype"] == "full_synonyms_to"
      if @definition.full_synonyms_tos != nil 
        if params['tags'] != nil 
          @definition.full_synonyms_tos.delete(@definition.full_synonyms_tos - FullSynonym.find(params['tags']))
        else
          @definition.full_synonyms_tos.delete(@definition.full_synonyms_tos)
    	  end
    	end
    end
    if params["relatedtype"] == "translation_equivalent"
      if @definition.translation_equivalents != nil 
        if params['tags'] != nil 
          @definition.translation_equivalents.delete(@definition.translation_equivalents - TranslationEquivalent.find(params['tags']))
        else
          @definition.translation_equivalents.delete(@definition.translation_equivalents)
    	  end
    	end
    end
    if params["relatedtype"] == "sub_definition"
      if @definition.sub_definitions != nil 
        if params['tags'] != nil 
          defs = []
          (@definition.sub_definitions - DefinitionDefinition.find(params['tags'])).each do |d|
            defs += [d.id]
          end
          @definition.sub_definitions.delete(@definition.sub_definitions - DefinitionDefinition.find(params['tags']))
          for d in defs
            DefinitionDefinition.delete(d)
          end
          # @definition.sub_definitions.delete(@definition.sub_definitions - DefinitionDefinition.find(params['tags']))
        else
          defs = []
          @definition.sub_definitions.each do |d|
            defs += [d.id]
          end
          @definition.sub_definitions.delete(@definition.sub_definitions)
          for d in defs
            DefinitionDefinition.delete(d)
          end
          # @definition.sub_definitions.delete(@definition.sub_definitions)
    	  end
    	end
    end
    if params["relatedtype"] == "etymology"
      if @definition.etymologies != nil 
        if params['tags'] != nil 
          @definition.etymologies.delete(@definition.etymologies - Etymology.find(params['tags']))
        else
          @definition.etymologies.delete(@definition.etymologies)
    	  end
    	end
    end
    if params["relatedtype"] == "related_definition"
      if @definition.related_definitions != nil 
        if params['tags'] != nil 
          @definition.related_definitions.delete(@definition.related_definitions - Definition.find(params['tags']))
        else
          @definition.related_definitions.delete(@definition.related_definitions)
    	  end
    	end
    end
    if params["relatedtype"] == "oral_quotation"
      if @definition.oral_quotations != nil 
        if params['tags'] != nil 
          @definition.oral_quotations.delete(@definition.oral_quotations - OralQuotation.find(params['tags']))
        else
          @definition.oral_quotations.delete(@definition.oral_quotations)
    	  end
    	end
    end
    if params["relatedtype"] == "meta"
      @definition.meta = nil if params['tags'] == nil 
      @definition.save
    end
    if params["relatedtype"] == "spelling"
      if @definition.spellings != nil 
        if params['tags'] != nil 
          @definition.spellings.delete(@definition.spellings - Spelling.find(params['tags']))
        else
          @definition.spellings.delete(@definition.spellings)
    	  end
    	end
    end
    if params["relatedtype"] == "model_sentence"
      if @definition.model_sentences != nil 
        if params['tags'] != nil 
          @definition.model_sentences.delete(@definition.model_sentences - ModelSentence.find(params['tags']))
        else
          @definition.model_sentences.delete(@definition.model_sentences)
    	  end
    	end
    end
    if params["relatedtype"] == "definition_definition_form_to"
      if @definition.definition_definition_form_tos != nil 
        if params['tags'] != nil 
          defs = []
          (@definition.definition_definition_form_tos - DefinitionDefinitionForm.find(params['tags'])).each do |d|
            defs += [d.id]
          end
          @definition.definition_definition_form_tos.delete(@definition.definition_definition_form_tos - DefinitionDefinitionForm.find(params['tags']))
          for d in defs
            DefinitionDefinitionForm.delete(d)
          end
          # @definition.definition_definition_form_tos.delete(@definition.definition_definition_form_tos - DefinitionDefinitionForm.find(params['tags']))
        else
          defs = []
          @definition.definition_definition_form_tos.each do |d|
            defs += [d.id]
          end
          @definition.definition_definition_form_tos.delete(@definition.definition_definition_form_froms)
          for d in defs
            DefinitionDefinitionForm.delete(d)
          end
          # @definition.definition_definition_form_tos.delete(@definition.definition_definition_form_tos)
    	  end
    	end
    end
    if params["relatedtype"] == "translation"
      if @definition.translations != nil 
        if params['tags'] != nil 
          @definition.translations.delete(@definition.translations - Translation.find(params['tags']))
        else
          @definition.translations.delete(@definition.translations)
    	  end
    	end
    end
    if params["relatedtype"] == "pronunciation"
      if @definition.pronunciations != nil 
        if params['tags'] != nil 
          @definition.pronunciations.delete(@definition.pronunciations - Pronunciation.find(params['tags']))
        else
          @definition.pronunciations.delete(@definition.pronunciations)
    	  end
    	end
    end
    if params["relatedtype"] == "definition_definition_form_from"
      if @definition.definition_definition_form_froms != nil 
        if params['tags'] != nil 
          defs = []
          (@definition.definition_definition_form_froms - DefinitionDefinitionForm.find(params['tags'])).each do |d|
            defs += [d.id]
          end
          @definition.definition_definition_form_froms.delete(@definition.definition_definition_form_froms - DefinitionDefinitionForm.find(params['tags']))
          for d in defs
            DefinitionDefinitionForm.delete(d)
          end
          # @definition.definition_definition_form_froms.delete(@definition.definition_definition_form_froms - DefinitionDefinitionForm.find(params['tags']))
        else
          defs = []
          @definition.definition_definition_form_froms.each do |d|
            defs += [d.id]
          end
          @definition.definition_definition_form_froms.delete(@definition.definition_definition_form_froms)
          for d in defs
            DefinitionDefinitionForm.delete(d)
          end
          # @definition.definition_definition_form_froms.delete(@definition.definition_definition_form_froms)
    	  end
    	end
    end
   if params['internal'] == 'edit_box'
      # puts 'done'
      render :text => 'done', :layout => false
    else
      render_partial "edit_contents"
    end
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @definition = Definition.find(params['id'])
      render :layout => false
  end

  def synonym_search
    @definition = Definition.find(params['id'])
    #render :layout => false
    render :layout => 'staging_popup'
  end

  def synonym_search_action
    @terms = Definition.find(:all, :conditions => "term ilike '%"+params['term']+"%'")
    render :layout => false
    #render :layout => 'staging_popup'
  end

  def add_synonym
    debugger
    puts '------------'
    puts params[:id]
    puts params['tags']
    term_a = Definition.find(params[:id])
    if params['tags'] != nil
      term_b = Definition.find(params['tags'][0])
      if term_a.full_synonyms.size == 0
        puts '-------'
        puts 'a not in group'
        if term_b.full_synonyms.size == 0
          puts '-------'
          puts 'create b group'
          fs = FullSynonym.new
          fs.created_by = session[:user].login
          fs.created_at = Time.now
          fs.save
          term_b.full_synonyms << fs
        end
        fs = term_b.full_synonyms[0]
        fs.definitions << term_a
        fs.updated_by = session[:user].login
        fs.updated_at = Time.now
        if fs.update_history == nil
          fs.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
        else
          fs.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
        end
        fs.save
        # for fs in term_b.full_synonyms
        #   puts '-------'
        #   puts 'put b fs into a'
        #   term_a.full_synonyms << fs
        # end
      else
        for fs in term_a.full_synonyms
          puts '-------'
          puts 'add b to syn group'
          if term_b.full_synonyms.size > 0
            puts '-------'
            puts 'merge syn groups'
            merge_synyonyms = term_b.full_synonyms
            for fs_b in merge_synyonyms
              for s in fs_b.definitions
                puts '-------'
                puts 'add syn to a'
                fs.definitions << s
                fs.updated_by = session[:user].login
                fs.updated_at = Time.now
                if fs.update_history == nil
                  fs.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
                else
                  fs.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
                end
                fs.save
              end
              # term_a.full_synonyms << fs_b
              if fs_b.meta != nil 
                if fs.meta != nil
                  fs.meta.metadata_note = '' if fs.meta.metadata_note == nil
                  fs.meta.metadata_note += ";\n"+fs_b.meta.metadata_note unless fs_b.meta.metadata_note == nil
                  fs.meta.updated_by = session[:user].login
                  fs.meta.updated_at = Time.now
                  if fs.meta.update_history == nil
                    fs.meta.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
                  else
                    fs.meta.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
                  end
                  fs.meta.save
                else
                  fs.meta = Meta.new
                  fs.meta.updated_by = session[:user].login
                  fs.meta.updated_at = Time.now
                  if fs.meta.update_history == nil
                    fs.meta.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
                  else
                    fs.meta.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
                  end
                  fs.meta.metadata_note = '' if fs.meta.metadata_note == nil
                  fs.meta.metadata_note += ";\n"+fs_b.meta.metadata_note
                  fs.meta.save
                end
                for s in fs_b.meta.sources
                  fs.meta.sources << s
                end
              end
              puts '-------'
              puts 'remove b syn group'
              fs_b.destroy
            end
          else
            fs.definitions << term_b
            fs.updated_by = session[:user].login
            fs.updated_at = Time.now
            if fs.update_history == nil
              fs.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
            else
              fs.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
            end
            fs.save
            # if fs_b.meta != nil 
            #   if fs.meta != nil
            #       fs.meta.updated_by = session[:user].login
            #       fs.meta.updated_at = Time.now
            #       if fs.meta.update_history == nil
            #         fs.meta.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
            #       else
            #         fs.meta.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
            #       end
            #     fs.meta.metadata_note = '' if fs.meta.metadata_note == nil
            #     fs.meta.metadata_note += ";\n"+fs_b.meta.metadata_note unless fs_b.meta.metadata_note == nil
            #     fs.meta.save
            #   else
            #     fs.meta = Meta.new
            #       fs.meta.updated_by = session[:user].login
            #       fs.meta.updated_at = Time.now
            #       if fs.meta.update_history == nil
            #         fs.meta.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
            #       else
            #         fs.meta.update_history += session[:user].login + " ["+Time.now.to_s+"] \n"
            #       end
            #     fs.meta.metadata_note = '' if fs.meta.metadata_note == nil
            #     fs.meta.metadata_note += ";\n"+fs_b.meta.metadata_note
            #     fs.meta.save
            #   end
            #   for s in fs_b.meta.sources
            #     fs.meta.sources << s
            #   end
            # end
          end
        end
      end
    end
    #redirect_to :action => 'public_content_only', :id => params['definition_id']
    redirect_to :action => 'public_edit', :id => params['id']
  end
  
  def edit_search_action
    @definition = Definition.find(params['definition']['id'])
    query = ""
     @full_synonyms_froms = nil
     if params["relatedtype"] == "full_synonym"
       @array = []
       params['full_synonym'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @full_synonyms = FullSynonym.find :all
       else
         @full_synonyms = FullSynonym.find :all, :conditions => query
       end
     end
     @super_definitions = nil
     if params["relatedtype"] == "super_definition"
       @array = []
       params['internal_definition'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @super_definitions = Definition.find :all
       else
         @super_definitions = Definition.find :all, :conditions => query
       end
     end
     @literary_quotations = nil
     if params["relatedtype"] == "literary_quotation"
       @array = []
       params['literary_quotation'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @literary_quotations = LiteraryQuotation.find :all
       else
         @literary_quotations = LiteraryQuotation.find :all, :conditions => query
       end
     end
     @full_synonyms_tos = nil
     if params["relatedtype"] == "full_synonyms_to"
       @array = []
       params['full_synonym'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @full_synonyms_tos = FullSynonym.find :all
       else
         @full_synonyms_tos = FullSynonym.find :all, :conditions => query
       end
     end
     @translation_equivalents = nil
     if params["relatedtype"] == "translation_equivalent"
       @array = []
       params['translation_equivalent'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @translation_equivalents = TranslationEquivalent.find :all
       else
         @translation_equivalents = TranslationEquivalent.find :all, :conditions => query
       end
     end
     @sub_definitions = nil
     if params["relatedtype"] == "sub_definition"
       @array = []
       params['internal_definition'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @sub_definitions = Definition.find :all
       else
         @sub_definitions = Definition.find :all, :conditions => query
       end
     end
     @etymology = nil
     if params["relatedtype"] == "etymology"
       @array = []
       params['etymology'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @etymology = Etymology.find :all
       else
         @etymology = Etymology.find :all, :conditions => query
       end
     end
     @related_definitions = nil
     if params["relatedtype"] == "related_definition"
       @array = []
       params['internal_definition'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @related_definitions = Definition.find :all
       else
         @related_definitions = Definition.find :all, :conditions => query
       end
     end
     @oral_quotations = nil
     if params["relatedtype"] == "oral_quotation"
       @array = []
       params['oral_quotation'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @oral_quotations = OralQuotation.find :all
       else
         @oral_quotations = OralQuotation.find :all, :conditions => query
       end
     end
     @metas = nil
     if params["relatedtype"] == "meta"
       @array = []
       params['meta'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @metas = Meta.find :all
       else
         @metas = Meta.find :all, :conditions => query
       end
     end
     @spellings = nil
     if params["relatedtype"] == "spelling"
       @array = []
       params['spelling'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @spellings = Spelling.find :all
       else
         @spellings = Spelling.find :all, :conditions => query
       end
     end
     @model_sentences = nil
     if params["relatedtype"] == "model_sentence"
       @array = []
       params['model_sentence'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @model_sentences = ModelSentence.find :all
       else
         @model_sentences = ModelSentence.find :all, :conditions => query
       end
     end
     @definition_definition_form_tos = nil
     if params["relatedtype"] == "definition_definition_form_to"
       @array = []
       params['definition_definition_form'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @definition_definition_form_tos = DefinitionDefinitionForm.find :all
       else
         @definition_definition_form_tos = DefinitionDefinitionForm.find :all, :conditions => query
       end
     end
     @translations = nil
     if params["relatedtype"] == "translation"
       @array = []
       params['translation'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @translations = Translation.find :all
       else
         @translations = Translation.find :all, :conditions => query
       end
     end
     @pronunciations = nil
     if params["relatedtype"] == "pronunciation"
       @array = []
       params['pronunciation'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @pronunciations = Pronunciation.find :all
       else
         @pronunciations = Pronunciation.find :all, :conditions => query
       end
     end
     @definition_definition_form_froms = nil
     if params["relatedtype"] == "definition_definition_form_from"
       @array = []
       params['definition_definition_form'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @definition_definition_form_froms = DefinitionDefinitionForm.find :all
       else
         @definition_definition_form_froms = DefinitionDefinitionForm.find :all, :conditions => query
       end
     end
      render :layout => false
    
  end

  def edit_add_to_list_action
    @definition = Definition.find(params['id'])
    @definition.updated_by = session[:user].login
    @definition.updated_at = Time.now
    if @definition.update_history == nil
      @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    
    if params['tags'] != nil

    if params["relatedtype"] == "full_synonym"
      if @definition.full_synonyms == nil 
        @definition.full_synonyms = FullSynonym.find(params['tags'])
      else
        @definition.full_synonyms.delete(@definition.full_synonyms - FullSynonym.find(params['tags']))
        @definition.full_synonyms << FullSynonym.find(params['tags']) - @definition.full_synonyms
    	end
    end
    if params["relatedtype"] == "super_definition"
      if @definition.super_definitions == nil 
        @definition.super_definitions = Definition.find(params['tags'])
      else
        @definition.super_definitions.delete(@definition.super_definitions - Definition.find(params['tags']))
        @definition.super_definitions << Definition.find(params['tags']) - @definition.super_definitions 
    	end
    end
    if params["relatedtype"] == "literary_quotation"
      if @definition.literary_quotations == nil 
        @definition.literary_quotations = LiteraryQuotation.find(params['tags'])
      else
        @definition.literary_quotations.delete(@definition.literary_quotations - LiteraryQuotation.find(params['tags']))
        @definition.literary_quotations << LiteraryQuotation.find(params['tags']) - @definition.literary_quotations 
    	end
    end
    if params["relatedtype"] == "full_synonyms_to"
      if @definition.full_synonyms_tos == nil 
        @definition.full_synonyms_tos = FullSynonym.find(params['tags'])
      else
        @definition.full_synonyms_tos.delete(@definition.full_synonyms_tos - FullSynonym.find(params['tags']))
        @definition.full_synonyms_tos << FullSynonym.find(params['tags']) - @definition.full_synonyms_tos 
    	end
    end
    if params["relatedtype"] == "translation_equivalent"
      if @definition.translation_equivalents == nil 
        @definition.translation_equivalents = TranslationEquivalent.find(params['tags'])
      else
        @definition.translation_equivalents.delete(@definition.translation_equivalents - TranslationEquivalent.find(params['tags']))
        @definition.translation_equivalents << TranslationEquivalent.find(params['tags']) - @definition.translation_equivalents 
    	end
    end
    if params["relatedtype"] == "sub_definition"
      if @definition.sub_definitions == nil 
        @definition.sub_definitions = Definition.find(params['tags'])
      else
        @definition.sub_definitions.delete(@definition.sub_definitions - Definition.find(params['tags']))
        @definition.sub_definitions << Definition.find(params['tags']) - @definition.sub_definitions 
    	end
    end
    if params["relatedtype"] == "etymology"
      if @definition.etymologies == nil 
        @definition.etymologies = Etymology.find(params['tags'])
      else
        @definition.etymologies.delete(@definition.etymologies - Etymology.find(params['tags']))
        @definition.etymologies << Etymology.find(params['tags']) - @definition.etymologies 
    	end
    end
    if params["relatedtype"] == "related_definition"
      if @definition.related_definitions == nil 
        if params['tags'] != nil 
          @definition.related_definitions = Definition.find(params['tags'])
        end
      else
        if params['tags'] != nil 
          @definition.related_definitions.delete(@definition.related_definitions - Definition.find(params['tags']))
          @definition.related_definitions << Definition.find(params['tags']) - @definition.related_definitions 
        end
    	end
    end
    if params["relatedtype"] == "oral_quotation"
      if @definition.oral_quotations == nil 
        @definition.oral_quotations = OralQuotation.find(params['tags'])
      else
        @definition.oral_quotations.delete(@definition.oral_quotations - OralQuotation.find(params['tags']))
        @definition.oral_quotations << OralQuotation.find(params['tags']) - @definition.oral_quotations 
    	end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @definition.meta = Meta.find(params['tags'][0])
        @definition.save
      end
    end
    if params["relatedtype"] == "spelling"
      if @definition.spellings == nil 
        @definition.spellings = Spelling.find(params['tags'])
      else
        @definition.spellings.delete(@definition.spellings - Spelling.find(params['tags']))
        @definition.spellings << Spelling.find(params['tags']) - @definition.spellings 
    	end
    end
    if params["relatedtype"] == "model_sentence"
      if @definition.model_sentences == nil 
        @definition.model_sentences = ModelSentence.find(params['tags'])
      else
        @definition.model_sentences.delete(@definition.model_sentences - ModelSentence.find(params['tags']))
        @definition.model_sentences << ModelSentence.find(params['tags']) - @definition.model_sentences 
    	end
    end
    if params["relatedtype"] == "definition_definition_form_to"
      if @definition.definition_definition_form_tos == nil 
        @definition.definition_definition_form_tos = DefinitionDefinitionForm.find(params['tags'])
      else
        @definition.definition_definition_form_tos.delete(@definition.definition_definition_form_tos - DefinitionDefinitionForm.find(params['tags']))
        @definition.definition_definition_form_tos << DefinitionDefinitionForm.find(params['tags']) - @definition.definition_definition_form_tos 
    	end
    end
    if params["relatedtype"] == "translation"
      if @definition.translations == nil 
        @definition.translations = Translation.find(params['tags'])
      else
        @definition.translations.delete(@definition.translations - Translation.find(params['tags']))
        @definition.translations << Translation.find(params['tags']) - @definition.translations 
    	end
    end
    if params["relatedtype"] == "pronunciation"
      if @definition.pronunciations == nil 
        @definition.pronunciations = Pronunciation.find(params['tags'])
      else
        @definition.pronunciations.delete(@definition.pronunciations - Pronunciation.find(params['tags']))
        @definition.pronunciations << Pronunciation.find(params['tags']) - @definition.pronunciations 
    	end
    end
    if params["relatedtype"] == "definition_definition_form_from"
      if @definition.definition_definition_form_froms == nil 
        @definition.definition_definition_form_froms = DefinitionDefinitionForm.find(params['tags'])
      else
        @definition.definition_definition_form_froms.delete(@definition.definition_definition_form_froms - DefinitionDefinitionForm.find(params['tags']))
        @definition.definition_definition_form_froms << DefinitionDefinitionForm.find(params['tags']) - @definition.definition_definition_form_froms 
    	end
    end
  end
    if params['internal'] == 'edit_box'
      puts '--------------------------'
      # puts 'done'
      # render :text => 'done', :layout => false
      @definition = Definition.find(params['definition_id'])
      @head_id = @definition.id
      redirect_to :action => 'public_content_only', :id => params['definition_id']
      # render :template => 'definitions/public_content_only', :layout => false
      # render(:partial => 'definition',:locals => {:d => @definition})
    else
      render_partial 'edit_contents'
    end
  end

  def search
    @level = ["","head term","not head"]
      @definition = Definition.new
  end

  def searchaction
      sort_init 'id'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['definition'] != nil
          @array = []
          params['definition'].each do |key, val| 
            if val != "" and val != nil
              if query != ""
                query = query + " and "
                vals = vals + ","
              end
              query = query + key + " ilike ?"
              @array.push("%"+val+"%")
              vals = vals + key + ":" + val 
            end
          end
          query = [query]+@array
        end
      end
      if flash['sub_definitions'] != nil
        params['sub_definitions'] = flash['sub_definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['full_synonyms'] != nil
        params['full_synonyms'] = flash['full_synonyms']
        flash['relatedsearch'] = 'yes'
      end
      if flash['oral_quotations'] != nil
        params['oral_quotations'] = flash['oral_quotations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['etymologies'] != nil
        params['etymologies'] = flash['etymologies']
        flash['relatedsearch'] = 'yes'
      end
      if flash['literary_quotations'] != nil
        params['literary_quotations'] = flash['literary_quotations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['model_sentences'] != nil
        params['model_sentences'] = flash['model_sentences']
        flash['relatedsearch'] = 'yes'
      end
      if flash['related_definitions'] != nil
        params['related_definitions'] = flash['related_definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translations'] != nil
        params['translations'] = flash['translations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['super_definitions'] != nil
        params['super_definitions'] = flash['super_definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition_definition_form_froms'] != nil
        params['definition_definition_form_froms'] = flash['definition_definition_form_froms']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition_definition_form_tos'] != nil
        params['definition_definition_form_tos'] = flash['definition_definition_form_tos']
        flash['relatedsearch'] = 'yes'
      end
      if flash['spellings'] != nil
        params['spellings'] = flash['spellings']
        flash['relatedsearch'] = 'yes'
      end
      if flash['full_synonyms_froms'] != nil
        params['full_synonyms_froms'] = flash['full_synonyms_froms']
        flash['relatedsearch'] = 'yes'
      end
      if flash['pronunciations'] != nil
        params['pronunciations'] = flash['pronunciations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translation_equivalents'] != nil
        params['translation_equivalents'] = flash['translation_equivalents']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['sub_definitions'] == nil or params['sub_definitions'] == "") and (params['full_synonyms'] == nil or params['full_synonyms'] == "") and (params['oral_quotations'] == nil or params['oral_quotations'] == "") and (params['etymologies'] == nil or params['etymologies'] == "") and (params['literary_quotations'] == nil or params['literary_quotations'] == "") and (params['model_sentences'] == nil or params['model_sentences'] == "") and (params['related_definitions'] == nil or params['related_definitions'] == "") and (params['meta'] == nil or params['meta'] == "") and (params['translations'] == nil or params['translations'] == "") and (params['super_definitions'] == nil or params['super_definitions'] == "") and (params['definition_definition_form_froms'] == nil or params['definition_definition_form_froms'] == "") and (params['definition_definition_form_tos'] == nil or params['definition_definition_form_tos'] == "") and (params['spellings'] == nil or params['spellings'] == "") and (params['full_synonyms_froms'] == nil or params['full_synonyms_froms'] == "") and (params['pronunciations'] == nil or params['pronunciations'] == "") and (params['translation_equivalents'] == nil or params['translation_equivalents'] == "")
        @definition_pages, @definitions = paginate :definitions, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @definitions = Definition.find :all, :order => sort_clause
        else
          @definitions = Definition.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['sub_definitions'] != nil and params['sub_definitions'] != ""
      flash['sub_definitions'] = params['sub_definitions']
      for o in @definitions
        found = 0
        for obj in o.sub_definitions
          if string_contains obj.displayInfo, params['sub_definitions']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['full_synonyms'] != nil and params['full_synonyms'] != ""
      flash['full_synonyms'] = params['full_synonyms']
      for o in @definitions
        found = 0
        for obj in o.full_synonyms
          if string_contains obj.displayInfo, params['full_synonyms']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['oral_quotations'] != nil and params['oral_quotations'] != ""
      flash['oral_quotations'] = params['oral_quotations']
      for o in @definitions
        found = 0
        for obj in o.oral_quotations
          if string_contains obj.displayInfo, params['oral_quotations']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['etymologies'] != nil and params['etymologies'] != ""
      flash['etymologies'] = params['etymologies']
      for o in @definitions
        found = 0
        for obj in o.etymologies
          if string_contains obj.displayInfo, params['etymologies']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['literary_quotations'] != nil and params['literary_quotations'] != ""
      flash['literary_quotations'] = params['literary_quotations']
      for o in @definitions
        found = 0
        for obj in o.literary_quotations
          if string_contains obj.displayInfo, params['literary_quotations']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['model_sentences'] != nil and params['model_sentences'] != ""
      flash['model_sentences'] = params['model_sentences']
      for o in @definitions
        found = 0
        for obj in o.model_sentences
          if string_contains obj.displayInfo, params['model_sentences']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['related_definitions'] != nil and params['related_definitions'] != ""
      flash['related_definitions'] = params['related_definitions']
      for o in @definitions
        found = 0
        for obj in o.related_definitions
          if string_contains obj.displayInfo, params['related_definitions']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @definitions
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @definitions = array
    end
    array = []
    if params['translations'] != nil and params['translations'] != ""
      flash['translations'] = params['translations']
      for o in @definitions
        found = 0
        for obj in o.translations
          if string_contains obj.displayInfo, params['translations']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['super_definitions'] != nil and params['super_definitions'] != ""
      flash['super_definitions'] = params['super_definitions']
      for o in @definitions
        found = 0
        for obj in o.super_definitions
          if string_contains obj.displayInfo, params['super_definitions']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['definition_definition_form_froms'] != nil and params['definition_definition_form_froms'] != ""
      flash['definition_definition_form_froms'] = params['definition_definition_form_froms']
      for o in @definitions
        found = 0
        for obj in o.definition_definition_form_froms
          if string_contains obj.displayInfo, params['definition_definition_form_froms']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['definition_definition_form_tos'] != nil and params['definition_definition_form_tos'] != ""
      flash['definition_definition_form_tos'] = params['definition_definition_form_tos']
      for o in @definitions
        found = 0
        for obj in o.definition_definition_form_tos
          if string_contains obj.displayInfo, params['definition_definition_form_tos']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['spellings'] != nil and params['spellings'] != ""
      flash['spellings'] = params['spellings']
      for o in @definitions
        found = 0
        for obj in o.spellings
          if string_contains obj.displayInfo, params['spellings']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['full_synonyms_froms'] != nil and params['full_synonyms_froms'] != ""
      flash['full_synonyms_froms'] = params['full_synonyms_froms']
      for o in @definitions
        found = 0
        for obj in o.full_synonyms_froms
          if string_contains obj.displayInfo, params['full_synonyms_froms']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['pronunciations'] != nil and params['pronunciations'] != ""
      flash['pronunciations'] = params['pronunciations']
      for o in @definitions
        found = 0
        for obj in o.pronunciations
          if string_contains obj.displayInfo, params['pronunciations']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
    array = []
    if params['translation_equivalents'] != nil and params['translation_equivalents'] != ""
      flash['translation_equivalents'] = params['translation_equivalents']
      for o in @definitions
        found = 0
        for obj in o.translation_equivalents
          if string_contains obj.displayInfo, params['translation_equivalents']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @definitions = array
    end
      if flash['sub_definitions'] != nil
        params['sub_definitions'] = flash['sub_definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['full_synonyms'] != nil
        params['full_synonyms'] = flash['full_synonyms']
        flash['relatedsearch'] = 'yes'
      end
      if flash['oral_quotations'] != nil
        params['oral_quotations'] = flash['oral_quotations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['etymologies'] != nil
        params['etymologies'] = flash['etymologies']
        flash['relatedsearch'] = 'yes'
      end
      if flash['literary_quotations'] != nil
        params['literary_quotations'] = flash['literary_quotations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['model_sentences'] != nil
        params['model_sentences'] = flash['model_sentences']
        flash['relatedsearch'] = 'yes'
      end
      if flash['related_definitions'] != nil
        params['related_definitions'] = flash['related_definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translations'] != nil
        params['translations'] = flash['translations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['super_definitions'] != nil
        params['super_definitions'] = flash['super_definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition_definition_form_froms'] != nil
        params['definition_definition_form_froms'] = flash['definition_definition_form_froms']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition_definition_form_tos'] != nil
        params['definition_definition_form_tos'] = flash['definition_definition_form_tos']
        flash['relatedsearch'] = 'yes'
      end
      if flash['spellings'] != nil
        params['spellings'] = flash['spellings']
        flash['relatedsearch'] = 'yes'
      end
      if flash['full_synonyms_froms'] != nil
        params['full_synonyms_froms'] = flash['full_synonyms_froms']
        flash['relatedsearch'] = 'yes'
      end
      if flash['pronunciations'] != nil
        params['pronunciations'] = flash['pronunciations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translation_equivalents'] != nil
        params['translation_equivalents'] = flash['translation_equivalents']
        flash['relatedsearch'] = 'yes'
      end
           if vals == ""
             vals = params["query"]
           end
           #  ---------  build custom paginator to handle extra queries -----------------
           if params['items_per_page'] != nil
             items_per_page = params['items_per_page'].to_i
           else
             items_per_page = 10
           end
           @definition_pages = Paginator.new self, @definitions.length(), items_per_page, params['page']
           if @definition_pages.item_count != 0
             @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @definitions = @definitions[@offset,items_per_page] if @definitions[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
