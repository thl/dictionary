class TermsTermsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @terms_term_pages, @terms_terms = paginate :terms_terms, :per_page => 10
  end

  def show
    @terms_term = TermsTerm.find(params[:id])
  end

  def new
    @terms_term = TermsTerm.new
  end

  def create
    @terms_term = TermsTerm.new(params[:terms_term])
    if @terms_term.save
      flash[:notice] = 'TermsTerm was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @terms_term = TermsTerm.find(params[:id])
  end

  def update
    @terms_term = TermsTerm.find(params[:id])
    if @terms_term.update_attributes(params[:terms_term])
      flash[:notice] = 'TermsTerm was successfully updated.'
      redirect_to :action => 'show', :id => @terms_term
    else
      render :action => 'edit'
    end
  end

  def destroy
    TermsTerm.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
