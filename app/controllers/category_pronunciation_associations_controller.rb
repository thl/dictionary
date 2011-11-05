class CategoryPronunciationAssociationsController < ApplicationController
  before_filter :find_pronunciation_and_branch

  # GET /category_pronunciation_associations
  # GET /category_pronunciation_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_pronunciation_associations/1
  # GET /category_pronunciation_associations/1.xml
  def show
    @category_pronunciation_association = CategoryPronunciationAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_pronunciation_association }
    end
  end

  # GET /category_pronunciation_associations/new
  # GET /category_pronunciation_associations/new.xml
  def new
    case @branch.id
      when 638
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@pronunciation.id}_pronunciation_major_dialect_family_div" }
    end
  end

  # GET /category_pronunciation_associations/1/edit
  def edit
    @category_pronunciation_association = CategoryPronunciationAssociation.find(params[:id])
  end

  # POST /category_pronunciation_associations
  # POST /category_pronunciation_associations.xml
  def create
    errors = []
    if !params[:pronunciation].blank?
       pronunciation_params = params[:pronunciation]
       #association_params = params[:pronunciation]
       associations_param = pronunciation_params.delete(:category_pronunciation_associations)
       #category_ids = association_params.delete(:category_pronunciation_associations_id).split(',').collect(&:strip).reject(&:blank?).collect(&:to_i)
       #new_category_ids = category_ids
       new_category_ids = associations_param[:category_ids].collect(&:to_i)
     else
       new_category_ids = []
     end
     assoc = @pronunciation.category_pronunciation_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
     ##saved_category_ids = @pronunciation.category_pronunciation_associations.find(:all, :conditions => {:category_branch_id => @branch.id}).collect(&:category_id)
     saved_category_ids  = assoc.collect(&:category_id)
     CategoryPronunciationAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @pronunciation.category_pronunciation_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_pronunciation_association.errors, :status => :unprocessable_entity }
       end
     end   
    #@category_pronunciation_association = CategoryPronunciationAssociation.new(params[:category_pronunciation_association])

  end

  # PUT /category_pronunciation_associations/1
  # PUT /category_pronunciation_associations/1.xml
  def update
    @category_pronunciation_association = CategoryPronunciationAssociation.find(params[:id])

    respond_to do |format|
      if @category_pronunciation_association.update_attributes(params[:category_pronunciation_association])
        flash[:notice] = 'CategoryPronunciationAssociation was successfully updated.'
        format.html { redirect_to(@category_pronunciation_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_pronunciation_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_pronunciation_associations/1
  # DELETE /category_pronunciation_associations/1.xml
  def destroy
    @category_pronunciation_association = CategoryPronunciationAssociation.find(params[:id])
    @category_pronunciation_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_pronunciation_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_pronunciation_and_branch
    pronunciation_id = params[:pronunciation_id]
    @pronunciation = pronunciation_id.blank? ? nil : Pronunciation.find(pronunciation_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
