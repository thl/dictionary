class CategoryTranslationEquivalentAssociationsController < ApplicationController
  before_filter :find_translation_equivalent_and_branch

  # GET /category_translation_equivalent_associations
  # GET /category_translation_equivalent_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_translation_equivalent_associations/1
  # GET /category_translation_equivalent_associations/1.xml
  def show
    @category_translation_equivalent_association = CategoryTranslationEquivalentAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_translation_equivalent_association }
    end
  end

  # GET /category_translation_equivalent_associations/new
  # GET /category_translation_equivalent_associations/new.xml
  def new
    case @branch.id
      when 184
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@translation_equivalent.id}_translation_equivalent_language_div" }
    end
  end

  # GET /category_translation_equivalent_associations/1/edit
  def edit
    @category_translation_equivalent_association = CategoryTranslationEquivalentAssociation.find(params[:id])
  end

  # POST /category_translation_equivalent_associations
  # POST /category_translation_equivalent_associations.xml
  def create
     errors = []
     if !params[:translation_equivalent].blank?
       translation_equivalent_params = params[:translation_equivalent]
       associations_param = translation_equivalent_params.delete(:category_translation_equivalent_associations)
       new_category_ids = associations_param[:category_ids].collect(&:to_i)
     else
       new_category_ids = []
     end
     assoc = @translation_equivalent.category_translation_equivalent_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
     saved_category_ids  = assoc.collect(&:category_id)  
     CategoryTranslationEquivalentAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @translation_equivalent.category_translation_equivalent_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_translation_equivalent_association.errors, :status => :unprocessable_entity }
       end
     end   
    
    #@category_translation_equivalent_association = CategoryTranslationEquivalentAssociation.new(params[:category_translation_equivalent_association])
  end

  # PUT /category_translation_equivalent_associations/1
  # PUT /category_translation_equivalent_associations/1.xml
  def update
    @category_translation_equivalent_association = CategoryTranslationEquivalentAssociation.find(params[:id])

    respond_to do |format|
      if @category_translation_equivalent_association.update_attributes(params[:category_translation_equivalent_association])
        flash[:notice] = 'CategoryTranslationEquivalentAssociation was successfully updated.'
        format.html { redirect_to(@category_translation_equivalent_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_translation_equivalent_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_translation_equivalent_associations/1
  # DELETE /category_translation_equivalent_associations/1.xml
  def destroy
    @category_translation_equivalent_association = CategoryTranslationEquivalentAssociation.find(params[:id])
    @category_translation_equivalent_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_translation_equivalent_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_translation_equivalent_and_branch
    translation_equivalent_id = params[:translation_equivalent_id]
    @translation_equivalent = translation_equivalent_id.blank? ? nil : TranslationEquivalent.find(translation_equivalent_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
end
