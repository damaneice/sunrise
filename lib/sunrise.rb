require 'net/http'
require 'uri' 
require 'rexml/document'

class Sunrise
    

  
  def createURL(latitude, longitude)
     'http://www.earthtools.org/sun/'+ latitude + '/'+ longitude + '/' + Time.now.day.to_s + '/' + 
      Time.now.month.to_s + '/99/1'
  end


  def getXMLData(latitude, longitude)
      url = createURL(latitude,longitude)
      xml = Net::HTTP.get(URI.parse(url))
  end
  
  def getSunriseTime(latitude,longitude)
    xml = getXMLData(latitude,longitude)
    extractSunriseTime(xml)
  end  
  
  def extractSunriseTime(xml)
    sunrise = ''
    doc = REXML::Document.new(xml)
    doc.elements.each('sun/morning/sunrise') do 
      |ele|  sunrise = ele.text 
    end
    return sunrise
  end





end
