class LiteraryPeriodsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  LiteraryPeriod.content_columns.each do |column|
    in_place_edit_for :literary_period, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'literary_period'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @literary_period_pages, @literary_periods = paginate :literary_period, :per_page => items_per_page, :order_by => sort_clause
    if @literary_period_pages.item_count != 0
      @pages = (@literary_period_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@literary_period_pages.current.first_item.to_f / @literary_period_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @literary_period = LiteraryPeriod.find(params[:id])
  end

  def new
    @literary_period = LiteraryPeriod.new
    @literary_period.created_by = session[:user].login
    @literary_period.created_at = Time.now
    @literary_period.save
    redirect_to :action => 'edit_dynamic', :id => @literary_period.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'literary_period_internal'
    else
    	@divname = 'literary_period'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_period = LiteraryPeriod.new(params[:literary_period])
    if @literary_period.save
      flash[:notice] = 'LiteraryPeriod was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'literary_period_internal'
    else
    	@divname = 'literary_period'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_period = LiteraryPeriod.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'literary_period_internal'
    else
    	@divname = 'literary_period'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @literary_period = LiteraryPeriod.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'literary_period_internal'
    else
    	@divname = 'literary_period'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @literary_period = LiteraryPeriod.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @literary_period = LiteraryPeriod.find(params[:id])
    if session[:user] != nil
      @literary_period.updated_by = session[:user].login
    end
    @literary_period.updated_at = Time.now
    if @literary_period.update_history == nil
      @literary_period.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@literary_period.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @literary_period.update_attributes(params[:literary_period])
      flash[:notice] = 'LiteraryPeriod was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @literary_period
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @literary_period
      end
  end

  def destroy
    LiteraryPeriod.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        LiteraryPeriod.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'literary_periods'
       render :partial => 'literary_periods/edit_contents', :locals => {'@literary_period' => LiteraryPeriod.find(params['pk'])}
     end
    else
      LiteraryPeriod.find(params['id']).destroy unless params['new'] == nil
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
      internal = "literary_period"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @literary_period = LiteraryPeriod.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @literary_period = LiteraryPeriod.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @literary_period = LiteraryPeriod.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @literary_period = LiteraryPeriod.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @literary_period = LiteraryPeriod.find(params['literary_period']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @literary_period = LiteraryPeriod.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @literary_period = LiteraryPeriod.new
  end

  def searchaction
      sort_init 'literary_period'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['literary_period'] != nil
          @array = []
          params['literary_period'].each do |key, val| 
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
        @literary_period_pages, @literary_periods = paginate :literary_periods, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @literary_periods = LiteraryPeriod.find :all, :order => sort_clause
        else
          @literary_periods = LiteraryPeriod.find :all, :conditions => query, :order => sort_clause
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
           @literary_period_pages = Paginator.new self, @literary_periods.length(), items_per_page, params['page']
           if @literary_period_pages.item_count != 0
             @pages = (@literary_period_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@literary_period_pages.current.first_item.to_f / @literary_period_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @literary_periods = @literary_periods[@offset,items_per_page] if @literary_periods[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
