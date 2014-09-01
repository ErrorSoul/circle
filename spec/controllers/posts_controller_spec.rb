require 'spec_helper'
require 'pry'

describe PostsController do
  
  let! (:posts) {FactoryGirl.create_list(:post, 7).reverse}
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

  
  describe "edit method" do
    it "should return post 1 " do
      get :edit, id: post_id_1.id
      expected_json = {post: post_id_1 }.to_json
      expect(response.body).to eq expected_json
    end
  end



  describe "update method" do
    it "should update post"  do 
     
      patch :update, id: post_id_1.id, post: {title: "XXX", text:"FFFF"}

      expected_json = {message: "Your text saved"}.to_json
      
      expect(response.body).to eq expected_json
    end


    it 'should update post with image' do
     
      patch :update, id: post_id_1.id, post: {asset: File.open('spec/fixtures/dream.jpg') }
      expected_json = {message: "Your text saved"}.to_json
      
      expect(response.body).to eq expected_json
    
    end
  
  

  end


end
