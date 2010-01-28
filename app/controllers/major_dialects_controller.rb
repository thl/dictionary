class MajorDialectsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :specific_dialects


  MajorDialect.content_columns.each do |column|
    in_place_edit_for :major_dialect, column.name
  end
  SpecificDialect.content_columns.each do |column|
    in_place_edit_for :specific_dialect, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'name'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @major_dialect_pages, @major_dialects = paginate :major_dialect, :per_page => items_per_page, :order_by => sort_clause
    if @major_dialect_pages.item_count != 0
      @pages = (@major_dialect_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@major_dialect_pages.current.first_item.to_f / @major_dialect_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @major_dialect = MajorDialect.find(params[:id])
  end

  def new
    @major_dialect = MajorDialect.new
    @major_dialect.created_by = session[:user].login
    @major_dialect.created_at = Time.now
    @major_dialect.save
    redirect_to :action => 'edit_dynamic', :id => @major_dialect.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'major_dialect_internal'
    else
    	@divname = 'major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @major_dialect = MajorDialect.new(params[:major_dialect])
    if @major_dialect.save
      flash[:notice] = 'MajorDialect was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'major_dialect_internal'
    else
    	@divname = 'major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @major_dialect = MajorDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'major_dialect_internal'
    else
    	@divname = 'major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @major_dialect = MajorDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'major_dialect_internal'
    else
    	@divname = 'major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @major_dialect = MajorDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @major_dialect = MajorDialect.find(params[:id])
    if session[:user] != nil
      @major_dialect.updated_by = session[:user].login
    end
    @major_dialect.updated_at = Time.now
    if @major_dialect.update_history == nil
      @major_dialect.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@major_dialect.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @major_dialect.update_attributes(params[:major_dialect])
      flash[:notice] = 'MajorDialect was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'specific_dialects'
          render :partial => "specific_dialects/edit_contents",:locals => {'@specific_dialect' => SpecificDialect.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @major_dialect
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'specific_dialects'
          render :partial => "specific_dialects/edit_contents",:locals => {'@specific_dialect' => SpecificDialect.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @major_dialect
      end
  end

  def destroy
    MajorDialect.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        MajorDialect.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'specific_dialects'
      render :partial => "specific_dialects/edit_contents", :locals => {'@specific_dialect' => SpecificDialect.find(params['pk'])}
    end
     if params['internal'] == 'major_dialects'
       render :partial => 'major_dialects/edit_contents', :locals => {'@major_dialect' => MajorDialect.find(params['pk'])}
     end
    else
      MajorDialect.find(params['id']).destroy unless params['new'] == nil
      if session['previous_page'] != 'invalid' and session['previous_page'] != nil
      	redirect_to session['previous_page']
      else
        redirect_to :controller => 'definitions', :action => 'control_vocab'
      end
    end
  end

  def edit_new
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "major_dialect"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @major_dialect = MajorDialect.find(params['id'])
    if params["relatedtype"] == "specific_dialect"
      o = SpecificDialect.new
      o.save
      @major_dialect.specific_dialects << o
      render_component :controller => "specific_dialects", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "major_dialects", 'pk' => params['id'], 'relatedtype'=> 'specific_dialect', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @major_dialect = MajorDialect.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @major_dialect = MajorDialect.find(params['id'])
    if params["relatedtype"] == "specific_dialect"
      if @major_dialect.specific_dialects != nil 
        if params['tags'] != nil 
          @major_dialect.specific_dialects.delete(@major_dialect.specific_dialects - SpecificDialect.find(params['tags']))
        else
          @major_dialect.specific_dialects.delete(@major_dialect.specific_dialects)
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
      @major_dialect = MajorDialect.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @major_dialect = MajorDialect.find(params['major_dialect']['id'])
    query = ""
     @specific_dialects = nil
     if params["relatedtype"] == "specific_dialect"
       @array = []
       params['specific_dialect'].each do |key, val| 
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
         @specific_dialects = SpecificDialect.find_all
       else
         @specific_dialects = SpecificDialect.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @major_dialect = MajorDialect.find(params['id'])
    if params["relatedtype"] == "specific_dialect"
      if @major_dialect.specific_dialects == nil 
        @major_dialect.specific_dialects = SpecificDialect.find(params['tags'])
      else
        @major_dialect.specific_dialects.delete(@major_dialect.specific_dialects - SpecificDialect.find(params['tags']))
        @major_dialect.specific_dialects << SpecificDialect.find(params['tags']) - @major_dialect.specific_dialects 
    	end
    end
    render_partial 'edit_contents'
  end

  def search
      @major_dialect = MajorDialect.new
  end

  def searchaction
      sort_init 'name'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['major_dialect'] != nil
          @array = []
          params['major_dialect'].each do |key, val| 
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
      if flash['specific_dialects'] != nil
        params['specific_dialects'] = flash['specific_dialects']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['specific_dialects'] == nil or params['specific_dialects'] == "")
        @major_dialect_pages, @major_dialects = paginate :major_dialects, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @major_dialects = MajorDialect.find :all, :order => sort_clause
        else
          @major_dialects = MajorDialect.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['specific_dialects'] != nil and params['specific_dialects'] != ""
      flash['specific_dialects'] = params['specific_dialects']
      for o in @major_dialects
        found = 0
        for obj in o.specific_dialects
          if string_contains obj.displayInfo, params['specific_dialects']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @major_dialects = array
    end
      if flash['specific_dialects'] != nil
        params['specific_dialects'] = flash['specific_dialects']
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
           @major_dialect_pages = Paginator.new self, @major_dialects.length(), items_per_page, params['page']
           if @major_dialect_pages.item_count != 0
             @pages = (@major_dialect_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@major_dialect_pages.current.first_item.to_f / @major_dialect_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @major_dialects = @major_dialects[@offset,items_per_page] if @major_dialects[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
