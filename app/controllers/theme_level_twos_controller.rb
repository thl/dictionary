class ThemeLevelTwosController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :theme_level_threes
  helper :theme_level_ones


  ThemeLevelTwo.content_columns.each do |column|
    in_place_edit_for :theme_level_two, column.name
  end
  ThemeLevelThree.content_columns.each do |column|
    in_place_edit_for :theme_level_three, column.name
  end
  ThemeLevelOne.content_columns.each do |column|
    in_place_edit_for :theme_level_one, column.name
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
    @theme_level_two_pages, @theme_level_twos = paginate :theme_level_two, :per_page => items_per_page, :order_by => sort_clause
    if @theme_level_two_pages.item_count != 0
      @pages = (@theme_level_two_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@theme_level_two_pages.current.first_item.to_f / @theme_level_two_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @theme_level_two = ThemeLevelTwo.find(params[:id])
  end

  def new
    @theme_level_two = ThemeLevelTwo.new
    @theme_level_two.created_by = session[:user].login
    @theme_level_two.created_at = Time.now
    @theme_level_two.save
    redirect_to :action => 'edit_dynamic', :id => @theme_level_two.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'theme_level_two_internal'
    else
    	@divname = 'theme_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @theme_level_two = ThemeLevelTwo.new(params[:theme_level_two])
    if @theme_level_two.save
      flash[:notice] = 'ThemeLevelTwo was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'theme_level_two_internal'
    else
    	@divname = 'theme_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @theme_level_two = ThemeLevelTwo.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'theme_level_two_internal'
    else
    	@divname = 'theme_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @theme_level_two = ThemeLevelTwo.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'theme_level_two_internal'
    else
    	@divname = 'theme_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @theme_level_two = ThemeLevelTwo.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @theme_level_two = ThemeLevelTwo.find(params[:id])
    if session[:user] != nil
      @theme_level_two.updated_by = session[:user].login
    end
    @theme_level_two.updated_at = Time.now
    if @theme_level_two.update_history == nil
      @theme_level_two.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@theme_level_two.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if true #@theme_level_two.update_attributes(params[:theme_level_two])
      flash[:notice] = 'ThemeLevelTwo was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'theme_level_threes'
          render :partial => "theme_level_threes/edit_contents",:locals => {'@theme_level_three' => ThemeLevelThree.find(params['pk'])}
        end
        if params['internal'] == 'theme_level_ones'
          render :partial => "theme_level_ones/edit_contents",:locals => {'@theme_level_one' => ThemeLevelOne.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @theme_level_two
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'theme_level_threes'
          render :partial => "theme_level_threes/edit_contents",:locals => {'@theme_level_three' => ThemeLevelThree.find(params['pk'])}
        end
        if params['internal'] == 'theme_level_ones'
          render :partial => "theme_level_ones/edit_contents",:locals => {'@theme_level_one' => ThemeLevelOne.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @theme_level_two
      end
  end

  def destroy
    ThemeLevelTwo.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        ThemeLevelTwo.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'theme_level_threes'
      render :partial => "theme_level_threes/edit_contents", :locals => {'@theme_level_three' => ThemeLevelThree.find(params['pk'])}
    end
    if params['internal'] == 'theme_level_ones'
      render :partial => "theme_level_ones/edit_contents", :locals => {'@theme_level_one' => ThemeLevelOne.find(params['pk'])}
    end
     if params['internal'] == 'theme_level_twos'
       render :partial => 'theme_level_twos/edit_contents', :locals => {'@theme_level_two' => ThemeLevelTwo.find(params['pk'])}
     end
    else
      ThemeLevelTwo.find(params['id']).destroy unless params['new'] == nil
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
      internal = "theme_level_two"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @theme_level_two = ThemeLevelTwo.find(params['id'])
    if params["relatedtype"] == "theme_level_three"
      o = ThemeLevelThree.new
      o.save
      @theme_level_two.theme_level_threes << o
      render_component :controller => "theme_level_threes", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "theme_level_twos", 'pk' => params['id'], 'relatedtype'=> 'theme_level_three', 'level' => params['level'], 'new' => 'yes'}
    end
    if params["relatedtype"] == "theme_level_one"
      o = ThemeLevelOne.new
      o.save
      @theme_level_two.theme_level_one = o
      @theme_level_two.save
      render_component :controller => "theme_level_ones", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "theme_level_twos", 'pk' => params['id'], 'relatedtype'=> 'theme_level_one', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @theme_level_two = ThemeLevelTwo.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @theme_level_two = ThemeLevelTwo.find(params['id'])
    if params["relatedtype"] == "theme_level_three"
      if @theme_level_two.theme_level_threes != nil 
        if params['tags'] != nil 
          @theme_level_two.theme_level_threes.delete(@theme_level_two.theme_level_threes - ThemeLevelThree.find(params['tags']))
        else
          @theme_level_two.theme_level_threes.delete(@theme_level_two.theme_level_threes)
    	  end
    	end
    end
    if params["relatedtype"] == "theme_level_one"
      @theme_level_two.theme_level_one = nil if params['tags'] == nil 
      @theme_level_two.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @theme_level_two = ThemeLevelTwo.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @theme_level_two = ThemeLevelTwo.find(params['theme_level_two']['id'])
    query = ""
     @theme_level_threes = nil
     if params["relatedtype"] == "theme_level_three"
       @array = []
       params['theme_level_three'].each do |key, val| 
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
         @theme_level_threes = ThemeLevelThree.find_all
       else
         @theme_level_threes = ThemeLevelThree.find :all, :conditions => query
       end
     end
     @theme_level_ones = nil
     if params["relatedtype"] == "theme_level_one"
       @array = []
       params['theme_level_one'].each do |key, val| 
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
         @theme_level_ones = ThemeLevelOne.find_all
       else
         @theme_level_ones = ThemeLevelOne.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @theme_level_two = ThemeLevelTwo.find(params['id'])
    if params["relatedtype"] == "theme_level_three"
      if @theme_level_two.theme_level_threes == nil 
        @theme_level_two.theme_level_threes = ThemeLevelThree.find(params['tags'])
      else
        @theme_level_two.theme_level_threes.delete(@theme_level_two.theme_level_threes - ThemeLevelThree.find(params['tags']))
        @theme_level_two.theme_level_threes << ThemeLevelThree.find(params['tags']) - @theme_level_two.theme_level_threes 
    	end
    end
    if params["relatedtype"] == "theme_level_one"
      if params['tags'] != nil
        @theme_level_two.theme_level_one = ThemeLevelOne.find(params['tags'][0])
        @theme_level_two.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @theme_level_two = ThemeLevelTwo.new
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
        if params['theme_level_two'] != nil
          @array = []
          params['theme_level_two'].each do |key, val| 
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
      if flash['theme_level_one'] != nil
        params['theme_level_one'] = flash['theme_level_one']
        flash['relatedsearch'] = 'yes'
      end
      if flash['theme_level_threes'] != nil
        params['theme_level_threes'] = flash['theme_level_threes']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['theme_level_one'] == nil or params['theme_level_one'] == "") and (params['theme_level_threes'] == nil or params['theme_level_threes'] == "")
        @theme_level_two_pages, @theme_level_twos = paginate :theme_level_twos, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @theme_level_twos = ThemeLevelTwo.find :all, :order => sort_clause
        else
          @theme_level_twos = ThemeLevelTwo.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['theme_level_one'] != nil and params['theme_level_one'] != ""
      flash['theme_level_one'] = params['theme_level_one']
      for o in @theme_level_twos
        if o.theme_level_one != nil
          if string_contains o.theme_level_one.displayInfo, params['theme_level_one']
            array = array + [o]
          end
        end
      end
      @theme_level_twos = array
    end
    array = []
    if params['theme_level_threes'] != nil and params['theme_level_threes'] != ""
      flash['theme_level_threes'] = params['theme_level_threes']
      for o in @theme_level_twos
        found = 0
        for obj in o.theme_level_threes
          if string_contains obj.displayInfo, params['theme_level_threes']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @theme_level_twos = array
    end
      if flash['theme_level_one'] != nil
        params['theme_level_one'] = flash['theme_level_one']
        flash['relatedsearch'] = 'yes'
      end
      if flash['theme_level_threes'] != nil
        params['theme_level_threes'] = flash['theme_level_threes']
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
           @theme_level_two_pages = Paginator.new self, @theme_level_twos.length(), items_per_page, params['page']
           if @theme_level_two_pages.item_count != 0
             @pages = (@theme_level_two_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@theme_level_two_pages.current.first_item.to_f / @theme_level_two_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @theme_level_twos = @theme_level_twos[@offset,items_per_page] if @theme_level_twos[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
