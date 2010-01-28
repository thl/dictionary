class ThematicClassificationsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  ThematicClassification.content_columns.each do |column|
    in_place_edit_for :thematic_classification, column.name
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
    @thematic_classification_pages, @thematic_classifications = paginate :thematic_classification, :per_page => items_per_page, :order_by => sort_clause
    if @thematic_classification_pages.item_count != 0
      @pages = (@thematic_classification_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@thematic_classification_pages.current.first_item.to_f / @thematic_classification_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @thematic_classification = ThematicClassification.find(params[:id])
  end

  def new
    @thematic_classification = ThematicClassification.new
    @thematic_classification.created_by = session[:user].login
    @thematic_classification.created_at = Time.now
    @thematic_classification.save
    redirect_to :action => 'edit_dynamic', :id => @thematic_classification.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'thematic_classification_internal'
    else
    	@divname = 'thematic_classification'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @thematic_classification = ThematicClassification.new(params[:thematic_classification])
    if @thematic_classification.save
      flash[:notice] = 'ThematicClassification was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'thematic_classification_internal'
    else
    	@divname = 'thematic_classification'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @thematic_classification = ThematicClassification.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'thematic_classification_internal'
    else
    	@divname = 'thematic_classification'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @thematic_classification = ThematicClassification.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'thematic_classification_internal'
    else
    	@divname = 'thematic_classification'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @thematic_classification = ThematicClassification.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @thematic_classification = ThematicClassification.find(params[:id])
    if session[:user] != nil
      @thematic_classification.updated_by = session[:user].login
    end
    @thematic_classification.updated_at = Time.now
    if @thematic_classification.update_history == nil
      @thematic_classification.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@thematic_classification.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @thematic_classification.update_attributes(params[:thematic_classification])
      flash[:notice] = 'ThematicClassification was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @thematic_classification
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @thematic_classification
      end
  end

  def destroy
    ThematicClassification.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        ThematicClassification.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'thematic_classifications'
       render :partial => 'thematic_classifications/edit_contents', :locals => {'@thematic_classification' => ThematicClassification.find(params['pk'])}
     end
    else
      ThematicClassification.find(params['id']).destroy unless params['new'] == nil
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
      internal = "thematic_classification"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @thematic_classification = ThematicClassification.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @thematic_classification = ThematicClassification.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @thematic_classification = ThematicClassification.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @thematic_classification = ThematicClassification.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @thematic_classification = ThematicClassification.find(params['thematic_classification']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @thematic_classification = ThematicClassification.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @thematic_classification = ThematicClassification.new
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
        if params['thematic_classification'] != nil
          @array = []
          params['thematic_classification'].each do |key, val| 
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
        @thematic_classification_pages, @thematic_classifications = paginate :thematic_classifications, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @thematic_classifications = ThematicClassification.find :all, :order => sort_clause
        else
          @thematic_classifications = ThematicClassification.find :all, :conditions => query, :order => sort_clause
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
           @thematic_classification_pages = Paginator.new self, @thematic_classifications.length(), items_per_page, params['page']
           if @thematic_classification_pages.item_count != 0
             @pages = (@thematic_classification_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@thematic_classification_pages.current.first_item.to_f / @thematic_classification_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @thematic_classifications = @thematic_classifications[@offset,items_per_page] if @thematic_classifications[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
