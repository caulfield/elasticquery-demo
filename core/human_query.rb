require 'active_support/all'
require 'elasticquery'

class HumanQuery < Elasticquery::Base
  filtered do |params|
    search params[:name], fields: %w(name), operator: "or"
    term genre: params[:genre]
    range :age, gte: params[:age].to_i
  end

  def self.all
    Elasticquery::Query::DEFAULT
  end
end
