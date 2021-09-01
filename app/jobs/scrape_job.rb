class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(product)
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
    html_file = URI.open(product.url, 'User-Agent' => user_agent).read
    doc = Nokogiri::HTML(html_file, nil, 'utf-8')

    product.name = doc.search('h1>span#productTitle').text.strip
    product.price = doc.search('#priceblock_ourprice').text.delete('R$').gsub(/[[:space:]]/, '').delete('.').gsub(',','.').to_f

    product.save

  end
end
