require 'elasticquery'

class HumanQuery < Elasticquery::Base
  filtered do |params|
    search params[:search] if params[:query]
  end

  def self.all
    Elasticquery::Query::DEFAULT
  end
end
