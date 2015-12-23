require File.join(File.dirname(__FILE__), "environment")

before do
  content_type 'application/json'
end

get "/" do
  {}.to_json
end

get "/sequence/:number" do
  @sequence = FibonacciService::Sequence.new(params['number'])
  { "sequence": @sequence.sequence }.to_json
end

error FibonacciService::InvalidNumberError do
  [422, { "error": env['sinatra.error'].message }.to_json]
end
