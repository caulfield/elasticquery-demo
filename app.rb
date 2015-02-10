require 'sinatra/base'
require "sinatra/json"
require 'slim'
require 'elasticquery/query'

require './core/human_repository'
require './core/human_query'

class App < Sinatra::Base
  helpers Sinatra::JSON

  get '/' do
    slim :index
  end

  get '/all' do
    humans = HumanRepository.search(HumanQuery.all).to_a
    json humans: humans.map(&:to_hash)
  end

  get '/search' do
    query = HumanQuery.new(params).build
    humans = HumanRepository.search(query).to_a
    json humans: humans, query: query
  end
end
