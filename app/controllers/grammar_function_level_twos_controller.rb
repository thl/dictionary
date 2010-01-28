class GrammarFunctionLevelTwosController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :grammar_function_level_threes
  helper :grammar_function_level_ones


  GrammarFunctionLevelTwo.content_columns.each do |column|
    in_place_edit_for :grammar_function_level_two, column.name
  end
  GrammarFunctionLevelThree.content_columns.each do |column|
    in_place_edit_for :grammar_function_level_three, column.name
  end
  GrammarFunctionLevelOne.content_columns.each do |column|
    in_place_edit_for :grammar_function_level_one, column.name
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
    @grammar_function_level_two_pages, @grammar_function_level_twos = paginate :grammar_function_level_two, :per_page => items_per_page, :order_by => sort_clause
    if @grammar_function_level_two_pages.item_count != 0
      @pages = (@grammar_function_level_two_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@grammar_function_level_two_pages.current.first_item.to_f / @grammar_function_level_two_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params[:id])
  end

  def new
    @grammar_function_level_two = GrammarFunctionLevelTwo.new
    @grammar_function_level_two.created_by = session[:user].login
    @grammar_function_level_two.created_at = Time.now
    @grammar_function_level_two.save
    redirect_to :action => 'edit_dynamic', :id => @grammar_function_level_two.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_two_internal'
    else
    	@divname = 'grammar_function_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @grammar_function_level_two = GrammarFunctionLevelTwo.new(params[:grammar_function_level_two])
    if @grammar_function_level_two.save
      flash[:notice] = 'GrammarFunctionLevelTwo was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_two_internal'
    else
    	@divname = 'grammar_function_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_two_internal'
    else
    	@divname = 'grammar_function_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_two_internal'
    else
    	@divname = 'grammar_function_level_two'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params[:id])
    if session[:user] != nil
      @grammar_function_level_two.updated_by = session[:user].login
    end
    @grammar_function_level_two.updated_at = Time.now
    if @grammar_function_level_two.update_history == nil
      @grammar_function_level_two.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@grammar_function_level_two.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if true #@grammar_function_level_two.update_attributes(params[:grammar_function_level_two])
      flash[:notice] = 'GrammarFunctionLevelTwo was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'grammar_function_level_threes'
          render :partial => "grammar_function_level_threes/edit_contents",:locals => {'@grammar_function_level_three' => GrammarFunctionLevelThree.find(params['pk'])}
        end
        if params['internal'] == 'grammar_function_level_ones'
          render :partial => "grammar_function_level_ones/edit_contents",:locals => {'@grammar_function_level_one' => GrammarFunctionLevelOne.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @grammar_function_level_two
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'grammar_function_level_threes'
          render :partial => "grammar_function_level_threes/edit_contents",:locals => {'@grammar_function_level_three' => GrammarFunctionLevelThree.find(params['pk'])}
        end
        if params['internal'] == 'grammar_function_level_ones'
          render :partial => "grammar_function_level_ones/edit_contents",:locals => {'@grammar_function_level_one' => GrammarFunctionLevelOne.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @grammar_function_level_two
      end
  end

  def destroy
    GrammarFunctionLevelTwo.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        GrammarFunctionLevelTwo.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'grammar_function_level_threes'
      render :partial => "grammar_function_level_threes/edit_contents", :locals => {'@grammar_function_level_three' => GrammarFunctionLevelThree.find(params['pk'])}
    end
    if params['internal'] == 'grammar_function_level_ones'
      render :partial => "grammar_function_level_ones/edit_contents", :locals => {'@grammar_function_level_one' => GrammarFunctionLevelOne.find(params['pk'])}
    end
     if params['internal'] == 'grammar_function_level_twos'
       render :partial => 'grammar_function_level_twos/edit_contents', :locals => {'@grammar_function_level_two' => GrammarFunctionLevelTwo.find(params['pk'])}
     end
    else
      GrammarFunctionLevelTwo.find(params['id']).destroy unless params['new'] == nil
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
      internal = "grammar_function_level_two"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params['id'])
    if params["relatedtype"] == "grammar_function_level_three"
      o = GrammarFunctionLevelThree.new
      o.save
      @grammar_function_level_two.grammar_function_level_threes << o
      render_component :controller => "grammar_function_level_threes", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "grammar_function_level_twos", 'pk' => params['id'], 'relatedtype'=> 'grammar_function_level_three', 'level' => params['level'], 'new' => 'yes'}
    end
    if params["relatedtype"] == "grammar_function_level_one"
      o = GrammarFunctionLevelOne.new
      o.save
      @grammar_function_level_two.grammar_function_level_one = o
      @grammar_function_level_two.save
      render_component :controller => "grammar_function_level_ones", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "grammar_function_level_twos", 'pk' => params['id'], 'relatedtype'=> 'grammar_function_level_one', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params['id'])
    if params["relatedtype"] == "grammar_function_level_three"
      if @grammar_function_level_two.grammar_function_level_threes != nil 
        if params['tags'] != nil 
          @grammar_function_level_two.grammar_function_level_threes.delete(@grammar_function_level_two.grammar_function_level_threes - GrammarFunctionLevelThree.find(params['tags']))
        else
          @grammar_function_level_two.grammar_function_level_threes.delete(@grammar_function_level_two.grammar_function_level_threes)
    	  end
    	end
    end
    if params["relatedtype"] == "grammar_function_level_one"
      @grammar_function_level_two.grammar_function_level_one = nil if params['tags'] == nil 
      @grammar_function_level_two.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @grammar_function_level_two = GrammarFunctionLevelTwo.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params['grammar_function_level_two']['id'])
    query = ""
     @grammar_function_level_threes = nil
     if params["relatedtype"] == "grammar_function_level_three"
       @array = []
       params['grammar_function_level_three'].each do |key, val| 
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
         @grammar_function_level_threes = GrammarFunctionLevelThree.find_all
       else
         @grammar_function_level_threes = GrammarFunctionLevelThree.find :all, :conditions => query
       end
     end
     @grammar_function_level_ones = nil
     if params["relatedtype"] == "grammar_function_level_one"
       @array = []
       params['grammar_function_level_one'].each do |key, val| 
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
         @grammar_function_level_ones = GrammarFunctionLevelOne.find_all
       else
         @grammar_function_level_ones = GrammarFunctionLevelOne.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @grammar_function_level_two = GrammarFunctionLevelTwo.find(params['id'])
    if params["relatedtype"] == "grammar_function_level_three" and params['tags'] != nil
      if @grammar_function_level_two.grammar_function_level_threes == nil 
        @grammar_function_level_two.grammar_function_level_threes = GrammarFunctionLevelThree.find(params['tags'])
      else
        @grammar_function_level_two.grammar_function_level_threes.delete(@grammar_function_level_two.grammar_function_level_threes - GrammarFunctionLevelThree.find(params['tags']))
        @grammar_function_level_two.grammar_function_level_threes << GrammarFunctionLevelThree.find(params['tags']) - @grammar_function_level_two.grammar_function_level_threes 
    	end
    end
    if params["relatedtype"] == "grammar_function_level_one" and params['tags'] != nil
      if params['tags'] != nil
        @grammar_function_level_two.grammar_function_level_one = GrammarFunctionLevelOne.find(params['tags'][0])
        @grammar_function_level_two.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @grammar_function_level_two = GrammarFunctionLevelTwo.new
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
        if params['grammar_function_level_two'] != nil
          @array = []
          params['grammar_function_level_two'].each do |key, val| 
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
      if flash['grammar_function_level_threes'] != nil
        params['grammar_function_level_threes'] = flash['grammar_function_level_threes']
        flash['relatedsearch'] = 'yes'
      end
      if flash['grammar_function_level_one'] != nil
        params['grammar_function_level_one'] = flash['grammar_function_level_one']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['grammar_function_level_threes'] == nil or params['grammar_function_level_threes'] == "") and (params['grammar_function_level_one'] == nil or params['grammar_function_level_one'] == "")
        @grammar_function_level_two_pages, @grammar_function_level_twos = paginate :grammar_function_level_twos, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @grammar_function_level_twos = GrammarFunctionLevelTwo.find :all, :order => sort_clause
        else
          @grammar_function_level_twos = GrammarFunctionLevelTwo.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['grammar_function_level_threes'] != nil and params['grammar_function_level_threes'] != ""
      flash['grammar_function_level_threes'] = params['grammar_function_level_threes']
      for o in @grammar_function_level_twos
        found = 0
        for obj in o.grammar_function_level_threes
          if string_contains obj.displayInfo, params['grammar_function_level_threes']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @grammar_function_level_twos = array
    end
    array = []
    if params['grammar_function_level_one'] != nil and params['grammar_function_level_one'] != ""
      flash['grammar_function_level_one'] = params['grammar_function_level_one']
      for o in @grammar_function_level_twos
        if o.grammar_function_level_one != nil
          if string_contains o.grammar_function_level_one.displayInfo, params['grammar_function_level_one']
            array = array + [o]
          end
        end
      end
      @grammar_function_level_twos = array
    end
      if flash['grammar_function_level_threes'] != nil
        params['grammar_function_level_threes'] = flash['grammar_function_level_threes']
        flash['relatedsearch'] = 'yes'
      end
      if flash['grammar_function_level_one'] != nil
        params['grammar_function_level_one'] = flash['grammar_function_level_one']
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
           @grammar_function_level_two_pages = Paginator.new self, @grammar_function_level_twos.length(), items_per_page, params['page']
           if @grammar_function_level_two_pages.item_count != 0
             @pages = (@grammar_function_level_two_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@grammar_function_level_two_pages.current.first_item.to_f / @grammar_function_level_two_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @grammar_function_level_twos = @grammar_function_level_twos[@offset,items_per_page] if @grammar_function_level_twos[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
