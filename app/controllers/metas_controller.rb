class MetasController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :full_synonyms
  helper :definitions
  helper :translations
  helper :oral_quotations
  helper :spellings
  helper :groups
  helper :model_sentences
  helper :etymologies
  helper :literary_quotations
  helper :pronunciations
  helper :translation_equivalents


  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end
  FullSynonym.content_columns.each do |column|
    in_place_edit_for :full_synonym, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Translation.content_columns.each do |column|
    in_place_edit_for :translation, column.name
  end
  OralQuotation.content_columns.each do |column|
    in_place_edit_for :oral_quotation, column.name
  end
  Spelling.content_columns.each do |column|
    in_place_edit_for :spelling, column.name
  end
  Group.content_columns.each do |column|
    in_place_edit_for :group, column.name
  end
  ModelSentence.content_columns.each do |column|
    in_place_edit_for :model_sentence, column.name
  end
  Etymology.content_columns.each do |column|
    in_place_edit_for :etymology, column.name
  end
  LiteraryQuotation.content_columns.each do |column|
    in_place_edit_for :literary_quotation, column.name
  end
  Pronunciation.content_columns.each do |column|
    in_place_edit_for :pronunciation, column.name
  end
  TranslationEquivalent.content_columns.each do |column|
    in_place_edit_for :translation_equivalent, column.name
  end
  Source.content_columns.each do |column|
    in_place_edit_for :source, column.name
  end
  
  def set_language_type_id
    d = Meta.find(params[:id])
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
  
  def set_project_type_id
    d = Meta.find(params[:id])
    if d != nil and params[:value] != nil
      d.project_type_id = params[:value].to_i
      d.project = nil
    end
        d.updated_by = session[:user].login
        # debugger
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'language_type', :title => d.project_type.title, :id => d.id, :data_id => 236, :update_id => params[:update_id]})  
  end

  def display_category_selector
    @data = Category.find(params['data_id'])
    @meta = Meta.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end

  def set_source_source_id
    d = Source.find(params[:id])
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

  def add_source
    @source = Source.new
    @source.created_by = session[:user].login
    @source.created_at = Time.now
    @source.save
    meta = Meta.find(params[:id])
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end
    render :layout => false
  end
  
  def meta_content_only
    @language = []
    Language.find(:all).each do |l|
      @language += [l.language]
    end
    @project = []
    Project.find(:all).each do |l|
      @project += [l.project]
    end
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end
    @meta = Meta.find(params[:id])
    render :layout => false
  end
  
  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'id'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @meta_pages, @metas = paginate :meta, :per_page => items_per_page, :order_by => sort_clause
    if @meta_pages.item_count != 0
      @pages = (@meta_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@meta_pages.current.first_item.to_f / @meta_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @meta = Meta.find(params[:id])
  end

  def new
    @meta = Meta.new
    @meta.created_by = session[:user].login
    @meta.created_at = Time.now
    @meta.save
    redirect_to :action => 'edit_dynamic', :id => @meta.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'meta_internal'
    else
    	@divname = 'meta'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @meta = Meta.new(params[:meta])
    if @meta.save
      flash[:notice] = 'Meta was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'meta_internal'
    else
    	@divname = 'meta'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @meta = Meta.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    @language = []
    Language.find(:all).each do |l|
      @language += [l.language]
    end
    @project = []
    Project.find(:all).each do |l|
      @project += [l.project]
    end
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end

    if(params['internal'] != nil)
      @divname = 'meta_internal'
    else
    	@divname = 'meta'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @meta = Meta.find(params[:id])
    render :layout => false
  end

  def edit_dynamic
    @language = []
    Language.find(:all).each do |l|
      @language += [l.language]
    end
    @project = []
    Project.find(:all).each do |l|
      @project += [l.project]
    end
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end

    if(params['internal'] != nil)
      @divname = 'meta_internal'
    else
    	@divname = 'meta'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @meta = Meta.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'meta_internal'
    else
    	@divname = 'meta'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @meta = Meta.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @meta = Meta.find(params[:id])
    # if session[:user] != nil
    #   @meta.updated_by = session[:user].login
    # end
#     @meta.updated_at = Time.now
#     if @meta.update_history == nil
#       @meta.update_history = session[:user].login + " ["+Time.now.to_s+"]
# "
#     else
#     	@meta.update_history += session[:user].login + " ["+Time.now.to_s+"]
# "
#     end
    if @meta.update_attributes(params[:meta])
      flash[:notice] = 'Meta was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'full_synonyms'
          render :partial => "full_synonyms/edit_contents",:locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
        end
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
        if params['internal'] == 'oral_quotations'
          render :partial => "oral_quotations/edit_contents",:locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
        end
        if params['internal'] == 'spellings'
          render :partial => "spellings/edit_contents",:locals => {'@spelling' => Spelling.find(params['pk'])}
        end
        if params['internal'] == 'groups'
          render :partial => "groups/edit_contents",:locals => {'@group' => Group.find(params['pk'])}
        end
        if params['internal'] == 'model_sentences'
          render :partial => "model_sentences/edit_contents",:locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
        end
        if params['internal'] == 'etymologies'
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'literary_quotations'
          render :partial => "literary_quotations/edit_contents",:locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
        end
        if params['internal'] == 'pronunciations'
          render :partial => "pronunciations/edit_contents",:locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
        end
        if params['internal'] == 'translation_equivalents'
          render :partial => "translation_equivalents/edit_contents",:locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @meta
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'full_synonyms'
          render :partial => "full_synonyms/edit_contents",:locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
        end
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
        if params['internal'] == 'oral_quotations'
          render :partial => "oral_quotations/edit_contents",:locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
        end
        if params['internal'] == 'spellings'
          render :partial => "spellings/edit_contents",:locals => {'@spelling' => Spelling.find(params['pk'])}
        end
        if params['internal'] == 'groups'
          render :partial => "groups/edit_contents",:locals => {'@group' => Group.find(params['pk'])}
        end
        if params['internal'] == 'model_sentences'
          render :partial => "model_sentences/edit_contents",:locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
        end
        if params['internal'] == 'etymologies'
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'literary_quotations'
          render :partial => "literary_quotations/edit_contents",:locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
        end
        if params['internal'] == 'pronunciations'
          render :partial => "pronunciations/edit_contents",:locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
        end
        if params['internal'] == 'translation_equivalents'
          render :partial => "translation_equivalents/edit_contents",:locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @meta
      end
  end

  def destroy
    Meta.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    Meta.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     Meta.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'full_synonyms'
    #   render :partial => "full_synonyms/edit_contents", :locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
    # end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'translations'
    #   render :partial => "translations/edit_contents", :locals => {'@translation' => Translation.find(params['pk'])}
    # end
    # if params['internal'] == 'oral_quotations'
    #   render :partial => "oral_quotations/edit_contents", :locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
    # end
    # if params['internal'] == 'spellings'
    #   render :partial => "spellings/edit_contents", :locals => {'@spelling' => Spelling.find(params['pk'])}
    # end
    # if params['internal'] == 'groups'
    #   render :partial => "groups/edit_contents", :locals => {'@group' => Group.find(params['pk'])}
    # end
    # if params['internal'] == 'model_sentences'
    #   render :partial => "model_sentences/edit_contents", :locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
    # end
    # if params['internal'] == 'etymologies'
    #   render :partial => "etymologies/edit_contents", :locals => {'@etymology' => Etymology.find(params['pk'])}
    # end
    # if params['internal'] == 'literary_quotations'
    #   render :partial => "literary_quotations/edit_contents", :locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
    # end
    # if params['internal'] == 'pronunciations'
    #   render :partial => "pronunciations/edit_contents", :locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
    # end
    # if params['internal'] == 'translation_equivalents'
    #   render :partial => "translation_equivalents/edit_contents", :locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
    # end
    #  if params['internal'] == 'metas'
    #    render :partial => 'metas/edit_contents', :locals => {'@meta' => Meta.find(params['pk'])}
    #  end
    # else
    #   Meta.find(params['id']).destroy unless params['new'] == nil
    #   if session['previous_page'] != 'invalid' and session['previous_page'] != nil
    #     redirect_to session['previous_page']
    #   else
    #     redirect_to $home_page
    #   end
    # end
  end

  def edit_new
    #debugger
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "meta"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    print '----------render '
    puts params['relatedtype']
    
    @meta = Meta.find(params['id'])
    if params["relatedtype"] == "source"
      o = Source.new
      o.save
      @meta.sources << o
      @meta.save
      puts '----------render source'
      #render_component :controller => "sources", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'full_synonym', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      #redirect_to source_source_edit_dynamic_source_url(o.id), :something => "heiser"  #:params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to :controller => "sources", :action => "edit_dynamic_source", :id => o.id, :internal => "metas", :pk => params['id'], :relatedtype=> 'full_synonym', :level => params['level'], :new => 'yes', :definition_id => params['definition_id']
    end
    if params["relatedtype"] == "full_synonym"
      o = FullSynonym.new
      o.save
      @meta.full_synonym = o
      @meta.save
      render_component :controller => "full_synonyms", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'full_synonym', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @meta.definition = o
      @meta.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "translation"
      o = Translation.new
      o.save
      @meta.translation = o
      @meta.save
      render_component :controller => "translations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'translation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "oral_quotation"
      o = OralQuotation.new
      o.save
      @meta.oral_quotation = o
      @meta.save
      render_component :controller => "oral_quotations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'oral_quotation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "spelling"
      o = Spelling.new
      o.save
      @meta.spelling = o
      @meta.save
      render_component :controller => "spellings", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'spelling', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "group"
      o = Group.new
      o.save
      @meta.group = o
      @meta.save
      render_component :controller => "groups", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'group', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "model_sentence"
      o = ModelSentence.new
      o.save
      @meta.model_sentence = o
      @meta.save
      render_component :controller => "model_sentences", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'model_sentence', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "etymology"
      o = Etymology.new
      o.save
      @meta.etymology = o
      @meta.save
      render_component :controller => "etymologies", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'etymology', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "literary_quotation"
      o = LiteraryQuotation.new
      o.save
      @meta.literary_quotation = o
      @meta.save
      render_component :controller => "literary_quotations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'literary_quotation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "pronunciation"
      o = Pronunciation.new
      o.save
      @meta.pronunciation = o
      @meta.save
      render_component :controller => "pronunciations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'pronunciation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "translation_equivalent"
      o = TranslationEquivalent.new
      o.save
      @meta.translation_equivalent = o
      @meta.save
      render_component :controller => "translation_equivalents", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "metas", 'pk' => params['id'], 'relatedtype'=> 'translation_equivalent', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @meta = Meta.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @meta = Meta.find(params['id'])
    if params["relatedtype"] == "full_synonym"
      @meta.full_synonym = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "definition"
      @meta.definition = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "translation"
      @meta.translation = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "oral_quotation"
      @meta.oral_quotation = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "spelling"
      @meta.spelling = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "group"
      @meta.group = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "model_sentence"
      @meta.model_sentence = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "etymology"
      @meta.etymology = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "literary_quotation"
      @meta.literary_quotation = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "pronunciation"
      @meta.pronunciation = nil if params['tags'] == nil 
      @meta.save
    end
    if params["relatedtype"] == "translation_equivalent"
      @meta.translation_equivalent = nil if params['tags'] == nil 
      @meta.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @meta = Meta.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @meta = Meta.find(params['meta']['id'])
    query = ""
     @full_synonyms = nil
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
         @full_synonyms = FullSynonym.find_all
       else
         @full_synonyms = FullSynonym.find :all, :conditions => query
       end
     end
     @definitions = nil
     if params["relatedtype"] == "definition"
       @array = []
       params['definition'].each do |key, val| 
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
         @definitions = Definition.find_all
       else
         @definitions = Definition.find :all, :conditions => query
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
         @translations = Translation.find_all
       else
         @translations = Translation.find :all, :conditions => query
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
         @oral_quotations = OralQuotation.find_all
       else
         @oral_quotations = OralQuotation.find :all, :conditions => query
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
         @spellings = Spelling.find_all
       else
         @spellings = Spelling.find :all, :conditions => query
       end
     end
     @groups = nil
     if params["relatedtype"] == "group"
       @array = []
       params['group'].each do |key, val| 
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
         @groups = Group.find_all
       else
         @groups = Group.find :all, :conditions => query
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
         @model_sentences = ModelSentence.find_all
       else
         @model_sentences = ModelSentence.find :all, :conditions => query
       end
     end
     @etymologies = nil
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
         @etymologies = Etymology.find_all
       else
         @etymologies = Etymology.find :all, :conditions => query
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
         @literary_quotations = LiteraryQuotation.find_all
       else
         @literary_quotations = LiteraryQuotation.find :all, :conditions => query
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
         @pronunciations = Pronunciation.find_all
       else
         @pronunciations = Pronunciation.find :all, :conditions => query
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
         @translation_equivalents = TranslationEquivalent.find_all
       else
         @translation_equivalents = TranslationEquivalent.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @meta = Meta.find(params['id'])
    if params["relatedtype"] == "full_synonym"
      if params['tags'] != nil
        @meta.full_synonym = FullSynonym.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @meta.definition = Definition.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "translation"
      if params['tags'] != nil
        @meta.translation = Translation.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "oral_quotation"
      if params['tags'] != nil
        @meta.oral_quotation = OralQuotation.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "spelling"
      if params['tags'] != nil
        @meta.spelling = Spelling.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "group"
      if params['tags'] != nil
        @meta.group = Group.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "model_sentence"
      if params['tags'] != nil
        @meta.model_sentence = ModelSentence.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "etymology"
      if params['tags'] != nil
        @meta.etymology = Etymology.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "literary_quotation"
      if params['tags'] != nil
        @meta.literary_quotation = LiteraryQuotation.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "pronunciation"
      if params['tags'] != nil
        @meta.pronunciation = Pronunciation.find(params['tags'][0])
        @meta.save
      end
    end
    if params["relatedtype"] == "translation_equivalent"
      if params['tags'] != nil
        @meta.translation_equivalent = TranslationEquivalent.find(params['tags'][0])
        @meta.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @meta = Meta.new
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
        if params['meta'] != nil
          @array = []
          params['meta'].each do |key, val| 
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
      if flash['etymology'] != nil
        params['etymology'] = flash['etymology']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translation_equivalent'] != nil
        params['translation_equivalent'] = flash['translation_equivalent']
        flash['relatedsearch'] = 'yes'
      end
      if flash['spelling'] != nil
        params['spelling'] = flash['spelling']
        flash['relatedsearch'] = 'yes'
      end
      if flash['full_synonym'] != nil
        params['full_synonym'] = flash['full_synonym']
        flash['relatedsearch'] = 'yes'
      end
      if flash['oral_quotation'] != nil
        params['oral_quotation'] = flash['oral_quotation']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translation'] != nil
        params['translation'] = flash['translation']
        flash['relatedsearch'] = 'yes'
      end
      if flash['model_sentence'] != nil
        params['model_sentence'] = flash['model_sentence']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition'] != nil
        params['definition'] = flash['definition']
        flash['relatedsearch'] = 'yes'
      end
      if flash['group'] != nil
        params['group'] = flash['group']
        flash['relatedsearch'] = 'yes'
      end
      if flash['pronunciation'] != nil
        params['pronunciation'] = flash['pronunciation']
        flash['relatedsearch'] = 'yes'
      end
      if flash['literary_quotation'] != nil
        params['literary_quotation'] = flash['literary_quotation']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['etymology'] == nil or params['etymology'] == "") and (params['translation_equivalent'] == nil or params['translation_equivalent'] == "") and (params['spelling'] == nil or params['spelling'] == "") and (params['full_synonym'] == nil or params['full_synonym'] == "") and (params['oral_quotation'] == nil or params['oral_quotation'] == "") and (params['translation'] == nil or params['translation'] == "") and (params['model_sentence'] == nil or params['model_sentence'] == "") and (params['definition'] == nil or params['definition'] == "") and (params['group'] == nil or params['group'] == "") and (params['pronunciation'] == nil or params['pronunciation'] == "") and (params['literary_quotation'] == nil or params['literary_quotation'] == "")
        @meta_pages, @metas = paginate :metas, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @metas = Meta.find :all, :order => sort_clause
        else
          @metas = Meta.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['etymology'] != nil and params['etymology'] != ""
      flash['etymology'] = params['etymology']
      for o in @metas
        if o.etymology != nil
          if string_contains o.etymology.displayInfo, params['etymology']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['translation_equivalent'] != nil and params['translation_equivalent'] != ""
      flash['translation_equivalent'] = params['translation_equivalent']
      for o in @metas
        if o.translation_equivalent != nil
          if string_contains o.translation_equivalent.displayInfo, params['translation_equivalent']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['spelling'] != nil and params['spelling'] != ""
      flash['spelling'] = params['spelling']
      for o in @metas
        if o.spelling != nil
          if string_contains o.spelling.displayInfo, params['spelling']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['full_synonym'] != nil and params['full_synonym'] != ""
      flash['full_synonym'] = params['full_synonym']
      for o in @metas
        if o.full_synonym != nil
          if string_contains o.full_synonym.displayInfo, params['full_synonym']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['oral_quotation'] != nil and params['oral_quotation'] != ""
      flash['oral_quotation'] = params['oral_quotation']
      for o in @metas
        if o.oral_quotation != nil
          if string_contains o.oral_quotation.displayInfo, params['oral_quotation']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['translation'] != nil and params['translation'] != ""
      flash['translation'] = params['translation']
      for o in @metas
        if o.translation != nil
          if string_contains o.translation.displayInfo, params['translation']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['model_sentence'] != nil and params['model_sentence'] != ""
      flash['model_sentence'] = params['model_sentence']
      for o in @metas
        if o.model_sentence != nil
          if string_contains o.model_sentence.displayInfo, params['model_sentence']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @metas
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['group'] != nil and params['group'] != ""
      flash['group'] = params['group']
      for o in @metas
        if o.group != nil
          if string_contains o.group.displayInfo, params['group']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['pronunciation'] != nil and params['pronunciation'] != ""
      flash['pronunciation'] = params['pronunciation']
      for o in @metas
        if o.pronunciation != nil
          if string_contains o.pronunciation.displayInfo, params['pronunciation']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
    array = []
    if params['literary_quotation'] != nil and params['literary_quotation'] != ""
      flash['literary_quotation'] = params['literary_quotation']
      for o in @metas
        if o.literary_quotation != nil
          if string_contains o.literary_quotation.displayInfo, params['literary_quotation']
            array = array + [o]
          end
        end
      end
      @metas = array
    end
      if flash['etymology'] != nil
        params['etymology'] = flash['etymology']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translation_equivalent'] != nil
        params['translation_equivalent'] = flash['translation_equivalent']
        flash['relatedsearch'] = 'yes'
      end
      if flash['spelling'] != nil
        params['spelling'] = flash['spelling']
        flash['relatedsearch'] = 'yes'
      end
      if flash['full_synonym'] != nil
        params['full_synonym'] = flash['full_synonym']
        flash['relatedsearch'] = 'yes'
      end
      if flash['oral_quotation'] != nil
        params['oral_quotation'] = flash['oral_quotation']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translation'] != nil
        params['translation'] = flash['translation']
        flash['relatedsearch'] = 'yes'
      end
      if flash['model_sentence'] != nil
        params['model_sentence'] = flash['model_sentence']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition'] != nil
        params['definition'] = flash['definition']
        flash['relatedsearch'] = 'yes'
      end
      if flash['group'] != nil
        params['group'] = flash['group']
        flash['relatedsearch'] = 'yes'
      end
      if flash['pronunciation'] != nil
        params['pronunciation'] = flash['pronunciation']
        flash['relatedsearch'] = 'yes'
      end
      if flash['literary_quotation'] != nil
        params['literary_quotation'] = flash['literary_quotation']
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
           @meta_pages = Paginator.new self, @metas.length(), items_per_page, params['page']
           if @meta_pages.item_count != 0
             @pages = (@meta_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@meta_pages.current.first_item.to_f / @meta_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @metas = @metas[@offset,items_per_page] if @metas[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
  
  def edit_dynamic_meta
    @language = []
    Language.find(:all).each do |l|
      @language += [l.language]
    end
    @project = []
    Project.find(:all).each do |l|
      @project += [l.project]
    end
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end

    if(params['internal'] != nil)
      @divname = 'meta_internal'
    else
    	@divname = 'meta'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @meta = Meta.find(params[:id])
    #render :layout => 'staging_popup'
    #render :partial => 'test'
    render :layout => false
  end  
  
  def update_dynamic_meta 
      @meta = Meta.find(params[:id])
      if @meta.created_by == nil or @meta.created_by == ""
             @meta.created_by = session[:user].login
             @meta.created_at = Time.now
      end
      if session[:user] != nil
             @meta.updated_by = session[:user].login
      end
      @meta.updated_at = Time.now
      if @meta.update_history == nil
        @meta.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @meta.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      if @meta.update_attributes(params[:meta])
        #if @meta.definition_id.nil?
        #   render :nothing => true
        #else
        #  render_meta
        #end
        render_metas
      end
  end  
  
  def render_meta
    @meta = Meta.find(params[:id])
    @temp_definition = Definition.find(@meta.definition_id) 
 	  render :update do |page|
      #yield(page) if block_given?  
      t = Time.now   	    
      page.replace_html "#{@meta.id}_meta_div", :partial => 'definitions/meta', :locals => {:meta_location => t.to_f, :meta => @meta , :head_id => @temp_definition.id}
    end 
  end
  
  def render_metas
    @meta = Meta.find(params[:id])
    if @meta.definition_id.nil?
      if @meta.translation_id.nil?
        if @meta.spelling_id.nil?
          if @meta.etymology_id.nil?
            if @meta.literary_quotation_id.nil?
              if @meta.pronunciation_id.nil?
                if @meta.oral_quotation_id.nil?
                  if @meta.model_sentence_id.nil?
                    if @meta.full_synonym_id.nil?
                      if @meta.definition_definition_form_id.nil?
                      else
                        @temp_element = DefinitionDefinitionForm.find(@meta.definition_definition_form_id)
                        @temp_definition = Definition.find( @temp_element.def1_id)
                      end
                    else
                      debugger
                      @temp_element = FullSynonym.find(@meta.full_synonym_id)
                      @temp_definition = Definition.find(@temp_element.definitions.first.definition_id)
                    end
                  else
                    @temp_element = ModelSentence.find(@meta.model_sentence_id)
                    @temp_definition = Definition.find(@temp_element.definitions.first.definition_id)
                  end
                else
                  @temp_element = OralQuotation.find(@meta.oral_quotation_id)
                  @temp_definition = Definition.find(@temp_element.definitions.first.definition_id)
                end
              else
                @temp_element = Pronunciation.find(@meta.pronunciation_id)
                @temp_definition = Definition.find(@temp_element.def_id)
              end
            else
              @temp_element = LiteraryQuotation.find(@meta.literary_quotation_id)
              @temp_definition = Definition.find(@temp_element.definitions.first.definition_id)
            end
          else
            @temp_element = Etymology.find(@meta.etymology_id)
            @temp_definition = Definition.find(@temp_element.definition_id)
          end
        else
          @temp_element = Spelling.find(@meta.spelling_id)
          @temp_definition = Definition.find(@temp_element.definition_id)
        end
      else
        @temp_element = Translation.find(@meta.translation_id)
        @temp_definition = Definition.find(@temp_element.definition_id)
      end
    else
      @temp_element = Definition.find(@meta.definition_id)
      @temp_definition = Definition.find(@meta.definition_id)
    end
    
 	  render :update do |page|
      t = Time.now   	    
      page.replace_html "#{@temp_element.id}_#{@temp_element.class.name.downcase}_metas_div", :partial => 'metas/index', :locals => {:t => t.to_f, :element => @temp_element,  :meta => @meta , :head_id => @temp_definition.id}
    end 
  end
  

  def update_title
      @meta = Meta.find(params[:meta][:id])
      if @meta.created_by == nil or @meta.created_by == ""
             @meta.created_by = session[:user].login
             @meta.created_at = Time.now
      end
      if session[:user] != nil
             @meta.updated_by = session[:user].login
      end
      @meta.updated_at = Time.now
      if @meta.update_history == nil
        @meta.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @meta.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @meta.update_attributes(params[:meta])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @meta, :divsuffix => "_metatitlediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @meta
        end
      end
  end

  def title_show
      @meta = Meta.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @meta, :divsuffix => "_metatitlediv"}
  end

  def title_edit
      @meta = Meta.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @meta, :divsuffix => "_metatitlediv"}
  end
  
  def update_author
      @meta = Meta.find(params[:meta][:id])
      if @meta.created_by == nil or @meta.created_by == ""
             @meta.created_by = session[:user].login
             @meta.created_at = Time.now
      end
      if session[:user] != nil
             @meta.updated_by = session[:user].login
      end
      @meta.updated_at = Time.now
      if @meta.update_history == nil
        @meta.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @meta.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @meta.update_attributes(params[:meta])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @meta, :divsuffix => "_metaauthordiv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @meta
        end
      end
  end

  def author_show
      @meta = Meta.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @meta, :divsuffix => "_metaauthordiv"}
  end

  def author_edit
      @meta = Meta.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @meta, :divsuffix => "_metaauthordiv"}
  end  
    
  def update_metadata_note
      @meta = Meta.find(params[:meta][:id])
      if @meta.created_by == nil or @meta.created_by == ""
             @meta.created_by = session[:user].login
             @meta.created_at = Time.now
      end
      if session[:user] != nil
             @meta.updated_by = session[:user].login
      end
      @meta.updated_at = Time.now
      if @meta.update_history == nil
        @meta.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @meta.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @meta.update_attributes(params[:meta])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @meta, :divsuffix => "_anotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @meta
        end
      end
  end

  def metadata_note_show
      @meta = Meta.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @meta, :divsuffix => "_anotediv"}
  end

  def metadata_note_edit
      @meta = Meta.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @meta, :divsuffix => "_anotediv"}
  end  
end
