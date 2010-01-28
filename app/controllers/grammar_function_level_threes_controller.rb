class GrammarFunctionLevelThreesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :grammar_function_level_twos


  GrammarFunctionLevelThree.content_columns.each do |column|
    in_place_edit_for :grammar_function_level_three, column.name
  end
  GrammarFunctionLevelTwo.content_columns.each do |column|
    in_place_edit_for :grammar_function_level_two, column.name
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
    @grammar_function_level_three_pages, @grammar_function_level_threes = paginate :grammar_function_level_three, :per_page => items_per_page, :order_by => sort_clause
    if @grammar_function_level_three_pages.item_count != 0
      @pages = (@grammar_function_level_three_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@grammar_function_level_three_pages.current.first_item.to_f / @grammar_function_level_three_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params[:id])
  end

  def new
    @grammar_function_level_three = GrammarFunctionLevelThree.new
    @grammar_function_level_three.created_by = session[:user].login
    @grammar_function_level_three.created_at = Time.now
    @grammar_function_level_three.save
    redirect_to :action => 'edit_dynamic', :id => @grammar_function_level_three.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_three_internal'
    else
    	@divname = 'grammar_function_level_three'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @grammar_function_level_three = GrammarFunctionLevelThree.new(params[:grammar_function_level_three])
    if @grammar_function_level_three.save
      flash[:notice] = 'GrammarFunctionLevelThree was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_three_internal'
    else
    	@divname = 'grammar_function_level_three'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_three_internal'
    else
    	@divname = 'grammar_function_level_three'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'grammar_function_level_three_internal'
    else
    	@divname = 'grammar_function_level_three'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params[:id])
    if session[:user] != nil
      @grammar_function_level_three.updated_by = session[:user].login
    end
    @grammar_function_level_three.updated_at = Time.now
    if @grammar_function_level_three.update_history == nil
      @grammar_function_level_three.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@grammar_function_level_three.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if true #@grammar_function_level_three.update_attributes(params[:grammar_function_level_three])
      flash[:notice] = 'GrammarFunctionLevelThree was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'grammar_function_level_twos'
          render :partial => "grammar_function_level_twos/edit_contents",:locals => {'@grammar_function_level_two' => GrammarFunctionLevelTwo.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @grammar_function_level_three
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'grammar_function_level_twos'
          render :partial => "grammar_function_level_twos/edit_contents",:locals => {'@grammar_function_level_two' => GrammarFunctionLevelTwo.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @grammar_function_level_three
      end
  end

  def destroy
    GrammarFunctionLevelThree.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        GrammarFunctionLevelThree.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'grammar_function_level_twos'
      render :partial => "grammar_function_level_twos/edit_contents", :locals => {'@grammar_function_level_two' => GrammarFunctionLevelTwo.find(params['pk'])}
    end
     if params['internal'] == 'grammar_function_level_threes'
       render :partial => 'grammar_function_level_threes/edit_contents', :locals => {'@grammar_function_level_three' => GrammarFunctionLevelThree.find(params['pk'])}
     end
    else
      GrammarFunctionLevelThree.find(params['id']).destroy unless params['new'] == nil
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
      internal = "grammar_function_level_three"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params['id'])
    if params["relatedtype"] == "grammar_function_level_two"
      o = GrammarFunctionLevelTwo.new
      o.save
      @grammar_function_level_three.grammar_function_level_two = o
      @grammar_function_level_three.save
      render_component :controller => "grammar_function_level_twos", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "grammar_function_level_threes", 'pk' => params['id'], 'relatedtype'=> 'grammar_function_level_two', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params['id'])
    if params["relatedtype"] == "grammar_function_level_two"
      @grammar_function_level_three.grammar_function_level_two = nil if params['tags'] == nil 
      @grammar_function_level_three.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @grammar_function_level_three = GrammarFunctionLevelThree.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params['grammar_function_level_three']['id'])
    query = ""
     @grammar_function_level_twos = nil
     if params["relatedtype"] == "grammar_function_level_two"
       @array = []
       params['grammar_function_level_two'].each do |key, val| 
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
         @grammar_function_level_twos = GrammarFunctionLevelTwo.find_all
       else
         @grammar_function_level_twos = GrammarFunctionLevelTwo.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @grammar_function_level_three = GrammarFunctionLevelThree.find(params['id'])
    if params["relatedtype"] == "grammar_function_level_two"
      if params['tags'] != nil
        @grammar_function_level_three.grammar_function_level_two = GrammarFunctionLevelTwo.find(params['tags'][0])
        @grammar_function_level_three.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @grammar_function_level_three = GrammarFunctionLevelThree.new
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
        if params['grammar_function_level_three'] != nil
          @array = []
          params['grammar_function_level_three'].each do |key, val| 
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
      if flash['grammar_function_level_two'] != nil
        params['grammar_function_level_two'] = flash['grammar_function_level_two']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['grammar_function_level_two'] == nil or params['grammar_function_level_two'] == "")
        @grammar_function_level_three_pages, @grammar_function_level_threes = paginate :grammar_function_level_threes, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @grammar_function_level_threes = GrammarFunctionLevelThree.find :all, :order => sort_clause
        else
          @grammar_function_level_threes = GrammarFunctionLevelThree.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['grammar_function_level_two'] != nil and params['grammar_function_level_two'] != ""
      flash['grammar_function_level_two'] = params['grammar_function_level_two']
      for o in @grammar_function_level_threes
        if o.grammar_function_level_two != nil
          if string_contains o.grammar_function_level_two.displayInfo, params['grammar_function_level_two']
            array = array + [o]
          end
        end
      end
      @grammar_function_level_threes = array
    end
      if flash['grammar_function_level_two'] != nil
        params['grammar_function_level_two'] = flash['grammar_function_level_two']
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
           @grammar_function_level_three_pages = Paginator.new self, @grammar_function_level_threes.length(), items_per_page, params['page']
           if @grammar_function_level_three_pages.item_count != 0
             @pages = (@grammar_function_level_three_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@grammar_function_level_three_pages.current.first_item.to_f / @grammar_function_level_three_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @grammar_function_level_threes = @grammar_function_level_threes[@offset,items_per_page] if @grammar_function_level_threes[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
