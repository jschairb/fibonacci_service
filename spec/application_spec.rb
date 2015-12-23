require 'spec_helper'

describe 'Fibonacci As A Service' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe "GET '/'" do
    it "returns a 200 status code" do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it "returns an application/json content type" do
      get '/'
      expect(last_response.content_type).to include('application/json')
    end
  end

  describe "GET '/sequence/:number'" do
    let(:number) { 1 }

    it "returns an application/json content type" do
      get "/sequence/#{number}"
      expect(last_response.content_type).to include('application/json')
    end

    context "with a positive integer" do
      let(:number) { 3 }

      it "returns a 200 ok" do
        get "/sequence/#{number}"
        expect(last_response.status).to eq(200)
      end

      it "returns the sequence" do
        get "/sequence/#{number}"
        expect(JSON.parse(last_response.body)).to eq({ "sequence" => [0,1,1]})
      end
    end

    context "when number is 0" do
      let(:number) { 0 }

      it "returns a 422 error" do
        get "/sequence/#{number}"
        expect(last_response.status).to eq(422)
      end

      it "returns an error message" do
        get "/sequence/#{number}"
        expect(JSON.parse(last_response.body)['error']).to eq("number must not be 0")
      end
    end

    context "with a negative integer" do
      let(:number) { -1 }

      it "returns a 422 error" do
        get "/sequence/#{number}"
        expect(last_response.status).to eq(422)
      end

      it "returns an error message" do
        get "/sequence/#{number}"
        expect(JSON.parse(last_response.body)['error']).to eq("number must be positive")
      end
    end

    context "with a float number" do
      let(:number) { 1.23 }

      it "returns a 422 error" do
        get "/sequence/#{number}"
        expect(last_response.status).to eq(422)
      end

      it "returns an error message" do
        get "/sequence/#{number}"
        expect(JSON.parse(last_response.body)['error']).to eq("number must be an integer")
      end
    end
  end
end
