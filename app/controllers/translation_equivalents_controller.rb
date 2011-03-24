class TranslationEquivalentsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas


  TranslationEquivalent.content_columns.each do |column|
    in_place_edit_for :translation_equivalent, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end

  def set_language_type_id
    d = TranslationEquivalent.find(params[:id])
    if d != nil and params[:value] != nil
      d.language_type_id = params[:value].to_i
      d.language = nil
    end
    d.save
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'language_type', :title => d.language_type.title, :id => d.id, :data_id => 184, :update_id => params[:update_id]})  
  end

  def display_category_selector
    @data = Category.find(params['data_id'])
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
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
    @translation_equivalent_pages, @translation_equivalents = paginate :translation_equivalent, :per_page => items_per_page, :order_by => sort_clause
    if @translation_equivalent_pages.item_count != 0
      @pages = (@translation_equivalent_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@translation_equivalent_pages.current.first_item.to_f / @translation_equivalent_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @translation_equivalent = TranslationEquivalent.find(params[:id])
  end

  def new
    @translation_equivalent = TranslationEquivalent.new
    @translation_equivalent.created_by = session[:user].login
    @translation_equivalent.created_at = Time.now
    @translation_equivalent.save
    #redirect_to :action => 'edit_dynamic', :id => @translation_equivalent.id, :params => {'new' => 'true'}
    redirect_to :action => 'edit_dynamic_translation_equivalent', :id => @translation_equivalent.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'translation_equivalent_internal'
    else
    	@divname = 'translation_equivalent'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation_equivalent = TranslationEquivalent.new(params[:translation_equivalent])
    if @translation_equivalent.save
      flash[:notice] = 'TranslationEquivalent was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'translation_equivalent_internal'
    else
    	@divname = 'translation_equivalent'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    if(params['internal'] != nil)
      @divname = 'translation_equivalent_internal'
    else
    	@divname = 'translation_equivalent'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    render :layout => false 
  end

  def edit_dynamic
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    if(params['internal'] != nil)
      @divname = 'translation_equivalent_internal'
    else
    	@divname = 'translation_equivalent'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'translation_equivalent_internal'
    else
    	@divname = 'translation_equivalent'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    if @translation_equivalent.created_by == nil or @translation_equivalent.created_by == ""
      @translation_equivalent.created_by = session[:user].login
      @translation_equivalent.created_at = Time.now
    end
    if session[:user] != nil
      @translation_equivalent.updated_by = session[:user].login
    end
    @translation_equivalent.updated_at = Time.now
    if @translation_equivalent.update_history == nil
      @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @translation_equivalent.update_attributes(params[:translation_equivalent])
      flash[:notice] = 'TranslationEquivalent was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @translation_equivalent
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
        redirect_to :action => 'show', :id => @translation_equivalent
      end
  end

  def destroy
    TranslationEquivalent.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    TranslationEquivalent.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     TranslationEquivalent.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    #  if params['internal'] == 'translation_equivalents'
    #    render :partial => 'translation_equivalents/edit_contents', :locals => {'@translation_equivalent' => TranslationEquivalent.find(params['pk'])}
    #  end
    # else
    #   TranslationEquivalent.find(params['id']).destroy unless params['new'] == nil
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
      internal = "translation_equivalent"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @translation_equivalent = TranslationEquivalent.find(params['id'])
    @translation_equivalent.updated_by = session[:user].login
    @translation_equivalent.updated_at = Time.now
    if @translation_equivalent.update_history == nil
      @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @translation_equivalent.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @translation_equivalent.definition = o
      @translation_equivalent.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "translation_equivalents", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @translation_equivalent.meta = o
      @translation_equivalent.save
      #render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to meta_metadata_edit_dynamic_meta_url(o.id)
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @translation_equivalent = TranslationEquivalent.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @translation_equivalent = TranslationEquivalent.find(params['id'])
    if params["relatedtype"] == "definition"
      @translation_equivalent.definition = nil if params['tags'] == nil 
      @translation_equivalent.save
    end
    if params["relatedtype"] == "meta"
      @translation_equivalent.meta = nil if params['tags'] == nil 
      @translation_equivalent.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @translation_equivalent = TranslationEquivalent.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @translation_equivalent = TranslationEquivalent.find(params['translation_equivalent']['id'])
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
         @definitions = Definition.find_all
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
         @metas = Meta.find_all
       else
         @metas = Meta.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @translation_equivalent = TranslationEquivalent.find(params['id'])
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @translation_equivalent.definition = Definition.find(params['tags'][0])
        @translation_equivalent.save
      end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @translation_equivalent.meta = Meta.find(params['tags'][0])
        @translation_equivalent.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @translation_equivalent = TranslationEquivalent.new
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
        if params['translation_equivalent'] != nil
          @array = []
          params['translation_equivalent'].each do |key, val| 
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
        @translation_equivalent_pages, @translation_equivalents = paginate :translation_equivalents, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @translation_equivalents = TranslationEquivalent.find :all, :order => sort_clause
        else
          @translation_equivalents = TranslationEquivalent.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @translation_equivalents
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @translation_equivalents = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @translation_equivalents
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @translation_equivalents = array
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
           @translation_equivalent_pages = Paginator.new self, @translation_equivalents.length(), items_per_page, params['page']
           if @translation_equivalent_pages.item_count != 0
             @pages = (@translation_equivalent_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@translation_equivalent_pages.current.first_item.to_f / @translation_equivalent_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @translation_equivalents = @translation_equivalents[@offset,items_per_page] if @translation_equivalents[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
  
  def edit_dynamic_translation_equivalent
    @language = []
    Language.find(:all, :order => 'language asc').each do |l|
      @language += [l.language]
    end
    if(params['internal'] != nil)
      @divname = 'translation_equivalent_internal'
    else
    	@divname = 'translation_equivalent'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    render :layout => 'staging_popup'
  end  
 
  def update_dynamic_translation_equivalent
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      if @translation_equivalent.created_by == nil or @translation_equivalent.created_by == ""
        @translation_equivalent.created_by = session[:user].login
        @translation_equivalent.created_at = Time.now
      end
      if session[:user] != nil
        @translation_equivalent.updated_by = session[:user].login
      end
      @translation_equivalent.updated_at = Time.now
      if @translation_equivalent.update_history == nil
        @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      if @translation_equivalent.update_attributes(params[:translation_equivalent])
        #render :nothing => true
        render_translation_equivalents
      else
      end
  end 
  
  
  def render_translation_equivalents
    @translation_equivalent = TranslationEquivalent.find(params[:id])
    @temp_definition = Definition.find(@translation_equivalent.def_id) 
 	  render :update do |page|
      #yield(page) if block_given?     	    
      page.replace_html "#{@translation_equivalent.def_id}_translation_equivalents_div", :partial => 'translation_equivalents/index', :locals => {:d => @temp_definition, :parent_id => @temp_definition.id, :head_id => @temp_definition.id}
    end 
  end
  
  def update_translation_equivalent
      @translation_equivalent = TranslationEquivalent.find(params[:translation_equivalent][:id])
      if @translation_equivalent.created_by == nil or @translation_equivalent.created_by == ""
             @translation_equivalent.created_by = session[:user].login
             @translation_equivalent.created_at = Time.now
      end
      if session[:user] != nil
             @translation_equivalent.updated_by = session[:user].login
      end
      @translation_equivalent.updated_at = Time.now
      if @translation_equivalent.update_history == nil
        @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation_equivalent.update_attributes(params[:translation_equivalent])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation_equivalent, :divsuffix => "_transdiv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation_equivalent
        end
      end
  end

  def translation_equivalent_show
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation_equivalent, :divsuffix => "_transdiv"}
  end

  def translation_equivalent_edit
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation_equivalent, :divsuffix => "_transdiv"}
  end
 
  def update_popup_translation_equivalent
      @translation_equivalent = TranslationEquivalent.find(params[:translation_equivalent][:id])
      if @translation_equivalent.created_by == nil or @translation_equivalent.created_by == ""
             @translation_equivalent.created_by = session[:user].login
             @translation_equivalent.created_at = Time.now
      end
      if session[:user] != nil
             @translation_equivalent.updated_by = session[:user].login
      end
      @translation_equivalent.updated_at = Time.now
      if @translation_equivalent.update_history == nil
        @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation_equivalent.update_attributes(params[:translation_equivalent])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation_equivalent, :divsuffix => "_transpopupdiv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation_equivalent
        end
      end
  end

  def translation_equivalent_popupshow
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation_equivalent, :divsuffix => "_transpopupdiv"}
  end

  def translation_equivalent_popupedit
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation_equivalent, :divsuffix => "_transpopupdiv"}
  end 
  
  def update_analytical_note
      @translation_equivalent = TranslationEquivalent.find(params[:translation_equivalent][:id])
      if @translation_equivalent.created_by == nil or @translation_equivalent.created_by == ""
             @translation_equivalent.created_by = session[:user].login
             @translation_equivalent.created_at = Time.now
      end
      if session[:user] != nil
             @translation_equivalent.updated_by = session[:user].login
      end
      @translation_equivalent.updated_at = Time.now
      if @translation_equivalent.update_history == nil
        @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @translation_equivalent.update_attributes(params[:translation_equivalent])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation_equivalent, :divsuffix => "_anotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @translation_equivalent
        end
      end
  end

  def analytical_note_show
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation_equivalent, :divsuffix => "_anotediv"}
  end

  def analytical_note_edit
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation_equivalent, :divsuffix => "_anotediv"}
  end

  def update_image_description
      @translation_equivalent = TranslationEquivalent.find(params[:translation_equivalent][:id])
      if @translation_equivalent.created_by == nil or @translation_equivalent.created_by == ""
        @translation_equivalent.created_by = session[:user].login
        @translation_equivalent.created_at = Time.now
      end
      if session[:user] != nil
        @translation_equivalent.updated_by = session[:user].login
      end
      @translation_equivalent.updated_at = Time.now
      if @translation_equivalent.update_history == nil
        @translation_equivalent.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @translation_equivalent.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @translation_equivalent.update_attributes(params[:translation_equivalent])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @translation_equivalent, :divsuffix => "_imagedescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @translation_equivalent
        end
      end
  end

    def image_description_show
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @translation_equivalent, :divsuffix => "_imagedescdiv"}
    end

    def image_description_edit
      @translation_equivalent = TranslationEquivalent.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @translation_equivalent, :divsuffix => "_imagedescdiv"}
    end 
    
end
