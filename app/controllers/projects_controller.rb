class ProjectsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  Project.content_columns.each do |column|
    in_place_edit_for :project, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'project'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    puts '------------'
    puts sort_clause
    @project_pages, @projects = paginate :project, :per_page => items_per_page, :order_by => sort_clause
    if @project_pages.item_count != 0
      @pages = (@project_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@project_pages.current.first_item.to_f / @project_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.created_by = session[:user].login
    @project.created_at = Time.now
    @project.save
    redirect_to :action => 'edit_dynamic', :id => @project.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'project_internal'
    else
    	@divname = 'project'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'project_internal'
    else
    	@divname = 'project'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @project = Project.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'project_internal'
    else
    	@divname = 'project'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @project = Project.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'project_internal'
    else
    	@divname = 'project'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @project = Project.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @project = Project.find(params[:id])
    if session[:user] != nil
      @project.updated_by = session[:user].login
    end
    @project.updated_at = Time.now
    if @project.update_history == nil
      @project.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@project.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @project
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @project
      end
  end

  def destroy
    Project.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Project.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'projects'
       render :partial => 'projects/edit_contents', :locals => {'@project' => Project.find(params['pk'])}
     end
    else
      Project.find(params['id']).destroy unless params['new'] == nil
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
      internal = "project"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @project = Project.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @project = Project.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @project = Project.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @project = Project.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @project = Project.find(params['project']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @project = Project.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @project = Project.new
  end

  def searchaction
      sort_init 'project'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['project'] != nil
          @array = []
          params['project'].each do |key, val| 
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
        @project_pages, @projects = paginate :projects, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @projects = Project.find :all, :order => sort_clause
        else
          @projects = Project.find :all, :conditions => query, :order => sort_clause
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
           @project_pages = Paginator.new self, @projects.length(), items_per_page, params['page']
           if @project_pages.item_count != 0
             @pages = (@project_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@project_pages.current.first_item.to_f / @project_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @projects = @projects[@offset,items_per_page] if @projects[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
