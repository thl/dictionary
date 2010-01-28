class DefinitionDefinitionsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions


  DefinitionDefinition.content_columns.each do |column|
    in_place_update_form :definition_definition, column.name
  end
  Definition.content_columns.each do |column|
    in_place_update_form :definition, column.name
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
    @definition_definition_pages, @definition_definitions = paginate :definition_definition, :per_page => items_per_page, :order_by => sort_clause
    if @definition_definition_pages.item_count != 0
      @pages = (@definition_definition_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@definition_definition_pages.current.first_item.to_f / @definition_definition_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @definition_definition = DefinitionDefinition.find(params[:id])
  end

  def new
    @definition_definition = DefinitionDefinition.new
    @definition_definition.created_by = session[:user].login
    @definition_definition.created_at = Time.now
    @definition_definition.save
    redirect_to :action => 'edit_dynamic', :id => @definition_definition.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'definition_definition_internal'
    else
    	@divname = 'definition_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition = DefinitionDefinition.new(params[:definition_definition])
    if @definition_definition.save
      flash[:notice] = 'DefinitionDefinition was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'definition_definition_internal'
    else
    	@divname = 'definition_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition = DefinitionDefinition.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'definition_definition_internal'
    else
    	@divname = 'definition_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition = DefinitionDefinition.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'definition_definition_internal'
    else
    	@divname = 'definition_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @definition_definition = DefinitionDefinition.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @definition_definition = DefinitionDefinition.find(params[:id])
    if @definition_definition.created_by == nil or @definition_definition.created_by == ""
      @definition_definition.created_by = session[:user].login
      @definition_definition.created_at = Time.now
    end
    if session[:user] != nil
      @definition_definition.updated_by = session[:user].login
    end
    @definition_definition.updated_at = Time.now
    if @definition_definition.update_history == nil
      @definition_definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition_definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    
    if @definition_definition.update_attributes(params[:definition_definition])
      flash[:notice] = 'DefinitionDefinition was succesfully created.'
      
      # delete incomplete join
      if @definition_definition.sub_definition == nil or @definition_definition.super_definition == nil
        DefinitionDefinition.delete(@definition_definition.id) #super_definition = nil
      end
      
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'super_definitions'
          render :partial => "super_definitions/edit_contents",:locals => {'@super_definition' => Definition.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @definition_definition
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
        if params['internal'] == 'super_definitions'
          render :partial => "super_definitions/edit_contents",:locals => {'@super_definition' => Definition.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @definition_definition
      end
  end

  def destroy
    DefinitionDefinition.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        DefinitionDefinition.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'definitions'
      render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    end
    if params['internal'] == 'super_definitions'
      render :partial => "super_definitions/edit_contents", :locals => {'@super_definition' => Definition.find(params['pk'])}
    end
     if params['internal'] == 'definition_definitions'
       render :partial => 'definition_definitions/edit_contents', :locals => {'@definition_definition' => DefinitionDefinition.find(params['pk'])}
     end
    else
      DefinitionDefinition.find(params['id']).destroy unless params['new'] == nil
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
      internal = "definition_definition"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @definition_definition = DefinitionDefinition.find(params['id'])
    if params["relatedtype"] == "sub_definition"
      o = Definition.new
      o.save
      @definition_definition.sub_definition = o
      @definition_definition.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "definition_definitions", 'pk' => params['id'], 'relatedtype'=> 'sub_definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "super_definition"
      o = Definition.new
      o.save
      @definition_definition.super_definition = o
      @definition_definition.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "definition_definitions", 'pk' => params['id'], 'relatedtype'=> 'super_definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @definition_definition = DefinitionDefinition.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    # #DefinitionDefinition.delete(params['id'])
    # @definition_definition = DefinitionDefinition.find(params['id'])
    # @definition_definition.sub_definition = nil 
    # @definition_definition.super_definition = nil
    # @definition_definition.save
    @definition_definition = DefinitionDefinition.find(params['id'])
    if params["relatedtype"] == "sub_definition"
      @definition_definition.sub_definition = nil if params['tags'] == nil 
      @definition_definition.save
    end
    if params["relatedtype"] == "super_definition"
      @definition_definition.super_definition = nil if params['tags'] == nil 
      @definition_definition.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @definition_definition = DefinitionDefinition.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @definition_definition = DefinitionDefinition.find(params['definition_definition']['id'])
    query = ""
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
         @sub_definitions = Definition.find_all
       else
         @sub_definitions = Definition.find :all, :conditions => query
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
         @super_definitions = Definition.find_all
       else
         @super_definitions = Definition.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @definition_definition = DefinitionDefinition.find(params['id'])
    if params["relatedtype"] == "sub_definition"
      if params['tags'] != nil
        @definition_definition.sub_definition = Definition.find(params['tags'][0])
        @definition_definition.save
      end
    end
    if params["relatedtype"] == "super_definition"
      if params['tags'] != nil
        @definition_definition.super_definition = Definition.find(params['tags'][0])
        @definition_definition.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @definition_definition = DefinitionDefinition.new
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
        if params['definition_definition'] != nil
          @array = []
          params['definition_definition'].each do |key, val| 
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
      if flash['super_definition'] != nil
        params['super_definition'] = flash['super_definition']
        flash['relatedsearch'] = 'yes'
      end
      if flash['sub_definition'] != nil
        params['sub_definition'] = flash['sub_definition']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['super_definition'] == nil or params['super_definition'] == "") and (params['sub_definition'] == nil or params['sub_definition'] == "")
        @definition_definition_pages, @definition_definitions = paginate :definition_definitions, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @definition_definitions = DefinitionDefinition.find :all, :order => sort_clause
        else
          @definition_definitions = DefinitionDefinition.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['super_definition'] != nil and params['super_definition'] != ""
      flash['super_definition'] = params['super_definition']
      for o in @definition_definitions
        if o.super_definition != nil
          if string_contains o.super_definition.displayInfo, params['super_definition']
            array = array + [o]
          end
        end
      end
      @definition_definitions = array
    end
    array = []
    if params['sub_definition'] != nil and params['sub_definition'] != ""
      flash['sub_definition'] = params['sub_definition']
      for o in @definition_definitions
        if o.sub_definition != nil
          if string_contains o.sub_definition.displayInfo, params['sub_definition']
            array = array + [o]
          end
        end
      end
      @definition_definitions = array
    end
      if flash['super_definition'] != nil
        params['super_definition'] = flash['super_definition']
        flash['relatedsearch'] = 'yes'
      end
      if flash['sub_definition'] != nil
        params['sub_definition'] = flash['sub_definition']
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
           @definition_definition_pages = Paginator.new self, @definition_definitions.length(), items_per_page, params['page']
           if @definition_definition_pages.item_count != 0
             @pages = (@definition_definition_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@definition_definition_pages.current.first_item.to_f / @definition_definition_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @definition_definitions = @definition_definitions[@offset,items_per_page] if @definition_definitions[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
