class CrawlersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  protect_from_forgery with: :null_session

  def run_crawler
	twitter_all = Nokogiri::HTML(open('https://twitter.com/naobou_official'))
	twitter_all.xpath('//a[@data-conversation-id]').each do |twitter|
	  break if Post.where(data_code: twitter["data-conversation-id"]).present?
	  tweet_url = Nokogiri::HTML(open("https://twitter.com#{twitter['href']}"))
	  Post.create(data_code: twitter["data-conversation-id"], data_type: "twitter", content: tweet_url.xpath('//div[@class="js-tweet-text-container"]').first.content, content_url: "https://twitter.com#{twitter['href']}")
	end
  end

end
