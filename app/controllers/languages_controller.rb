class LanguagesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  Language.content_columns.each do |column|
    in_place_edit_for :language, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'language'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @language_pages, @languages = paginate :language, :per_page => items_per_page, :order_by => sort_clause
    if @language_pages.item_count != 0
      @pages = (@language_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@language_pages.current.first_item.to_f / @language_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @language = Language.find(params[:id])
  end

  def new
    @language = Language.new
    @language.created_by = session[:user].login
    @language.created_at = Time.now
    @language.save
    redirect_to :action => 'edit_dynamic', :id => @language.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'language_internal'
    else
    	@divname = 'language'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @language = Language.new(params[:language])
    if @language.save
      flash[:notice] = 'Language was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'language_internal'
    else
    	@divname = 'language'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @language = Language.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'language_internal'
    else
    	@divname = 'language'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @language = Language.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'language_internal'
    else
    	@divname = 'language'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @language = Language.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @language = Language.find(params[:id])
    if session[:user] != nil
      @language.updated_by = session[:user].login
    end
    @language.updated_at = Time.now
    if @language.update_history == nil
      @language.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@language.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @language.update_attributes(params[:language])
      flash[:notice] = 'Language was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @language
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @language
      end
  end

  def destroy
    Language.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Language.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'languages'
       render :partial => 'languages/edit_contents', :locals => {'@language' => Language.find(params['pk'])}
     end
    else
      Language.find(params['id']).destroy unless params['new'] == nil
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
      internal = "language"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @language = Language.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @language = Language.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @language = Language.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @language = Language.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @language = Language.find(params['language']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @language = Language.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @language = Language.new
  end

  def searchaction
      sort_init 'language'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['language'] != nil
          @array = []
          params['language'].each do |key, val| 
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
        @language_pages, @languages = paginate :languages, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @languages = Language.find :all, :order => sort_clause
        else
          @languages = Language.find :all, :conditions => query, :order => sort_clause
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
           @language_pages = Paginator.new self, @languages.length(), items_per_page, params['page']
           if @language_pages.item_count != 0
             @pages = (@language_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@language_pages.current.first_item.to_f / @language_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @languages = @languages[@offset,items_per_page] if @languages[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
