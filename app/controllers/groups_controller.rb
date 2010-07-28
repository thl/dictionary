class GroupsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :metas


  #Group.content_columns.each do |column|
  #  in_place_update_form :group, column.name
  #end
  #Meta.content_columns.each do |column|
  #  in_place_update_form :meta, column.name
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
    @group_pages, @groups = paginate :group, :per_page => items_per_page, :order_by => sort_clause
    if @group_pages.item_count != 0
      @pages = (@group_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@group_pages.current.first_item.to_f / @group_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    @group.created_by = session[:user].login
    @group.created_at = Time.now
    @group.save
    redirect_to :action => 'edit_dynamic', :id => @group.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'group_internal'
    else
    	@divname = 'group'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @group = Group.new(params[:group])
    if @group.save
      flash[:notice] = 'Group was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'group_internal'
    else
    	@divname = 'group'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @group = Group.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'group_internal'
    else
    	@divname = 'group'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @group = Group.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'group_internal'
    else
    	@divname = 'group'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @group = Group.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @group = Group.find(params[:id])
    if @group.created_by == nil or @group.created_by == ""
      @group.created_by = session[:user].login
      @group.created_at = Time.now
    end
    if session[:user] != nil
      @group.updated_by = session[:user].login
    end
    @group.updated_at = Time.now
    if @group.update_history == nil
      @group.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@group.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @group.update_attributes(params[:group])
      flash[:notice] = 'Group was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @group
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @group
      end
  end

  def destroy
    Group.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Group.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'metas'
      render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    end
     if params['internal'] == 'groups'
       render :partial => 'groups/edit_contents', :locals => {'@group' => Group.find(params['pk'])}
     end
    else
      Group.find(params['id']).destroy unless params['new'] == nil
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
      internal = "group"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @group = Group.find(params['id'])
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.save
      @group.meta = o
      @group.save
      render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "groups", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @group = Group.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @group = Group.find(params['id'])
    if params["relatedtype"] == "meta"
      @group.meta = nil if params['tags'] == nil 
      @group.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @group = Group.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @group = Group.find(params['group']['id'])
    query = ""
     @metas = nil
     if params["relatedtype"] == "meta"
       @array = []
       params['meta'].each do |key, val| 
         if val != ""
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @metas = Meta.find_all
       else
         @metas = Meta.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @group = Group.find(params['id'])
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @group.meta = Meta.find(params['tags'][0])
        @group.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @group = Group.new
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
        if params['group'] != nil
          @array = []
          params['group'].each do |key, val| 
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
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['meta'] == nil or params['meta'] == "")
        @group_pages, @groups = paginate :groups, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @groups = Group.find :all, :order => sort_clause
        else
          @groups = Group.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @groups
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @groups = array
    end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
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
           @group_pages = Paginator.new self, @groups.length(), items_per_page, params['page']
           if @group_pages.item_count != 0
             @pages = (@group_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@group_pages.current.first_item.to_f / @group_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @groups = @groups[@offset,items_per_page] if @groups[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
