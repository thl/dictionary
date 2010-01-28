module ActionController
  module Macros
    module InPlaceEditing
      module ClassMethods

        def in_place_edit_and_validate_for(object, attribute, options = {})
          define_method("set_#{object}_#{attribute}") do
            print "---------------------saving---------------------\n"
            @item = object.to_s.camelize.constantize.find(params[:id])
            # @item[attribute] = params[:value]
            # if @item.save
            #   render :text => @item[attribute]
            # else
            #   @errors = @item.errors[attribute].is_a?(Array) ?
            #   @item.errors[attribute] : [@item.errors[attribute]]
            #   error_text = attribute.to_s.titleize + " has the following errors:\n- "
            #   error_text << @errors.join("\n- ")
            #   render :text => error_text, :status => 500
            # end
          end
        end

        def in_place_edit_for(object, attribute, options = {})
          define_method("set_#{object}_#{attribute}") do
            # print "---------------------saving---------------------\n"
            @item = object.to_s.camelize.constantize.find(params[:id])
            @item[attribute] = params[:value]
            @item['updated_by'] = session[:user].login
            @item['updated_at'] = Time.now
            if @item.update_history == nil
              @item.update_history = session[:user].login + " ["+Time.now.to_s+"]
"
            else
            	@item.update_history += session[:user].login + " ["+Time.now.to_s+"]
"
            end
            puts '---------------updated by '+session[:user].login
            if @item.save
              render :text => @item[attribute].to_s.s
            else
              @errors = @item.errors[attribute].is_a?(Array) ?
              @item.errors[attribute] : [@item.errors[attribute]]
              error_text = attribute.to_s.titleize + " has the following errors:\n- "
              error_text << @errors.join("\n- ")
              render :text => error_text, :status => 500
            end
          end
        end

        def in_place_update_form(object, attribute, options = {})
          define_method("set_#{object}_#{attribute}") do
            @item = object.to_s.camelize.constantize.find(params[:id])
            print "---------------------updating---------------------\n"
            print @item[attribute].type.to_s+" = "+params[:value].type.to_s
            if @item[attribute].type.to_s == 'Fixnum'
              if params[:value].to_s == params[:value].to_i.to_s
                render :text => params[:value]
              else
                render :text => params[:value].to_s+' <font color=red>Error: Must be an Integer</font>'
              end
            else
              render :text => params[:value].to_s.s
            end
          end
        end

      end
    end
  end
end