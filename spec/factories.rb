FactoryGirl.define do

  sequence(:title) { |n| "Example title #{n}" }
  sequence(:text)  { |n| Faker::Lorem.sentence(4, false, 2)}
  factory :user do
    name     "Michael"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end


   factory :ataman, parent: :user  do |f|
    f.name     "Nusha"
    f.email    "nusha@example.com"
    f.password "foobar"
    f.password_confirmation "foobar"
  end
  factory :invalid_user_password, parent: :user do |f|
    f.password " "
    f.password_confirmation " "
  end

  factory :invalid_user_email, parent: :user do |z|
    z.email  nil 
  end
  

  factory :post do
    title 
    text
  end
end


