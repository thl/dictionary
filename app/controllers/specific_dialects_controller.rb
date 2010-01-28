class SpecificDialectsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :major_dialects


  SpecificDialect.content_columns.each do |column|
    in_place_edit_for :specific_dialect, column.name
  end
  MajorDialect.content_columns.each do |column|
    in_place_edit_for :major_dialect, column.name
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
    @specific_dialect_pages, @specific_dialects = paginate :specific_dialect, :per_page => items_per_page, :order_by => sort_clause
    if @specific_dialect_pages.item_count != 0
      @pages = (@specific_dialect_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@specific_dialect_pages.current.first_item.to_f / @specific_dialect_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @specific_dialect = SpecificDialect.find(params[:id])
  end

  def new
    @specific_dialect = SpecificDialect.new
    @specific_dialect.created_by = session[:user].login
    @specific_dialect.created_at = Time.now
    @specific_dialect.save
    redirect_to :action => 'edit_dynamic', :id => @specific_dialect.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'specific_dialect_internal'
    else
    	@divname = 'specific_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @specific_dialect = SpecificDialect.new(params[:specific_dialect])
    if @specific_dialect.save
      flash[:notice] = 'SpecificDialect was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'specific_dialect_internal'
    else
    	@divname = 'specific_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @specific_dialect = SpecificDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'specific_dialect_internal'
    else
    	@divname = 'specific_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @specific_dialect = SpecificDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'specific_dialect_internal'
    else
    	@divname = 'specific_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @specific_dialect = SpecificDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @specific_dialect = SpecificDialect.find(params[:id])
    if session[:user] != nil
      @specific_dialect.updated_by = session[:user].login
    end
    @specific_dialect.updated_at = Time.now
    if @specific_dialect.update_history == nil
      @specific_dialect.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@specific_dialect.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if true #@specific_dialect.update_attributes(params[:specific_dialect])
      flash[:notice] = 'SpecificDialect was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'major_dialects'
          render :partial => "major_dialects/edit_contents",:locals => {'@major_dialect' => MajorDialect.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @specific_dialect
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'major_dialects'
          render :partial => "major_dialects/edit_contents",:locals => {'@major_dialect' => MajorDialect.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @specific_dialect
      end
  end

  def destroy
    SpecificDialect.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        SpecificDialect.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'major_dialects'
      render :partial => "major_dialects/edit_contents", :locals => {'@major_dialect' => MajorDialect.find(params['pk'])}
    end
     if params['internal'] == 'specific_dialects'
       render :partial => 'specific_dialects/edit_contents', :locals => {'@specific_dialect' => SpecificDialect.find(params['pk'])}
     end
    else
      SpecificDialect.find(params['id']).destroy unless params['new'] == nil
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
      internal = "specific_dialect"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @specific_dialect = SpecificDialect.find(params['id'])
    if params["relatedtype"] == "major_dialect"
      o = MajorDialect.new
      o.save
      @specific_dialect.major_dialect = o
      @specific_dialect.save
      render_component :controller => "major_dialects", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "specific_dialects", 'pk' => params['id'], 'relatedtype'=> 'major_dialect', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @specific_dialect = SpecificDialect.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @specific_dialect = SpecificDialect.find(params['id'])
    if params["relatedtype"] == "major_dialect"
      @specific_dialect.major_dialect = nil if params['tags'] == nil 
      @specific_dialect.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @specific_dialect = SpecificDialect.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @specific_dialect = SpecificDialect.find(params['specific_dialect']['id'])
    query = ""
     @major_dialects = nil
     if params["relatedtype"] == "major_dialect"
       @array = []
       params['major_dialect'].each do |key, val| 
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
         @major_dialects = MajorDialect.find_all
       else
         @major_dialects = MajorDialect.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @specific_dialect = SpecificDialect.find(params['id'])
    if params["relatedtype"] == "major_dialect"
      if params['tags'] != nil
        @specific_dialect.major_dialect = MajorDialect.find(params['tags'][0])
        @specific_dialect.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @specific_dialect = SpecificDialect.new
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
        if params['specific_dialect'] != nil
          @array = []
          params['specific_dialect'].each do |key, val| 
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
      if flash['major_dialect'] != nil
        params['major_dialect'] = flash['major_dialect']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['major_dialect'] == nil or params['major_dialect'] == "")
        @specific_dialect_pages, @specific_dialects = paginate :specific_dialects, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @specific_dialects = SpecificDialect.find :all, :order => sort_clause
        else
          @specific_dialects = SpecificDialect.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['major_dialect'] != nil and params['major_dialect'] != ""
      flash['major_dialect'] = params['major_dialect']
      for o in @specific_dialects
        if o.major_dialect != nil
          if string_contains o.major_dialect.displayInfo, params['major_dialect']
            array = array + [o]
          end
        end
      end
      @specific_dialects = array
    end
      if flash['major_dialect'] != nil
        params['major_dialect'] = flash['major_dialect']
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
           @specific_dialect_pages = Paginator.new self, @specific_dialects.length(), items_per_page, params['page']
           if @specific_dialect_pages.item_count != 0
             @pages = (@specific_dialect_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@specific_dialect_pages.current.first_item.to_f / @specific_dialect_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @specific_dialects = @specific_dialects[@offset,items_per_page] if @specific_dialects[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
