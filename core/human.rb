class Human
  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes
  end

  def to_hash
    @attributes
  end

  def to_json(options = {})
    to_hash
  end
end
