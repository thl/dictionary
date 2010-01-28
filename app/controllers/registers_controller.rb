class RegistersController < ApplicationController
  layout 'stgall'
  helper :habtm
  helper :sort
  include SortHelper



  Register.content_columns.each do |column|
    in_place_edit_for :register, column.name
  end

  def index
    list
    render :action => 'list'
  end

  def list
    sort_init 'register'
    sort_update
    if params['items_per_page'] != nil
      items_per_page = params['items_per_page'].to_i
    else
      items_per_page = 10
    end
    @register_pages, @registers = paginate :register, :per_page => items_per_page, :order_by => sort_clause
    if @register_pages.item_count != 0
      @pages = (@register_pages.item_count.to_f / items_per_page.to_f).ceil
      @current_page = (@register_pages.current.first_item.to_f / @register_pages.item_count.to_f * @pages).ceil
    else
      @pages = 0
      @current_page = 0
    end
  end

  def show
    @register = Register.find(params[:id])
  end

  def new
    @register = Register.new
    @register.created_by = session[:user].login
    @register.created_at = Time.now
    @register.save
    redirect_to :action => 'edit_dynamic', :id => @register.id, :params => {'new' => 'true'}
  end

  def create
    if(params['internal'] != nil)
      @divname = 'register_internal'
    else
    	@divname = 'register'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @register = Register.new(params[:register])
    if @register.save
      flash[:notice] = 'Register was succesfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    if(params['internal'] != nil)
      @divname = 'register_internal'
    else
    	@divname = 'register'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @register = Register.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def edit_dynamic
    if(params['internal'] != nil)
      @divname = 'register_internal'
    else
    	@divname = 'register'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '1'
    end
    @register = Register.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def show_edit
    if(params['internal'] != nil)
      @divname = 'register_internal'
    else
    	@divname = 'register'
    end
    if params['level'] != nil
      params['level'] = (params['level'].to_i + 1).to_s
    else
      params['level'] = '0'
    end
    @register = Register.find(params[:id])
    render_without_layout if params['internal'] != nil
  end

  def update
    @register = Register.find(params[:id])
    if session[:user] != nil
      @register.updated_by = session[:user].login
    end
    @register.updated_at = Time.now
    if @register.update_history == nil
      @register.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
    else
    	@register.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
    end
    if @register.update_attributes(params[:register])
      flash[:notice] = 'Register was succesfully created.'
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @register
      end
    else
      render :action => 'edit'
    end
  end

  def update_related
      if params['internal'] != nil and params['internal'] != ''
      else
        redirect_to :action => 'show', :id => @register
      end
  end

  def destroy
    Register.find(params[:id]).destroy
    if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
      redirect_to session['return_to']  #:action => 'list'
    else
      redirect_to session['previous_page']
    end
  end


  def cancel
    if(params['internal'] != nil)
      if params['new'] != nil
        Register.find(params['id']).destroy unless params['id'] == nil
      end
     if params['internal'] == 'registers'
       render :partial => 'registers/edit_contents', :locals => {'@register' => Register.find(params['pk'])}
     end
    else
      Register.find(params['id']).destroy unless params['new'] == nil
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
      internal = "register"
    end
    if params['level'] != nil
      level = params['level'].to_i + 1
    else
    	 level = '2'
    end
    @register = Register.find(params['id'])
  end

  def edit_delete
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
    @register = Register.find(params['id'])
    render_without_layout
  end

  def edit_delete_action
    @register = Register.find(params['id'])
    render_partial "edit_contents"
  end

  def edit_search
    if params['level'] != nil
      params['level'] = params['level'].to_i + 1
    else
    	params['level'] = '3'
    end
      @register = Register.find(params['id'])
      render_without_layout
  end

  def edit_search_action
    @register = Register.find(params['register']['id'])
    query = ""
    render_without_layout
  end

  def edit_add_to_list_action
    @register = Register.find(params['id'])
    render_partial 'edit_contents'
  end

  def search
      @register = Register.new
  end

  def searchaction
      sort_init 'register'
      sort_update
      vals=""
      query=""
      if params['query']
        @query = buildquery(params["query"])
        query = buildquery(params["query"])
        flash["query"] = params["query"]
      else
        if params['register'] != nil
          @array = []
          params['register'].each do |key, val| 
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
        @register_pages, @registers = paginate :registers, :order_by => sort_clause
        render_action 'list'
      else
        if query == [""]  or query == ""
          @registers = Register.find :all, :order => sort_clause
        else
          @registers = Register.find :all, :conditions => query, :order => sort_clause
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
           @register_pages = Paginator.new self, @registers.length(), items_per_page, params['page']
           if @register_pages.item_count != 0
             @pages = (@register_pages.item_count.to_f / items_per_page.to_f).ceil
             @current_page = (@register_pages.current.first_item.to_f / @register_pages.item_count.to_f * @pages).ceil
           else
             @pages = 0
             @current_page = 0
           end
           @offset = 0
           if (params['page'] != nil) 
             @offset = (params['page'].to_i - 1) * 10
           end
           @registers = @registers[@offset,items_per_page] if @registers[@offset,items_per_page] != nil
           # -----------------------------------------------------------------------------
           flash["query"] = vals
           flash["existingquery"] = params["query"]
           render_action 'list'
         end
  end
end
