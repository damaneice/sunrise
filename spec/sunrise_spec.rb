
require 'sunrise'

describe Sunrise do
  before(:each) do
    @sunrise = Sunrise.new
  end

  it "should create URL" do
    @sunrise.createURL("42.48", "83.24").should == "http://www.earthtools.org/sun/42.48/83.24/18/1/99/1"
  end
  
  
  it "should extract sunrise time from xml" do
    
  @sunrise.extractSunriseTime(createSampleXML).should == '10:54:07'
  end  
  
  def createSampleXML 
  '<?xml version="1.0" encoding="ISO-8859-1" ?>
  <sun xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.earthtools.org/sun.xsd">
    <version>1.0</version>
    <location>
      <latitude>42.48</latitude>
      <longitude>83.24</longitude>
    </location>
    <date>
      <day>18</day>
      <month>1</month>
      <timezone>8</timezone>
      <dst>1</dst>
    </date>
    <morning>
      <sunrise>10:54:07</sunrise>
      <twilight>
        <civil>10:23:05</civil>
        <nautical>09:48:26</nautical>
        <astronomical>09:14:47</astronomical>
      </twilight>
    </morning>
    <evening>
      <sunset>20:21:41</sunset>
      <twilight>
        <civil>20:52:43</civil>
        <nautical>21:27:23</nautical>
        <astronomical>22:01:03</astronomical>
      </twilight>
    </evening>
  </sun>'
  end
end

