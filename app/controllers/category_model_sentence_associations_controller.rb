class CategoryModelSentenceAssociationsController < ApplicationController
  before_filter :find_model_sentence_and_branch

  # GET /category_model_sentence_associations
  # GET /category_model_sentence_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_model_sentence_associations/1
  # GET /category_model_sentence_associations/1.xml
  def show
    @category_model_sentence_association = CategoryModelSentenceAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_model_sentence_association }
    end
  end

  # GET /category_model_sentence_associations/new
  # GET /category_model_sentence_associations/new.xml
  def new
    case @branch.id
      when 184
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_language_type_div" }
      when 638
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_major_dialect_family_type_div" }
      when 119
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_literary_genre_type_div" }
      when 187
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_literary_period_type_div" }
      when 186
        render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_literary_form_type_div" }

      #when 191
      #   render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_basis_of_model_sentence_div" }
      # when 4091
      #   render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@model_sentence.id}_model_sentence_model_sentence_category_div" }

     end
  end

  # GET /category_model_sentence_associations/1/edit
  def edit
    @category_model_sentence_association = CategoryModelSentenceAssociation.find(params[:id])
  end

  # POST /category_model_sentence_associations
  # POST /category_model_sentence_associations.xml
  def create
    errors = []
    if !params[:model_sentence].blank?
      model_sentence_params = params[:model_sentence]
      associations_param = model_sentence_params.delete(:category_model_sentence_associations)
      new_category_ids = associations_param[:category_ids].collect(&:to_i)
    else
      new_category_ids = []
    end
    assoc = @model_sentence.category_model_sentence_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
     saved_category_ids  = assoc.collect(&:category_id)
      CategoryModelSentenceAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
      begin
        (new_category_ids - saved_category_ids).each{|c_id| @model_sentence.category_model_sentence_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
          #format.xml  { render :xml => @category_model_sentence_association.errors, :status => :unprocessable_entity }
        end
      end       
    
    #@category_model_sentence_association = CategoryModelSentenceAssociation.new(params[:category_model_sentence_association])
  end

  # PUT /category_model_sentence_associations/1
  # PUT /category_model_sentence_associations/1.xml
  def update
    @category_model_sentence_association = CategoryModelSentenceAssociation.find(params[:id])

    respond_to do |format|
      if @category_model_sentence_association.update_attributes(params[:category_model_sentence_association])
        flash[:notice] = 'CategoryModelSentenceAssociation was successfully updated.'
        format.html { redirect_to(@category_model_sentence_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_model_sentence_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_model_sentence_associations/1
  # DELETE /category_model_sentence_associations/1.xml
  def destroy
    @category_model_sentence_association = CategoryModelSentenceAssociation.find(params[:id])
    @category_model_sentence_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_model_sentence_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_model_sentence_and_branch
    model_sentence_id = params[:model_sentence_id]
    @model_sentence = model_sentence_id.blank? ? nil : ModelSentence.find(model_sentence_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
