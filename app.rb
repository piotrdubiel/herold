require "sinatra"
require "pubnub"

publish_key   = ENV['PUBNUB_PUBLISH_KEY']
subscribe_key = ENV['PUBNUB_SUBSCRIBE_KEY']

pubnub = Pubnub.new(
     :subscribe_key    => subscribe_key,
     :publish_key      => publish_key,
)


get "/computer/on" do
  pubnub.publish(channel: 'home', message: '{"object": "computer", "action": "on"}') do |data|
    puts data.response
  end
end
