class PronunciationTypesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  PronunciationType.content_columns.each do |column|
    in_place_edit_for :pronunciation_type, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'pronunciation_type'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @pronunciation_type_pages, @pronunciation_types = paginate :pronunciation_type, :per_page => items_per_page, :order_by => sort_clause
    if @pronunciation_type_pages.item_count != 0
      @pages = (@pronunciation_type_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@pronunciation_type_pages.current.first_item.to_f / @pronunciation_type_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @pronunciation_type = PronunciationType.find(params[:id])
  end

  def new
    @pronunciation_type = PronunciationType.new
    @pronunciation_type.created_by = session[:user].login
    @pronunciation_type.created_at = Time.now
    @pronunciation_type.save
    redirect_to :action => 'edit_dynamic', :id => @pronunciation_type.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'pronunciation_type_internal'
    else
    	@divname = 'pronunciation_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @pronunciation_type = PronunciationType.new(params[:pronunciation_type])
    if @pronunciation_type.save
      flash[:notice] = 'PronunciationType was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'pronunciation_type_internal'
    else
    	@divname = 'pronunciation_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @pronunciation_type = PronunciationType.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'pronunciation_type_internal'
    else
    	@divname = 'pronunciation_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @pronunciation_type = PronunciationType.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'pronunciation_type_internal'
    else
    	@divname = 'pronunciation_type'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @pronunciation_type = PronunciationType.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @pronunciation_type = PronunciationType.find(params[:id])
    if session[:user] != nil
      @pronunciation_type.updated_by = session[:user].login
    end
    @pronunciation_type.updated_at = Time.now
    if @pronunciation_type.update_history == nil
      @pronunciation_type.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@pronunciation_type.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @pronunciation_type.update_attributes(params[:pronunciation_type])
      flash[:notice] = 'PronunciationType was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @pronunciation_type
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @pronunciation_type
      end
  end

  def destroy
    PronunciationType.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        PronunciationType.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'pronunciation_types'
       render :partial => 'pronunciation_types/edit_contents', :locals => {'@pronunciation_type' => PronunciationType.find(params['pk'])}
     end
    else
      PronunciationType.find(params['id']).destroy unless params['new'] == nil
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
      internal = "pronunciation_type"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @pronunciation_type = PronunciationType.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @pronunciation_type = PronunciationType.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @pronunciation_type = PronunciationType.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @pronunciation_type = PronunciationType.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @pronunciation_type = PronunciationType.find(params['pronunciation_type']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @pronunciation_type = PronunciationType.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @pronunciation_type = PronunciationType.new
  end

  def searchaction
      sort_init 'pronunciation_type'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['pronunciation_type'] != nil
          @array = []
          params['pronunciation_type'].each do |key, val| 
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
        @pronunciation_type_pages, @pronunciation_types = paginate :pronunciation_types, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @pronunciation_types = PronunciationType.find :all, :order => sort_clause
        else
          @pronunciation_types = PronunciationType.find :all, :conditions => query, :order => sort_clause
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
           @pronunciation_type_pages = Paginator.new self, @pronunciation_types.length(), items_per_page, params['page']
           if @pronunciation_type_pages.item_count != 0
             @pages = (@pronunciation_type_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@pronunciation_type_pages.current.first_item.to_f / @pronunciation_type_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @pronunciation_types = @pronunciation_types[@offset,items_per_page] if @pronunciation_types[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
