module HtmlAttributes #:nodoc:

  BOOLEAN_ATTRIBUTES = %w(disabled readonly multiple checked autobuffer
                       autoplay controls loop selected hidden scoped async
                       defer reversed ismap seemless muted required
                       autofocus novalidate formnovalidate open pubdate).to_set

  module TagHelper #:nodoc:

    def self.included(base) #:nodoc:
      base.alias_method_chain :tag_options, :html_attributes
    end

    def tag_options_with_html_attributes(options, escape = true) #:nodoc:
      options = ::Hash[options.map { |key, value| [key, value.respond_to?("to_#{key}_attr") ? value.send("to_#{key}_attr") : value] }] unless options.blank?
      tag_options_without_html_attributes(options, escape)
    end

  end

end
