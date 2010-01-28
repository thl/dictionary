module ComplexScriptsHelper
  # Receives a language code as argument and returns a hash with keys xml:lang and class set to that code. If no code is
  # given, it defaults to "bo" (tibetan). This can be used to easily pass it to form helpers to be styled accordingly.
  def fixed_language_options(options = Hash.new)
    if options[:lang].nil?
      options[:lang] = 'bo'
    else
      options[:lang] = options[:lang][0...2] if options[:lang].size>2
    end
    options['xml:lang'] = options[:lang]
    options[:class] = options[:lang]
    return options
  end
  
  # Not really related to complex scripts per se. Displays a title and attribute if attribute is not blank.
  def display_if_not_blank(name, attribute)
    if !attribute.blank?
      return "<p><b>#{name}:</b> #{attribute}</p>"
    else
      return nil
    end
  end
end
