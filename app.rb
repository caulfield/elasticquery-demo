require 'dotenv'
Dotenv.load

require 'sinatra/base'
require "sinatra/json"
require 'slim'
require 'sinatra/tag-helpers'
require 'elasticquery/query'

require './core/human_repository'
require './core/human_query'

class App < Sinatra::Base
  register Sinatra::TagHelpers
  helpers Sinatra::JSON

  helpers do
    def query_snippet
      snippet = <<-eos
class HumanQuery < Elasticquery::Base
  filtered do |params|
    search params[:name], fields: %w(name), operator: "or"
    term genre: params[:genre]
    range :age, gte: params[:age].to_i
  end
end
      eos
    end

    def current_query
      JSON.pretty_generate @query
    end

    def current_index
      JSON.pretty_generate @index
    end
  end

  get '/all' do
    humans = HumanRepository.search(HumanQuery.all).to_a
    json humans: humans.map(&:to_hash)
  end

  get '/' do
    @params = params
    @index = HumanRepository.mappings.to_hash
    @query = HumanQuery.new(params).build
    @humans = HumanRepository.search(@query)
    slim :index
  end
end
