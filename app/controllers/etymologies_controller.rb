class EtymologiesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas
  helper :translations


  Etymology.content_columns.each do |column|
    in_place_edit_for :etymology, column.name
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

	def display_history
	  @history = params[:history]
	  render :partial => 'partial/display_history'
	end
	
  def display_category_selector
    @data = Category.find(params['data_id'])
    @etymology = Etymology.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end

	def set_loan_language_type_id
    d = Etymology.find(params[:id])
    if d != nil and params[:value] != nil
      d.loan_language_type_id = params[:value].to_i
      d.loan_language = nil
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'loan_language_type', :title => d.loan_language_type.title, :id => d.id, :data_id => 184, :update_id => params[:update_id]})  
  end
  
  def set_major_dialect_family_type_id
    d = Etymology.find(params[:id])
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

  def set_derivation_type_id
    d = Etymology.find(params[:id])
    if d != nil and params[:value] != nil
      d.derivation_type_id = params[:value].to_i
      d.derivation = nil
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'derivation_type', :title => d.derivation_type.title, :id => d.id, :data_id => 180, :update_id => params[:update_id]})  
  end

  def set_etymology_category_id
    d = Etymology.find(params[:id])
    if d != nil and params[:value] != nil
      d.etymology_category_id = params[:value].to_i
      d.etymology_type = nil
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'etymology_category', :title => d.etymology_category.title, :id => d.id, :data_id => 182, :update_id => params[:update_id]})  
  end

  def set_literary_genre_type_id
    d = Etymology.find(params[:id])
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
    d = Etymology.find(params[:id])
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
    d = Etymology.find(params[:id])
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
      @definition = Etymology.find(params['id'])
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
  def set_major_dialect_family
    d = Etymology.find(params[:id])
    d.update_attribute('major_dialect_family',params['value'])
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
    @etymology_pages, @etymologies = paginate :etymology, :per_page => items_per_page, :order_by => sort_clause
    if @etymology_pages.item_count != 0
      @pages = (@etymology_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@etymology_pages.current.first_item.to_f / @etymology_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @etymology = Etymology.find(params[:id])
  end

  def new
    @etymology = Etymology.new
    @etymology.created_by = session[:user].login
    @etymology.created_at = Time.now
    @etymology.save
    redirect_to :action => 'edit_dynamic', :id => @etymology.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'etymology_internal'
    else
    	@divname = 'etymology'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @etymology = Etymology.new(params[:etymology])
    if @etymology.save
      flash[:notice] = 'Etymology was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'etymology_internal'
    else
    	@divname = 'etymology'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @etymology = Etymology.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    # @etymology_type = []
    # EtymologyType.find(:all).each do |l|
    #   @etymology_type += [l.etymology_type]
    # end
    # @derivation = []
    # Derivation.find(:all).each do |l|
    #   @derivation += [l.derivation]
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
    # @loan_language = []
    # Language.find(:all).each do |l|
    #   @loan_language += [l.language]
    # end
    if(params['internal'] != nil)
      @divname = 'etymology_internal'
    else
    	@divname = 'etymology'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @etymology = Etymology.find(params[:id])
    render :layout => false 
  end

  def edit_dynamic
    @etymology_type = []
    EtymologyType.find(:all).each do |l|
      @etymology_type += [l.etymology_type]
    end
    @derivation = []
    Derivation.find(:all).each do |l|
      @derivation += [l.derivation]
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
    @loan_language = []
    Language.find(:all).each do |l|
      @loan_language += [l.language]
    end
    if(params['internal'] != nil)
      @divname = 'etymology_internal'
    else
    	@divname = 'etymology'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @etymology = Etymology.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'etymology_internal'
    else
    	@divname = 'etymology'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @etymology = Etymology.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @etymology = Etymology.find(params[:id])
    if @etymology.created_by == nil or @etymology.created_by == ""
      @etymology.created_by = session[:user].login
      @etymology.created_at = Time.now
    end
    if session[:user] != nil
      @etymology.updated_by = session[:user].login
    end
    @etymology.updated_at = Time.now
    if @etymology.update_history == nil
      @etymology.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@etymology.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @etymology.update_attributes(params[:etymology])
      flash[:notice] = 'Etymology was succesfully created.'
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
        redirect_to :action => 'show', :id => @etymology
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
        redirect_to :action => 'show', :id => @etymology
      end
  end

  def destroy
    Etymology.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    Etymology.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     Etymology.find(params['id']).destroy unless params['id'] == nil
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
    #  if params['internal'] == 'etymologies'
    #    render :partial => 'etymologies/edit_contents', :locals => {'@etymology' => Etymology.find(params['pk'])}
    #  end
    # else
    #   Etymology.find(params['id']).destroy unless params['new'] == nil
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
      internal = "etymology"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @etymology = Etymology.find(params['id'])
    @etymology.updated_by = session[:user].login
    @etymology.updated_at = Time.now
    if @etymology.update_history == nil
      @etymology.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@etymology.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @etymology.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @etymology.definition = o
      @etymology.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "etymologies", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @etymology.meta = o
      @etymology.save
      render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "translation"
      o = Translation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @etymology.translations << o
      render_component :controller => "translations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'translation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @etymology = Etymology.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @etymology = Etymology.find(params['id'])
    if params["relatedtype"] == "definition"
      @etymology.definition = nil if params['tags'] == nil 
      @etymology.save
    end
    if params["relatedtype"] == "meta"
      @etymology.meta = nil if params['tags'] == nil 
      @etymology.save
    end
    if params["relatedtype"] == "translation"
      if @etymology.translations != nil 
        if params['tags'] != nil 
          @etymology.translations.delete(@etymology.translations - Translation.find(params['tags']))
        else
          @etymology.translations.delete(@etymology.translations)
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
      @etymology = Etymology.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @etymology = Etymology.find(params['etymology']['id'])
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
    @etymology = Etymology.find(params['id'])
    if params['tags'] != nil
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @etymology.definition = Definition.find(params['tags'][0])
        @etymology.save
      end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @etymology.meta = Meta.find(params['tags'][0])
        @etymology.save
      end
    end
    if params["relatedtype"] == "translation"
      if @etymology.translations == nil 
        @etymology.translations = Translation.find(params['tags'])
      else
        @etymology.translations.delete(@etymology.translations - Translation.find(params['tags']))
        @etymology.translations << Translation.find(params['tags']) - @etymology.translations 
    	end
    end
  end
#    render_partial 'edit_contents'
      @definition = Definition.find(params['definition_id'])
      @head_id = @definition.id
      render :template => 'definitions/public_content_only', :layout => false
  end

  def search
      @etymology = Etymology.new
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
        if params['etymology'] != nil
          @array = []
          params['etymology'].each do |key, val| 
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
      if flash['definition'] != nil
        params['definition'] = flash['definition']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['meta'] == nil or params['meta'] == "") and (params['translations'] == nil or params['translations'] == "") and (params['definition'] == nil or params['definition'] == "")
        @etymology_pages, @etymologies = paginate :etymologies, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @etymologies = Etymology.find :all, :order => sort_clause
        else
          @etymologies = Etymology.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @etymologies
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @etymologies = array
    end
    array = []
    if params['translations'] != nil and params['translations'] != ""
      flash['translations'] = params['translations']
      for o in @etymologies
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
      @etymologies = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @etymologies
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @etymologies = array
    end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translations'] != nil
        params['translations'] = flash['translations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition'] != nil
        params['definition'] = flash['definition']
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
           @etymology_pages = Paginator.new self, @etymologies.length(), items_per_page, params['page']
           if @etymology_pages.item_count != 0
             @pages = (@etymology_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@etymology_pages.current.first_item.to_f / @etymology_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @etymologies = @etymologies[@offset,items_per_page] if @etymologies[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end

  def update_analytical_note
    @etymology = Etymology.find(params[:etymology][:id])
    if @etymology.created_by == nil or @etymology.created_by == ""
           @etymology.created_by = session[:user].login
           @etymology.created_at = Time.now
    end
    if session[:user] != nil
           @etymology.updated_by = session[:user].login
    end
    @etymology.updated_at = Time.now
    if @etymology.update_history == nil
      @etymology.update_history = session[:user].login + " ["+Time.now.to_s+"]
     "
    else
      @etymology.update_history += session[:user].login + " ["+Time.now.to_s+"]
     "
    end
    respond_to do |format|
      if @etymology.update_attributes(params[:etymology])
        format.html do
          render :partial => 'etymologies/analytical_note_show', :locals => {:e => @etymology}
        end
      else
         #redirect_to :action => 'index_edit'
         #redirect_to :action => 'public_edit', :id => @definition
      end
    end
  end
  
  def analytical_note_show
    @etymology = Etymology.find(params[:id])
    render :partial => "analytical_note_show", :locals => {:e => @etymology}
  end
  
  def analytical_note_edit
    @etymology = Etymology.find(params[:id])
    render :partial => "analytical_note_edit", :locals => {:e => @etymology}
  end
  
end
