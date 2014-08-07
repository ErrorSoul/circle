class Post < ActiveRecord::Base
  validates :title, presence: true, length: {in: 2..140}, uniqueness: true
  validates :text, presence: true, length: {minimum: 2}
end
