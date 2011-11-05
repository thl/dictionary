class CategoryTranslationAssociationsController < ApplicationController
  before_filter :find_translation_and_branch

  # GET /category_translation_associations
  # GET /category_translation_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_translation_associations/1
  # GET /category_translation_associations/1.xml
  def show
    @category_translation_association = CategoryTranslationAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_translation_association }
    end
  end

  # GET /category_translation_associations/new
  # GET /category_translation_associations/new.xml
  def new
    case @branch.id
       when 184
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@translation.id}_translation_language_div" }
     end
  end

  # GET /category_translation_associations/1/edit
  def edit
    @category_translation_association = CategoryTranslationAssociation.find(params[:id])
  end

  # POST /category_translation_associations
  # POST /category_translation_associations.xml
  def create
    errors = []
    if !params[:translation].blank?
      translation_params = params[:translation]
      associations_param = translation_params.delete(:category_translation_associations)
      new_category_ids = associations_param[:category_ids].collect(&:to_i)
    else
      new_category_ids = []
    end
    assoc = @translation.category_translation_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
     CategoryTranslationAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @translation.category_translation_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_translation_association.errors, :status => :unprocessable_entity }
       end
     end   
    #@category_translation_association = CategoryTranslationAssociation.new(params[:category_translation_association])
  end

  # PUT /category_translation_associations/1
  # PUT /category_translation_associations/1.xml
  def update
    @category_translation_association = CategoryTranslationAssociation.find(params[:id])

    respond_to do |format|
      if @category_translation_association.update_attributes(params[:category_translation_association])
        flash[:notice] = 'CategoryTranslationAssociation was successfully updated.'
        format.html { redirect_to(@category_translation_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_translation_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_translation_associations/1
  # DELETE /category_translation_associations/1.xml
  def destroy
    @category_translation_association = CategoryTranslationAssociation.find(params[:id])
    @category_translation_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_translation_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_translation_and_branch
    translation_id = params[:translation_id]
    @translation = translation_id.blank? ? nil : Translation.find(translation_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
