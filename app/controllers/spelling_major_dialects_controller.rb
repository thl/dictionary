class SpellingMajorDialectsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  SpellingMajorDialect.content_columns.each do |column|
    in_place_edit_for :spelling_major_dialect, column.name
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
    @spelling_major_dialect_pages, @spelling_major_dialects = paginate :spelling_major_dialect, :per_page => items_per_page, :order_by => sort_clause
    if @spelling_major_dialect_pages.item_count != 0
      @pages = (@spelling_major_dialect_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@spelling_major_dialect_pages.current.first_item.to_f / @spelling_major_dialect_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @spelling_major_dialect = SpellingMajorDialect.find(params[:id])
  end

  def new
    @spelling_major_dialect = SpellingMajorDialect.new
    @spelling_major_dialect.created_by = session[:user].login
    @spelling_major_dialect.created_at = Time.now
    @spelling_major_dialect.save
    redirect_to :action => 'edit_dynamic', :id => @spelling_major_dialect.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'spelling_major_dialect_internal'
    else
    	@divname = 'spelling_major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling_major_dialect = SpellingMajorDialect.new(params[:spelling_major_dialect])
    if @spelling_major_dialect.save
      flash[:notice] = 'SpellingMajorDialect was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'spelling_major_dialect_internal'
    else
    	@divname = 'spelling_major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling_major_dialect = SpellingMajorDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'spelling_major_dialect_internal'
    else
    	@divname = 'spelling_major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling_major_dialect = SpellingMajorDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'spelling_major_dialect_internal'
    else
    	@divname = 'spelling_major_dialect'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @spelling_major_dialect = SpellingMajorDialect.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @spelling_major_dialect = SpellingMajorDialect.find(params[:id])
    if session[:user] != nil
      @spelling_major_dialect.updated_by = session[:user].login
    end
    @spelling_major_dialect.updated_at = Time.now
    if @spelling_major_dialect.update_history == nil
      @spelling_major_dialect.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@spelling_major_dialect.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @spelling_major_dialect.update_attributes(params[:spelling_major_dialect])
      flash[:notice] = 'SpellingMajorDialect was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @spelling_major_dialect
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @spelling_major_dialect
      end
  end

  def destroy
    SpellingMajorDialect.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        SpellingMajorDialect.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'spelling_major_dialects'
       render :partial => 'spelling_major_dialects/edit_contents', :locals => {'@spelling_major_dialect' => SpellingMajorDialect.find(params['pk'])}
     end
    else
      SpellingMajorDialect.find(params['id']).destroy unless params['new'] == nil
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
      internal = "spelling_major_dialect"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @spelling_major_dialect = SpellingMajorDialect.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @spelling_major_dialect = SpellingMajorDialect.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @spelling_major_dialect = SpellingMajorDialect.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @spelling_major_dialect = SpellingMajorDialect.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @spelling_major_dialect = SpellingMajorDialect.find(params['spelling_major_dialect']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @spelling_major_dialect = SpellingMajorDialect.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @spelling_major_dialect = SpellingMajorDialect.new
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
        if params['spelling_major_dialect'] != nil
          @array = []
          params['spelling_major_dialect'].each do |key, val| 
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
      if query == [""]
        @spelling_major_dialect_pages, @spelling_major_dialects = paginate :spelling_major_dialects, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @spelling_major_dialects = SpellingMajorDialect.find :all, :order => sort_clause
        else
          @spelling_major_dialects = SpellingMajorDialect.find :all, :conditions => query, :order => sort_clause
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
           @spelling_major_dialect_pages = Paginator.new self, @spelling_major_dialects.length(), items_per_page, params['page']
           if @spelling_major_dialect_pages.item_count != 0
             @pages = (@spelling_major_dialect_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@spelling_major_dialect_pages.current.first_item.to_f / @spelling_major_dialect_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @spelling_major_dialects = @spelling_major_dialects[@offset,items_per_page] if @spelling_major_dialects[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
