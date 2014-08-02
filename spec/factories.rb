FactoryGirl.define do
  factory :user do
    name     "Michael"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :invalid_user_password, parent: :user do |f|
    f.password " "
    f.password_confirmation " "
  end

  factory :invalid_user_email, parent: :user do |z|
    z.email  nil 
  end
end


