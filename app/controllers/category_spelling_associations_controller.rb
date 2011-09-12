class CategorySpellingAssociationsController < ApplicationController
  before_filter :find_spelling_and_branch

  # GET /category_spelling_associations
  # GET /category_spelling_associations.xml
  def index
    render :partial => 'index', :locals => {:data_id => @branch.id}
  end

  # GET /category_spelling_associations/1
  # GET /category_spelling_associations/1.xml
  def show
    @category_spelling_association = CategorySpellingAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category_spelling_association }
    end
  end

  # GET /category_spelling_associations/new
  # GET /category_spelling_associations/new.xml
  def new
    case @branch.id
       when 191
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@spelling.id}_spelling_basis_of_spelling_div" }
       when 4091
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@spelling.id}_spelling_spelling_category_div" }
       when 638
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@spelling.id}_spelling_major_dialect_family_div" }
       when 119
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@spelling.id}_spelling_literary_genre_div" }
       when 187
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@spelling.id}_spelling_literary_period_div" }
       when 186
         render :partial => "edit", :locals => {:data_id => @branch.id, :update_id => "#{@spelling.id}_spelling_literary_form_div" }
     end
  end

  # GET /category_spelling_associations/1/edit
  def edit
    @category_spelling_association = CategorySpellingAssociation.find(params[:id])
  end

  # POST /category_spelling_associations
  # POST /category_spelling_associations.xml
  def create
    errors = []
    spelling_params = params[:spelling]
    associations_param = spelling_params.delete(:category_spelling_associations)
    new_category_ids = associations_param[:category_ids].collect(&:to_i)
    assoc = @spelling.category_spelling_associations.find(:all, :conditions => {:category_branch_id => @branch.id})
    saved_category_ids  = assoc.collect(&:category_id)
     CategorySpellingAssociation.destroy_all(:category_id  => saved_category_ids - new_category_ids)
     begin
       (new_category_ids - saved_category_ids).each{|c_id| @spelling.category_spelling_associations.create(:category_id => c_id, :category_branch_id => @branch.id)}
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
         #format.xml  { render :xml => @category_spelling_association.errors, :status => :unprocessable_entity }
       end
     end       
    #@category_spelling_association = CategorySpellingAssociation.new(params[:category_spelling_association])
  end

  # PUT /category_spelling_associations/1
  # PUT /category_spelling_associations/1.xml
  def update
    @category_spelling_association = CategorySpellingAssociation.find(params[:id])

    respond_to do |format|
      if @category_spelling_association.update_attributes(params[:category_spelling_association])
        flash[:notice] = 'CategorySpellingAssociation was successfully updated.'
        format.html { redirect_to(@category_spelling_association) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category_spelling_association.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category_spelling_associations/1
  # DELETE /category_spelling_associations/1.xml
  def destroy
    @category_spelling_association = CategorySpellingAssociation.find(params[:id])
    @category_spelling_association.destroy

    respond_to do |format|
      format.html { redirect_to(category_spelling_associations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_spelling_and_branch
    spelling_id = params[:spelling_id]
    @spelling = spelling_id.blank? ? nil : Spelling.find(spelling_id)
    category_id = params[:branch_id]
    @branch = category_id.blank? ? nil : Category.find(category_id)
  end
  
end
