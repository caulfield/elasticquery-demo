require 'elasticsearch/persistence'

require './core/human'

HumanRepository = Elasticsearch::Persistence::Repository.new do
  elasticsearch_url = ENV['BONSAI_URL'] || ENV["ELASTICSEARCH_URL"] || "http://localhost:9200"

  client Elasticsearch::Client.new url: elasticsearch_url

  index :people

  klass Human

  settings do
    mapping do
      indexes :first_name, analyzer: 'snowball'
      indexes :last_name, analyzer: 'snowball'
      indexes :country, index: "not_analyzed"
      indexes :kind, index: "not_analyzed"
      indexes :stature, type: :integer
    end
  end
end

HumanRepository.create_index!
