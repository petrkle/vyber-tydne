xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://vyber-tydne.kle.cz/"
  xml.title "Výběr týdne"
  xml.subtitle "Výběr týdne"
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name "Petr Kletečka" }

  blog.articles[0..10].each do |article|
    xml.entry do
      xml.title article.title + ' ' + article.date.strftime('%-d. %-m. %Y')
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published (article.date + 20*60*60).to_time.iso8601
      xml.updated (article.date + 20*60*60).to_time.iso8601
      xml.author { xml.name "Petr Kletečka" }
      xml.content article.body, "type" => "html"
    end
  end
end
