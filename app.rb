require 'sinatra'
require "sinatra/reloader" if development?

require 'http'

set :public_folder, 'public'

# Utility for parsing and working with a IIIF manifest
class IiifManifest
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def body
    response.body.to_s
  end

  def json
    @json ||= JSON.parse(body)
  end

  def canvases
    json.fetch('items', [])
  end

  private

  def response
    @response ||= HTTP.get(@url)
  end
end

get '/' do
  erb :'app.html'
end

get '/manifest' do
  @manifest = IiifManifest.new(params[:url])

  erb :'manifest.html'
end
