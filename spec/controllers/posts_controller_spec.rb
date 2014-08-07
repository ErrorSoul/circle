require 'spec_helper'
require 'pry'

describe PostsController do
  let! (:posts) {FactoryGirl.create_list(:post, 7)}

  describe "index method" do
    it "should return posts" do
      get '/posts'
      pry.binding
      expect(responce).to eq posts
    end
  end

end
