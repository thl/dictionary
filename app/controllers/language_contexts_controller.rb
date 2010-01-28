class LanguageContextsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  LanguageContext.content_columns.each do |column|
    in_place_edit_for :language_context, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'language_context'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @language_context_pages, @language_contexts = paginate :language_context, :per_page => items_per_page, :order_by => sort_clause
    if @language_context_pages.item_count != 0
      @pages = (@language_context_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@language_context_pages.current.first_item.to_f / @language_context_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @language_context = LanguageContext.find(params[:id])
  end

  def new
    @language_context = LanguageContext.new
    @language_context.created_by = session[:user].login
    @language_context.created_at = Time.now
    @language_context.save
    redirect_to :action => 'edit_dynamic', :id => @language_context.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'language_context_internal'
    else
    	@divname = 'language_context'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @language_context = LanguageContext.new(params[:language_context])
    if @language_context.save
      flash[:notice] = 'LanguageContext was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'language_context_internal'
    else
    	@divname = 'language_context'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @language_context = LanguageContext.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'language_context_internal'
    else
    	@divname = 'language_context'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @language_context = LanguageContext.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'language_context_internal'
    else
    	@divname = 'language_context'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @language_context = LanguageContext.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @language_context = LanguageContext.find(params[:id])
    if session[:user] != nil
      @language_context.updated_by = session[:user].login
    end
    @language_context.updated_at = Time.now
    if @language_context.update_history == nil
      @language_context.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@language_context.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @language_context.update_attributes(params[:language_context])
      flash[:notice] = 'LanguageContext was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @language_context
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @language_context
      end
  end

  def destroy
    LanguageContext.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        LanguageContext.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'language_contexts'
       render :partial => 'language_contexts/edit_contents', :locals => {'@language_context' => LanguageContext.find(params['pk'])}
     end
    else
      LanguageContext.find(params['id']).destroy unless params['new'] == nil
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
      internal = "language_context"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @language_context = LanguageContext.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @language_context = LanguageContext.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @language_context = LanguageContext.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @language_context = LanguageContext.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @language_context = LanguageContext.find(params['language_context']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @language_context = LanguageContext.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @language_context = LanguageContext.new
  end

  def searchaction
      sort_init 'language_context'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['language_context'] != nil
          @array = []
          params['language_context'].each do |key, val| 
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
        @language_context_pages, @language_contexts = paginate :language_contexts, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @language_contexts = LanguageContext.find :all, :order => sort_clause
        else
          @language_contexts = LanguageContext.find :all, :conditions => query, :order => sort_clause
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
           @language_context_pages = Paginator.new self, @language_contexts.length(), items_per_page, params['page']
           if @language_context_pages.item_count != 0
             @pages = (@language_context_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@language_context_pages.current.first_item.to_f / @language_context_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @language_contexts = @language_contexts[@offset,items_per_page] if @language_contexts[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
