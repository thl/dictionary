# The filters added to this controller will be run for all controllers in the application.
# Likewise will all the methods added be available for all controllers.
require_dependency "login_system"
require_dependency 'unicode'
require 'rubygems'
# require_gem 'hpricot'
require 'hpricot'
require 'open-uri'
require 'net/http'
require 'rexml/document'

class ApplicationController < ActionController::Base
  uses_tiny_mce :options => { 
  								:theme => 'advanced',
  								:editor_selector => 'mceEditor2',
  								:width => '550px',
  								:height => '220px',
  								:theme_advanced_resizing => 'true',
  								:theme_advanced_toolbar_location => 'top', 
  								:theme_advanced_toolbar_align => 'left',
  								:theme_advanced_buttons1 => %w{fullscreen separator bold italic underline strikethrough separator undo redo separator link unlink template formatselect code},
  								:theme_advanced_buttons2 => %w{cut copy paste separator pastetext pasteword separator bullist numlist outdent indent separator  justifyleft justifycenter justifyright justifiyfull separator removeformat  charmap },
  								:theme_advanced_buttons3 => [],
  								:plugins => %w{contextmenu paste media fullscreen template noneditable },				
  								:template_external_list_url => '/templates/templates.js',
  								:noneditable_leave_contenteditable => 'true',
  								:theme_advanced_blockformats => 'p,h1,h2,h3,h4,h5,h6'
  								}
  								  
  layout 'stgall'
  include LoginSystem
  # model :user 
  require 'inplacemacro'
	before_filter :login_required, :only => [:new, :edit, :destroy, :create, :list, :show, :show_edit, :edit_dynamic, :public_edit, :index_edit ]

	before_filter :set_charset
	
  # before_filter :save_user, :only => [:save, :update]
	
	#before_filter :previous_page
	after_filter :remember_location
 	# Never return to one of these controllers:
 	@@REMEMBER_NOT = ['feed', 'login', 'user', 'cancel']
	@@REMEMBER = ['list', 'show']

	$home_page = "/edit.html"
  $root_dir = ''
	if defined? BASE_URL
	  $root_dir = BASE_URL
	end
	
	def local_request?
		["127.0.0.1","128.143.22.122"].include?(request.remote_ip)
	end
	
  # auto_complete_for :search_term, :term

  def set_charset
    headers["Content-Type"] = "text/html; charset=utf-8" 
  end

  @@title = 'test'

	$allow_editing = true
	
	def buildquery (fields)
    query = ""
		@array = []
		term = ''
    if fields != nil
      op = 'anywhere'
      if fields.include?('exact:')
        op = 'exact'
      elsif fields.include?('beginning:')
        op = 'beginning'
      end
      array = fields.split(",")
      for i in array
        a = i.split(":")
        if query != ""
          query = query + " and "
        end
        if a[0] != nil #and a[1] != nil
          term = a[1]
          if a[1] == nil and (a[0] != "anywhere") and (a[0] != "beginning") and (a[0] != "exact")
            query = query + a[0] + " ilike '%'" 
					elsif (a[1] != "-null-") and (a[0] != "anywhere") and (a[0] != "beginning") and (a[0] != "exact")
					  if op == 'anywhere'
  	          query = query + a[0] + " ilike ?" 
  						@array.push("%"+a[1]+"%")
  					elsif op == 'beginning'
    	        query = query + a[0] + " ilike ?" 
    					@array.push(a[1]+"%")
    				else
      	      query = query + a[0] + " = ?" 
      				@array.push(a[1])
      			end
					elsif (a[0] != "anywhere") and (a[0] != "beginning") and (a[0] != "exact")
						query = query + a[0] + " is null"
					end
        end
      end
      if query != ''
        # query += " or wylie ilike ?"
        # @array.push("%#{term}%")
        @array = [query] + @array
      end
      # debugger
    end
    return @array
  end  

  def string_contains (str1, str2)
  	lstr1 = str1.downcase
  	lstr2 = str2.downcase
  	if lstr1.include? lstr2
  		return true
  	else
  		return false
  	end
  end


  def test
    debugger
		if ((params["query"] == nil) ) and flash['relatedsearch'] != 'yes'
		  #flash = flash
			redirect_to :action => "list", :params => {"page" => params["page"], 'items_per_page' => params['items_per_page'], 'query' => ''}
		elsif params['query'] == 'browse'
		  newparams = {"page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode']}
			redirect_to :action =>  "browse", :params => params
		elsif params['query'] == 'user_search'
		  newparams = {"page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode'], "login" => params['login']}
			redirect_to :action =>  "admin_search_action", :params => params
		else
		  newparams = {"page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode']}
		  flash.each {|k,v|
		    params[k.to_s]=v.to_s
		  }
			redirect_to :action =>  "find_head_terms", :params => newparams
		end
    # render :text => 'worked'
    #  @literary_genre = []
    # LiteraryGenre.find(:all).each do |l|
    #   @literary_genre += [l.literary_genre]
    # end
    # render :layout => 'staging'
  end
	
	def jump_to_page
	  #breakpoint
     debugger
		if ((params["query"] == nil) ) and flash['relatedsearch'] != 'yes'
		  #flash = flash
			redirect_to :action => "list", :params => {"page" => params["page"], 'items_per_page' => params['items_per_page'], 'query' => ''}
		elsif params['query'] == 'browse'
		  newparams = {"page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode']}
			redirect_to :action =>  "browse", :params => params
		elsif params['query'] == 'user_search'
		  newparams = {"page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode'], "login" => params['login']}
			redirect_to :action =>  "admin_search_action", :params => newparams
		else
		  newparams = {"page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode']}
		  flash.each {|k,v|
		    newparams[k.to_s]=v.to_s
		  }
			redirect_to :action =>  "find_head_terms", :params => newparams
		end
	end

	def jump_to_related_page
		  newparams = {"id" => params["id"], "page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode']}
		  flash.each {|k,v|
		    newparams[k.to_s]=v.to_s
		  }
			redirect_to :action =>  "edit_search_action", :params => newparams
	end

	def jump_to_full_synonym_page
     debugger
		  newparams = {"id" => params["id"], "page" => params["page"], 'items_per_page' => params['items_per_page'],"query"=>params["query"], "mode" => params['mode']}
		  flash.each {|k,v|
		    newparams[k.to_s]=v.to_s
		  }
			redirect_to :action =>  "synonym_search_action", :params => newparams
	end


	def find_jump_to_page
	    if params['query'] == 'browse'
  		  params = {"page" => params["page"], 'items_per_page' => params['items_per_page'], "paged" => "yes,","query"=>params["query"], "mode" => params['mode']}
  			redirect_to :action =>  "browse", :params => params
	    else
        params = {"page" => params["page"], 'items_per_page' => params['items_per_page'], "paged" => "yes,","query"=>params["query"], "mode" => params['mode']}
  		  flash.each {|k,v|
  		    params[k.to_s]=v.to_s
  		  }
        # breakpoint
  			redirect_to :action =>  "find_head_terms", :params => params
  		end
	end

	def menu_action
		if params["type"] == "home"
			session[:dbtable] = "home"
			session['return_to'] = 'home'
			#breakpoint
			redirect_to_url($home_page)
		else
			redirect_to_url( url_for( :controller => params["table_name"], :action => params["type"]))
		end
		session[:dbtable] = params["table_name"] unless params["type"] == "home"
		#render_action 'menu'
	end
	
	private
	
	def previous_page
		if @@REMEMBER_NOT.include?(controller_name) == false
		if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
			session['previous_page'] = session['return_to'] 
		else
			session['previous_page'] = 'invalid'
		end
		end
	end	
	
	def remember_location
		#breakpoint
 		if response.headers['Status'] == '200 OK'
			if @@REMEMBER_NOT.include?(controller_name) == false
				#breakpoint
				#session['return_to'] = request.request_uri if @@REMEMBER.include? params['action']
				if session['return_to'] != nil
					if session['return_to'].include?('/list') or session['return_to'].include?('/searchaction')
						session['previous_page'] = session['return_to'] 
				  else
					  session['previous_page'] = 'invalid'
				  end
				end
				#session['previous_page'] = request.request_uri if session['return_to'] == 'home'
				if defined? BASE_URL
				  session['return_to'] = BASE_URL+request.request_uri 
				else
 				  session['return_to'] = request.request_uri 
 				end
			end
 		end
	end

	
	def local_request?
		["127.0.0.1","128.143.22.122"].include?(request.remote_ip)
	end
	
	def display_history
	  @history = params[:history]
	  render :partial => 'partials/display_history'
	end

	def display_public_history
	  @history = ''
	  hash = {}
	  h = params[:history]
	  a = h.split("\n")
    a.each {|k| hash[k.split(' ')[0]] = k}
    # breakpoint
    hash.each do |k,v|
      user = User.find(:first,:conditions=>"login='"+k+"'")
      # puts hash[k].gsub(k,user.full_name)
      @history += hash[k].gsub(k,user.full_name) unless user == nil
      @history += "\n"
    end
    # puts @history
	  render :partial => 'partial/display_history'
	end
	
	class Image
    attr_reader :thumb, :medium, :large, :doc_id, :title
    attr_writer :thumb, :medium, :large, :doc_id, :title
  end
  
  def entities( str )
    converted = []
    # str.split(//).collect { |c| converted << ( c[0] > 127 ? "&##{c[0]};" : c ) }
    str.unpack("U*").collect {|s| (s > 127 ? "&##{s};" : s.chr) }.join("")
    # converted.join('')
  end
  
end
