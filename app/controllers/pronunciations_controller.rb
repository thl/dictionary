class PronunciationsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :definitions
  helper :metas


  Pronunciation.content_columns.each do |column|
    in_place_edit_for :pronunciation, column.name
  end
  Definition.content_columns.each do |column|
    in_place_edit_for :definition, column.name
  end
  Meta.content_columns.each do |column|
    in_place_edit_for :meta, column.name
  end

  def display_category_selector
    @data = Category.find(params['data_id'])
    @pronunciation = Pronunciation.find(params[:id])
    # debugger
    @model_name = params['model_name']
    @function_name = params['function_name']
    @id = params[:id]
    @update_id = params[:update_id]
    render :partial => 'display_category_selector' #:layout => false
  end

	def set_pronunciation_category_id
    # debugger
    d = Pronunciation.find(params[:id])
    if d != nil and params[:value] != nil
      d.pronunciation_category_id = params[:value].to_i
      d.pronunciation_type = nil
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'pronunciation_category', :title => d.pronunciation_category.title, :id => d.id, :data_id => 189, :update_id => params[:update_id]})  
  end

	def set_major_dialect_family_type_id
    d = Pronunciation.find(params[:id])
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
    d = Pronunciation.find(params[:id])
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_genre_type', :title => d.literary_genre_type.title, :id => d.id, :data_id => 119})  
  end

  def set_literary_period_type_id
    d = Pronunciation.find(params[:id])
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_period_type', :title => d.literary_period_type.title, :id => d.id, :data_id => 187})  
  end

  def set_literary_form_type_id
    d = Pronunciation.find(params[:id])
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
    render(:partial => 'display_category_selector_link', :locals => {:function_name => 'literary_form_type', :title => d.literary_form_type.title, :id => d.id, :data_id => 186})  
  end

    def set_literary_genre
      puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
      puts params['def_id']
      @definition = Pronunciation.find(params['id'])
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
    puts '---------------------'
    puts params[:id]
    d = Pronunciation.find(params[:id])
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

  def set_public_phonetic_transliteration
    puts '=============='
    puts params['content']
    puts params['definition_id']
    d = Pronunciation.find(params[:id])
    d.update_attribute('phonetic_transliteration',params['content'])
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
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id']
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
    @pronunciation_pages, @pronunciations = paginate :pronunciation, :per_page => items_per_page, :order_by => sort_clause
    if @pronunciation_pages.item_count != 0
      @pages = (@pronunciation_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@pronunciation_pages.current.first_item.to_f / @pronunciation_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @pronunciation = Pronunciation.find(params[:id])
    render :layout => false
  end

  def public_edit
    # @pronunciation_type = []
    # PronunciationType.find(:all).each do |l|
    #   @pronunciation_type += [l.pronunciation_type]
    # end
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
    if(params['internal'] != nil)
      @divname = 'pronunciation_internal'
    else
    	@divname = 'pronunciation'
    end
    @pronunciation = Pronunciation.find(params[:id])
    render :layout => false
  end

  def new
    @pronunciation = Pronunciation.new
    @pronunciation.created_by = session[:user].login
    @pronunciation.created_at = Time.now
    @pronunciation.save
    redirect_to :action => 'edit_dynamic', :id => @pronunciation.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'pronunciation_internal'
    else
    	@divname = 'pronunciation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @pronunciation = Pronunciation.new(params[:pronunciation])
    if @pronunciation.save
      flash[:notice] = 'Pronunciation was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'pronunciation_internal'
    else
    	@divname = 'pronunciation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @pronunciation = Pronunciation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def edit_dynamic
    # @pronunciation_type = []
    # PronunciationType.find(:all).each do |l|
    #   @pronunciation_type += [l.pronunciation_type]
    # end
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
    if(params['internal'] != nil)
      @divname = 'pronunciation_internal'
    else
    	@divname = 'pronunciation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @pronunciation = Pronunciation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'pronunciation_internal'
    else
    	@divname = 'pronunciation'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @pronunciation = Pronunciation.find(params[:id])
    render :layout => false if params['internal'] != nil
  end

  def update
    @pronunciation = Pronunciation.find(params[:id])
    if @pronunciation.created_by == nil or @pronunciation.created_by == ""
      @pronunciation.created_by = session[:user].login
      @pronunciation.created_at = Time.now
    end
    if session[:user] != nil
      @pronunciation.updated_by = session[:user].login
    end
    @pronunciation.updated_at = Time.now
    if @pronunciation.update_history == nil
      @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @pronunciation.update_attributes(params[:pronunciation])
      flash[:notice] = 'Pronunciation was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@meta' => Meta.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @pronunciation
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
        redirect_to :action => 'show', :id => @pronunciation
      end
  end

  def destroy
    Pronunciation.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    Pronunciation.find(params['id']).destroy unless params['id'] == nil
    redirect_to :controller => 'definitions', :action => 'public_content_only', :id => params['definition_id'] 
    # if(params['internal'] != nil)
    #   if params['new'] != nil
    #     Pronunciation.find(params['id']).destroy unless params['id'] == nil
    #   end
    # if params['internal'] == 'definitions'
    #   render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    # end
    # if params['internal'] == 'metas'
    #   render :partial => "metas/edit_contents", :locals => {'@meta' => Meta.find(params['pk'])}
    # end
    #  if params['internal'] == 'pronunciations'
    #    render :partial => 'pronunciations/edit_contents', :locals => {'@pronunciation' => Pronunciation.find(params['pk'])}
    #  end
    # else
    #   Pronunciation.find(params['id']).destroy unless params['new'] == nil
    #   if session['previous_page'] != 'invalid' and session['previous_page'] != nil
    #     redirect_to session['previous_page']
    #   else
    #     redirect_to :controller => 'definitions', :action => 'control_vocab'
    #   end
    # end
  end

  def edit_new
    if params['internal'] != nil
      internal = params['internal']
    else
      internal = "pronunciations"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @pronunciation = Pronunciation.find(params['id'])
    @pronunciation.updated_by = session[:user].login
    @pronunciation.updated_at = Time.now
    if @pronunciation.update_history == nil
      @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    @pronunciation.save
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @pronunciation.definition = o
      @pronunciation.save
      render_component :controller => "definitions", :action => "edit_dynamic", :id => o.id, :params => {'internal' => internal, 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
    if params["relatedtype"] == "meta"
      o = Meta.new
      o.created_by = session[:user].login
      o.created_at = Time.now
      o.update_history = session[:user].login + " ["+Time.now.to_s+"] \n"
      o.save
      @pronunciation.meta = o
      @pronunciation.save
      render_component :controller => "metas", :action => "edit_dynamic", :id => o.id, :params => {'internal' => "edit_box", 'pk' => params['id'], 'relatedtype'=> 'meta', 'level' => params['level'], 'new' => 'yes', 'definition_id' => params['definition_id']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @pronunciation = Pronunciation.find(params['id'])
    render :layout => false
  end

  def edit_delete_action
    @pronunciation = Pronunciation.find(params['id'])
    if params["relatedtype"] == "definition"
      @pronunciation.definition = nil if params['tags'] == nil 
      @pronunciation.save
    end
    if params["relatedtype"] == "meta"
      @pronunciation.meta = nil if params['tags'] == nil 
      @pronunciation.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @pronunciation = Pronunciation.find(params['id'])
      render :layout => false
  end

  def edit_search_action
    @pronunciation = Pronunciation.find(params['pronunciation']['id'])
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
    @pronunciation = Pronunciation.find(params['id'])
    if params["relatedtype"] == "definition"
      if params['tags'] != nil
        @pronunciation.definition = Definition.find(params['tags'][0])
        @pronunciation.save
      end
    end
    if params["relatedtype"] == "meta"
      if params['tags'] != nil
        @pronunciation.meta = Meta.find(params['tags'][0])
        @pronunciation.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @pronunciation = Pronunciation.new
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
        if params['pronunciation'] != nil
          @array = []
          params['pronunciation'].each do |key, val| 
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
        @pronunciation_pages, @pronunciations = paginate :pronunciations, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @pronunciations = Pronunciation.find :all, :order => sort_clause
        else
          @pronunciations = Pronunciation.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @pronunciations
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @pronunciations = array
    end
    array = []
    if params['definition'] != nil and params['definition'] != ""
      flash['definition'] = params['definition']
      for o in @pronunciations
        if o.definition != nil
          if string_contains o.definition.displayInfo, params['definition']
            array = array + [o]
          end
        end
      end
      @pronunciations = array
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
           @pronunciation_pages = Paginator.new self, @pronunciations.length(), items_per_page, params['page']
           if @pronunciation_pages.item_count != 0
             @pages = (@pronunciation_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@pronunciation_pages.current.first_item.to_f / @pronunciation_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @pronunciations = @pronunciations[@offset,items_per_page] if @pronunciations[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
  
  def edit_dynamic_pronunciation
    # @pronunciation_type = []
    # PronunciationType.find(:all).each do |l|
    #   @pronunciation_type += [l.pronunciation_type]
    # end
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
    if(params['internal'] != nil)
      @divname = 'pronunciation_internal'
    else
    	@divname = 'pronunciation'
    end
    @pronunciation = Pronunciation.find(params[:id])
    render :layout => 'staging_popup'
  end  
  
  def update_dynamic_pronunciation
      @pronunciation = Pronunciation.find(params[:id])
      if @pronunciation.created_by == nil or @pronunciation.created_by == ""
        @pronunciation.created_by = session[:user].login
        @pronunciation.created_at = Time.now
      end
      if session[:user] != nil
        @pronunciation.updated_by = session[:user].login
      end
      @pronunciation.updated_at = Time.now
      if @pronunciation.update_history == nil
        @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
      	@pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end
      if @pronunciation.update_attributes(params[:pronunciation])
        render :nothing => true
      else
       
      end
    end
      
  def update_analytical_note
      @pronunciation = Pronunciation.find(params[:pronunciation][:id])
      if @pronunciation.created_by == nil or @pronunciation.created_by == ""
             @pronunciation.created_by = session[:user].login
             @pronunciation.created_at = Time.now
      end
      if session[:user] != nil
             @pronunciation.updated_by = session[:user].login
      end
      @pronunciation.updated_at = Time.now
      if @pronunciation.update_history == nil
        @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
       "
      else
        @pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
       "
      end
      respond_to do |format|
        if @pronunciation.update_attributes(params[:pronunciation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @pronunciation, :divsuffix => "_anotediv"}
          end
        else
           #redirect_to :action => 'index_edit'
           #redirect_to :action => 'public_edit', :id => @pronunciation
        end
      end
  end

  def analytical_note_show
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @pronunciation, :divsuffix => "_anotediv"}
  end

  def analytical_note_edit
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @pronunciation, :divsuffix => "_anotediv"}
  end

  def update_image_description
      @pronunciation = Pronunciation.find(params[:pronunciation][:id])
      if @pronunciation.created_by == nil or @pronunciation.created_by == ""
        @pronunciation.created_by = session[:user].login
        @pronunciation.created_at = Time.now
      end
      if session[:user] != nil
        @pronunciation.updated_by = session[:user].login
      end
      @pronunciation.updated_at = Time.now
      if @pronunciation.update_history == nil
        @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @pronunciation.update_attributes(params[:pronunciation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @pronunciation, :divsuffix => "_imagedescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @pronunciation
        end
      end
  end

    def image_description_show
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @pronunciation, :divsuffix => "_imagedescdiv"}
    end

    def image_description_edit
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @pronunciation, :divsuffix => "_imagedescdiv"}
    end 

    def update_audio_description
      @pronunciation = Pronunciation.find(params[:pronunciation][:id])
      if @pronunciation.created_by == nil or @pronunciation.created_by == ""
        @pronunciation.created_by = session[:user].login
        @pronunciation.created_at = Time.now
      end
      if session[:user] != nil
        @pronunciation.updated_by = session[:user].login
      end
      @pronunciation.updated_at = Time.now
      if @pronunciation.update_history == nil
        @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @pronunciation.update_attributes(params[:pronunciation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @pronunciation, :divsuffix => "_audiodescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @pronunciation
        end
      end
    end

    def audio_description_show
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @pronunciation, :divsuffix => "_audiodescdiv"}
    end

    def audio_description_edit
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @pronunciation, :divsuffix => "_audiodescdiv"}
    end 

    def update_video_description
      @pronunciation = Pronunciation.find(params[:pronunciation][:id])
      if @pronunciation.created_by == nil or @pronunciation.created_by == ""
        @pronunciation.created_by = session[:user].login
        @pronunciation.created_at = Time.now
      end
      if session[:user] != nil
        @pronunciation.updated_by = session[:user].login
      end
      @pronunciation.updated_at = Time.now
      if @pronunciation.update_history == nil
        @pronunciation.update_history = session[:user].login + " ["+Time.now.to_s+"]
  "
      else
        @pronunciation.update_history += session[:user].login + " ["+Time.now.to_s+"]
  "
      end    
      respond_to do |format|
        if @pronunciation.update_attributes(params[:pronunciation])
          format.html do
            render :partial => 'shared/tinymce_field_show', :locals => {:t => @pronunciation, :divsuffix => "_videodescdiv"}
          end
        else
          #redirect_to :action => 'index_edit'
          #redirect_to :action => 'public_edit', :id => @pronunciation
        end
      end
    end

    def video_description_show
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_show", :locals => {:t => @pronunciation, :divsuffix => "_videodescdiv"}
    end

    def video_description_edit
      @pronunciation = Pronunciation.find(params[:id])
      render :partial => "shared/tinymce_field_edit", :locals => {:t => @pronunciation, :divsuffix => "_videodescdiv"}
    end  
end
