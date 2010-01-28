class TermTypesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @term_type_pages, @term_types = paginate :term_types, :per_page => 10
  end

  def show
    @term_type = TermType.find(params[:id])
  end

  def new
    @term_type = TermType.new
  end

  def create
    @term_type = TermType.new(params[:term_type])
    if @term_type.save
      flash[:notice] = 'TermType was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @term_type = TermType.find(params[:id])
  end

  def update
    @term_type = TermType.find(params[:id])
    if @term_type.update_attributes(params[:term_type])
      flash[:notice] = 'TermType was successfully updated.'
      redirect_to :action => 'show', :id => @term_type
    else
      render :action => 'edit'
    end
  end

  def destroy
    TermType.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
