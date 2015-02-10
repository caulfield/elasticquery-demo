require 'active_support/all'
require 'elasticquery'

class HumanQuery < Elasticquery::Base
  filtered do |params|
    search params[:name], fields: %w(first_name last_name), operator: "or" if params[:name].present?
    term country: params[:country] if params[:country].present?
    term.not kind: "president" if !!params[:not_president]
    range :stature, gte: params[:min_stature].to_i
  end

  def self.all
    Elasticquery::Query::DEFAULT
  end
end
