require 'open-uri'
class Page
  attr_accessor :page

  GOOGLE_URL='https://www.google.com/search?hl=en&gl=en&q='
  private_constant :GOOGLE_URL

  def initialize(keyword)
  	@code = open(GOOGLE_URL + keyword.gsub(/ /, '+'), "User-Agent" => "HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").read
  	@keyword = keyword
    @page = Nokogiri::HTML(@code, nil, 'Encoding::UTF_8.to_s')
  end
  
  def top_ads
  	@page.css('#tads li.ads-ad .ads-visurl cite')
  end

  def right_ads
    @page.css('#mbEnd li.ads-ad .ads-visurl cite')
  end

  def normal_results
    @page.css('#ires li.g .s cite')
  end

  def top_ads_length
  	self.top_ads.length
  end

  def right_ads_length
    self.right_ads.length
  end

  def normal_results_length
    self.normal_results.length
  end

  def top_ads_links
  	self.top_ads.map { |link| link.text }
  end

  def right_ads_links
    self.right_ads.map { |link| link.text }
  end

   def normal_results_links
    self.normal_results.map { |link| link.text }
  end

  def top_stats
  	@page.css('#resultStats').text
  end

  def time_result
  	@page.css('#resultStats').css('nobr').text.delete! '()'
  end

 def page_html
 	open(GOOGLE_URL + @keyword.gsub(/ /, '+') + ".html", "User-Agent" => "HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").read
 end

end