class ModelSentenceTypesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  #ModelSentenceType.content_columns.each do |column|
  #  in_place_update_form :model_sentence_type, column.name
  #end

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
    @model_sentence_type_pages, @model_sentence_types = paginate :model_sentence_type, :per_page => items_per_page, :order_by => sort_clause
    if @model_sentence_type_pages.item_count != 0
      @pages = (@model_sentence_type_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@model_sentence_type_pages.current.first_item.to_f / @model_sentence_type_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @model_sentence_type = ModelSentenceType.find(params[:id])
  end

  def new
    @model_sentence_type = ModelSentenceType.new
    @model_sentence_type.created_by = session[:user].login
    @model_sentence_type.created_at = Time.now
    @model_sentence_type.save
    redirect_to :action => 'edit_dynamic', :id => @model_sentence_type.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'model_sentence_type_internal'
    else
    	@divname = 'model_sentence_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @model_sentence_type = ModelSentenceType.new(params[:model_sentence_type])
    if @model_sentence_type.save
      flash[:notice] = 'ModelSentenceType was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'model_sentence_type_internal'
    else
    	@divname = 'model_sentence_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @model_sentence_type = ModelSentenceType.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'model_sentence_type_internal'
    else
    	@divname = 'model_sentence_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @model_sentence_type = ModelSentenceType.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'model_sentence_type_internal'
    else
    	@divname = 'model_sentence_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @model_sentence_type = ModelSentenceType.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @model_sentence_type = ModelSentenceType.find(params[:id])
    if session[:user] != nil
      @model_sentence_type.updated_by = session[:user].login
    end
    @model_sentence_type.updated_at = Time.now
    if @model_sentence_type.update_history == nil
      @model_sentence_type.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@model_sentence_type.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @model_sentence_type.update_attributes(params[:model_sentence_type])
      flash[:notice] = 'ModelSentenceType was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @model_sentence_type
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @model_sentence_type
      end
  end

  def destroy
    ModelSentenceType.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        ModelSentenceType.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'model_sentence_types'
       render :partial => 'model_sentence_types/edit_contents', :locals => {'@model_sentence_type' => ModelSentenceType.find(params['pk'])}
     end
    else
      ModelSentenceType.find(params['id']).destroy unless params['new'] == nil
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
      internal = "model_sentence_type"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @model_sentence_type = ModelSentenceType.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @model_sentence_type = ModelSentenceType.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @model_sentence_type = ModelSentenceType.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @model_sentence_type = ModelSentenceType.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @model_sentence_type = ModelSentenceType.find(params['model_sentence_type']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @model_sentence_type = ModelSentenceType.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @model_sentence_type = ModelSentenceType.new
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
        if params['model_sentence_type'] != nil
          @array = []
          params['model_sentence_type'].each do |key, val| 
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
        @model_sentence_type_pages, @model_sentence_types = paginate :model_sentence_types, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @model_sentence_types = ModelSentenceType.find :all, :order => sort_clause
        else
          @model_sentence_types = ModelSentenceType.find :all, :conditions => query, :order => sort_clause
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
           @model_sentence_type_pages = Paginator.new self, @model_sentence_types.length(), items_per_page, params['page']
           if @model_sentence_type_pages.item_count != 0
             @pages = (@model_sentence_type_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@model_sentence_type_pages.current.first_item.to_f / @model_sentence_type_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @model_sentence_types = @model_sentence_types[@offset,items_per_page] if @model_sentence_types[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
