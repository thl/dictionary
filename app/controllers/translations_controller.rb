class TranslationsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :oral_quotations
  helper :model_sentences
  helper :metas
  helper :etymologies
  helper :literary_quotations


  Translation.content_columns.each do |column|
    in_place_edit_for :translation, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  OralQuotation.content_columns.each do |column|
    in_place_edit_for :oral_quotation, column.name
  end
  ModelSentence.content_columns.each do |column|
    in_place_edit_for :model_sentence, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end
  Etymology.content_columns.each do |column|
    in_place_edit_for :etymology, column.name
  end
  LiteraryQuotation.content_columns.each do |column|
    in_place_edit_for :literary_quotation, column.name
  end

  def set_language_type_id
    d = Translation.find(params[:id])
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

  def display_category_selector
    @data = Category.find(params['data_id'])
    @translation = Translation.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end

	def display_history
	  @history = params[:history]
	  render :partial => 'partial/display_history'
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
    @translation_pages, @translations = paginate :translation, :per_page => items_per_page, :order_by => sort_clause
    if @translation_pages.item_count != 0
      @pages = (@translation_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@translation_pages.current.first_item.to_f / @translation_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @translation = Translation.find(params[:id])
  end

  def new
    @translation = Translation.new
    @translation.created_by = session[:user].login
    @translation.created_at = Time.now
    @translation.save
    #redirect_to :action => 'edit_dynamic', :id => @translation.id, :params => {'new' => 'true'}
    redirect_to :action => 'edit_dynamic_translation', :id => @translation.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'translation_internal'
    else
    	@divname = 'translation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation = Translation.new(params[:translation])
    if @translation.save
      flash[:notice] = 'Translation was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'translation_internal'
    else
    	@divname = 'translation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation = Translation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    @language = []
    # Language.find(:all).each do |l|
    #   @language += [l.language]
    # end
    if(params['internal'] != nil)
      @divname = 'translation_internal'
    else
    	@divname = 'translation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation = Translation.find(params[:id])
    render :layout => false
  end

  def edit_dynamic
    @language = []
    Language.find(:all).each do |l|
      @language += [l.language]
    end
    if(params['internal'] != nil)
      @divname = 'translation_internal'
    else
    	@divname = 'translation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation = Translation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'translation_internal'
    else
    	@divname = 'translation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @translation = Translation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @translation = Translation.find(params[:id])
    # print '---------------'
    # print params['translation']
    # print "\n"
    if @translation.created_by == nil or @translation.created_by == ""
      @translation.created_by = session[:user].login
      @translation.created_at = Time.now
    end
    if session[:user] != nil
      @translation.updated_by = session[:user].login
    end
    @translation.updated_at = Time.now
    if @translation.update_history == nil
      @translation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@translation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @translation.update_attributes(params[:translation])
      flash[:notice] = 'Translation was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'oral_quotations'
          render :partial => "oral_quotations/edit_contents",:locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
        end
        if params['internal'] == 'model_sentences'
          render :partial => "model_sentences/edit_contents",:locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'etymologies'
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'literary_quotations'
          render :partial => "literary_quotations/edit_contents",:locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @translation
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'oral_quotations'
          render :partial => "oral_quotations/edit_contents",:locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
        end
        if params['internal'] == 'model_sentences'
          render :partial => "model_sentences/edit_contents",:locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'etymologies'
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'literary_quotations'
          render :partial => "literary_quotations/edit_contents",:locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @translation
      end
  end

  def destroy
    Translation.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    Translation.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     Translation.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'oral_quotations'
    #   render :partial => "oral_quotations/edit_contents", :locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
    # end
    # if params['internal'] == 'model_sentences'
    #   render :partial => "model_sentences/edit_contents", :locals => {'@model_sentence' => ModelSentence.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    # if params['internal'] == 'etymologies'
    #   render :partial => "etymologies/edit_contents", :locals => {'@etymology' => Etymology.find(params['pk'])}
    # end
    # if params['internal'] == 'literary_quotations'
    #   render :partial => "literary_quotations/edit_contents", :locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
    # end
    #  if params['internal'] == 'translations'
    #    render :partial => 'translations/edit_contents', :locals => {'@translation' => Translation.find(params['pk'])}
    #  end
    # else
    #   Translation.find(params['id']).destroy unless params['new'] == nil
    #   if session['previous_page'] != 'invalid' and session['previous_page'] != nil
    #     redirect_to session['previous_page']
    #   else
    #     redirect_to $home_page
    #   end
    # end
  end

  def edit_new
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "translation"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @translation = Translation.find(params['id'])
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @translation.definition = o
      @translation.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "translations", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "oral_quotation"
      o = OralQuotation.new
      o.save
      @translation.oral_quotation = o
      @translation.save
      render_component :controller => "oral_quotations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'oral_quotation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "model_sentence"
      o = ModelSentence.new
      o.save
      @translation.model_sentence = o
      @translation.save
      render_component :controller => "model_sentences", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'model_sentence', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.save
      @translation.meta = o
      @translation.save
      #render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to meta_metadata_edit_dynamic_meta_url(o.id), :something => "heiser"  #:params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "etymology"
      o = Etymology.new
      o.save
      @translation.etymology = o
      @translation.save
      render_component :controller => "etymologies", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'etymology', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "literary_quotation"
      o = LiteraryQuotation.new
      o.save
      @translation.literary_quotation = o
      @translation.save
      render_component :controller => "literary_quotations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'literary_quotation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @translation = Translation.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @translation = Translation.find(params['id'])
    if params["relatedtype"] == "definition"
      @translation.definition = nil if params['tags'] == nil 
      @translation.save
    end
    if params["relatedtype"] == "oral_quotation"
      @translation.oral_quotation = nil if params['tags'] == nil 
      @translation.save
    end
    if params["relatedtype"] == "model_sentence"
      @translation.model_sentence = nil if params['tags'] == nil 
      @translation.save
    end
    if params["relatedtype"] == "meta"
      @translation.meta = nil if params['tags'] == nil 
      @translation.save
    end
    if params["relatedtype"] == "etymology"
      @translation.etymology = nil if params['tags'] == nil 
      @translation.save
    end
    if params["relatedtype"] == "literary_quotation"
      @translation.literary_quotation = nil if params['tags'] == nil 
      @translation.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @translation = Translation.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @translation = Translation.find(params['translation']['id'])
    query = ""
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
         @definitions = Definition.find :all
       else
         @definitions = Definition.find :all, :conditions => query
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
         @etymologies = Etymology.find :all
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
         @literary_quotations = LiteraryQuotation.find :all
       else
         @literary_quotations = LiteraryQuotation.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @translation = Translation.find(params['id'])
    if params['tags'] != nil
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @translation.definition = Definition.find(params['tags'][0])
        @translation.save
      end
    end
    if params["relatedtype"] == "oral_quotation"
      if params['tags'] != nil
        @translation.oral_quotation = OralQuotation.find(params['tags'][0])
        @translation.save
      end
    end
    if params["relatedtype"] == "model_sentence"
      if params['tags'] != nil
        @translation.model_sentence = ModelSentence.find(params['tags'][0])
        @translation.save
      end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @translation.meta = Meta.find(params['tags'][0])
        @translation.save
      end
    end
    if params["relatedtype"] == "etymology"
      if params['tags'] != nil
        @translation.etymology = Etymology.find(params['tags'][0])
        @translation.save
      end
    end
    if params["relatedtype"] == "literary_quotation"
      if params['tags'] != nil
        @translation.literary_quotation = LiteraryQuotation.find(params['tags'][0])
        @translation.save
      end
    end
  end
      @definition = Definition.find(params['definition_id'])
      @head_id = @definition.id
      render :template => 'definitions/public_content_only', :layout => false
    # render_partial 'edit_contents'
  end

  def search
      @translation = Translation.new
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
        if params['translation'] != nil
          @array = []
          params['translation'].each do |key, val| 
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
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['oral_quotation'] != nil
        params['oral_quotation'] = flash['oral_quotation']
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
      if flash['literary_quotation'] != nil
        params['literary_quotation'] = flash['literary_quotation']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['etymology'] == nil or params['etymology'] == "") and (params['meta'] == nil or params['meta'] == "") and (params['oral_quotation'] == nil or params['oral_quotation'] == "") and (params['model_sentence'] == nil or params['model_sentence'] == "") and (params['definition'] == nil or params['definition'] == "") and (params['literary_quotation'] == nil or params['literary_quotation'] == "")
        @translation_pages, @translations = paginate :translations, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @translations = Translation.find :all, :order => sort_clause
        else
          @translations = Translation.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['etymology'] != nil and params['etymology'] != ""
      flash['etymology'] = params['etymology']
      for o in @translations
        if o.etymology != nil
          if string_contains o.etymology.displayInfo, params['etymology']
            array = array + [o]
          end
        end
      end
      @translations = array
    end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @translations
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @translations = array
    end
    array = []
    if params['oral_quotation'] != nil and params['oral_quotation'] != ""
      flash['oral_quotation'] = params['oral_quotation']
      for o in @translations
        if o.oral_quotation != nil
          if string_contains o.oral_quotation.displayInfo, params['oral_quotation']
            array = array + [o]
          end
        end
      end
      @translations = array
    end
    array = []
    if params['model_sentence'] != nil and params['model_sentence'] != ""
      flash['model_sentence'] = params['model_sentence']
      for o in @translations
        if o.model_sentence != nil
          if string_contains o.model_sentence.displayInfo, params['model_sentence']
            array = array + [o]
          end
        end
      end
      @translations = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @translations
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @translations = array
    end
    array = []
    if params['literary_quotation'] != nil and params['literary_quotation'] != ""
      flash['literary_quotation'] = params['literary_quotation']
      for o in @translations
        if o.literary_quotation != nil
          if string_contains o.literary_quotation.displayInfo, params['literary_quotation']
            array = array + [o]
          end
        end
      end
      @translations = array
    end
      if flash['etymology'] != nil
        params['etymology'] = flash['etymology']
        flash['relatedsearch'] = 'yes'
      end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['oral_quotation'] != nil
        params['oral_quotation'] = flash['oral_quotation']
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
           @translation_pages = Paginator.new self, @translations.length(), items_per_page, params['page']
           if @translation_pages.item_count != 0
             @pages = (@translation_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@translation_pages.current.first_item.to_f / @translation_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @translations = @translations[@offset,items_per_page] if @translations[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
  
  def edit_dynamic_translation
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    if(params['internal'] != nil)
      @divname = 'translation_internal'
    else
    	@divname = 'translation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation = Translation.find(params[:id])
    #@definition = Definition.find(51)
    #render :layout => 'staging_popup'
    render :layout => false
  end
  
  def update_dynamic_translation
      @translation = Translation.find(params[:id])
      #if params[:translation][:language_type_id].blank?
      #  params[:translation].delete :language_type_id
      #else
      #  mca_cats = params[:translation][:language_type_id].split(',') 
      #  mca_cats.each do |c|
      #    unless c.blank?
      #      params[:translation][:language_type_id] = c
      #    end
      #  end
      #end
      if @translation.created_by == nil or @translation.created_by == ""
        @translation.created_by = session[:user].login
        @translation.created_at = Time.now
      end
      if session[:user] != nil
        @translation.updated_by = session[:user].login
      end
      @translation.updated_at = Time.now
      if @translation.update_history == nil
        @translation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@translation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      if @translation.update_attributes(params[:translation])
        #render :nothing => true
        render_translations  
      else
      end
    end  
  
  def render_translations
    @translation = Translation.find(params[:id])
    if @translation.definition_id.nil?
      if @translation.etymology_id.nil?
        if @translation.literary_quotation_id.nil?
          if @translation.oral_quotation_id.nil?
            if @translation.model_sentence_id.nil?
            else
              @parent_element = ModelSentence.find(@translation.model_sentence_id) 
              @temp_definition = Definition.find(@parent_element.definitions.first.definition_id)
            end
          else
            @parent_element = OralQuotation.find(@translation.oral_quotation_id) 
            @temp_definition = Definition.find(@parent_element.definitions.first.definition_id)
          end
        else
          @parent_element = LiteraryQuotation.find(@translation.literary_quotation_id) 
          @temp_definition = Definition.find(@parent_element.definitions.first.definition_id)
        end
      else
        @parent_element = Etymology.find(@translation.etymology_id) 
        @temp_definition = Definition.find(@parent_element.definition_id)
      end
    else
      @parent_element = Definition.find(@translation.definition_id) 
      @temp_definition = Definition.find(@translation.definition_id) 
    end
 	  render :update do |page|
      #page.replace_html "#{@translation.definition_id}_translations_div", :partial => 'translations/index', :locals => {:d => @temp_definition, :parent_id => @temp_definition, :head_id => @temp_definition}
      page.replace_html "#{@parent_element.id}_#{@parent_element.class.name.downcase}_translations_div", :partial => 'translations/generic_index', :locals => {:o => @parent_element ,:d => @temp_definition, :parent_id => @temp_definition, :head_id => @temp_definition}
    end 
  end
  
  def update_translation
      @translation = Translation.find(params[:translation][:id])
      if @translation.created_by == nil or @translation.created_by == ""
             @translation.created_by = session[:user].login
             @translation.created_at = Time.now
      end
      if session[:user] != nil
             @translation.updated_by = session[:user].login
      end
      @translation.updated_at = Time.now
      if @translation.update_history == nil
        @translation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation.update_attributes(params[:translation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation, :divsuffix => "_translationdiv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation
        end
      end
  end

  def translation_show
      @translation = Translation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation, :divsuffix => "_translationdiv"}
  end

  def translation_edit
      @translation = Translation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation, :divsuffix => "_translationdiv"}
  end

  def update_popuptranslation
      @translation = Translation.find(params[:translation][:id])
      if @translation.created_by == nil or @translation.created_by == ""
             @translation.created_by = session[:user].login
             @translation.created_at = Time.now
      end
      if session[:user] != nil
             @translation.updated_by = session[:user].login
      end
      @translation.updated_at = Time.now
      if @translation.update_history == nil
        @translation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation.update_attributes(params[:translation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation, :divsuffix => "_translationpopupdiv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation
        end
      end
  end

  def translation_popupshow
      @translation = Translation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation, :divsuffix => "_translationpopupdiv"}
  end

  def translation_popupedit
      @translation = Translation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation, :divsuffix => "_translationpopupdiv"}
  end

  def update_analytical_note
      @translation = Translation.find(params[:translation][:id])
      if @translation.created_by == nil or @translation.created_by == ""
             @translation.created_by = session[:user].login
             @translation.created_at = Time.now
      end
      if session[:user] != nil
             @translation.updated_by = session[:user].login
      end
      @translation.updated_at = Time.now
      if @translation.update_history == nil
        @translation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation.update_attributes(params[:translation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation, :divsuffix => "_anotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation
        end
      end
  end

  def analytical_note_show
      @translation = Translation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation, :divsuffix => "_anotediv"}
  end

  def analytical_note_edit
      @translation = Translation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation, :divsuffix => "_anotediv"}
  end
  
  def language_update
      @translation = Translation.find(params[:translation][:id])
      if @translation.created_by == nil or @translation.created_by == ""
             @translation.created_by = session[:user].login
             @translation.created_at = Time.now
      end
      if session[:user] != nil
             @translation.updated_by = session[:user].login
      end
      @translation.updated_at = Time.now
      if @translation.update_history == nil
        @translation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation.update_attributes(params[:translation])
          format.html do
            render :partial => "shared/category_selector_show", :locals => {:object => @translation, :field_name => :language_type, :divsuffix => "_translation_language_div"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation
        end
      end
  end
  
  def language_show
      @translation = Translation.find(params[:id])
      render :partial => "shared/category_selector_show", :locals => {:object => @translation, :field_name => :language_type, :divsuffix => "_translation_language_div"}
  end
  
  def language_edit
      @translation = Translation.find(params[:id])
      render :partial => "shared/category_selector_edit", :locals => {:object => @translation, :model_name => :translation, :field_name => :language_type, :data_id => 184, :divsuffix => "_translation_language_div"}
  end
end
