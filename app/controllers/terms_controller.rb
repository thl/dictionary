class TermsController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper

  helper :etymologies
  helper :spellings
  helper :definitions
  helper :metas

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
    @term_pages, @terms = paginate :term, :per_page => items_per_page, :order_by => sort_clause
    if @term_pages.item_count != 0
      @pages = (@term_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@term_pages.current.first_item.to_f / @term_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @term = Term.find(params[:id])
  end

  def public_show
    @number = 0
    @letters = ['a','b','c','d','e','f','g']
    @gfunc = ""
    @x = 0
    @term = Term.find(params[:id])
  end

  def new
    @term = Term.new
    @term.save
    redirect_to :action => 'edit', :id => @term.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'term_internal'
    else
    	@divname = 'term'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @term = Term.new(params[:term])
    if @term.save
      flash[:notice] = 'Term was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'term_internal'
    else
    	@divname = 'term'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @term = Term.find(params[:id])
    if @term.meta == nil
      @meta = Meta.new
    else
      @meta = @term.meta
    end
    render_without_layout if params['internal'] != nil
  end

  def update
    @term = Term.find(params[:id])
    #breakpoint
    if @term.meta == nil
      meta = Meta.new
      if session[:user] != nil
        meta.created_by = session[:user].login
      end
      meta.date_created = Time.now
      meta.save
      @term.meta = meta
    end
    if session[:user] != nil
      @term.meta.last_modified_by = session[:user].login
    end
    @term.meta.last_modified_date = Time.now
    if @term.meta.history == nil
      @term.meta.history = session[:user].login + " ["+Time.now.to_s+"]\n"
    else
    	@term.meta.history += session[:user].login + " ["+Time.now.to_s+"]\n"    
    end
    @term.meta.update_attributes(params[:meta])
    if @term.update_attributes(params[:term])
      flash[:notice] = 'Term was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
        if params['internal'] == 'etymology'
          render :partial => "etymologies/edit_contents",:locals => {'@etymology' => Etymology.find(params['pk'])}
        end
        if params['internal'] == 'spellings'
          render :partial => "spellings/edit_contents",:locals => {'@spelling' => Spelling.find(params['pk'])}
        end
        if params['internal'] == 'definitions'
          render :partial => "definitions/edit_contents",:locals => {'@definition' => Definition.find(params['pk'])}
        end
        if params['internal'] == 'metas'
          render :partial => "metas/edit_contents",:locals => {'@metum' => Metum.find(params['pk'])}
        end
      else
        redirect_to :action => 'show', :id => @term
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    Term.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      Term.find(params['id']).destroy unless params['id'] == nil
    if params['internal'] == 'etymology'
      render :partial => "etymologies/edit_contents", :locals => {'@etymology' => Etymology.find(params['pk'])}
    end
    if params['internal'] == 'spellings'
      render :partial => "spellings/edit_contents", :locals => {'@spelling' => Spelling.find(params['pk'])}
    end
    if params['internal'] == 'definitions'
      render :partial => "definitions/edit_contents", :locals => {'@definition' => Definition.find(params['pk'])}
    end
    if params['internal'] == 'metas'
      render :partial => "metas/edit_contents", :locals => {'@metum' => Metum.find(params['pk'])}
    end
     if params['internal'] == 'terms'
       render :partial => 'terms/edit_contents', :locals => {'@term' => Term.find(params['pk'])}
     end
    else
      Term.find(params['id']).destroy unless params['new'] == nil
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
      internal = "term"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @term = Term.find(params['id'])
    if params["relatedtype"] == "etymology"
      o = Etymology.new
      o.save
      @term.etymologies << o
      render_component :controller => "etymologies", :action => "edit", :id => o.id, :params => {'internal' => "terms", 'pk' => params['id'], 'relatedtype'=> 'etymology', 'level' => params['level']}
    end
    if params["relatedtype"] == "spelling"
      o = Spelling.new
      o.save
      @term.spellings << o
      render_component :controller => "spellings", :action => "edit", :id => o.id, :params => {'internal' => "terms", 'pk' => params['id'], 'relatedtype'=> 'spelling', 'level' => params['level']}
    end
    if params["relatedtype"] == "definition"
      o = Definition.new
      o.save
      @term.definitions << o
      render_component :controller => "definitions", :action => "edit", :id => o.id, :params => {'internal' => "terms", 'pk' => params['id'], 'relatedtype'=> 'definition', 'level' => params['level']}
    end
    if params["relatedtype"] == "metum"
      o = Metum.new
      o.save
      @term.metum = o
      @term.save
      render_component :controller => "metas", :action => "edit", :id => o.id, :params => {'internal' => "terms", 'pk' => params['id'], 'relatedtype'=> 'metum', 'level' => params['level']}
    end
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @term = Term.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @term = Term.find(params['id'])
    if params["relatedtype"] == "etymology"
      if @term.etymologies != nil 
        if params['tags'] != nil 
          @term.etymologies.delete(@term.etymologies - Etymology.find(params['tags']))
        else
          @term.etymologies.delete(@term.etymologies)
    	  end
    	end
    end
    if params["relatedtype"] == "spelling"
      if @term.spellings != nil 
        if params['tags'] != nil 
          @term.spellings.delete(@term.spellings - Spelling.find(params['tags']))
        else
          @term.spellings.delete(@term.spellings)
    	  end
    	end
    end
    if params["relatedtype"] == "definition"
      if @term.definitions != nil 
        if params['tags'] != nil 
          @term.definitions.delete(@term.definitions - Definition.find(params['tags']))
        else
          @term.definitions.delete(@term.definitions)
    	  end
    	end
    end
    if params["relatedtype"] == "metum"
      @term.meta = nil if params['tags'] == nil 
      @term.save
    end
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @term = Term.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @term = Term.find(params['term']['id'])
    query = ""
     @etymology = nil
     if params["relatedtype"] == "etymology"
       @array = []
       params['etymology'].each do |key, val| 
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
         @etymology = Etymology.find_all
       else
         @etymology = Etymology.find :all, :conditions => query
       end
     end
     @spellings = nil
     if params["relatedtype"] == "spelling"
       @array = []
       params['spelling'].each do |key, val| 
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
         @spellings = Spelling.find_all
       else
         @spellings = Spelling.find :all, :conditions => query
       end
     end
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
     if params["relatedtype"] == "metum"
       @array = []
       params['metum'].each do |key, val| 
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
         @metas = Metum.find_all
       else
         @metas = Metum.find :all, :conditions => query
       end
     end
    render_without_layout
  end

  def edit_add_to_list_action
    @term = Term.find(params['id'])
    if params["relatedtype"] == "etymology"
      if @term.etymologies == nil 
        @term.etymologies = Etymology.find(params['tags'])
      else
        @term.etymologies.delete(@term.etymologies - Etymology.find(params['tags']))
        @term.etymologies << Etymology.find(params['tags']) - @term.etymologies 
    	end
    end
    if params["relatedtype"] == "spelling"
      if @term.spellings == nil 
        @term.spellings = Spelling.find(params['tags'])
      else
        @term.spellings.delete(@term.spellings - Spelling.find(params['tags']))
        @term.spellings << Spelling.find(params['tags']) - @term.spellings 
    	end
    end
    if params["relatedtype"] == "definition"
      if @term.definitions == nil 
        @term.definitions = Definition.find(params['tags'])
      else
        @term.definitions.delete(@term.definitions - Definition.find(params['tags']))
        @term.definitions << Definition.find(params['tags']) - @term.definitions 
    	end
    end
    if params["relatedtype"] == "metum"
      if params['tags'] != nil
        @term.meta = Metum.find(params['tags'][0])
        @term.save
      end
    end
    render_partial 'edit_contents'
  end

  def search
      @term = Term.new
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
        if params['term'] != nil
          @array = []
          params['term'].each do |key, val| 
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
      if query == [""] and (params['definitions'] == nil or params['definitions'] == "") and (params['etymologies'] == nil or params['etymologies'] == "") and (params['meta'] == nil or params['meta'] == "") and (params['spellings'] == nil or params['spellings'] == "")
        @term_pages, @terms = paginate :terms, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""] or query == ""
          @terms = Term.find :all, :order => sort_clause
        else
          @terms = Term.find :all, :conditions => query, :order => sort_clause
        end
    array = []
    if params['definitions'] != nil and params['definitions'] != ""
      flash['definitions'] = params['definitions']
      for o in @terms
        found = 0
        for obj in o.definitions
          if string_contains obj.displayInfo, params['definitions']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @terms = array
    end
    array = []
    if params['etymologies'] != nil and params['etymologies'] != ""
      flash['etymologies'] = params['etymologies']
      for o in @terms
        found = 0
        for obj in o.etymologies
          if string_contains obj.displayInfo, params['etymologies']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @terms = array
    end
    array = []
    if params['meta'] != nil and params['meta'] != ""
      flash['meta'] = params['meta']
      for o in @terms
        if o.meta != nil
          if string_contains o.meta.displayInfo, params['meta']
            array = array + [o]
          end
        end
      end
      @terms = array
    end
    array = []
    if params['spellings'] != nil and params['spellings'] != ""
      flash['spellings'] = params['spellings']
      for o in @terms
        found = 0
        for obj in o.spellings
          if string_contains obj.displayInfo, params['spellings']
            found = 1
          end
        end
        if found > 0
          array = array + [o]
        end
      end
      @terms = array
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
           @term_pages = Paginator.new self, @terms.length(), items_per_page, params['page']
           if @term_pages.item_count != 0
             @pages = (@term_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@term_pages.current.first_item.to_f / @term_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @terms = @terms[@offset,items_per_page] if @terms[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
