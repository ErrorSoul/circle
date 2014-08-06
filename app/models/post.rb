class Post < ActiveRecord::Base
  validates :title, presence: true, length: {in: 2..140}
  validates :text, presence: true, length: {minimum: 2}
end
