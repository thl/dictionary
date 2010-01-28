require_dependency 'application'

class CategoriesController < ApplicationController
  before_filter :find_main_category
  
  # GET /categories
  # GET /categories.xml
  def index
    if @main_category.nil?
      @categories = Category.find(:all, :conditions => {:parent_id => nil}, :order => 'title')
    else
      @categories = @main_category.children
    end
    selected_category_id = params[:selected_category_id]
    if !selected_category_id.blank?
      @category = Category.find(selected_category_id)
      @ancestors_for_current = @category.ancestors.collect{|c| c.id.to_i} + [@category.id.to_i]
    end
    respond_to do |format|
      format.html { render :partial => 'select_index', :locals => {:categories => @categories} if request.xhr? }
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    if @main_category.nil?
      @categories = Category.find(:all, :conditions => {:parent_id => nil}, :order => 'title')
    else
      @categories = @main_category.children
    end
    @ancestors_for_current = @category.ancestors.collect{|c| c.id.to_i} + [@category.id.to_i]
    if request.xhr?
      render :update do |page|
        page.replace_html 'navigation', :partial => 'index', :locals => {:categories => @categories, :margin_depth => 0}
        page['current_category_id'].value = @category.id
        page['current_category_title'].value = h(@category.title)
        page['current_category_url'].value = category_children_url(@main_category, :selected_category_id => @category.id)
      end
    else
      @categories = @category.children
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @category }
      end
    end
  end
  
  def expand
    category = Category.find(params[:id])
    margin_depth = params[:margin_depth].to_i
    render :partial => 'expanded', :object => category, :locals => {:margin_depth => margin_depth}
  end

  def contract
    category = Category.find(params[:id])
    margin_depth = params[:margin_depth].to_i
    render :partial => 'contracted', :object => category, :locals => {:margin_depth => margin_depth}
  end
  
  private
  
  def find_main_category
    category_id = params[:category_id]
    if category_id.blank?
      @main_category = nil
    else
      @main_category = Category.find(category_id)
    end
  end  
end