class DefinitionCategoryAssociationsController < ApplicationController
  before_filter :find_definition_and_branch

  # GET /definition_category_associations
  # GET /definition_category_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /definition_category_associations/1
  # GET /definition_category_associations/1.xml
  def show
    @definition_category_association = DefinitionCategoryAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @definition_category_association }
    end
  end

  # GET /definition_category_associations/new
  # GET /definition_category_associations/new.xml
  def new
    case @branch.id
      when 272
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_thematic_classification_div" }
      when 286 
        render :partial => "edit_inplace", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_grammatical_function_div" }
      when 190
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_register_div" }
      when 185
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_language_context_div" }
      when 119
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_literary_genre_div" }
      when 187
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_literary_period_div" }
      when 186
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_literary_period_div" }
      #only on edit dynamic window
      when 184
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_language_type_div" }
      when 638
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_major_dialect_family_type_div" } 
    end
  end

  def new_inline
     case @branch.id
       when 272
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_thematic_classification_div" }
       when 286 
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_popupdefinition_grammatical_function_div" }
       when 190
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_register_div" }
       when 185
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_language_context_div" }
       when 119
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_literary_genre_div" }
       when 187
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_literary_period_div" }
       when 186
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_literary_period_div" }
       #only on edit dynamic window
       when 184
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_language_type_div" }
       when 638
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@definition.id}_definition_major_dialect_family_type_div" } 
     end
   end
  # GET /definition_category_associations/1/edit
  def edit
    @definition_category_association = DefinitionCategoryAssociation.find(params[:id])
  end

  # POST /definition_category_associations
  # POST /definition_category_associations.xml
  def create
    errors = []
    definition_params = params[:definition]
    associations_param = definition_params.delete(:definition_category_associations)
    new_category_ids = associations_param[:category_ids].collect(&:to_i)
    assoc = @definition.definition_category_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
    DefinitionCategoryAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
    begin
      (new_category_ids - saved_category_ids).each{|c_id| @definition.definition_category_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
        #format.xml  { render :xml => @media_category_association.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /definition_category_associations/1
  # PUT /definition_category_associations/1.xml
  def update
    @definition_category_association = DefinitionCategoryAssociation.find(params[:id])

    respond_to do |format|
      if @definition_category_association.update_attributes(params[:definition_category_association])
        flash[:notice] = 'DefinitionCategoryAssociation was successfully updated.'
        format.html { redirect_to(@definition_category_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @definition_category_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /definition_category_associations/1
  # DELETE /definition_category_associations/1.xml
  def destroy
    @definition_category_association = DefinitionCategoryAssociation.find(params[:id])
    @definition_category_association.destroy

    respond_to do |format|
      format.html { redirect_to(definition_category_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  def public_remove_thematic_classification
    d = Definition.find(params[:id])
    d.thematic_classification = nil
    d.thematic_classification_type_id = nil
        d.updated_by = session[:user].login
        d.updated_at = Time.now
        if d.update_history == nil
          d.update_history = session[:user].login + " ["+Time.now.to_s+"]
    "
        else
        	d.update_history += session[:user].login + " ["+Time.now.to_s+"]
    "
        end
    d.save
    #redirect_to :action => 'public_content_only', :id => params['head_id']
    redirect_to :action => 'public_edit', :id => params['head_id']
  end
  
  private
  
  def find_definition_and_branch
    definition_id = params[:definition_id]
    @definition = definition_id.blank? ? nil : Definition.find(definition_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
