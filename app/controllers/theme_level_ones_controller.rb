class ThemeLevelOnesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :theme_level_twos


  ThemeLevelOne.content_columns.each do |column|
    in_place_edit_for :theme_level_one, column.name
  end
  ThemeLevelTwo.content_columns.each do |column|
    in_place_edit_for :theme_level_two, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'theme'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @theme_level_one_pages, @theme_level_ones = paginate :theme_level_one, :per_page => items_per_page, :order_by => sort_clause
    if @theme_level_one_pages.item_count != 0
      @pages = (@theme_level_one_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@theme_level_one_pages.current.first_item.to_f / @theme_level_one_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @theme_level_one = ThemeLevelOne.find(params[:id])
  end

  def new
    @theme_level_one = ThemeLevelOne.new
    @theme_level_one.created_by = session[:user].login
    @theme_level_one.created_at = Time.now
    @theme_level_one.save
    redirect_to :action => 'edit_dynamic', :id => @theme_level_one.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'theme_level_one_internal'
    else
    	@divname = 'theme_level_one'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @theme_level_one = ThemeLevelOne.new(params[:theme_level_one])
    if @theme_level_one.save
      flash[:notice] = 'ThemeLevelOne was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'theme_level_one_internal'
    else
    	@divname = 'theme_level_one'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @theme_level_one = ThemeLevelOne.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'theme_level_one_internal'
    else
    	@divname = 'theme_level_one'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @theme_level_one = ThemeLevelOne.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'theme_level_one_internal'
    else
    	@divname = 'theme_level_one'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @theme_level_one = ThemeLevelOne.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @theme_level_one = ThemeLevelOne.find(params[:id])
    if session[:user] != nil
      @theme_level_one.updated_by = session[:user].login
    end
    @theme_level_one.updated_at = Time.now
    if @theme_level_one.update_history == nil
      @theme_level_one.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@theme_level_one.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @theme_level_one.update_attributes(params[:theme_level_one])
      flash[:notice] = 'ThemeLevelOne was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'theme_level_twos'
          render :partial => "theme_level_twos/edit_contents",:locals => {'@theme_level_two' => ThemeLevelTwo.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @theme_level_one
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'theme_level_twos'
          render :partial => "theme_level_twos/edit_contents",:locals => {'@theme_level_two' => ThemeLevelTwo.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @theme_level_one
      end
  end

  def destroy
    ThemeLevelOne.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        ThemeLevelOne.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'theme_level_twos'
      render :partial => "theme_level_twos/edit_contents", :locals => {'@theme_level_two' => ThemeLevelTwo.find(params['pk'])}
    end
     if params['internal'] == 'theme_level_ones'
       render :partial => 'theme_level_ones/edit_contents', :locals => {'@theme_level_one' => ThemeLevelOne.find(params['pk'])}
     end
    else
      ThemeLevelOne.find(params['id']).destroy unless params['new'] == nil
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
      internal = "theme_level_one"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @theme_level_one = ThemeLevelOne.find(params['id'])
    if params["relatedtype"] == "theme_level_two"
      o = ThemeLevelTwo.new
      o.save
      @theme_level_one.theme_level_twos << o
      render_component :controller => "theme_level_twos", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "theme_level_ones", 'pk' => params['id'], 'relatedtype'=> 'theme_level_two', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @theme_level_one = ThemeLevelOne.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @theme_level_one = ThemeLevelOne.find(params['id'])
    if params["relatedtype"] == "theme_level_two"
      if @theme_level_one.theme_level_twos != nil 
        if params['tags'] != nil 
          @theme_level_one.theme_level_twos.delete(@theme_level_one.theme_level_twos - ThemeLevelTwo.find(params['tags']))
        else
          @theme_level_one.theme_level_twos.delete(@theme_level_one.theme_level_twos)
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
      @theme_level_one = ThemeLevelOne.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @theme_level_one = ThemeLevelOne.find(params['theme_level_one']['id'])
    query = ""
     @theme_level_twos = nil
     if params["relatedtype"] == "theme_level_two"
       @array = []
       params['theme_level_two'].each do |key, val| 
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
         @theme_level_twos = ThemeLevelTwo.find_all
       else
         @theme_level_twos = ThemeLevelTwo.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @theme_level_one = ThemeLevelOne.find(params['id'])
    if params["relatedtype"] == "theme_level_two"
      if @theme_level_one.theme_level_twos == nil 
        @theme_level_one.theme_level_twos = ThemeLevelTwo.find(params['tags'])
      else
        @theme_level_one.theme_level_twos.delete(@theme_level_one.theme_level_twos - ThemeLevelTwo.find(params['tags']))
        @theme_level_one.theme_level_twos << ThemeLevelTwo.find(params['tags']) - @theme_level_one.theme_level_twos 
    	end
    end
    render_partial 'edit_contents'
  end

  def search
      @theme_level_one = ThemeLevelOne.new
  end

  def searchaction
      sort_init 'theme'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['theme_level_one'] != nil
          @array = []
          params['theme_level_one'].each do |key, val| 
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
      if flash['theme_level_twos'] != nil
        params['theme_level_twos'] = flash['theme_level_twos']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['theme_level_twos'] == nil or params['theme_level_twos'] == "")
        @theme_level_one_pages, @theme_level_ones = paginate :theme_level_ones, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @theme_level_ones = ThemeLevelOne.find :all, :order => sort_clause
        else
          @theme_level_ones = ThemeLevelOne.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['theme_level_twos'] != nil and params['theme_level_twos'] != ""
      flash['theme_level_twos'] = params['theme_level_twos']
      for o in @theme_level_ones
        found = 0
        for obj in o.theme_level_twos
          if string_contains obj.displayInfo, params['theme_level_twos']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @theme_level_ones = array
    end
      if flash['theme_level_twos'] != nil
        params['theme_level_twos'] = flash['theme_level_twos']
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
           @theme_level_one_pages = Paginator.new self, @theme_level_ones.length(), items_per_page, params['page']
           if @theme_level_one_pages.item_count != 0
             @pages = (@theme_level_one_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@theme_level_one_pages.current.first_item.to_f / @theme_level_one_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @theme_level_ones = @theme_level_ones[@offset,items_per_page] if @theme_level_ones[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
