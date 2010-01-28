class TermsDefinitionsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @terms_definition_pages, @terms_definitions = paginate :terms_definitions, :per_page => 10
  end

  def show
    @terms_definition = TermsDefinition.find(params[:id])
  end

  def new
    @terms_definition = TermsDefinition.new
  end

  def create
    @terms_definition = TermsDefinition.new(params[:terms_definition])
    if @terms_definition.save
      flash[:notice] = 'TermsDefinition was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @terms_definition = TermsDefinition.find(params[:id])
  end

  def update
    @terms_definition = TermsDefinition.find(params[:id])
    if @terms_definition.update_attributes(params[:terms_definition])
      flash[:notice] = 'TermsDefinition was successfully updated.'
      redirect_to :action => 'show', :id => @terms_definition
    else
      render :action => 'edit'
    end
  end

  def destroy
    TermsDefinition.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
