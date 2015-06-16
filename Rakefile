require 'dotenv'
Dotenv.load
require './core/human_repository'

task :seed do
  people = [
    Human.new(name: "Mark", gender: "male", age: 20),
    Human.new(name: "Mary", gender: "female", age: 25),
    Human.new(name: "Max", gender: "male", age: 30),
    Human.new(name: "George", gender: "male", age: 50),
    Human.new(name: "Helen", gender: "female")
  ]

  people.each do |human|
    HumanRepository.save(human)
  end
end

task :update_index do
  HumanRepository.create_index! force: true
  HumanRepository.refresh_index!
end
