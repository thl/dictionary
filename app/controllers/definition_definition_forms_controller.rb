class DefinitionDefinitionFormsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions


  DefinitionDefinitionForm.content_columns.each do |column|
    in_place_edit_for :definition_definition_form, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end

  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
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
    @definition_definition_form_pages, @definition_definition_forms = paginate :definition_definition_form, :per_page => items_per_page, :order_by => sort_clause
    if @definition_definition_form_pages.item_count != 0
      @pages = (@definition_definition_form_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@definition_definition_form_pages.current.first_item.to_f / @definition_definition_form_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
  end

  def new
    @definition_definition_form = DefinitionDefinitionForm.new
    @definition_definition_form.created_by = session[:user].login
    @definition_definition_form.created_at = Time.now
    @definition_definition_form.save
    redirect_to :action => 'edit_dynamic', :id => @definition_definition_form.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'definition_definition_form_internal'
    else
    	@divname = 'definition_definition_form'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition_form = DefinitionDefinitionForm.new(params[:definition_definition_form])
    if @definition_definition_form.save
      flash[:notice] = 'DefinitionDefinitionForm was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'definition_definition_form_internal'
    else
    	@divname = 'definition_definition_form'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def edit_dynamic
    @role = "Honorific Form, Non-honorific Form, Conjugated Form Past, Conjugated Form Present, Conjugated Form Future, Conjugated Form Imperative, Dialectical correlates, Literary and colloquial correlates, Compounds, Abbreviation, Expansion, Phrases, Paired term, Partial Synonym, Antonym, Poetic expressions, Gloss".split(', ')
    if(params['internal'] != nil)
      @divname = 'definition_definition_form_internal'
    else
    	@divname = 'definition_definition_form'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
    #render :layout => false if params['internal'] != nil
    render :layout => 'staging_popup'
  end
  
  def modal_edit_dynamic
    @role = "Honorific Form, Non-honorific Form, Conjugated Form Past, Conjugated Form Present, Conjugated Form Future, Conjugated Form Imperative, Dialectical correlates, Literary and colloquial correlates, Compounds, Abbreviation, Expansion, Phrases, Paired term, Partial Synonym, Antonym, Poetic expressions, Gloss".split(', ')
    if(params['internal'] != nil)
      @divname = 'definition_definition_form_internal'
    else
    	@divname = 'definition_definition_form'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
    render :layout => 'staging_popup'
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'definition_definition_form_internal'
    else
    	@divname = 'definition_definition_form'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
    if @definition_definition_form.created_by == nil or @definition_definition_form.created_by == ""
      @definition_definition_form.created_by = session[:user].login
      @definition_definition_form.created_at = Time.now
    end
    if session[:user] != nil
      @definition_definition_form.updated_by = session[:user].login
    end
    @definition_definition_form.updated_at = Time.now
    if @definition_definition_form.update_history == nil
      @definition_definition_form.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition_definition_form.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @definition_definition_form.update_attributes(params[:definition_definition_form])
      flash[:notice] = 'DefinitionDefinitionForm was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'definition_tos'
          render :partial => "definition_tos/edit_contents",:locals => {'@definition_to' => Definition.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @definition_definition_form
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definition_froms/edit_contents",:locals => {'@definition_from' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'definition_tos'
          render :partial => "definition_tos/edit_contents",:locals => {'@definition_to' => Definition.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @definition_definition_form
      end
  end

  def destroy
    DefinitionDefinitionForm.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    DefinitionDefinitionForm.find(params['id']).destroy unless params['id'] == nil
    if(params['internal'] != nil)
      if params['new'] != nil
        DefinitionDefinitionForm.find(params['id']).destroy unless params['id'] == nil
      end
      if params['internal'] == 'definitions'
        #render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
        render :partial => "definitions/edit_contents", :locals => {:definition => Definition.find(params['pk'])}
      end
      if params['internal'] == 'definition_tos'
        #render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
        render :partial => "definitions/edit_contents", :locals => {:definition => Definition.find(params['pk'])}
      end
      if params['internal'] == 'definition_definition_forms'
        render :partial => 'definition_definition_forms/edit_contents', :locals => {:definition_definition_form => DefinitionDefinitionForm.find(params['pk'])}
      end
    else
      #redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
      redirect_to :controller => 'definitions', :action => 'public_edit', :id => params['definition_id']

      # DefinitionDefinitionForm.find(params['id']).destroy unless params['new'] == nil
      # if session['previous_page'] != 'invalid' and session['previous_page'] != nil
      #   redirect_to session['previous_page']
      # else
      #   redirect_to $home_page
      # end
    end
  end

  def edit_new
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "definition_definition_form"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    @definition_definition_form.updated_by = session[:user].login
    @definition_definition_form.updated_at = Time.now
    if @definition_definition_form.update_history == nil
      @definition_definition_form.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition_definition_form.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @definition_definition_form.save
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @definition_definition_form.meta = o
      @definition_definition_form.save
      #render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to meta_metadata_edit_dynamic_meta_url(o.id)
    end
    if params["relatedtype"] == "definition_from"
      o = Definition.new
      o.save
      @definition_definition_form.definition_from = o
      @definition_definition_form.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "definition_definition_forms", 'pk' => params['id'], 'relatedtype'=> 'definition_from', 'level' => params['level'], 'new' => 'yes'}
    end
    if params["relatedtype"] == "definition_to"
      o = Definition.new
      o.save
      @definition_definition_form.definition_to = o
      @definition_definition_form.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "definition_definition_forms", 'pk' => params['id'], 'relatedtype'=> 'definition_to', 'level' => params['level'], 'new' => 'yes'}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    if params["relatedtype"] == "definition_from"
      @definition_definition_form.definition_from = nil if params['tags'] == nil 
      @definition_definition_form.save
    end
    if params["relatedtype"] == "definition_to"
      @definition_definition_form.definition_to = nil if params['tags'] == nil 
      @definition_definition_form.save
    end
    #render :partial => "edit_contents"
    render :partial => "edit_contents", :locals => {:definition_definition_form => @definition_definition_form}
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    render :layout => false
  end

  def edit_search_action
    @definition_definition_form = DefinitionDefinitionForm.find(params['definition_definition_form']['id'])
    #@definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    query = ""
     @definition_froms = nil
     if params["relatedtype"] == "definition_from"
       @array = []
       params['internal_definition'].each do |key, val| 
         if val != ""
            space = Unicode::U0F0B
            line = Unicode::U0F0D
            val = val.gsub(line,'')
             val = val.gsub(space,'_space_')
             a = val.split('_space_')
             word = ''
             a.each {|w| 
               word += space if word != ''
               word += w 
             }
             val = word                  
           if query != ""
             query = query + " and "
           end
           query = query + key + " ilike ?"
           @array.push("%"+val+"%")
         end
       end
       query = [query]+@array
       if query == [""]
         @definition_froms = Definition.find_all
       else
         @definition_froms = Definition.find :all, :conditions => query
       end
     end
     @definition_tos = nil
     if params["relatedtype"] == "definition_to"
       @array = []
       params['internal_definition'].each do |key, val| 
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
         @definition_tos = Definition.find :all
       else
         @definition_tos = Definition.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    @definition_definition_form.updated_by = session[:user].login
    @definition_definition_form.updated_at = Time.now
    if @definition_definition_form.update_history == nil
      @definition_definition_form.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@definition_definition_form.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    if params["relatedtype"] == "definition_from"
      if params['tags'] != nil
        @definition_definition_form.definition_from = Definition.find(params['tags'][0])
        @definition_definition_form.save
      end
    end
    if params["relatedtype"] == "definition_to"
      if params['tags'] != nil
        @definition_definition_form.definition_to = Definition.find(params['tags'][0])
        @definition_definition_form.save
      end
    end
    #render :partial => 'edit_contents'
    render :partial => 'edit_contents', :locals => {:definition_definition_form => @definition_definition_form}
  end

  def search
      @definition_definition_form = DefinitionDefinitionForm.new
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
        if params['definition_definition_form'] != nil
          @array = []
          params['definition_definition_form'].each do |key, val| 
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
      if flash['definition_from'] != nil
        params['definition_from'] = flash['definition_from']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition_to'] != nil
        params['definition_to'] = flash['definition_to']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['definition_from'] == nil or params['definition_from'] == "") and (params['definition_to'] == nil or params['definition_to'] == "")
        @definition_definition_form_pages, @definition_definition_forms = paginate :definition_definition_forms, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @definition_definition_forms = DefinitionDefinitionForm.find :all, :order => sort_clause
        else
          @definition_definition_forms = DefinitionDefinitionForm.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['definition_from'] != nil and params['definition_from'] != ""
      flash['definition_from'] = params['definition_from']
      for o in @definition_definition_forms
        if o.definition_from != nil
          if string_contains o.definition_from.displayInfo, params['definition_from']
            array = array + [o]
          end
        end
      end
      @definition_definition_forms = array
    end
    array = []
    if params['definition_to'] != nil and params['definition_to'] != ""
      flash['definition_to'] = params['definition_to']
      for o in @definition_definition_forms
        if o.definition_to != nil
          if string_contains o.definition_to.displayInfo, params['definition_to']
            array = array + [o]
          end
        end
      end
      @definition_definition_forms = array
    end
      if flash['definition_from'] != nil
        params['definition_from'] = flash['definition_from']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition_to'] != nil
        params['definition_to'] = flash['definition_to']
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
           @definition_definition_form_pages = Paginator.new self, @definition_definition_forms.length(), items_per_page, params['page']
           if @definition_definition_form_pages.item_count != 0
             @pages = (@definition_definition_form_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@definition_definition_form_pages.current.first_item.to_f / @definition_definition_form_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @definition_definition_forms = @definition_definition_forms[@offset,items_per_page] if @definition_definition_forms[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
