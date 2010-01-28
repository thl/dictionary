module ComplexScripts
  module CoreExtensions # :nodoc:
    module String
      
      # Takes a string and spans characters in predefined unicode ranges with xml:lang and class attribute with
      # language code (ISO 369-3) for easy rendering. Also converts characters outside ascii range into NCR.
      def span
        return self if blank?
        unicode_message = self.chars
        return_string = ""
        i=0
        while i<unicode_message.length
          ch = unicode_message[i] 
          if ch<=255
            return_string << unicode_message.at(i)
          else
            range = ComplexScripts.character_within_unicode_range(ch)
            if range.nil?
              return_string << "&##{unicode_message[i]};"
            else
              lang_code = UNICODE_RANGES[range][2]
              return_string << "<span lang=\"#{lang_code}\" xml:lang=\"#{lang_code}\" class=\"#{lang_code}\">"
              while i<unicode_message.length && range==ComplexScripts.character_within_unicode_range(unicode_message[i])
                return_string << "&##{unicode_message[i]};"
                i+=1
              end
              return_string << "</span>"
              next
            end
          end
          i+=1
        end
        return_string
      end      
      alias :s :span
      
      # converts chars outside ascii range to NCR, but does not span. To be used in forms (buttons, drop-down
      # lists, etc.).
      def encode
        return self if blank?
        unicode_message = self.chars
        return_string = ""
        i=0
        while i<unicode_message.length
          ch = unicode_message[i] 
          if ch<=255
            return_string << unicode_message.at(i)
          else
            return_string << "&##{unicode_message[i]};"
          end
          i+=1
        end
        return_string
      end      
      alias :e :encode
      
      def base_letter(lang_code = nil)
        letter = self.lstrip.chars
        return nil if letter.blank?
        case lang_code
        when 'jee', 'wme', 'san'
          letter = letter.to(3)
          letter = letter.gsub(/-|=|_|\?|\/|\^|\342\211\241|\302\271|\302\262|\050/,'').lstrip.downcase # get rid of garbage that may precede head term
          return nil if letter.empty?
          return letter.to_s if letter.size==1
          if letter.at(1)=='h' && !"aeiou\304\201\305\253".include?(letter.at(0)) # last vowels are LATIN SMALL LETTER U WITH MACRON and LATIN SMALL LETTER A WITH MACRON
            letter = letter.to(1)
          else
            letter = letter.at(0)
          end
          #exceptions
          case letter.at(0)
          when "\303\230"
            return "\303\270" # LATIN CAPITAL LETTER O WITH STROKE -> SMALL
          when "\306\206"
            return "\311\224" # LATIN CAPITAL LETTER OPEN O -> SMALL
          when "\306\212"
            return "\311\227" # LATIN CAPITAL LETTER D WITH HOOK -> SMALL
          when "\341\271\204"
            return "\341\271\205" # LATIN CAPITAL LETTER N WITH DOT ABOVE -> SMALL
          when "\341\271\254"
            return "\341\271\255" # LATIN CAPITAL LETTER T WITH DOT BELOW -> SMALL
          when "\305\232"
            return "\305\233" # LATIN CAPITAL LETTER S WITH ACUTE -> SMALL
          when "\316\233"
            return "\316\273" # GREEK CAPITAL LETTER LAMDA -> SMALL
          when "\306\256"
            return "\312\210" # LATIN CAPITAL LETTER T WITH RETROFLEX HOOK -> SMALL
          when "\356\242\273"
            return "\?" # ?
          else
            return letter.to_s
          end
        else
          return letter.at(0).to_s
        end
      end
    end
  end
end