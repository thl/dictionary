class CategoryMetaAssociationsController < ApplicationController
  before_filter :find_meta_and_branch

  # GET /category_meta_associations
  # GET /category_meta_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_meta_associations/1
  # GET /category_meta_associations/1.xml
  def show
    @category_meta_association = CategoryMetaAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_meta_association }
    end
  end

  # GET /category_meta_associations/new
  # GET /category_meta_associations/new.xml
  def new
    case @branch.id
       when 236
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@meta.id}_meta_project_type_div" }
       when 184
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@meta.id}_meta_language_type_div" } 
     end
  end

  # GET /category_meta_associations/1/edit
  def edit
    @category_meta_association = CategoryMetaAssociation.find(params[:id])
  end

  # POST /category_meta_associations
  # POST /category_meta_associations.xml
  def create
    errors = []
    if !params[:meta].blank?
      meta_params = params[:meta]
      associations_param = meta_params.delete(:category_meta_associations)
      new_category_ids = associations_param[:category_ids].collect(&:to_i)
    else
      new_category_ids = []
    end
    assoc = @meta.category_meta_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
     CategoryMetaAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @meta.category_meta_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
     rescue ActiveRecord::StatementInvalid
       # ignore duplicate issues. how to add ignore parameter to sql query here without changing to sql completely?
     else
      #errors.push( @media_category_association.errors )
     end

     respond_to do |format|
       unless errors.length > 0
         format.html do
           render :partial => 'index', :locals => { :data_id => @branch.id}
         end
       else
         flash[:notice] = errors.join(', ')
         format.html { render :action => "new" }
         #format.xml  { render :xml => @category_meta_association.errors, :status => :unprocessable_entity }
       end
     end
#    @category_meta_association = CategoryMetaAssociation.new(params[:category_meta_association])
  end

  # PUT /category_meta_associations/1
  # PUT /category_meta_associations/1.xml
  def update
    @category_meta_association = CategoryMetaAssociation.find(params[:id])

    respond_to do |format|
      if @category_meta_association.update_attributes(params[:category_meta_association])
        flash[:notice] = 'CategoryMetaAssociation was successfully updated.'
        format.html { redirect_to(@category_meta_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_meta_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_meta_associations/1
  # DELETE /category_meta_associations/1.xml
  def destroy
    @category_meta_association = CategoryMetaAssociation.find(params[:id])
    @category_meta_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_meta_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_meta_and_branch
    meta_id = params[:meta_id]
    @meta = meta_id.blank? ? nil : Meta.find(meta_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
