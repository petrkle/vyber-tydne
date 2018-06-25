Time.zone = "Europe/Prague"

activate :blog do |blog|
  blog.permalink = "{year}-{month}-{day}.html"
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "stranka/{num}"
	blog.default_extension = ".md"
end

page "/feed.xml", layout: false
set :css_dir, "css"
set :images_dir, "img"

configure :build do
	activate :minify_html do |html|
		html.remove_http_protocol       = false
		html.remove_https_protocol      = false
	end
  activate :minify_css
  activate :asset_hash
end
