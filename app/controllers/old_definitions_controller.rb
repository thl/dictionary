class OldDefinitionsController < ApplicationController
  layout 'staging_new'
  helper :habtm
  helper :sort
  include SortHelper



  OldDefinition.content_columns.each do |column|
    in_place_edit_for :old_definition, column.name
  end

  def public_show_list
    @old_definition = OldDefinition.find(params[:id])
    render :layout => false
    # render :text => 'done'
    # render :template => '/definitions/edit_show'
  end

  def public_show
    @old_definition = OldDefinition.find(params[:id])
    render :layout => 'thdl_home'
  end

  def public_edit
    @old_definition = OldDefinition.find(params[:id])
    render :layout => 'staging'
  end
  
  def display_history
	  @history = params[:history]
	  render :partial => 'partial/display_history'
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
    @old_definition_pages, @old_definitions = paginate :old_definition, :per_page => items_per_page, :order_by => sort_clause
    if @old_definition_pages.item_count != 0
      @pages = (@old_definition_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@old_definition_pages.current.first_item.to_f / @old_definition_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @old_definition = OldDefinition.find(params[:id])
  end

  def new
    @old_definition = OldDefinition.new
    @old_definition.created_by = session[:user].login
    @old_definition.created_at = Time.now
    @old_definition.save
    redirect_to :action => 'edit_dynamic', :id => @old_definition.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'old_definition_internal'
    else
    	@divname = 'old_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @old_definition = OldDefinition.new(params[:old_definition])
    if @old_definition.save
      flash[:notice] = 'OldDefinition was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'old_definition_internal'
    else
    	@divname = 'old_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @old_definition = OldDefinition.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'old_definition_internal'
    else
    	@divname = 'old_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @old_definition = OldDefinition.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'old_definition_internal'
    else
    	@divname = 'old_definition'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @old_definition = OldDefinition.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @old_definition = OldDefinition.find(params[:id])
    if @old_definition.created_by == nil or @old_definition.created_by == ""
      @old_definition.created_by = session[:user].login
    @old_definition.created_at = Time.now
    end
    if session[:user] != nil
      @old_definition.updated_by = session[:user].login
    end
    @old_definition.updated_at = Time.now
    if @old_definition.update_history == nil
      @old_definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@old_definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @old_definition.update_attributes(params[:old_definition])
      flash[:notice] = 'OldDefinition was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @old_definition
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @old_definition
      end
  end

  def destroy
    OldDefinition.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        OldDefinition.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'old_definitions'
       render :partial => 'old_definitions/edit_contents', :locals => {'@old_definition' => OldDefinition.find(params['pk'])}
     end
    else
      OldDefinition.find(params['id']).destroy unless params['new'] == nil
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
      internal = "old_definition"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @old_definition = OldDefinition.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @old_definition = OldDefinition.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @old_definition = OldDefinition.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @old_definition = OldDefinition.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @old_definition = OldDefinition.find(params['old_definition']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @old_definition = OldDefinition.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @old_definition = OldDefinition.new
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
        if params['old_definition'] != nil
          @array = []
          params['old_definition'].each do |key, val| 
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
        @old_definition_pages, @old_definitions = paginate :old_definitions, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @old_definitions = OldDefinition.find :all, :order => sort_clause
        else
          @old_definitions = OldDefinition.find :all, :conditions => query, :order => sort_clause
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
           @old_definition_pages = Paginator.new self, @old_definitions.length(), items_per_page, params['page']
           if @old_definition_pages.item_count != 0
             @pages = (@old_definition_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@old_definition_pages.current.first_item.to_f / @old_definition_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @old_definitions = @old_definitions[@offset,items_per_page] if @old_definitions[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
