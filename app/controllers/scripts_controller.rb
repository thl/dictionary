class ScriptsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  Script.content_columns.each do |column|
    in_place_edit_for :script, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'script'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @script_pages, @scripts = paginate :script, :per_page => items_per_page, :order_by => sort_clause
    if @script_pages.item_count != 0
      @pages = (@script_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@script_pages.current.first_item.to_f / @script_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @script = Script.find(params[:id])
  end

  def new
    @script = Script.new
    @script.created_by = session[:user].login
    @script.created_at = Time.now
    @script.save
    redirect_to :action => 'edit_dynamic', :id => @script.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'script_internal'
    else
    	@divname = 'script'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @script = Script.new(params[:script])
    if @script.save
      flash[:notice] = 'Script was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'script_internal'
    else
    	@divname = 'script'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @script = Script.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'script_internal'
    else
    	@divname = 'script'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @script = Script.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'script_internal'
    else
    	@divname = 'script'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @script = Script.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @script = Script.find(params[:id])
    if session[:user] != nil
      @script.updated_by = session[:user].login
    end
    @script.updated_at = Time.now
    if @script.update_history == nil
      @script.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@script.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @script.update_attributes(params[:script])
      flash[:notice] = 'Script was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @script
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @script
      end
  end

  def destroy
    Script.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Script.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'scripts'
       render :partial => 'scripts/edit_contents', :locals => {'@script' => Script.find(params['pk'])}
     end
    else
      Script.find(params['id']).destroy unless params['new'] == nil
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
      internal = "script"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @script = Script.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @script = Script.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @script = Script.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @script = Script.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @script = Script.find(params['script']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @script = Script.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @script = Script.new
  end

  def searchaction
      sort_init 'script'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['script'] != nil
          @array = []
          params['script'].each do |key, val| 
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
        @script_pages, @scripts = paginate :scripts, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @scripts = Script.find :all, :order => sort_clause
        else
          @scripts = Script.find :all, :conditions => query, :order => sort_clause
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
           @script_pages = Paginator.new self, @scripts.length(), items_per_page, params['page']
           if @script_pages.item_count != 0
             @pages = (@script_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@script_pages.current.first_item.to_f / @script_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @scripts = @scripts[@offset,items_per_page] if @scripts[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
