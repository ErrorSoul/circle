namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    12.times do 
      title = Faker::Lorem.sentence(4, false, 2)
      text = Faker::Lorem.paragraphs(Random.rand(2..6))
      text.map { |x| x + "\n"}
      text = text.join("")
      Post.create!(title: title,
                   text: text)
    end
  end
end
