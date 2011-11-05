class CategoryOralQuotationAssociationsController < ApplicationController
  before_filter :find_oral_quotation_and_branch

  # GET /category_oral_quotation_associations
  # GET /category_oral_quotation_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_oral_quotation_associations/1
  # GET /category_oral_quotation_associations/1.xml
  def show
    @category_oral_quotation_association = CategoryOralQuotationAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_oral_quotation_association }
    end
  end

  # GET /category_oral_quotation_associations/new
  # GET /category_oral_quotation_associations/new.xml
  def new
    case @branch.id
       when 638
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@oral_quotation.id}_oral_quotation_major_dialect_family_div" }
     end
  end

  # GET /category_oral_quotation_associations/1/edit
  def edit
    @category_oral_quotation_association = CategoryOralQuotationAssociation.find(params[:id])
  end

  # POST /category_oral_quotation_associations
  # POST /category_oral_quotation_associations.xml
  def create
    errors = []
    if !params[:oral_quotation].blank?
      oral_quotation_params = params[:oral_quotation]
      associations_param = oral_quotation_params.delete(:category_oral_quotation_associations)
      new_category_ids = associations_param[:category_ids].collect(&:to_i)
    else
      new_category_ids = []
    end
    assoc = @oral_quotation.category_oral_quotation_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
     CategoryOralQuotationAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @oral_quotation.category_oral_quotation_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_oral_quotation_association.errors, :status => :unprocessable_entity }
       end
     end       
    
    #@category_oral_quotation_association = CategoryOralQuotationAssociation.new(params[:category_oral_quotation_association])
  end

  # PUT /category_oral_quotation_associations/1
  # PUT /category_oral_quotation_associations/1.xml
  def update
    @category_oral_quotation_association = CategoryOralQuotationAssociation.find(params[:id])

    respond_to do |format|
      if @category_oral_quotation_association.update_attributes(params[:category_oral_quotation_association])
        flash[:notice] = 'CategoryOralQuotationAssociation was successfully updated.'
        format.html { redirect_to(@category_oral_quotation_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_oral_quotation_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_oral_quotation_associations/1
  # DELETE /category_oral_quotation_associations/1.xml
  def destroy
    @category_oral_quotation_association = CategoryOralQuotationAssociation.find(params[:id])
    @category_oral_quotation_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_oral_quotation_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_oral_quotation_and_branch
    oral_quotation_id = params[:oral_quotation_id]
    @oral_quotation = oral_quotation_id.blank? ? nil : OralQuotation.find(oral_quotation_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
