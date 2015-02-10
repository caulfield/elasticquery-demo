class Human
  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes

    @attributes["name"] = "#{@attributes["first_name"]}  #{@attributes["last_name"]}"
  end

  def to_hash
    @attributes
  end

  def [](field)
    @attributes[field]
  end

  def to_json(options = {})
    to_hash
  end
end
