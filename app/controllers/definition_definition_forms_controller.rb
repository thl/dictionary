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
    #render :layout => 'staging_popup_related_term_edit'
    render :layout => false
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


  def new_search
    @role = "Honorific Form, Non-honorific Form, Conjugated Form Past, Conjugated Form Present, Conjugated Form Future, Conjugated Form Imperative, Dialectical correlates, Literary and colloquial correlates, Compounds, Abbreviation, Expansion, Phrases, Paired term, Partial Synonym, Antonym, Poetic expressions, Gloss".split(', ')
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params[:id])
    render :layout => false
  end
  
  def edit_search
#debugger
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    render :layout => false
  end

  def edit_search_action
    #debugger
    #@definition_definition_form = DefinitionDefinitionForm.find(params['definition_definition_form']['id'])
    if params['definition_definition_form'].blank?
      @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    else
      @definition_definition_form = DefinitionDefinitionForm.find(params['definition_definition_form']['id'])
    end
    #@definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    
    if params['mode'] != nil 
        @page_class = params['mode']
    else
        @page_class = 'edit'
    end
    if params['items_per_page'] != nil
        items_per_page = params['items_per_page'].to_i
    else
        items_per_page = 50
    end
    if params['query']
       #@query = buildquery(params["query"])
       @query = params['query']
       query = buildquery(params["query"])
       flash["query"] = params["query"]
       # breakpoint
       # if session['query'] != nil and params['paged'] != nil
       #   query = session['query']
       if session['search_type'] != nil
         session['search_type'] = 'term'
       end
       
       if params['current_first_item'] != nil
          first_item = params['current_first_item'].to_f
          calculated_page = (first_item / items_per_page.to_f).ceil
          params['page'] = calculated_page
       else
         #use current params['page'] parameter if any
       end
       
       sort_clause = "sort_order asc"
        
       #@definition_tos = Definition.find :all, :conditions => query
       @definition_pages = Paginator.new self, Definition.count(:conditions => query), items_per_page, params['page']
       @definition_tos = Definition.find :all, :order => sort_clause, :conditions => query, :limit => @definition_pages.items_per_page, :offset => @definition_pages.current.offset
        
       if @definition_pages.item_count != 0
           @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
           @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
       else
           @pages = 0
           @current_page = 0
       end
          
        
  else 
    
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
       
       
       vals=""
       query=""
       @array = []
       if params['internal_definition']['term'] != nil and params['internal_definition']['term'] != ''
         val = params['internal_definition']['term'] #params['term']
         if params[:search_field] == 'tibetan'
            key = 'term'
         elsif params[:search_field] == 'wylie'
            key = 'wylie'
         else
            key = 'phonetic'
         end
         session['search_type'] = key
         if query != ""
             query = query + " and "
             vals = vals + ","
         end
         term_value = val
         space = Unicode::U0F0B
         space2 = Unicode::U0F0C
         line = Unicode::U0F0D
         nb_space = Unicode::U00A0

         val = val.gsub("#{nb_space}",' ')  #remove non-breaking space before tsheg

         val = val.gsub(line,'')
          val = val.gsub(space2,space)
          val = val.gsub(space,'_space_')
          a = val.split('_space_')
          word = ''
          a.each {|w|
             word += space if word != ''
             word += w
          }
        val = word
        if params['search_type'] == 'anywhere'
            query = query + key + " ilike ?"
            @array.push("%"+val.gsub('/','').strip+"%")
            vals += 'anywhere:'
        elsif params['search_type'] == 'exact'
            query = query +'('+ key + " = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? or "+key+" = ? )"
            @array.push(val.gsub('/','').strip)
            @array.push(val.gsub('/','').strip+line)
            @array.push(val.gsub('/','').strip+space+line)
            @array.push(val.gsub('/','').strip+space)
            @array.push(val.gsub('/','').strip+space2+line)
            @array.push(val.gsub('/','').strip+space2)
            @array.push(val.gsub('/','').strip+' ')
            @array.push(val.gsub('/','').strip+'/')
            @array.push(val.gsub('/','').strip+' /')
            @array.push(val.gsub('/','').strip+"#{nb_space}")
            @array.push(val.gsub('/','').strip+"#{nb_space}/")
            
            vals += 'exact:'
        else params['search_type'] == 'beginning'
            query = query + key + " ilike ?"
            @array.push(val+"%")
            vals += 'beginning:'
        end 
        if params['search_extent'] == nil
            query += ' and ' if query != nil
            query = query + "level = ?"
            @array.push("head term")
            vals += ',' if vals != ''
            vals += 'level:head term'
         end
         
         vals += ',' if vals != ''
         vals = vals + key + ":" + val
          
      end # if params['internal_definition']['term'] != nil
      query = [query]+@array
      
       @query = vals
       
      # previous code
      # @array = []
      # params['internal_definition'].each do |key, val| 
      # if val != ""
      #     if query != ""
      #       query = query + " and "
      #     end
      #     query = query + key + " ilike ?"
      #     @array.push("%"+val+"%")
      #   end
      # end
      # query = [query]+@array
      # #this is a temp fix, will implement a full search for options as on main page
      # query = ["wylie ilike ? and level = ?", "%"+params['internal_definition']['term']+"%", "head term"]
       
       #new paginator code
       #items_per_page = 50
       sort_clause = "sort_order asc"
       
       #debugger
       if query == [""]
         #old code #@definition_tos = Definition.find :all
         @definition_tos = Definition.find :all
       else
         # old code #@definition_tos = Definition.find :all, :conditions => query
         #@definition_tos = Definition.find :all, :conditions => query
         @definition_pages = Paginator.new self, Definition.count(:conditions => query), items_per_page, params['page']
         @definition_tos = Definition.find :all, :order => sort_clause, :conditions => query, :limit => @definition_pages.items_per_page, :offset => @definition_pages.current.offset
         
         if @definition_pages.item_count != 0
            @pages = (@definition_pages.item_count.to_f / items_per_page.to_f).ceil
            @current_page = (@definition_pages.current.first_item.to_f / @definition_pages.item_count.to_f * @pages).ceil
         else
            @pages = 0
            @current_page = 0
         end
       end
       
       
     end
    end #end if query=="" 
     #debugger
     
     #@query = query
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
    ##render :partial => 'edit_contents'
    
    #render :partial => 'edit_contents', :locals => {:definition_definition_form => @definition_definition_form}
    #here we have to render all related terms instead
    render_related_terms
  end
  
  def render_related_terms
    @definition_definition_form = DefinitionDefinitionForm.find(params['id'])
    @temp_definition = Definition.find(@definition_definition_form.definition_from.id) 
 	  render :update do |page|
      #yield(page) if block_given?     	    
      page.replace_html "#{@temp_definition.id}_related_terms_div", :partial => 'definition_definition_forms/index', :locals => {:d => @temp_definition, :parent_id => @temp_definition.id, :head_id => @temp_definition.id}
      #page.replace_html "#{@temp_definition.id}_related_terms_div", "hola"
    end
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
