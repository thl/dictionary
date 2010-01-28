class SpellingsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas


  Spelling.content_columns.each do |column|
    in_place_edit_for :spelling, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end

  def display_category_selector
    @data = Category.find(params['data_id'])
    @spelling = Spelling.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end

  def set_spelling_category_id
    d = Spelling.find(params[:id])
    if d != nil and params[:value] != nil
      d.spelling_category_id = params[:value].to_i
      d.spelling_type = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
        debugger
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'spelling_category', :title => d.spelling_category.title, :id => d.id, :data_id => 4091, :update_id => params[:update_id]})  
  end

  def set_basis_of_spelling_type_id
    d = Spelling.find(params[:id])
    if d != nil and params[:value] != nil
      d.basis_of_spelling_type_id = params[:value].to_i
      d.basis_of_spelling = nil
    end
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
        debugger
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'basis_of_spelling_type', :title => d.basis_of_spelling_type.title, :id => d.id, :data_id => 191, :update_id => params[:update_id]})  
  end

	def set_major_dialect_family_type_id
    d = Spelling.find(params[:id])
    if d != nil and params[:value] != nil
      d.major_dialect_family_type_id = params[:value].to_i
      d.major_dialect_family = nil
    end
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'major_dialect_family_type', :title => d.major_dialect_family_type.title, :id => d.id, :data_id => 638, :update_id => params[:update_id]})  
  end

  def set_literary_genre_type_id
    d = Spelling.find(params[:id])
    if d != nil and params[:value] != nil
      d.literary_genre_type_id = params[:value].to_i
      d.literary_genre = nil
    end
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_genre_type', :title => d.literary_genre_type.title, :id => d.id, :data_id => 119, :update_id => params[:update_id]})  
  end

  def set_literary_period_type_id
    d = Spelling.find(params[:id])
    if d != nil and params[:value] != nil
      d.literary_period_type_id = params[:value].to_i
      d.literary_period = nil
    end
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_period_type', :title => d.literary_period_type.title, :id => d.id, :data_id => 187, :update_id => params[:update_id]})  
  end

  def set_literary_form_type_id
    d = Spelling.find(params[:id])
    if d != nil and params[:value] != nil
      d.literary_form_type_id = params[:value].to_i
      d.literary_form = nil
    end
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_form_type', :title => d.literary_form_type.title, :id => d.id, :data_id => 186, :update_id => params[:update_id]})  
  end

    def set_literary_genre
      puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
      puts params['def_id']
      @definition = Spelling.find(params['id'])
      @definition.update_attribute('literary_genre',params['value'])
      @definition.updated_by = session[:user].login
      @definition.updated_at = Time.now
      if @definition.update_history == nil
        @definition.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@definition.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      @definition.save
      render :text => params['value']
    end

  def set_major_dialect_family
    d = Spelling.find(params[:id])
    d.update_attribute('major_dialect_family',params['value'])
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
    @spelling_pages, @spellings = paginate :spelling, :per_page => items_per_page, :order_by => sort_clause
    if @spelling_pages.item_count != 0
      @pages = (@spelling_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@spelling_pages.current.first_item.to_f / @spelling_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @spelling = Spelling.find(params[:id])
  end

  def new
    @spelling = Spelling.new
    @spelling.created_by = session[:user].login
    @spelling.created_at = Time.now
    @spelling.save
    redirect_to :action => 'edit_dynamic', :id => @spelling.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'spelling_internal'
    else
    	@divname = 'spelling'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling = Spelling.new(params[:spelling])
    if @spelling.save
      flash[:notice] = 'Spelling was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'spelling_internal'
    else
    	@divname = 'spelling'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling = Spelling.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    # @literary_genre = []
    # LiteraryGenre.find(:all).each do |l|
    #   @literary_genre += [l.literary_genre]
    # end
    # @literary_period = []
    # LiteraryPeriod.find(:all).each do |l|
    #   @literary_period += [l.literary_period]
    # end
    # @literary_form = []
    # LiteraryForm.find(:all).each do |l|
    #   @literary_form += [l.literary_form]
    # end
    # @spelling_type = []
    # SourceType.find(:all).each do |s|
    #   @spelling_type += [s.source_type]
    # end
    
    if(params['internal'] != nil)
      @divname = 'spelling_internal'
    else
    	@divname = 'spelling'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling = Spelling.find(params[:id])
    render :layout => false
  end

  def edit_dynamic
    # @literary_genre = []
    # LiteraryGenre.find(:all).each do |l|
    #   @literary_genre += [l.literary_genre]
    # end
    # @literary_period = []
    # LiteraryPeriod.find(:all).each do |l|
    #   @literary_period += [l.literary_period]
    # end
    # @literary_form = []
    # LiteraryForm.find(:all).each do |l|
    #   @literary_form += [l.literary_form]
    # end
    # @spelling_type = []
    # SourceType.find(:all).each do |s|
    #   @spelling_type += [s.source_type]
    # end
    
    if(params['internal'] != nil)
      @divname = 'spelling_internal'
    else
    	@divname = 'spelling'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @spelling = Spelling.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'spelling_internal'
    else
    	@divname = 'spelling'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @spelling = Spelling.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @spelling = Spelling.find(params[:id])
    if @spelling.created_by == nil or @spelling.created_by == ""
      @spelling.created_by = session[:user].login
      @spelling.created_at = Time.now
    end
    if session[:user] != nil
      @spelling.updated_by = session[:user].login
    end
    @spelling.updated_at = Time.now
    if @spelling.update_history == nil
      @spelling.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@spelling.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @spelling.update_attributes(params[:spelling])
      flash[:notice] = 'Spelling was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @spelling
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @spelling
      end
  end

  def destroy
    Spelling.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    Spelling.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     Spelling.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    #  if params['internal'] == 'spellings'
    #    render :partial => 'spellings/edit_contents', :locals => {'@spelling' => Spelling.find(params['pk'])}
    #  end
    # else
    #   Spelling.find(params['id']).destroy unless params['new'] == nil
    #   if session['previous_page'] != 'invalid' and session['previous_page'] != nil
    #     redirect_to session['previous_page']
    #   else
    #     redirect_to $home_page
    #   end
    # end
  end

  def edit_new
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "spelling"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @spelling = Spelling.find(params['id'])
    @spelling.updated_by = session[:user].login
    @spelling.updated_at = Time.now
    if @spelling.update_history == nil
      @spelling.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@spelling.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @spelling.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @spelling.definition = o
      @spelling.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "spellings", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @spelling.meta = o
      @spelling.save
      render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @spelling = Spelling.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @spelling = Spelling.find(params['id'])
    if params["relatedtype"] == "definition"
      @spelling.definition = nil if params['tags'] == nil 
      @spelling.save
    end
    if params["relatedtype"] == "meta"
      @spelling.meta = nil if params['tags'] == nil 
      @spelling.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @spelling = Spelling.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @spelling = Spelling.find(params['spelling']['id'])
    query = ""
     @definitions = nil
     if params["relatedtype"] == "definition"
       @array = []
       params['definition'].each do |key, val| 
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
         @definitions = Definition.find :all
       else
         @definitions = Definition.find :all, :conditions => query
       end
     end
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
         @metas = Meta.find :all
       else
         @metas = Meta.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @spelling = Spelling.find(params['id'])
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @spelling.definition = Definition.find(params['tags'][0])
        @spelling.save
      end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @spelling.meta = Meta.find(params['tags'][0])
        @spelling.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @spelling = Spelling.new
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
        if params['spelling'] != nil
          @array = []
          params['spelling'].each do |key, val| 
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
      if flash['definition'] != nil
        params['definition'] = flash['definition']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['meta'] == nil or params['meta'] == "") and (params['definition'] == nil or params['definition'] == "")
        @spelling_pages, @spellings = paginate :spellings, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @spellings = Spelling.find :all, :order => sort_clause
        else
          @spellings = Spelling.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @spellings
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @spellings = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @spellings
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @spellings = array
    end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition'] != nil
        params['definition'] = flash['definition']
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
           @spelling_pages = Paginator.new self, @spellings.length(), items_per_page, params['page']
           if @spelling_pages.item_count != 0
             @pages = (@spelling_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@spelling_pages.current.first_item.to_f / @spelling_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @spellings = @spellings[@offset,items_per_page] if @spellings[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
