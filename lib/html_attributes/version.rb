module HtmlAttributes
  VERSION = "0.1.3"

  module Version
    version = VERSION.to_s.split(".").map { |i| i.to_i }
    MAJOR = version[0]
    MINOR = version[1]
    PATCH = version[3]
    STRING = "#{MAJOR}.#{MINOR}.#{PATCH}"
  end

end
