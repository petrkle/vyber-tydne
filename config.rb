Time.zone = "Europe/Prague"

activate :blog do |blog|
	blog.paginate = true
  blog.per_page = 10
  blog.page_link = "stranka/{num}"
	blog.permalink = ":year-:month-:day.html"
end

page "/feed.xml", layout: false
set :css_dir, 'css'
set :images_dir, 'img'

# Build-specific configuration
configure :build do
	activate :minify_html
  activate :minify_css
  activate :asset_hash
end
