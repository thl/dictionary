class LiteraryQuotationsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas
  helper :translations

  in_place_edit_for :literary_quotation, :line_id

  in_place_edit_for :literary_quotation, :source_id

  LiteraryQuotation.content_columns.each do |column|
    in_place_edit_for :literary_quotation, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end
  Translation.content_columns.each do |column|
    in_place_edit_for :translation, column.name
  end

  def display_category_selector
    @data = Category.find(params['data_id'])
    @literary_quotation = LiteraryQuotation.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end

	def set_script_type_id
    d = LiteraryQuotation.find(params[:id])
    if d != nil and params[:value] != nil
      d.script_type_id = params[:value].to_i
      d.script = nil
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'script_type', :title => d.script_type.title, :id => d.id, :data_id => 192, :update_id => params[:update_id]})  
  end

  def set_literary_genre_type_id
    d = LiteraryQuotation.find(params[:id])
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_genre_type', :title => d.literary_genre_type.title, :id => d.id, :data_id => 119})  
  end

  def set_literary_period_type_id
    d = LiteraryQuotation.find(params[:id])
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_period_type', :title => d.literary_period_type.title, :id => d.id, :data_id => 187})  
  end

  def set_literary_form_type_id
    d = LiteraryQuotation.find(params[:id])
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

    def set_literary_genre
      puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
      puts params['def_id']
      @definition = LiteraryQuotation.find(params['id'])
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
    @literary_quotation_pages, @literary_quotations = paginate :literary_quotation, :per_page => items_per_page, :order_by => sort_clause
    if @literary_quotation_pages.item_count != 0
      @pages = (@literary_quotation_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@literary_quotation_pages.current.first_item.to_f / @literary_quotation_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @literary_quotation = LiteraryQuotation.find(params[:id])
  end

  def new
    @literary_quotation = LiteraryQuotation.new
    @literary_quotation.created_by = session[:user].login
    @literary_quotation.created_at = Time.now
    @literary_quotation.save
    redirect_to :action => 'edit_dynamic', :id => @literary_quotation.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'literary_quotation_internal'
    else
    	@divname = 'literary_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_quotation = LiteraryQuotation.new(params[:literary_quotation])
    if @literary_quotation.save
      flash[:notice] = 'LiteraryQuotation was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'literary_quotation_internal'
    else
    	@divname = 'literary_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_quotation = LiteraryQuotation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    # @language = []
    # Language.find(:all, :order => 'language asc').each do |l|
    #   @language += [l.language]
    # end
    # @script = []
    # Script.find(:all).each do |l|
    #   @script += [l.script]
    # end
    # @literary_period = []
    # LiteraryPeriod.find(:all).each do |l|
    #   @literary_period += [l.literary_period]
    # end
    # @literary_form = []
    # LiteraryForm.find(:all).each do |l|
    #   @literary_form += [l.literary_form]
    # end
    # @literary_genre = []
    # LiteraryGenre.find(:all).each do |l|
    #   @literary_genre += [l.literary_genre]
    # end
    # @script = []
    # Script.find(:all).each do |s|
    #   @script += [s.script]
    # end
    
    if(params['internal'] != nil)
      @divname = 'literary_quotation_internal'
    else
    	@divname = 'literary_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_quotation = LiteraryQuotation.find(params[:id])
    #breakpoint
    render :layout => false 
  end

  def edit_dynamic
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    @script = []
    Script.find(:all).each do |l|
      @script += [l.script]
    end
    @literary_period = []
    LiteraryPeriod.find(:all).each do |l|
      @literary_period += [l.literary_period]
    end
    @literary_form = []
    LiteraryForm.find(:all).each do |l|
      @literary_form += [l.literary_form]
    end
    @literary_genre = []
    LiteraryGenre.find(:all).each do |l|
      @literary_genre += [l.literary_genre]
    end
    @script = []
    Script.find(:all).each do |s|
      @script += [s.script]
    end
    
    if(params['internal'] != nil)
      @divname = 'literary_quotation_internal'
    else
    	@divname = 'literary_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_quotation = LiteraryQuotation.find(params[:id])
    #breakpoint
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'literary_quotation_internal'
    else
    	@divname = 'literary_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @literary_quotation = LiteraryQuotation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @literary_quotation = LiteraryQuotation.find(params[:id])
    if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
      @literary_quotation.created_by = session[:user].login
      @literary_quotation.created_at = Time.now
    end
    if session[:user] != nil
      @literary_quotation.updated_by = session[:user].login
    end
    @literary_quotation.updated_at = Time.now
    if @literary_quotation.update_history == nil
      @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @literary_quotation.update_attributes(params[:literary_quotation])
      flash[:notice] = 'LiteraryQuotation was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @literary_quotation
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
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @literary_quotation
      end
  end

  def destroy
    LiteraryQuotation.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    LiteraryQuotation.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     LiteraryQuotation.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    # if params['internal'] == 'translations'
    #   render :partial => "translations/edit_contents", :locals => {'@translation' => Translation.find(params['pk'])}
    # end
    #  if params['internal'] == 'literary_quotations'
    #    render :partial => 'literary_quotations/edit_contents', :locals => {'@literary_quotation' => LiteraryQuotation.find(params['pk'])}
    #  end
    # else
    #   LiteraryQuotation.find(params['id']).destroy unless params['new'] == nil
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
      internal = "literary_quotation"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @literary_quotation = LiteraryQuotation.find(params['id'])
    @literary_quotation.updated_by = session[:user].login
    @literary_quotation.updated_at = Time.now
    if @literary_quotation.update_history == nil
      @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @literary_quotation.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @literary_quotation.definitions << o
      # @literary_quotation.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "literary_quotations", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @literary_quotation.meta = o
      @literary_quotation.save
      #render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to meta_metadata_edit_dynamic_meta_url(o.id)
    end
    if params["relatedtype"] == "translation"
      o = Translation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.save
      @literary_quotation.translations << o
      #render_component :controller => "translations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'translation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to translation_edit_dynamic_translation_url(o.id)
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @literary_quotation = LiteraryQuotation.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @literary_quotation = LiteraryQuotation.find(params['id'])
    if params["relatedtype"] == "definition"
      if @literary_quotation.definitions != nil 
        if params['tags'] != nil 
          @literary_quotation.definitions.delete(@literary_quotation.definitions - Definition.find(params['tags']))
        else
          @literary_quotation.definitions.delete(@literary_quotation.definitions)
    	  end
    	end
      # @literary_quotation.definition = nil if params['tags'] == nil 
      # @literary_quotation.save
    end
    if params["relatedtype"] == "meta"
      @literary_quotation.meta = nil if params['tags'] == nil 
      @literary_quotation.save
    end
    if params["relatedtype"] == "translation"
      if @literary_quotation.translations != nil 
        if params['tags'] != nil 
          @literary_quotation.translations.delete(@literary_quotation.translations - Translation.find(params['tags']))
        else
          @literary_quotation.translations.delete(@literary_quotation.translations)
    	  end
    	end
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @literary_quotation = LiteraryQuotation.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @literary_quotation = LiteraryQuotation.find(params['literary_quotation']['id'])
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
    render :layout => false
  end

  def edit_add_to_list_action
    #breakpoint
    @literary_quotation = LiteraryQuotation.find(params['id'])
    if params['tags'] != nil
    if params["relatedtype"] == "definition"
      if @literary_quotation.definitions == nil 
        @literary_quotation.definitions = Definition.find(params['tags'])
      else
        @literary_quotation.definitions.delete(@literary_quotation.definitions - Definition.find(params['tags']))
        @literary_quotation.definitions << Definition.find(params['tags']) - @literary_quotation.definitions 
    	end
      # if params['tags'] != nil
      #   @literary_quotation.definition = Definition.find(params['tags'][0])
      #   status = @literary_quotation.save
      #   #breakpoint
      # end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @literary_quotation.meta = Meta.find(params['tags'][0])
        @literary_quotation.save
      end
    end
    if params["relatedtype"] == "translation"
      if @literary_quotation.translations == nil 
        @literary_quotation.translations = Translation.find(params['tags'])
      else
        @literary_quotation.translations.delete(@literary_quotation.translations - Translation.find(params['tags']))
        @literary_quotation.translations << Translation.find(params['tags']) - @literary_quotation.translations 
    	end
    end
  end
      @definition = Definition.find(params['definition_id'])
      @head_id = @definition.id
      render :template => 'definitions/public_content_only', :layout => false
    #breakpoint
    # render_partial 'edit_contents'
  end

  def search
      @literary_quotation = LiteraryQuotation.new
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
        if params['literary_quotation'] != nil
          @array = []
          params['literary_quotation'].each do |key, val| 
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
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translations'] != nil
        params['translations'] = flash['translations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definitions'] != nil
        params['definitions'] = flash['definitions']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['meta'] == nil or params['meta'] == "") and (params['translations'] == nil or params['translations'] == "") and (params['definition'] == nil or params['definition'] == "")
        @literary_quotation_pages, @literary_quotations = paginate :literary_quotations, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @literary_quotations = LiteraryQuotation.find :all, :order => sort_clause
        else
          @literary_quotations = LiteraryQuotation.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @literary_quotations
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @literary_quotations = array
    end
    array = []
    if params['translations'] != nil and params['translations'] != ""
      flash['translations'] = params['translations']
      for o in @literary_quotations
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
      @literary_quotations = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @literary_quotations
        found = 0
        for obj in o.definitions
          if string_contains obj.displayInfo, params['definitions']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
        # if o.definition != nil
        #   if string_contains o.definition.displayInfo, params['definition']
        #     array = array + [o]
        #   end
        # end
      end
      @literary_quotations = array
    end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translations'] != nil
        params['translations'] = flash['translations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definitions'] != nil
        params['definitions'] = flash['definitions']
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
           @literary_quotation_pages = Paginator.new self, @literary_quotations.length(), items_per_page, params['page']
           if @literary_quotation_pages.item_count != 0
             @pages = (@literary_quotation_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@literary_quotation_pages.current.first_item.to_f / @literary_quotation_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @literary_quotations = @literary_quotations[@offset,items_per_page] if @literary_quotations[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
 
  def edit_dynamic_literary_quotation
    if(params['internal'] != nil)
      @divname = 'literary_quotation_internal'
    else
    	@divname = 'literary_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_quotation = LiteraryQuotation.find(params[:id])
    render :layout => 'staging_popup' 
  end
 
  def update_dynamic_literary_quotation
      @literary_quotation = LiteraryQuotation.find(params[:id])
      if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
        @literary_quotation.created_by = session[:user].login
        @literary_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @literary_quotation.updated_by = session[:user].login
      end
      @literary_quotation.updated_at = Time.now
      if @literary_quotation.update_history == nil
        @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      if @literary_quotation.update_attributes(params[:literary_quotation])
         render :nothing => true
      else

      end
    end

 
  def update_passage
      @literary_quotation = LiteraryQuotation.find(params[:literary_quotation][:id])
      if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
             @literary_quotation.created_by = session[:user].login
             @literary_quotation.created_at = Time.now
      end
      if session[:user] != nil
             @literary_quotation.updated_by = session[:user].login
      end
      @literary_quotation.updated_at = Time.now
      if @literary_quotation.update_history == nil
        @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @literary_quotation.update_attributes(params[:literary_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @literary_quotation, :divsuffix => "_passagediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @literary_quotation
        end
      end
  end

  def passage_show
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @literary_quotation, :divsuffix => "_passagediv"}
  end

  def passage_edit
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @literary_quotation, :divsuffix => "_passagediv"}
  end
  
  
  def update_analytical_note
      @literary_quotation = LiteraryQuotation.find(params[:literary_quotation][:id])
      if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
             @literary_quotation.created_by = session[:user].login
             @literary_quotation.created_at = Time.now
      end
      if session[:user] != nil
             @literary_quotation.updated_by = session[:user].login
      end
      @literary_quotation.updated_at = Time.now
      if @literary_quotation.update_history == nil
        @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @literary_quotation.update_attributes(params[:literary_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @literary_quotation, :divsuffix => "_anotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @literary_quotation
        end
      end
  end

  def analytical_note_show
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @literary_quotation, :divsuffix => "_anotediv"}
  end

  def analytical_note_edit
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @literary_quotation, :divsuffix => "_anotediv"}
  end

  def update_image_description
      @literary_quotation = LiteraryQuotation.find(params[:literary_quotation][:id])
      if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
        @literary_quotation.created_by = session[:user].login
        @literary_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @literary_quotation.updated_by = session[:user].login
      end
      @literary_quotation.updated_at = Time.now
      if @literary_quotation.update_history == nil
        @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @literary_quotation.update_attributes(params[:literary_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @literary_quotation, :divsuffix => "_imagedescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @literary_quotation
        end
      end
  end

    def image_description_show
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @literary_quotation, :divsuffix => "_imagedescdiv"}
    end

    def image_description_edit
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @literary_quotation, :divsuffix => "_imagedescdiv"}
    end 

    def update_audio_description
      @literary_quotation = LiteraryQuotation.find(params[:literary_quotation][:id])
      if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
        @literary_quotation.created_by = session[:user].login
        @literary_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @literary_quotation.updated_by = session[:user].login
      end
      @literary_quotation.updated_at = Time.now
      if @literary_quotation.update_history == nil
        @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @literary_quotation.update_attributes(params[:literary_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @literary_quotation, :divsuffix => "_audiodescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @literary_quotation
        end
      end
    end

    def audio_description_show
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @literary_quotation, :divsuffix => "_audiodescdiv"}
    end

    def audio_description_edit
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @literary_quotation, :divsuffix => "_audiodescdiv"}
    end 

    def update_video_description
      @literary_quotation = LiteraryQuotation.find(params[:literary_quotation][:id])
      if @literary_quotation.created_by == nil or @literary_quotation.created_by == ""
        @literary_quotation.created_by = session[:user].login
        @literary_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @literary_quotation.updated_by = session[:user].login
      end
      @literary_quotation.updated_at = Time.now
      if @literary_quotation.update_history == nil
        @literary_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @literary_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @literary_quotation.update_attributes(params[:literary_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @literary_quotation, :divsuffix => "_videodescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @literary_quotation
        end
      end
    end

    def video_description_show
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @literary_quotation, :divsuffix => "_videodescdiv"}
    end

    def video_description_edit
      @literary_quotation = LiteraryQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @literary_quotation, :divsuffix => "_videodescdiv"}
    end  
  
end
