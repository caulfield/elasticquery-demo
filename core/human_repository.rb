require 'elasticsearch/persistence'

require './core/human'

HumanRepository = Elasticsearch::Persistence::Repository.new do
  elasticsearch_url = ENV['BONSAI_URL'] || ENV["ELASTICSEARCH_URL"] || "http://localhost:9200"

  client Elasticsearch::Client.new url: elasticsearch_url

  index :people

  klass Human

  settings do
    mapping do
      indexes :name, analyzer: 'snowball'
    end
  end
end

HumanRepository.create_index!
