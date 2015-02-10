require './core/human_repository'

task :seed do
  people = [
    Human.new(name: "Vladimir Putin"),
    Human.new(name: "Barack Obama"),
  ]

  people.each do |human|
    HumanRepository.save(human)
  end
end

task :update_index do
  HumanRepository.create_index! force: true
end
