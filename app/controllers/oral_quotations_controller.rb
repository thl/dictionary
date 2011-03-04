class OralQuotationsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas
  helper :translations


  OralQuotation.content_columns.each do |column|
    in_place_edit_for :oral_quotation, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end
  Translation.content_columns.each do |column|
    in_place_edit_for :translation, column.name
  end

  def set_source_speaker_dialect_type_id
    d = OralQuotation.find(params[:id])
    if d != nil and params[:value] != nil
      d.source_speaker_dialect_type_id = params[:value].to_i
      d.source_speaker_dialect = nil
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'source_speaker_dialect_type', :title => d.source_speaker_dialect_type.title, :id => d.id, :data_id => 638, :update_id => params[:update_id]})  
  end
  
  def display_category_selector
    @data = Category.find(params['data_id'])
    @oral_quotation = OralQuotation.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end
  

  def set_source_speaker_dialect
    d = OralQuotation.find(params[:id])
    d.update_attribute('source_speaker_dialect',params['value'])
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
    @oral_quotation_pages, @oral_quotations = paginate :oral_quotation, :per_page => items_per_page, :order_by => sort_clause
    if @oral_quotation_pages.item_count != 0
      @pages = (@oral_quotation_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@oral_quotation_pages.current.first_item.to_f / @oral_quotation_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @oral_quotation = OralQuotation.find(params[:id])
  end

  def new
    @oral_quotation = OralQuotation.new
    @oral_quotation.created_by = session[:user].login
    @oral_quotation.created_at = Time.now
    @oral_quotation.save
    #redirect_to :action => 'edit_dynamic', :id => @oral_quotation.id, :params => {'new' => 'true'}
    redirect_to :action => 'edit_dynamic_oral_quotation', :id => @oral_quotation.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'oral_quotation_internal'
    else
    	@divname = 'oral_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @oral_quotation = OralQuotation.new(params[:oral_quotation])
    if @oral_quotation.save
      flash[:notice] = 'OralQuotation was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'oral_quotation_internal'
    else
    	@divname = 'oral_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @oral_quotation = OralQuotation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def public_edit
    if(params['internal'] != nil)
      @divname = 'oral_quotation_internal'
    else
    	@divname = 'oral_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @oral_quotation = OralQuotation.find(params[:id])
    render :layout => false 
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'oral_quotation_internal'
    else
    	@divname = 'oral_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @oral_quotation = OralQuotation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'oral_quotation_internal'
    else
    	@divname = 'oral_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @oral_quotation = OralQuotation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @oral_quotation = OralQuotation.find(params[:id])
    if @oral_quotation.created_by == nil or @oral_quotation.created_by == ""
      @oral_quotation.created_by = session[:user].login
      @oral_quotation.created_at = Time.now
    end
    if session[:user] != nil
      @oral_quotation.updated_by = session[:user].login
    end
    @oral_quotation.updated_at = Time.now
    if @oral_quotation.update_history == nil
      @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @oral_quotation.update_attributes(params[:oral_quotation])
      flash[:notice] = 'OralQuotation was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @oral_quotation
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
        if params['internal'] == 'translations'
          render :partial => "translations/edit_contents",:locals => {'@translation' => Translation.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @oral_quotation
      end
  end

  def destroy
    OralQuotation.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    OralQuotation.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     OralQuotation.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    # if params['internal'] == 'translations'
    #   render :partial => "translations/edit_contents", :locals => {'@translation' => Translation.find(params['pk'])}
    # end
    #  if params['internal'] == 'oral_quotations'
    #    render :partial => 'oral_quotations/edit_contents', :locals => {'@oral_quotation' => OralQuotation.find(params['pk'])}
    #  end
    # else
    #   OralQuotation.find(params['id']).destroy unless params['new'] == nil
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
      internal = "oral_quotation"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @oral_quotation = OralQuotation.find(params['id'])
    @oral_quotation.updated_by = session[:user].login
    @oral_quotation.updated_at = Time.now
    if @oral_quotation.update_history == nil
      @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @oral_quotation.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @oral_quotation.definition = o
      @oral_quotation.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "oral_quotations", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @oral_quotation.meta = o
      @oral_quotation.save
      #render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to meta_metadata_edit_dynamic_meta_url(o.id)
    end
    if params["relatedtype"] == "translation"
      o = Translation.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @oral_quotation.translations << o
      #render_component :controller => "translations", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'translation', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
      redirect_to edit_dynamic_translation_url(o.id)
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @oral_quotation = OralQuotation.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @oral_quotation = OralQuotation.find(params['id'])
    if params["relatedtype"] == "definition"
      @oral_quotation.definition = nil if params['tags'] == nil 
      @oral_quotation.save
    end
    if params["relatedtype"] == "meta"
      @oral_quotation.meta = nil if params['tags'] == nil 
      @oral_quotation.save
    end
    if params["relatedtype"] == "translation"
      if @oral_quotation.translations != nil 
        if params['tags'] != nil 
          @oral_quotation.translations.delete(@oral_quotation.translations - Translation.find(params['tags']))
        else
          @oral_quotation.translations.delete(@oral_quotation.translations)
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
      @oral_quotation = OralQuotation.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @oral_quotation = OralQuotation.find(params['oral_quotation']['id'])
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
     @translations = nil
     if params["relatedtype"] == "translation"
       @array = []
       params['translation'].each do |key, val| 
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
         @translations = Translation.find :all
       else
         @translations = Translation.find :all, :conditions => query
       end
     end
    render :layout => false
  end

  def edit_add_to_list_action
    @oral_quotation = OralQuotation.find(params['id'])
    if params['tags'] != nil
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @oral_quotation.definition = Definition.find(params['tags'][0])
        @oral_quotation.save
      end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @oral_quotation.meta = Meta.find(params['tags'][0])
        @oral_quotation.save
      end
    end
    if params["relatedtype"] == "translation"
      if @oral_quotation.translations == nil 
        @oral_quotation.translations = Translation.find(params['tags'])
      else
        @oral_quotation.translations.delete(@oral_quotation.translations - Translation.find(params['tags']))
        @oral_quotation.translations << Translation.find(params['tags']) - @oral_quotation.translations 
    	end
    end
  end
      @definition = Definition.find(params['definition_id'])
      @head_id = @definition.id
      render :template => 'definitions/public_content_only', :layout => false
    # render_partial 'edit_contents'
  end

  def search
      @oral_quotation = OralQuotation.new
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
        if params['oral_quotation'] != nil
          @array = []
          params['oral_quotation'].each do |key, val| 
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
      if flash['translations'] != nil
        params['translations'] = flash['translations']
        flash['relatedsearch'] = 'yes'
      end
      if flash['definition'] != nil
        params['definition'] = flash['definition']
        flash['relatedsearch'] = 'yes'
      end
      if query == [""] and (params['meta'] == nil or params['meta'] == "") and (params['translations'] == nil or params['translations'] == "") and (params['definition'] == nil or params['definition'] == "")
        @oral_quotation_pages, @oral_quotations = paginate :oral_quotations, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @oral_quotations = OralQuotation.find :all, :order => sort_clause
        else
          @oral_quotations = OralQuotation.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @oral_quotations
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @oral_quotations = array
    end
    array = []
    if params['translations'] != nil and params['translations'] != ""
      flash['translations'] = params['translations']
      for o in @oral_quotations
        found = 0
        for obj in o.translations
          if string_contains obj.displayInfo, params['translations']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @oral_quotations = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @oral_quotations
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @oral_quotations = array
    end
      if flash['meta'] != nil
        params['meta'] = flash['meta']
        flash['relatedsearch'] = 'yes'
      end
      if flash['translations'] != nil
        params['translations'] = flash['translations']
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
           @oral_quotation_pages = Paginator.new self, @oral_quotations.length(), items_per_page, params['page']
           if @oral_quotation_pages.item_count != 0
             @pages = (@oral_quotation_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@oral_quotation_pages.current.first_item.to_f / @oral_quotation_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @oral_quotations = @oral_quotations[@offset,items_per_page] if @oral_quotations[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
  
  def edit_dynamic_oral_quotation
    if(params['internal'] != nil)
      @divname = 'oral_quotation_internal'
    else
    	@divname = 'oral_quotation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @oral_quotation = OralQuotation.find(params[:id])
    render :layout => 'staging_popup' 
  end  
  
  def update_dynamic_oral_quotation
      @oral_quotation = OralQuotation.find(params[:id])
      if @oral_quotation.created_by == nil or @oral_quotation.created_by == ""
        @oral_quotation.created_by = session[:user].login
        @oral_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @oral_quotation.updated_by = session[:user].login
      end
      @oral_quotation.updated_at = Time.now
      if @oral_quotation.update_history == nil
        @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      if @oral_quotation.update_attributes(params[:oral_quotation])
        #render :nothing => true
        render_oral_quotations
      else
      end
  end  
  
  def render_oral_quotations
    @oral_quotation = OralQuotation.find(params[:id])
    @temp_definition = Definition.find(@oral_quotation.definitions.first.id) 
 	  render :update do |page|
      #yield(page) if block_given?     	    
      page.replace_html "#{@oral_quotation.definitions.first.id}_oral_quotations_div", :partial => 'oral_quotations/index', :locals => {:d => @temp_definition, :parent_id => @temp_definition.id, :head_id => @temp_definition.id}
    end 
  end
  
  def update_analytical_note
      @oral_quotation = OralQuotation.find(params[:oral_quotation][:id])
      if @oral_quotation.created_by == nil or @oral_quotation.created_by == ""
             @oral_quotation.created_by = session[:user].login
             @oral_quotation.created_at = Time.now
      end
      if session[:user] != nil
             @oral_quotation.updated_by = session[:user].login
      end
      @oral_quotation.updated_at = Time.now
      if @oral_quotation.update_history == nil
        @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @oral_quotation.update_attributes(params[:oral_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @oral_quotation, :divsuffix => "_anotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @oral_quotation
        end
      end
  end

  def analytical_note_show
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @oral_quotation, :divsuffix => "_anotediv"}
  end

  def analytical_note_edit
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @oral_quotation, :divsuffix => "_anotediv"}
  end

  def update_image_description
      @oral_quotation = OralQuotation.find(params[:oral_quotation][:id])
      if @oral_quotation.created_by == nil or @oral_quotation.created_by == ""
        @oral_quotation.created_by = session[:user].login
        @oral_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @oral_quotation.updated_by = session[:user].login
      end
      @oral_quotation.updated_at = Time.now
      if @oral_quotation.update_history == nil
        @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @oral_quotation.update_attributes(params[:oral_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @oral_quotation, :divsuffix => "_imagedescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @oral_quotation
        end
      end
  end

    def image_description_show
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @oral_quotation, :divsuffix => "_imagedescdiv"}
    end

    def image_description_edit
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @oral_quotation, :divsuffix => "_imagedescdiv"}
    end 

    def update_audio_description
      @oral_quotation = OralQuotation.find(params[:oral_quotation][:id])
      if @oral_quotation.created_by == nil or @oral_quotation.created_by == ""
        @oral_quotation.created_by = session[:user].login
        @oral_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @oral_quotation.updated_by = session[:user].login
      end
      @oral_quotation.updated_at = Time.now
      if @oral_quotation.update_history == nil
        @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @oral_quotation.update_attributes(params[:oral_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @oral_quotation, :divsuffix => "_audiodescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @oral_quotation
        end
      end
    end

    def audio_description_show
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @oral_quotation, :divsuffix => "_audiodescdiv"}
    end

    def audio_description_edit
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @oral_quotation, :divsuffix => "_audiodescdiv"}
    end 

    def update_video_description
      @oral_quotation = OralQuotation.find(params[:oral_quotation][:id])
      if @oral_quotation.created_by == nil or @oral_quotation.created_by == ""
        @oral_quotation.created_by = session[:user].login
        @oral_quotation.created_at = Time.now
      end
      if session[:user] != nil
        @oral_quotation.updated_by = session[:user].login
      end
      @oral_quotation.updated_at = Time.now
      if @oral_quotation.update_history == nil
        @oral_quotation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @oral_quotation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @oral_quotation.update_attributes(params[:oral_quotation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @oral_quotation, :divsuffix => "_videodescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @oral_quotation
        end
      end
    end

    def video_description_show
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @oral_quotation, :divsuffix => "_videodescdiv"}
    end

    def video_description_edit
      @oral_quotation = OralQuotation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @oral_quotation, :divsuffix => "_videodescdiv"}
    end  
end
