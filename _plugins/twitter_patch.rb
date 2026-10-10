require "jekyll-twitter-plugin"

module TwitterJekyll
  class ApiRequest
    def to_uri
      URI.parse("https://publish.x.com/oembed").tap do |uri|
        uri.query = URI.encode_www_form url_params
      end
    end
  end
end