class SourcesController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  # helper :metas


  Source.content_columns.each do |column|
    in_place_edit_for :source, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end

  def set_source_source_id
    d = Source.find(params[:id])
    d.update_attribute('source_id',params['value'])
    d.updated_by = session[:user].login
    d.updated_at = Time.now
    if d.update_history == nil
      d.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    d.save
    render :text => params['value']
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
    @source_pages, @sources = paginate :source, :per_page => items_per_page, :order_by => sort_clause
    if @source_pages.item_count != 0
      @pages = (@source_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@source_pages.current.first_item.to_f / @source_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = Source.new
    @source.created_by = session[:user].login
    @source.created_at = Time.now
    @source.save
    redirect_to :action => 'edit_dynamic', :id => @source.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'source_internal'
    else
    	@divname = 'source'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @source = Source.new(params[:source])
    if @source.save
      flash[:notice] = 'Source was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'source_internal'
    else
    	@divname = 'source'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @source = Source.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def edit_dynamic
    puts '------source'
    if(params['internal'] != nil)
      @divname = 'source_internal'
    else
    	@divname = 'source'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @source = Source.find(params[:id])
    # breakpoint
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end
    render :layout => false
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'source_internal'
    else
    	@divname = 'source'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @source = Source.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @source = Source.find(params[:id])
    if @source.created_by == nil or @source.created_by == ""
      @source.created_by = session[:user].login
    @source.created_at = Time.now
    end
    if session[:user] != nil
      @source.updated_by = session[:user].login
    end
    @source.updated_at = Time.now
    if @source.update_history == nil
      @source.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@source.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @source.update_attributes(params[:source])
      flash[:notice] = 'Source was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @source
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
        redirect_to :action => 'show', :id => @source
      end
  end

  def destroy
    Source.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Source.find(params['id']).destroy unless params['id'] == nil
      end
    if params['internal'] == 'metas'
      render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    end
     if params['internal'] == 'sources'
       render :partial => 'sources/edit_contents', :locals => {'@source' => Source.find(params['pk'])}
     end
    else
      Source.find(params['id']).destroy unless params['new'] == nil
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
      internal = "source"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @source = Source.find(params['id'])
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.save
      @source.metas << o
      render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "sources", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @source = Source.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @source = Source.find(params['id'])
    if params["relatedtype"] == "meta"
      if @source.metas != nil 
        if params['tags'] != nil 
          @source.metas.delete(@source.metas - Meta.find(params['tags']))
        else
          @source.metas.delete(@source.metas)
    	  end
    	end
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @source = Source.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @source = Source.find(params['source']['id'])
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
    render :layout => false
  end

  def edit_add_to_list_action
    @source = Source.find(params['id'])
    if params["relatedtype"] == "meta"
      if @source.metas == nil 
        if params['tags'] != nil 
          @source.metas = Meta.find(params['tags'])
        end
      else
        if params['tags'] != nil 
          @source.metas.delete(@source.metas - Meta.find(params['tags']))
          @source.metas << Meta.find(params['tags']) - @source.metas 
        end
    	end
    end
    render_partial 'edit_contents'
  end

  def search
      @source = Source.new
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
        if params['source'] != nil
          @array = []
          params['source'].each do |key, val| 
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
      if flash['metas'] != nil
        params['metas'] = flash['metas']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['metas'] == nil or params['metas'] == "")
        @source_pages, @sources = paginate :sources, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @sources = Source.find :all, :order => sort_clause
        else
          @sources = Source.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['metas'] != nil and params['metas'] != ""
      flash['metas'] = params['metas']
      for o in @sources
        found = 0
        for obj in o.metas
          if string_contains obj.displayInfo, params['metas']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @sources = array
    end
      if flash['metas'] != nil
        params['metas'] = flash['metas']
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
           @source_pages = Paginator.new self, @sources.length(), items_per_page, params['page']
           if @source_pages.item_count != 0
             @pages = (@source_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@source_pages.current.first_item.to_f / @source_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @sources = @sources[@offset,items_per_page] if @sources[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end

  def edit_dynamic_source
    #debugger
    if(params['internal'] != nil)
      @divname = 'source_internal'
    else
    	@divname = 'source'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @source = Source.find(params[:id])
    #@meta = Meta.find(params[:meta])
    @source_type = []
    SourceType.find(:all).each do |l|
      @source_type += [l.source_type]
    end
    #render :layout => 'staging_popup'
    render :layout => false
  end
  
  def update_dynamic_source
      
      @source = Source.find(params[:id])
      if @source.created_by == nil or @source.created_by == ""
        @source.created_by = session[:user].login
      @source.created_at = Time.now
      end
      if session[:user] != nil
        @source.updated_by = session[:user].login
      end
      @source.updated_at = Time.now
      if @source.update_history == nil
        @source.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@source.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      if @source.update_attributes(params[:source])
        #render :nothing => true
        render_sources  
      else
      end
  end  
  
  def render_sources
    @source = Source.find(params[:id])
    @temp_meta = Meta.find(@source.metas.first.id)
    #@temp_definition = Definition.find(@translation.definition_id) 
 	  render :update do |page|
      #yield(page) if block_given?     	    
      page.replace_html "#{@source.metas.first.id}_meta_sources_div", :partial => 'sources/index', :locals => {:meta => @temp_meta, :head_id => @temp_definition}
    end
  end
  
  def update_source_note
      @source = Source.find(params[:source][:id])
      if @source.created_by == nil or @source.created_by == ""
             @source.created_by = session[:user].login
             @source.created_at = Time.now
      end
      if session[:user] != nil
             @source.updated_by = session[:user].login
      end
      @source.updated_at = Time.now
      if @source.update_history == nil
        @source.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @source.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @source.update_attributes(params[:source])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @source, :divsuffix => "_snotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @source
        end
      end
  end

  def source_note_show
      @source = Source.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @source, :divsuffix => "_snotediv"}
  end

  def source_note_edit
      @source = Source.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @source, :divsuffix => "_snotediv"}
  end  
  
end
