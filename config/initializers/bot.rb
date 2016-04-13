require File.join(Rails.root, 'bot/tattletale')
SlackRubyBot.configure do |config|
  config.aliases = [':pong:', 'pongbot']
end
