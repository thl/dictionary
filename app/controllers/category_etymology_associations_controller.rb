class CategoryEtymologyAssociationsController < ApplicationController
  before_filter :find_etymology_and_branch

  # GET /category_etymology_associations
  # GET /category_etymology_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_etymology_associations/1
  # GET /category_etymology_associations/1.xml
  def show
    @category_etymology_association = CategoryEtymologyAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_etymology_association }
    end
  end

  # GET /category_etymology_associations/new
  # GET /category_etymology_associations/new.xml
  def new
    case @branch.id
       when 182
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_etymology_category_div" }
       when 184
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_loan_language_type_div" }
       when 180
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_derivation_type_div" }
       when 638
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_major_dialect_family_type_div" }
       when 119
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_literary_genre_type_div" }
       when 187
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_literary_period_type_div" }
       when 186
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@etymology.id}_etymology_literary_form_type_div" }
     end

  end

  # GET /category_etymology_associations/1/edit
  def edit
    @category_etymology_association = CategoryEtymologyAssociation.find(params[:id])
  end

  # POST /category_etymology_associations
  # POST /category_etymology_associations.xml
  def create
    errors = []
    etymology_params = params[:etymology]
    associations_param = etymology_params.delete(:category_etymology_associations)
    new_category_ids = associations_param[:category_ids].collect(&:to_i)
    assoc = @etymology.category_etymology_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
     CategoryEtymologyAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @etymology.category_etymology_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_etymology_association.errors, :status => :unprocessable_entity }
       end
     end   
    #@category_etymology_association = CategoryEtymologyAssociation.new(params[:category_etymology_association])

  end

  # PUT /category_etymology_associations/1
  # PUT /category_etymology_associations/1.xml
  def update
    @category_etymology_association = CategoryEtymologyAssociation.find(params[:id])

    respond_to do |format|
      if @category_etymology_association.update_attributes(params[:category_etymology_association])
        flash[:notice] = 'CategoryEtymologyAssociation was successfully updated.'
        format.html { redirect_to(@category_etymology_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_etymology_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_etymology_associations/1
  # DELETE /category_etymology_associations/1.xml
  def destroy
    @category_etymology_association = CategoryEtymologyAssociation.find(params[:id])
    @category_etymology_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_etymology_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_etymology_and_branch
    etymology_id = params[:etymology_id]
    @etymology = etymology_id.blank? ? nil : Etymology.find(etymology_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
