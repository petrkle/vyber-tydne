Time.zone = "Europe/Prague"

activate :blog do |blog|
	blog.paginate = true
  blog.per_page = 10
  blog.page_link = "stranka/{num}"
	blog.permalink = ":year-:month-:day.html"
end

page "/feed.xml", layout: false
set :css_dir, "css"
set :images_dir, "img"

# Build-specific configuration
configure :build do
  activate :favicon_maker, :icons => {
    "_favicon_template.png" => [
			{ icon: "android-chrome-144x144.png" },
			{ icon: "android-chrome-192x192.png" },
			{ icon: "android-chrome-36x36.png" },
			{ icon: "android-chrome-48x48.png" },
			{ icon: "android-chrome-72x72.png" },
			{ icon: "android-chrome-96x96.png" },
			{ icon: "apple-touch-icon.png", size: "180x180" },
			{ icon: "apple-touch-icon-precomposed.png", size: "180x180" },
			{ icon: "apple-touch-icon-114x114.png" },
			{ icon: "apple-touch-icon-120x120.png" },
			{ icon: "apple-touch-icon-144x144.png" },
			{ icon: "apple-touch-icon-152x152.png" },
			{ icon: "apple-touch-icon-180x180.png" },
			{ icon: "apple-touch-icon-57x57.png" },
			{ icon: "apple-touch-icon-60x60.png" },
			{ icon: "apple-touch-icon-72x72.png" },
			{ icon: "apple-touch-icon-76x76.png" },
			{ icon: "favicon-16x16.png" },
			{ icon: "favicon-32x32.png" },
			{ icon: "favicon-96x96.png" },
			{ icon: "mstile-144x144.png" },
			{ icon: "mstile-150x150.png" },
			{ icon: "mstile-310x150.png" },
			{ icon: "mstile-310x310.png" },
			{ icon: "mstile-70x70.png" },
			{ icon: "podium.png", size: "64x64" },
			{ icon: "favicon.ico", size: "64x64, 32x32, 24x24, 16x16" }
    ]
  }
	activate :minify_html
  activate :minify_css
  activate :asset_hash
end
