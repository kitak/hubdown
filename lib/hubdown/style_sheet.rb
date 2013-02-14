require 'open-uri'

class StyleSheet
  attr_accessor :name
  attr_accessor :url
  attr_accessor :content


  def from_tag tag
    matcher = /href=['|"](([\w:.\/])*)\/(\w+.css)/.match( tag )
    @url = matcher.captures[0]
    @name = matcher.captures[2]
  end

  def to_tag
    "<link href=\"#{url}/#{name}\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\">"
  end

  def download_content
    @content ||= open("#{@url}/#{name}").read
  end

end
