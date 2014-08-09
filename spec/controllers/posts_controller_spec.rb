require 'spec_helper'
require 'pry'

describe PostsController do
  
  let! (:posts) {FactoryGirl.create_list(:post, 7)}
  let! (:post_id_1) { posts.first}

  after (:all) do 
    Post.destroy_all
  end

  describe "index method" do
    it "should return posts" do
      #pry.binding
      get :index 
      expected_json = { posts: posts}.to_json
      expect(response.body).to eq expected_json
    end
  end

end
