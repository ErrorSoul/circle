require 'spec_helper'
require 'pry'

describe PostsController do
  
  let! (:posts) {FactoryGirl.create_list(:post, 7).reverse}
  let! (:post_id_1) { posts.first}

  #files should be in spec/fixtures and use fixture_file_upload
  let! (:file) {fixture_file_upload("dream.jpg", 'image/jpeg') }
  
  

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
      
     
      patch :update, id: post_id_1.id, post: {asset: file }
      asset_url = Post.first.asset.url
      expected_json = {message: "Your text saved", url: asset_url}.to_json
      
      
      expect(response.body).to eq expected_json
    
    end
  end

  describe 'create method' do
    it "should create new post" do
      post :create, post: {title: 'New title', text: "New text"}
      expected_json = {message: "Your text saved"}.to_json
      expect(response.body).to eq expected_json
    end 

    it 'should create new post with image' do
      #pry.binding
      post :create, post: {title: "New title", text: "New text", asset: file}
      asset_url = Post.first.asset.url
      expected_json = {message: "Your text saved", url: asset_url}.to_json
      expect(response.body).to eq expected_json 
    end
  end

  describe 'delete method' do
    it "should delete post" do 
      
      delete :destroy, id: post_id_1.id 

      expected_json = {message: "Your post deleted"}.to_json
      expect(response.body).to eq expected_json
      #pry.binding
      get :index
      new_posts = posts.dup
      new_posts.delete(post_id_1)
      expected_json ={posts: new_posts }.to_json
      expect(response.body).to eq expected_json
      
    end
  end


end
