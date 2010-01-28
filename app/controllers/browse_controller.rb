class BrowseController < ApplicationController
  layout 'staging_new'
  
  def index
    render :file => "/tmp/page_#{params[:letter]}.rhtml"
  end
  
  def clear
    expire_page(:controller => :browse, :action => :index)
    render :text => 'done'
  end
end