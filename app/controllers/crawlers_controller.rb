class CrawlersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  protect_from_forgery with: :null_session

  def run_crawler
	twitter_all = Nokogiri::HTML(open('https://twitter.com/naobou_official'))
	p 123123
	p 123123
	# twitter_all.xpath('//a[@data-conversation-id]//parent::small').each do |twitter|
	twitter_all.xpath('//a[@data-conversation-id]').each do |twitter|
	# twitter_all.xpath('//small/following-sibling::div').each do |twitter|
	  p 1
	  # twitter.xpath('/p')
	  p twitter.content
	  p twitter["href"]
	  p twitter["data-conversation-id"]
	  break if Post.where(data_code: twitter["data-conversation-id"]).present?
	  tweet_url = Nokogiri::HTML(open("https://twitter.com#{twitter['href']}"))
	  Post.create(data_code: twitter["data-conversation-id"], data_type: "twitter", content: tweet_url.xpath('//div[@class="js-tweet-text-container"]').first.content, content_url: "https://twitter.com#{twitter['href']}")
	end
	p 123123
  end

end
