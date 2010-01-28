class FullSynonymsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas


  FullSynonym.content_columns.each do |column|
    in_place_edit_for :full_synonym, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
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
    @full_synonym_pages, @full_synonyms = paginate :full_synonym, :per_page => items_per_page, :order_by => sort_clause
    if @full_synonym_pages.item_count != 0
      @pages = (@full_synonym_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@full_synonym_pages.current.first_item.to_f / @full_synonym_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @full_synonym = FullSynonym.find(params[:id])
  end

  def new
    @full_synonym = FullSynonym.new
    @full_synonym.created_by = session[:user].login
    @full_synonym.created_at = Time.now
    @full_synonym.save
    redirect_to :action => 'edit_dynamic', :id => @full_synonym.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'full_synonym_internal'
    else
    	@divname = 'full_synonym'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @full_synonym = FullSynonym.new(params[:full_synonym])
    if @full_synonym.save
      flash[:notice] = 'FullSynonym was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'full_synonym_internal'
    else
    	@divname = 'full_synonym'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @full_synonym = FullSynonym.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    if(params['internal'] != nil)
      @divname = 'full_synonym_internal'
    else
    	@divname = 'full_synonym'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @full_synonym = FullSynonym.find(params[:id])
    render :layout => false
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'full_synonym_internal'
    else
    	@divname = 'full_synonym'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @full_synonym = FullSynonym.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'full_synonym_internal'
    else
    	@divname = 'full_synonym'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @full_synonym = FullSynonym.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @full_synonym = FullSynonym.find(params[:id])
    if @full_synonym.created_by == nil or @full_synonym.created_by == ""
      @full_synonym.created_by = session[:user].login
    @full_synonym.created_at = Time.now
    end
    if session[:user] != nil
      @full_synonym.updated_by = session[:user].login
    end
    @full_synonym.updated_at = Time.now
    if @full_synonym.update_history == nil
      @full_synonym.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@full_synonym.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @full_synonym.update_attributes(params[:full_synonym])
      flash[:notice] = 'FullSynonym was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @full_synonym
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
      else
        redirect_to :action => 'show', :id => @full_synonym
      end
  end

  def destroy
    FullSynonym.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    FullSynonym.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     FullSynonym.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    #  if params['internal'] == 'full_synonyms'
    #    render :partial => 'full_synonyms/edit_contents', :locals => {'@full_synonym' => FullSynonym.find(params['pk'])}
    #  end
    # else
    #   FullSynonym.find(params['id']).destroy unless params['new'] == nil
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
      internal = "full_synonym"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @full_synonym = FullSynonym.find(params['id'])
    @full_synonym.updated_by = session[:user].login
    @full_synonym.updated_at = Time.now
    if @full_synonym.update_history == nil
      @full_synonym.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@full_synonym.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @full_synonym.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @full_synonym.definitions << o
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "full_synonyms", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @full_synonym.meta = o
      @full_synonym.save
      render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @full_synonym = FullSynonym.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @full_synonym = FullSynonym.find(params['id'])
    if params["relatedtype"] == "definition"
      if @full_synonym.definitions != nil 
        if params['tags'] != nil 
          @full_synonym.definitions.delete(@full_synonym.definitions - Definition.find(params['tags']))
        else
          @full_synonym.definitions.delete(@full_synonym.definitions)
    	  end
    	end
    end
    if params["relatedtype"] == "meta"
      @full_synonym.meta = nil if params['tags'] == nil 
      @full_synonym.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @full_synonym = FullSynonym.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @full_synonym = FullSynonym.find(params['full_synonym']['id'])
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
         @definitions = Definition.find_all
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
         @metas = Meta.find_all
       else
         @metas = Meta.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @full_synonym = FullSynonym.find(params['id'])
    if params["relatedtype"] == "definition"
      if @full_synonym.definitions == nil 
        if params['tags'] != nil 
          @full_synonym.definitions = Definition.find(params['tags'])
        end
      else
        if params['tags'] != nil 
          @full_synonym.definitions.delete(@full_synonym.definitions - Definition.find(params['tags']))
          @full_synonym.definitions << Definition.find(params['tags']) - @full_synonym.definitions 
        end
    	end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @full_synonym.meta = Meta.find(params['tags'][0])
        @full_synonym.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @full_synonym = FullSynonym.new
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
        if params['full_synonym'] != nil
          @array = []
          params['full_synonym'].each do |key, val| 
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
      if flash['definitions'] != nil
        params['definitions'] = flash['definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['definitions'] == nil or params['definitions'] == "") and (params['meta'] == nil or params['meta'] == "")
        @full_synonym_pages, @full_synonyms = paginate :full_synonyms, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @full_synonyms = FullSynonym.find :all, :order => sort_clause
        else
          @full_synonyms = FullSynonym.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['definitions'] != nil and params['definitions'] != ""
      flash['definitions'] = params['definitions']
      for o in @full_synonyms
        found = 0
        for obj in o.definitions
          if string_contains obj.displayInfo, params['definitions']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @full_synonyms = array
    end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @full_synonyms
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @full_synonyms = array
    end
      if flash['definitions'] != nil
        params['definitions'] = flash['definitions']
        flash['relatedsearch'] = 'yes'
      end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
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
           @full_synonym_pages = Paginator.new self, @full_synonyms.length(), items_per_page, params['page']
           if @full_synonym_pages.item_count != 0
             @pages = (@full_synonym_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@full_synonym_pages.current.first_item.to_f / @full_synonym_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @full_synonyms = @full_synonyms[@offset,items_per_page] if @full_synonyms[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
