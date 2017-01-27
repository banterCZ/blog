# Copy _redirects file to _site folder for netlify hosting
#
# See https://www.netlify.com/docs/redirects/ for the format
module Jekyll
  class NetlifyRedirectGenerator < Generator
    def generate(site)
      site.static_files << Jekyll::StaticFile.new(site, site.source, "/", "_redirects")
    end
  end
end