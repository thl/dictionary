class DerivationsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  Derivation.content_columns.each do |column|
    in_place_edit_for :derivation, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'derivation'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @derivation_pages, @derivations = paginate :derivation, :per_page => items_per_page, :order_by => sort_clause
    if @derivation_pages.item_count != 0
      @pages = (@derivation_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@derivation_pages.current.first_item.to_f / @derivation_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @derivation = Derivation.find(params[:id])
  end

  def new
    @derivation = Derivation.new
    @derivation.created_by = session[:user].login
    @derivation.created_at = Time.now
    @derivation.save
    redirect_to :action => 'edit_dynamic', :id => @derivation.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'derivation_internal'
    else
    	@divname = 'derivation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @derivation = Derivation.new(params[:derivation])
    if @derivation.save
      flash[:notice] = 'Derivation was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'derivation_internal'
    else
    	@divname = 'derivation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @derivation = Derivation.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'derivation_internal'
    else
    	@divname = 'derivation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @derivation = Derivation.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'derivation_internal'
    else
    	@divname = 'derivation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @derivation = Derivation.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @derivation = Derivation.find(params[:id])
    if @derivation.created_by == nil or @derivation.created_by == ""
      @derivation.created_by = session[:user].login
      @derivation.created_at = Time.now
    end
    if session[:user] != nil
      @derivation.updated_by = session[:user].login
    end
    @derivation.updated_at = Time.now
    if @derivation.update_history == nil
      @derivation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@derivation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @derivation.update_attributes(params[:derivation])
      flash[:notice] = 'Derivation was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @derivation
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @derivation
      end
  end

  def destroy
    Derivation.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Derivation.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'derivations'
       render :partial => 'derivations/edit_contents', :locals => {'@derivation' => Derivation.find(params['pk'])}
     end
    else
      Derivation.find(params['id']).destroy unless params['new'] == nil
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
      internal = "derivation"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @derivation = Derivation.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @derivation = Derivation.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @derivation = Derivation.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @derivation = Derivation.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @derivation = Derivation.find(params['derivation']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @derivation = Derivation.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @derivation = Derivation.new
  end

  def searchaction
      sort_init 'derivation'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['derivation'] != nil
          @array = []
          params['derivation'].each do |key, val| 
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
        @derivation_pages, @derivations = paginate :derivations, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @derivations = Derivation.find :all, :order => sort_clause
        else
          @derivations = Derivation.find :all, :conditions => query, :order => sort_clause
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
           @derivation_pages = Paginator.new self, @derivations.length(), items_per_page, params['page']
           if @derivation_pages.item_count != 0
             @pages = (@derivation_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@derivation_pages.current.first_item.to_f / @derivation_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @derivations = @derivations[@offset,items_per_page] if @derivations[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
