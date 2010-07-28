class UsersController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  #User.content_columns.each do |column|
  #  in_place_update_form :user, column.name
  #end

  def index
    #list
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
    @user_pages, @users = paginate :user, :per_page => items_per_page, :order_by => sort_clause
    if @user_pages.item_count != 0
      @pages = (@user_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@user_pages.current.first_item.to_f / @user_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    #@user.created_by = session[:user].login
    @user.login
    #@user.created_at = Time.now
    @user.save
    debugger
    redirect_to :action => 'edit_dynamic', :id => @user.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'user_internal'
    else
    	@divname = 'user'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'user_internal'
    else
    	@divname = 'user'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @user = User.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    debugger
    if(params['internal'] != nil)
      @divname = 'user_internal'
    else
    	@divname = 'user'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @user = User.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'user_internal'
    else
    	@divname = 'user'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @user = User.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @user = User.find(params[:id])
    if session[:user] != nil
      @user.updated_by = session[:user].login
    end
    @user.updated_at = Time.now
    if @user.update_history == nil
      @user.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@user.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @user
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @user
      end
  end

  def destroy
    User.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        User.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'users'
       render :partial => 'users/edit_contents', :locals => {'@user' => User.find(params['pk'])}
     end
    else
      User.find(params['id']).destroy unless params['new'] == nil
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
      internal = "user"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @user = User.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @user = User.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @user = User.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @user = User.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @user = User.find(params['user']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @user = User.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @user = User.new
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
        if params['user'] != nil
          @array = []
          params['user'].each do |key, val| 
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
        @user_pages, @users = paginate :users, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @users = User.find :all, :order => sort_clause
        else
          @users = User.find :all, :conditions => query, :order => sort_clause
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
           @user_pages = Paginator.new self, @users.length(), items_per_page, params['page']
           if @user_pages.item_count != 0
             @pages = (@user_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@user_pages.current.first_item.to_f / @user_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @users = @users[@offset,items_per_page] if @users[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
