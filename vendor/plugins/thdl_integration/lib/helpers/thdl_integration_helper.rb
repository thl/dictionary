module ThdlIntegrationHelper

  def header(body_attributes = Hash.new)
    frame_init()
    load_attributes if $html_start.blank?
    return $html_start +
           "<title>#{controller.controller_name.humanize}: #{controller.action_name.humanize}</title>\n" +
           "#{javascripts}\n" +
           "#{frame_js}\n" +
           "\n#{stylesheets}\n" +
           "#{frame_css}\n" +
           "</head>\n" +
           "<body id=\"body\" #{body_attributes.collect{|at, value| "#{at.to_s}=\"#{value}\""}.join(' ')}>#{$body_start}\n#{side_column}\n#{$post_side_column}" + 
           "<div id=\"login-status\">#{login_status}</div>" +
           "#{$content_start}\n#{flash_notice}"
  end
  
  def footer
    return thdl_footer
  end
  
  private
  
  def get_content(url, headers={})
      begin
        doc = Hpricot(open(url, headers))
        yield doc if block_given?
        return doc
      rescue Errno::EHOSTUNREACH
        "Can't connect to #{url}"
      rescue Errno::ETIMEDOUT
        "Can't connect to #{url}"
      rescue SocketError
        "Can't connect to #{url}"      
      end
      return nil
  end
  
  def load_attributes(options = Hash.new)
    if !in_frame()
      headers = ENV['RAILS_ENV']=='quandu_production' ? { 'Host' => 'thlib.org' } : { }
      domain = case ENV['RAILS_ENV']
      when 'quandu_production' then '127.0.0.1'
      when 'production' then 'staging.thdl.org'
      else 'www.thlib.org'
      end
      # doc = get_content("http://#{domain}/global/php/offsite.php?url=/template/index-offsite.php", headers)
      # doc = get_content("http://staging.thdl.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-offsite.php", headers)
      doc = get_content("http://www.thlib.org/global/php/offsite.php?url=/reference/dictionaries/tibetan-dictionary/dictionary-offsite.php", headers)
      # doc = get_content("http://staging.thdl.org/reference/dictionaries/tibetan-dictionary/dictionary-offsite-old.php", headers)

      head = doc/'head'
      head.search('title').remove
      head.append("<meta name=\"MSSmartTagsPreventParsing\" content=\"TRUE\">\n")
      head_html = head.to_html
      content = doc%'div#content'
      content.inner_html = ''
      html = doc.to_html
      head_end = html.index('</head>')    
      $html_start = html[0...head_end]
      body_tag_start = html.index('<body')
      body_tag_end = html.index('>', body_tag_start)
      side_column_start = html.index('<!-- begin sliding side column -->')
      $body_start = html[body_tag_end+1...side_column_start]
      $side_column_object = doc%'div#side-column'
      ($side_column_object/'div#list1').prepend("<div id=\"app-vertical-links\"></div>")
      content_html = content.to_html
      relative_content_end = content_html.index('</')
      post_sidenav_start = html.index('<!-- Link for Side-Menu -->')
      side_column_links_pos = html.index('<!-- Advanced Search -->')
      content_start = html.index(content_html)
      $post_side_column = html[post_sidenav_start...side_column_links_pos]
      $content_start = html[side_column_links_pos...content_start+relative_content_end]
      $footer = html[content_start+relative_content_end...html.size]
    else
      $html_start = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"
        \"http://www.w3.org/TR/html4/strict.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head>"
      $content_start = "<div id=\"body-wrapper\" style=\"width:#{frame_width}; background-image: none\"><div id=\"content\" style=\"background-image: none;\"><div class=\"shell-1\">"
      $footer = "</div></div></div></div><script type=\"text/javascript\" language=\"Javascript\">var bookmark_url = '#{frame_bookmark}' ; document.observe( 'contentloaded' , frame_service.init() )</script>\n</body></html>"
      $body_start = ''
      $post_side_column = ''
    end
  end  
  
  def login_status
    # if !in_frame()
    #   if !logged_in?
    #     return "You are currently not logged in. #{link_to 'Login', login_path}."
    #   else
    #     return "You are logged in as #{current_user.login}. #{link_to 'Logout', logout_path}."
    #   end
    # else
    #   return ''
    # end
  end
  
  def content_end
    load_attributes if $content_end.blank?
    return $content_end
  end
  
  def side_column
    if !in_frame()
      load_attributes if $side_column_object.nil?
      # ($side_column_object%'div#login-status').inner_html = login_status
      ($side_column_object%'div#app-vertical-links').inner_html = side_column_links
      $side_column_object.to_html
    end
  end
  
  def thdl_footer
    load_attributes if $footer.blank?
    return $footer
  end
  
  def flash_notice
    return "<div class=\"shell-1\"><div id=\"div_flash-notice\">\n" +
           "<p style=\"color: green\">#{flash[:notice]}</p>\n" +
           "</div></div>"
  end
end