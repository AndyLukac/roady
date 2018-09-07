require 'net/https'
require 'uri'
require 'json'

class BingImage
  def self.search(term)
    accessKey = ENV["BING_API_KEY"]

    uri  = "https://api.cognitive.microsoft.com"
    path = "/bing/v7.0/images/search"

    uri = URI(uri + path + "?q=" + URI.escape(term))

    puts "Searching images for: " + term

    request = Net::HTTP::Get.new(uri)
    request['Ocp-Apim-Subscription-Key'] = accessKey

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    data = JSON.parse(response.body)
    data["value"].first["contentUrl"]
  end
end
