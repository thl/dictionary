class CategoryLiteraryQuotationAssociationsController < ApplicationController
  before_filter :find_literary_quotation_and_branch

  # GET /category_literary_quotation_associations
  # GET /category_literary_quotation_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_literary_quotation_associations/1
  # GET /category_literary_quotation_associations/1.xml
  def show
    @category_literary_quotation_association = CategoryLiteraryQuotationAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_literary_quotation_association }
    end
  end

  # GET /category_literary_quotation_associations/new
  # GET /category_literary_quotation_associations/new.xml
  def new
    case @branch.id
       when 192
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@literary_quotation.id}_literary_quotation_script_type_div" }
       when 186
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@literary_quotation.id}_literary_quotation_literary_form_type_div" } 
     end
  end

  # GET /category_literary_quotation_associations/1/edit
  def edit
    @category_literary_quotation_association = CategoryLiteraryQuotationAssociation.find(params[:id])
  end

  # POST /category_literary_quotation_associations
  # POST /category_literary_quotation_associations.xml
  def create
    errors = []
    literary_quotation_params = params[:literary_quotation]
    associations_param = literary_quotation_params.delete(:category_literary_quotation_associations)
    new_category_ids = associations_param[:category_ids].collect(&:to_i)
    assoc = @literary_quotation.category_literary_quotation_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
     CategoryLiteraryQuotationAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @literary_quotation.category_literary_quotation_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_literary_quotation_association.errors, :status => :unprocessable_entity }
       end
     end       

    #@category_literary_quotation_association = CategoryLiteraryQuotationAssociation.new(params[:category_literary_quotation_association])

  end

  # PUT /category_literary_quotation_associations/1
  # PUT /category_literary_quotation_associations/1.xml
  def update
    @category_literary_quotation_association = CategoryLiteraryQuotationAssociation.find(params[:id])

    respond_to do |format|
      if @category_literary_quotation_association.update_attributes(params[:category_literary_quotation_association])
        flash[:notice] = 'CategoryLiteraryQuotationAssociation was successfully updated.'
        format.html { redirect_to(@category_literary_quotation_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_literary_quotation_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_literary_quotation_associations/1
  # DELETE /category_literary_quotation_associations/1.xml
  def destroy
    @category_literary_quotation_association = CategoryLiteraryQuotationAssociation.find(params[:id])
    @category_literary_quotation_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_literary_quotation_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
  def find_literary_quotation_and_branch
    literary_quotation_id = params[:literary_quotation_id]
    @literary_quotation = literary_quotation_id.blank? ? nil : LiteraryQuotation.find(literary_quotation_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
