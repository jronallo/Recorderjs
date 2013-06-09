require 'sinatra'
require "base64"
require 'pry'

post '/savewav' do
  request.body.rewind  # in case someone already read it
  data = request.body.read
  wav = data.slice(22,data.length)
  path = File.expand_path"~/tmp/wavs/#{Time.now.strftime("%Y%m%d%H%M%S")}.wav"
  File.open(path, 'wb') do |fh|
    fh.write(Base64.decode64(wav))
  end
end