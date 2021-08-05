require 'cocina/models'
require 'sinatra'
require "sinatra/reloader" if development?

set :root, File.dirname(__FILE__)

# Utility for parsing and working with a Cocina model
class CocinaObject
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def body
    JSON.pretty_generate(cocina)
  end

  def cocina
    @cocina ||= JSON.parse(File.read(path))
  end

  def file_urls
    file_sets.map do |file_set|
      Array(file_set.dig('structural', 'contains')).filter_map do |file|
        stacks_url(file['filename']) if file['hasMimeType'] == 'image/jpeg'
      end
    end.flatten.compact
  end

  private

  def identifier
    @identifier ||= File.basename(path, '.json')
  end

  def file_sets
    Array(cocina.dig('structural', 'contains'))
  end

  def stacks_url(filename)
    "https://stacks.stanford.edu/image/iiif/#{identifier}%2F#{File.basename(filename, '.jpg')}/full/full/0/default.jpg"
  end
end

get '/' do
  erb :'app.html'
end

get '/object' do
  @object = CocinaObject.new(params[:path])

  erb :'object.html'
end
