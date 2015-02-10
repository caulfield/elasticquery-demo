require './core/human_repository'

task :seed do
  people = [
    Human.new(first_name: "Vladimir", last_name: "Putin", country: "Russia", kind: 'president', stature: 168 ),
    Human.new(first_name: "Barack", last_name: "Obama", country: "USA", kind: 'president', stature: 185 ),
    Human.new(first_name: "George", last_name: "Bush", country: "USA", kind: 'president', stature: 178),
    Human.new(first_name: "Sergey", last_name: "Kuchmistov", country: "Belarus", kind: 'developer', stature: 185),
    Human.new(first_name: "Mike", last_name: "Morris", country: "USA", kind: 'regular', stature: 202)
  ]

  people.each do |human|
    HumanRepository.save(human)
  end
end

task :update_index do
  HumanRepository.create_index! force: true
  HumanRepository.refresh_index!
end
