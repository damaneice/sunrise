require 'net/http'

require 'uri' require 'rexml/document'

class Sunrise
    
def initialize

end
xml = Net::HTTP.get(URI.parse('http://www.earthtools.org/sun/40.71417/-74.00639/4/12/-5/0'))

doc = REXML::Document.new(xml)

doc.elements.each('sun/morning/sunrise') do |ele| puts ele.text end

end
